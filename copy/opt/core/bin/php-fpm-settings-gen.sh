#!/usr/bin/env bash
set -eu

RESERVED_MB=1024 # left for the OS, nginx, monitoring agents, etc.
FRACTION=75      # percent of the remaining memory to actually plan for

pools=0
worker_mb=0

while getopts "p:w:" opt; do
    case "$opt" in
        p) pools=$OPTARG ;;
        w) worker_mb=$OPTARG ;;
        *) exit 1 ;;
    esac
done

# memory
mem_mb=$(kstat -p -m memory_cap -s physcap 2>/dev/null | awk '{print $2}')
mem_mb=$(( mem_mb / 1024 / 1024 ))

# pool count
# shellcheck disable=SC2126 # grep -c exits 1 on no match, which would trip set -e here
if [ "$pools" -eq 0 ]; then
    pools=$(svcs -H -o state,fmri 'svc:/pkgsrc/php-fpm*' 2>/dev/null | grep '^online' | wc -l | awk '{print $1}')
    [ -z "${pools:-}" ] && pools=0
    [ "$pools" -lt 1 ] && pools=1
fi

# worker size
if [ "$worker_mb" -eq 0 ]; then
    worker_mb=$(ps -eo comm,rss | awk 'tolower($1) ~ /php-fpm/ {s+=$2; n++} END{if(n>0) printf "%d", s/n/1024}')
    worker_mb=${worker_mb:-0}
    [ "$worker_mb" -le 0 ] 2>/dev/null && worker_mb=40
fi

# pm.* math
usable_mb=$(( (mem_mb - RESERVED_MB) * FRACTION / 100 ))
[ "$usable_mb" -le 0 ] && usable_mb=$(( worker_mb * pools * 2 ))
per_pool_mb=$(( usable_mb / pools ))

max_children=$(( per_pool_mb / worker_mb ))
[ "$max_children" -lt 2 ] && max_children=2

min_spare=$(( max_children * 20 / 100 ))
[ "$min_spare" -lt 1 ] && min_spare=1

max_spare=$(( max_children * 50 / 100 ))
[ "$max_spare" -le "$min_spare" ] && max_spare=$(( min_spare + 1 ))

start_servers=$(( min_spare + (max_spare - min_spare) / 2 ))

# max_requests
REQUEST_BASE=1000
REQUEST_REF_MB=40
max_requests=$(( REQUEST_BASE * REQUEST_REF_MB / worker_mb ))
[ "$max_requests" -lt 200 ] && max_requests=200
[ "$max_requests" -gt 5000 ] && max_requests=5000

echo "; mem=${mem_mb}MB pools=$pools worker=${worker_mb}MB"
echo "pm = dynamic"
echo "pm.max_children = $max_children"
echo "pm.start_servers = $start_servers"
echo "pm.min_spare_servers = $min_spare"
echo "pm.max_spare_servers = $max_spare"
echo "pm.max_requests = $max_requests"
