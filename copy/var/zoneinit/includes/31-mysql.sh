




<!DOCTYPE html>
<html class="   ">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    
    <title>mi-percona/31-mysql.sh at master · joyent/mi-percona · GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png">
    <meta property="fb:app_id" content="1401488693436528">

      <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="joyent/mi-percona" name="twitter:title" /><meta content="Contribute to mi-percona development by creating an account on GitHub." name="twitter:description" /><meta content="https://avatars0.githubusercontent.com/u/10161?v=2&amp;s=400" name="twitter:image:src" />
<meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://avatars0.githubusercontent.com/u/10161?v=2&amp;s=400" property="og:image" /><meta content="joyent/mi-percona" property="og:title" /><meta content="https://github.com/joyent/mi-percona" property="og:url" /><meta content="Contribute to mi-percona development by creating an account on GitHub." property="og:description" />

    <link rel="assets" href="https://assets-cdn.github.com/">
    <link rel="conduit-xhr" href="https://ghconduit.com:25035">
    

    <meta name="msapplication-TileImage" content="/windows-tile.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="selected-link" value="repo_source" data-pjax-transient>
      <meta name="google-analytics" content="UA-3769691-2">

    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="collector-cdn.github.com" name="octolytics-script-host" /><meta content="github" name="octolytics-app-id" /><meta content="5B41BE41:6943:3FDC8C0:53DFAD6A" name="octolytics-dimension-request_id" />
    

    
    
    <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">


    <meta content="authenticity_token" name="csrf-param" />
<meta content="sUS2u520VW/GdXxH7eO0PVOMUM1f730LeUl4aoGDVD1CQVKk1qqD8uVW6+Jn4tu75DHu/KiMs1085+U8jBW1Ig==" name="csrf-token" />

    <link href="https://assets-cdn.github.com/assets/github-8488336393a59083828e685a8702f8734352719a.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://assets-cdn.github.com/assets/github2-022c3fa33926015b9e04fcd6a447ced7fe84fdd8.css" media="all" rel="stylesheet" type="text/css" />
    


    <meta http-equiv="x-pjax-version" content="aea5b1e796f98188726860c3add4bed4">

      
  <meta name="description" content="Contribute to mi-percona development by creating an account on GitHub.">


  <meta content="10161" name="octolytics-dimension-user_id" /><meta content="joyent" name="octolytics-dimension-user_login" /><meta content="10347297" name="octolytics-dimension-repository_id" /><meta content="joyent/mi-percona" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="10347297" name="octolytics-dimension-repository_network_root_id" /><meta content="joyent/mi-percona" name="octolytics-dimension-repository_network_root_nwo" />

  <link href="https://github.com/joyent/mi-percona/commits/master.atom" rel="alternate" title="Recent Commits to mi-percona:master" type="application/atom+xml">

  </head>


  <body class="logged_out  env-production  vis-public page-blob">
    <a href="#start-of-content" tabindex="1" class="accessibility-aid js-skip-to-content">Skip to content</a>
    <div class="wrapper">
      
      
      
      


      
      <div class="header header-logged-out">
  <div class="container clearfix">

    <a class="header-logo-wordmark" href="https://github.com/">
      <span class="mega-octicon octicon-logo-github"></span>
    </a>

    <div class="header-actions">
        <a class="button primary" href="/join">Sign up</a>
      <a class="button signin" href="/login?return_to=%2Fjoyent%2Fmi-percona%2Fblob%2Fmaster%2Fcopy%2Fvar%2Fzoneinit%2Fincludes%2F31-mysql.sh">Sign in</a>
    </div>

    <div class="command-bar js-command-bar  in-repository">

      <ul class="top-nav">
          <li class="explore"><a href="/explore">Explore</a></li>
          <li class="features"><a href="/features">Features</a></li>
          <li class="enterprise"><a href="https://enterprise.github.com/">Enterprise</a></li>
          <li class="blog"><a href="/blog">Blog</a></li>
      </ul>
        <form accept-charset="UTF-8" action="/search" class="command-bar-form" id="top_search_form" method="get">

<div class="commandbar">
  <span class="message"></span>
  <input type="text" data-hotkey="s, /" name="q" id="js-command-bar-field" placeholder="Search or type a command" tabindex="1" autocapitalize="off"
    
    
    data-repo="joyent/mi-percona"
  >
  <div class="display hidden"></div>
</div>

    <input type="hidden" name="nwo" value="joyent/mi-percona">

    <div class="select-menu js-menu-container js-select-menu search-context-select-menu">
      <span class="minibutton select-menu-button js-menu-target" role="button" aria-haspopup="true">
        <span class="js-select-button">This repository</span>
      </span>

      <div class="select-menu-modal-holder js-menu-content js-navigation-container" aria-hidden="true">
        <div class="select-menu-modal">

          <div class="select-menu-item js-navigation-item js-this-repository-navigation-item selected">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" class="js-search-this-repository" name="search_target" value="repository" checked="checked">
            <div class="select-menu-item-text js-select-button-text">This repository</div>
          </div> <!-- /.select-menu-item -->

          <div class="select-menu-item js-navigation-item js-all-repositories-navigation-item">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" name="search_target" value="global">
            <div class="select-menu-item-text js-select-button-text">All repositories</div>
          </div> <!-- /.select-menu-item -->

        </div>
      </div>
    </div>

  <span class="help tooltipped tooltipped-s" aria-label="Show command bar help">
    <span class="octicon octicon-question"></span>
  </span>


  <input type="hidden" name="ref" value="cmdform">

</form>
    </div>

  </div>
</div>



      <div id="start-of-content" class="accessibility-aid"></div>
          <div class="site" itemscope itemtype="http://schema.org/WebPage">
    <div id="js-flash-container">
      
    </div>
    <div class="pagehead repohead instapaper_ignore readability-menu">
      <div class="container">
        
<ul class="pagehead-actions">


  <li>
      <a href="/login?return_to=%2Fjoyent%2Fmi-percona"
    class="minibutton with-count star-button tooltipped tooltipped-n"
    aria-label="You must be signed in to star a repository" rel="nofollow">
    <span class="octicon octicon-star"></span>
    Star
  </a>

    <a class="social-count js-social-count" href="/joyent/mi-percona/stargazers">
      1
    </a>

  </li>

    <li>
      <a href="/login?return_to=%2Fjoyent%2Fmi-percona"
        class="minibutton with-count js-toggler-target fork-button tooltipped tooltipped-n"
        aria-label="You must be signed in to fork a repository" rel="nofollow">
        <span class="octicon octicon-repo-forked"></span>
        Fork
      </a>
      <a href="/joyent/mi-percona/network" class="social-count">
        2
      </a>
    </li>
</ul>

        <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
          <span class="mega-octicon octicon-repo"></span>
          <span class="author"><a href="/joyent" class="url fn" itemprop="url" rel="author"><span itemprop="title">joyent</span></a></span><!--
       --><span class="path-divider">/</span><!--
       --><strong><a href="/joyent/mi-percona" class="js-current-repository js-repo-home-link">mi-percona</a></strong>

          <span class="page-context-loader">
            <img alt="" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
          </span>

        </h1>
      </div><!-- /.container -->
    </div><!-- /.repohead -->

    <div class="container">
      <div class="repository-with-sidebar repo-container new-discussion-timeline  ">
        <div class="repository-sidebar clearfix">
            

<div class="sunken-menu vertical-right repo-nav js-repo-nav js-repository-container-pjax js-octicon-loaders" data-issue-count-url="/joyent/mi-percona/issues/counts">
  <div class="sunken-menu-contents">
    <ul class="sunken-menu-group">
      <li class="tooltipped tooltipped-w" aria-label="Code">
        <a href="/joyent/mi-percona" aria-label="Code" class="selected js-selected-navigation-item sunken-menu-item" data-hotkey="g c" data-pjax="true" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /joyent/mi-percona">
          <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

        <li class="tooltipped tooltipped-w" aria-label="Issues">
          <a href="/joyent/mi-percona/issues" aria-label="Issues" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-hotkey="g i" data-selected-links="repo_issues repo_labels repo_milestones /joyent/mi-percona/issues">
            <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
            <span class="js-issue-replace-counter"></span>
            <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>        </li>

      <li class="tooltipped tooltipped-w" aria-label="Pull Requests">
        <a href="/joyent/mi-percona/pulls" aria-label="Pull Requests" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-hotkey="g p" data-selected-links="repo_pulls /joyent/mi-percona/pulls">
            <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull Requests</span>
            <span class="js-pull-replace-counter"></span>
            <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>


    </ul>
    <div class="sunken-menu-separator"></div>
    <ul class="sunken-menu-group">

      <li class="tooltipped tooltipped-w" aria-label="Pulse">
        <a href="/joyent/mi-percona/pulse" aria-label="Pulse" class="js-selected-navigation-item sunken-menu-item" data-pjax="true" data-selected-links="pulse /joyent/mi-percona/pulse">
          <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped tooltipped-w" aria-label="Graphs">
        <a href="/joyent/mi-percona/graphs" aria-label="Graphs" class="js-selected-navigation-item sunken-menu-item" data-pjax="true" data-selected-links="repo_graphs repo_contributors /joyent/mi-percona/graphs">
          <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>
    </ul>


  </div>
</div>

              <div class="only-with-full-nav">
                

  

<div class="clone-url open"
  data-protocol-type="http"
  data-url="/users/set_protocol?protocol_selector=http&amp;protocol_type=clone">
  <h3><strong>HTTPS</strong> clone URL</h3>
  <div class="input-group">
    <input type="text" class="input-mini input-monospace js-url-field"
           value="https://github.com/joyent/mi-percona.git" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="https://github.com/joyent/mi-percona.git" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  

<div class="clone-url "
  data-protocol-type="subversion"
  data-url="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=clone">
  <h3><strong>Subversion</strong> checkout URL</h3>
  <div class="input-group">
    <input type="text" class="input-mini input-monospace js-url-field"
           value="https://github.com/joyent/mi-percona" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="https://github.com/joyent/mi-percona" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>


<p class="clone-options">You can clone with
      <a href="#" class="js-clone-selector" data-protocol="http">HTTPS</a>
      or <a href="#" class="js-clone-selector" data-protocol="subversion">Subversion</a>.
  <a href="https://help.github.com/articles/which-remote-url-should-i-use" class="help tooltipped tooltipped-n" aria-label="Get help on which URL is right for you.">
    <span class="octicon octicon-question"></span>
  </a>
</p>



                <a href="/joyent/mi-percona/archive/master.zip"
                   class="minibutton sidebar-button"
                   aria-label="Download joyent/mi-percona as a zip file"
                   title="Download joyent/mi-percona as a zip file"
                   rel="nofollow">
                  <span class="octicon octicon-cloud-download"></span>
                  Download ZIP
                </a>
              </div>
        </div><!-- /.repository-sidebar -->

        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>
          


<a href="/joyent/mi-percona/blob/46f74e73db9f08886fff1d1a334a7d77b6200f3d/copy/var/zoneinit/includes/31-mysql.sh" class="hidden js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:ecbc16dc45e672950534d0a87316c707 -->

<div class="file-navigation">
  

<div class="select-menu js-menu-container js-select-menu" >
  <span class="minibutton select-menu-button js-menu-target css-truncate" data-hotkey="w"
    data-master-branch="master"
    data-ref="master"
    title="master"
    role="button" aria-label="Switch branches or tags" tabindex="0" aria-haspopup="true">
    <span class="octicon octicon-git-branch"></span>
    <i>branch:</i>
    <span class="js-select-button css-truncate-target">master</span>
  </span>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax aria-hidden="true">

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-x js-menu-close" role="button" aria-label="Close"></span>
      </div> <!-- /.select-menu-header -->

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Filter branches/tags" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" class="js-select-menu-tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" class="js-select-menu-tab">Tags</a>
            </li>
          </ul>
        </div><!-- /.select-menu-tabs -->
      </div><!-- /.select-menu-filters -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item selected">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/joyent/mi-percona/blob/master/copy/var/zoneinit/includes/31-mysql.sh"
                 data-name="master"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="master">master</a>
            </div> <!-- /.select-menu-item -->
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/joyent/mi-percona/tree/13.3.0/copy/var/zoneinit/includes/31-mysql.sh"
                 data-name="13.3.0"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="13.3.0">13.3.0</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/joyent/mi-percona/tree/13.1.0/copy/var/zoneinit/includes/31-mysql.sh"
                 data-name="13.1.0"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="13.1.0">13.1.0</a>
            </div> <!-- /.select-menu-item -->
        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

    </div> <!-- /.select-menu-modal -->
  </div> <!-- /.select-menu-modal-holder -->
</div> <!-- /.select-menu -->

  <div class="button-group right">
    <a href="/joyent/mi-percona/find/master"
          class="js-show-file-finder minibutton empty-icon tooltipped tooltipped-s"
          data-pjax
          data-hotkey="t"
          aria-label="Quickly jump between files">
      <span class="octicon octicon-list-unordered"></span>
    </a>
    <button class="js-zeroclipboard minibutton zeroclipboard-button"
          data-clipboard-text="copy/var/zoneinit/includes/31-mysql.sh"
          aria-label="Copy to clipboard"
          data-copied-hint="Copied!">
      <span class="octicon octicon-clippy"></span>
    </button>
  </div>

  <div class="breadcrumb">
    <span class='repo-root js-repo-root'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/joyent/mi-percona" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">mi-percona</span></a></span></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/joyent/mi-percona/tree/master/copy" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">copy</span></a></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/joyent/mi-percona/tree/master/copy/var" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">var</span></a></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/joyent/mi-percona/tree/master/copy/var/zoneinit" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">zoneinit</span></a></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/joyent/mi-percona/tree/master/copy/var/zoneinit/includes" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">includes</span></a></span><span class="separator"> / </span><strong class="final-path">31-mysql.sh</strong>
  </div>
</div>


  <div class="commit file-history-tease">
      <img alt="Derek Crudgington" class="main-avatar" data-user="1850899" height="24" src="https://avatars0.githubusercontent.com/u/1850899?v=1&amp;s=48" width="24" />
      <span class="author"><a href="/dcrudgington" rel="contributor">dcrudgington</a></span>
      <time datetime="2013-12-11T14:42:18Z" is="relative-time">December 11, 2013</time>
      <div class="commit-title">
          <a href="/joyent/mi-percona/commit/46f74e73db9f08886fff1d1a334a7d77b6200f3d" class="message" data-pjax="true" title="Added release 13.3.0">Added release 13.3.0</a>
      </div>

    <div class="participation">
      <p class="quickstat"><a href="#blob_contributors_box" rel="facebox"><strong>1</strong>  contributor</a></p>
      
    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list">
          <li class="facebox-user-list-item">
            <img alt="Derek Crudgington" data-user="1850899" height="24" src="https://avatars0.githubusercontent.com/u/1850899?v=1&amp;s=48" width="24" />
            <a href="/dcrudgington">dcrudgington</a>
          </li>
      </ul>
    </div>
  </div>

<div class="file-box">
  <div class="file">
    <div class="meta clearfix">
      <div class="info file-name">
          <span>95 lines (78 sloc)</span>
          <span class="meta-divider"></span>
        <span>3.411 kb</span>
      </div>
      <div class="actions">
        <div class="button-group">
          <a href="/joyent/mi-percona/raw/master/copy/var/zoneinit/includes/31-mysql.sh" class="minibutton " id="raw-url">Raw</a>
            <a href="/joyent/mi-percona/blame/master/copy/var/zoneinit/includes/31-mysql.sh" class="minibutton js-update-url-with-hash">Blame</a>
          <a href="/joyent/mi-percona/commits/master/copy/var/zoneinit/includes/31-mysql.sh" class="minibutton " rel="nofollow">History</a>
        </div><!-- /.button-group -->


            <a class="octicon-button disabled tooltipped tooltipped-w" href="#"
               aria-label="You must be signed in to make or propose changes"><span class="octicon octicon-pencil"></span></a>

          <a class="octicon-button danger disabled tooltipped tooltipped-w" href="#"
             aria-label="You must be signed in to make or propose changes">
          <span class="octicon octicon-trashcan"></span>
        </a>
      </div><!-- /.actions -->
    </div>
      
  <div class="blob-wrapper data type-shell">
       <table class="file-code file-diff tab-size-8">
         <tr class="file-code-line">
           <td class="blob-line-nums">
             <span id="L1" rel="#L1">1</span>
<span id="L2" rel="#L2">2</span>
<span id="L3" rel="#L3">3</span>
<span id="L4" rel="#L4">4</span>
<span id="L5" rel="#L5">5</span>
<span id="L6" rel="#L6">6</span>
<span id="L7" rel="#L7">7</span>
<span id="L8" rel="#L8">8</span>
<span id="L9" rel="#L9">9</span>
<span id="L10" rel="#L10">10</span>
<span id="L11" rel="#L11">11</span>
<span id="L12" rel="#L12">12</span>
<span id="L13" rel="#L13">13</span>
<span id="L14" rel="#L14">14</span>
<span id="L15" rel="#L15">15</span>
<span id="L16" rel="#L16">16</span>
<span id="L17" rel="#L17">17</span>
<span id="L18" rel="#L18">18</span>
<span id="L19" rel="#L19">19</span>
<span id="L20" rel="#L20">20</span>
<span id="L21" rel="#L21">21</span>
<span id="L22" rel="#L22">22</span>
<span id="L23" rel="#L23">23</span>
<span id="L24" rel="#L24">24</span>
<span id="L25" rel="#L25">25</span>
<span id="L26" rel="#L26">26</span>
<span id="L27" rel="#L27">27</span>
<span id="L28" rel="#L28">28</span>
<span id="L29" rel="#L29">29</span>
<span id="L30" rel="#L30">30</span>
<span id="L31" rel="#L31">31</span>
<span id="L32" rel="#L32">32</span>
<span id="L33" rel="#L33">33</span>
<span id="L34" rel="#L34">34</span>
<span id="L35" rel="#L35">35</span>
<span id="L36" rel="#L36">36</span>
<span id="L37" rel="#L37">37</span>
<span id="L38" rel="#L38">38</span>
<span id="L39" rel="#L39">39</span>
<span id="L40" rel="#L40">40</span>
<span id="L41" rel="#L41">41</span>
<span id="L42" rel="#L42">42</span>
<span id="L43" rel="#L43">43</span>
<span id="L44" rel="#L44">44</span>
<span id="L45" rel="#L45">45</span>
<span id="L46" rel="#L46">46</span>
<span id="L47" rel="#L47">47</span>
<span id="L48" rel="#L48">48</span>
<span id="L49" rel="#L49">49</span>
<span id="L50" rel="#L50">50</span>
<span id="L51" rel="#L51">51</span>
<span id="L52" rel="#L52">52</span>
<span id="L53" rel="#L53">53</span>
<span id="L54" rel="#L54">54</span>
<span id="L55" rel="#L55">55</span>
<span id="L56" rel="#L56">56</span>
<span id="L57" rel="#L57">57</span>
<span id="L58" rel="#L58">58</span>
<span id="L59" rel="#L59">59</span>
<span id="L60" rel="#L60">60</span>
<span id="L61" rel="#L61">61</span>
<span id="L62" rel="#L62">62</span>
<span id="L63" rel="#L63">63</span>
<span id="L64" rel="#L64">64</span>
<span id="L65" rel="#L65">65</span>
<span id="L66" rel="#L66">66</span>
<span id="L67" rel="#L67">67</span>
<span id="L68" rel="#L68">68</span>
<span id="L69" rel="#L69">69</span>
<span id="L70" rel="#L70">70</span>
<span id="L71" rel="#L71">71</span>
<span id="L72" rel="#L72">72</span>
<span id="L73" rel="#L73">73</span>
<span id="L74" rel="#L74">74</span>
<span id="L75" rel="#L75">75</span>
<span id="L76" rel="#L76">76</span>
<span id="L77" rel="#L77">77</span>
<span id="L78" rel="#L78">78</span>
<span id="L79" rel="#L79">79</span>
<span id="L80" rel="#L80">80</span>
<span id="L81" rel="#L81">81</span>
<span id="L82" rel="#L82">82</span>
<span id="L83" rel="#L83">83</span>
<span id="L84" rel="#L84">84</span>
<span id="L85" rel="#L85">85</span>
<span id="L86" rel="#L86">86</span>
<span id="L87" rel="#L87">87</span>
<span id="L88" rel="#L88">88</span>
<span id="L89" rel="#L89">89</span>
<span id="L90" rel="#L90">90</span>
<span id="L91" rel="#L91">91</span>
<span id="L92" rel="#L92">92</span>
<span id="L93" rel="#L93">93</span>
<span id="L94" rel="#L94">94</span>

           </td>
           <td class="blob-line-code"><div class="code-body highlight"><pre><div class='line' id='LC1'><span class="c"># Get password from metadata, unless passed as MYSQL_PW, or set one.</span></div><div class='line' id='LC2'>log <span class="s2">&quot;getting mysql_pw&quot;</span></div><div class='line' id='LC3'><span class="nv">MYSQL_PW</span><span class="o">=</span><span class="k">${</span><span class="nv">MYSQL_PW</span><span class="k">:-$(</span>mdata-get mysql_pw 2&gt;/dev/null<span class="k">)}</span> <span class="o">||</span> <span class="se">\</span></div><div class='line' id='LC4'><span class="nv">MYSQL_PW</span><span class="o">=</span><span class="k">$(</span>od -An -N8 -x /dev/random <span class="p">|</span> head -1 <span class="p">|</span> tr -d <span class="s1">&#39; &#39;</span><span class="k">)</span><span class="p">;</span></div><div class='line' id='LC5'><br></div><div class='line' id='LC6'><span class="c"># Generate svccfg happy password for quickbackup-percona</span></div><div class='line' id='LC7'><span class="c"># (one without special characters)</span></div><div class='line' id='LC8'>log <span class="s2">&quot;getting qb_pw&quot;</span></div><div class='line' id='LC9'><span class="nv">QB_PW</span><span class="o">=</span><span class="k">$(</span>od -An -N8 -x /dev/random <span class="p">|</span> head -1 <span class="p">|</span> sed <span class="s1">&#39;s/^[ \t]*//&#39;</span> <span class="p">|</span> tr -d <span class="s1">&#39; &#39;</span><span class="k">)</span><span class="p">;</span></div><div class='line' id='LC10'><span class="nv">QB_US</span><span class="o">=</span>qb-<span class="k">$(</span>zonename <span class="p">|</span> awk -F<span class="se">\-</span> <span class="s1">&#39;{ print $5 }&#39;</span><span class="k">)</span><span class="p">;</span></div><div class='line' id='LC11'><br></div><div class='line' id='LC12'><span class="c"># Default query to lock down access and clean up</span></div><div class='line' id='LC13'><span class="nv">MYSQL_INIT</span><span class="o">=</span><span class="s2">&quot;DELETE from mysql.user;</span></div><div class='line' id='LC14'><span class="s2">DELETE FROM mysql.proxies_priv WHERE Host=&#39;base.joyent.us&#39;;</span></div><div class='line' id='LC15'><span class="s2">GRANT ALL on *.* to &#39;root&#39;@&#39;localhost&#39; identified by &#39;${MYSQL_PW}&#39; with grant option;</span></div><div class='line' id='LC16'><span class="s2">GRANT ALL on *.* to &#39;root&#39;@&#39;${PRIVATE_IP:-${PUBLIC_IP}}&#39; identified by &#39;${MYSQL_PW}&#39; with grant option;</span></div><div class='line' id='LC17'><span class="s2">GRANT LOCK TABLES,SELECT,RELOAD,SUPER,REPLICATION CLIENT on *.* to &#39;${QB_US}&#39;@&#39;localhost&#39; identified by &#39;${QB_PW}&#39;;</span></div><div class='line' id='LC18'><span class="s2">DROP DATABASE test;</span></div><div class='line' id='LC19'><span class="s2">DELETE FROM mysql.db WHERE Db=&#39;test&#39; OR Db=&#39;test\\_%&#39;;</span></div><div class='line' id='LC20'><span class="s2">FLUSH PRIVILEGES;</span></div><div class='line' id='LC21'><span class="s2">install plugin sphinx soname &#39;ha_sphinx.so&#39;;&quot;</span></div><div class='line' id='LC22'><br></div><div class='line' id='LC23'><span class="c"># MySQL my.cnf tuning</span></div><div class='line' id='LC24'><span class="nv">MEMCAP</span><span class="o">=</span><span class="k">$(</span>kstat -c zone_memory_cap -s physcap -p <span class="p">|</span> cut -f2 <span class="p">|</span> awk <span class="s1">&#39;{ printf &quot;%d&quot;, $1/1024/1024 }&#39;</span><span class="k">)</span><span class="p">;</span></div><div class='line' id='LC25'><br></div><div class='line' id='LC26'><span class="c"># innodb_buffer_pool_size</span></div><div class='line' id='LC27'><span class="nv">INNODB_BUFFER_POOL_SIZE</span><span class="o">=</span><span class="k">$(</span><span class="nb">echo</span> -e <span class="s2">&quot;scale=0; ${MEMCAP}/2&quot;</span><span class="p">|</span>bc<span class="k">)</span>M</div><div class='line' id='LC28'><br></div><div class='line' id='LC29'><span class="c"># back_log</span></div><div class='line' id='LC30'><span class="nv">BACK_LOG</span><span class="o">=</span>64</div><div class='line' id='LC31'><span class="o">[[</span> <span class="k">${</span><span class="nv">MEMCAP</span><span class="k">}</span> -gt <span class="m">8000</span> <span class="o">]]</span> <span class="o">&amp;&amp;</span> <span class="nv">BACK_LOG</span><span class="o">=</span>128</div><div class='line' id='LC32'><br></div><div class='line' id='LC33'><span class="c"># max_connections</span></div><div class='line' id='LC34'><span class="o">[[</span> <span class="k">${</span><span class="nv">MEMCAP</span><span class="k">}</span> -lt <span class="m">1000</span> <span class="o">]]</span> <span class="o">&amp;&amp;</span> <span class="nv">MAX_CONNECTIONS</span><span class="o">=</span>200</div><div class='line' id='LC35'><span class="o">[[</span> <span class="k">${</span><span class="nv">MEMCAP</span><span class="k">}</span> -gt <span class="m">1000</span> <span class="o">]]</span> <span class="o">&amp;&amp;</span> <span class="nv">MAX_CONNECTIONS</span><span class="o">=</span>500</div><div class='line' id='LC36'><span class="o">[[</span> <span class="k">${</span><span class="nv">MEMCAP</span><span class="k">}</span> -gt <span class="m">2000</span> <span class="o">]]</span> <span class="o">&amp;&amp;</span> <span class="nv">MAX_CONNECTIONS</span><span class="o">=</span>1000</div><div class='line' id='LC37'><span class="o">[[</span> <span class="k">${</span><span class="nv">MEMCAP</span><span class="k">}</span> -gt <span class="m">3000</span> <span class="o">]]</span> <span class="o">&amp;&amp;</span> <span class="nv">MAX_CONNECTIONS</span><span class="o">=</span>2000</div><div class='line' id='LC38'><span class="o">[[</span> <span class="k">${</span><span class="nv">MEMCAP</span><span class="k">}</span> -gt <span class="m">5000</span> <span class="o">]]</span> <span class="o">&amp;&amp;</span> <span class="nv">MAX_CONNECTIONS</span><span class="o">=</span>5000</div><div class='line' id='LC39'><br></div><div class='line' id='LC40'><span class="c"># table_cache</span></div><div class='line' id='LC41'><span class="nv">TABLE_CACHE</span><span class="o">=</span><span class="k">$((${</span><span class="nv">MEMCAP</span><span class="k">}</span><span class="o">/</span><span class="m">4</span><span class="k">))</span></div><div class='line' id='LC42'><span class="o">[[</span> <span class="k">${</span><span class="nv">TABLE_CACHE</span><span class="k">}</span> -lt <span class="m">256</span> <span class="o">]]</span> <span class="o">&amp;&amp;</span> <span class="nv">TABLE_CACHE</span><span class="o">=</span>256</div><div class='line' id='LC43'><span class="o">[[</span> <span class="k">${</span><span class="nv">TABLE_CACHE</span><span class="k">}</span> -gt <span class="m">512</span> <span class="o">]]</span> <span class="o">&amp;&amp;</span> <span class="nv">TABLE_CACHE</span><span class="o">=</span>512</div><div class='line' id='LC44'><br></div><div class='line' id='LC45'><span class="c"># thread_cache_size</span></div><div class='line' id='LC46'><span class="nv">THREAD_CACHE_SIZE</span><span class="o">=</span><span class="k">$((${</span><span class="nv">MAX_CONNECTIONS</span><span class="k">}</span><span class="o">/</span><span class="m">2</span><span class="k">))</span></div><div class='line' id='LC47'><span class="o">[[</span> <span class="k">${</span><span class="nv">THREAD_CACHE_SIZE</span><span class="k">}</span> -gt <span class="m">1000</span> <span class="o">]]</span> <span class="o">&amp;&amp;</span> <span class="nv">THREAD_CACHE_SIZE</span><span class="o">=</span>1000</div><div class='line' id='LC48'><br></div><div class='line' id='LC49'>log <span class="s2">&quot;tuning MySQL configuration&quot;</span></div><div class='line' id='LC50'>gsed -i <span class="se">\</span></div><div class='line' id='LC51'>	-e <span class="s2">&quot;s/bind-address = 127.0.0.1/bind-address = ${PRIVATE_IP:-${PUBLIC_IP}}/&quot;</span> <span class="se">\</span></div><div class='line' id='LC52'>	-e <span class="s2">&quot;s/back_log = 64/back_log = ${BACK_LOG}/&quot;</span> <span class="se">\</span></div><div class='line' id='LC53'>	-e <span class="s2">&quot;s/table_open_cache = 512/table_open_cache = ${TABLE_CACHE}/&quot;</span> <span class="se">\</span></div><div class='line' id='LC54'>	-e <span class="s2">&quot;s/thread_cache_size = 1000/thread_cache_size = ${THREAD_CACHE_SIZE}/&quot;</span> <span class="se">\</span></div><div class='line' id='LC55'>	-e <span class="s2">&quot;s/max_connections = 1000/max_connections = ${MAX_CONNECTIONS}/&quot;</span> <span class="se">\</span></div><div class='line' id='LC56'>	-e <span class="s2">&quot;s/innodb_buffer_pool_size = 16M/innodb_buffer_pool_size = ${INNODB_BUFFER_POOL_SIZE}/&quot;</span> <span class="se">\</span></div><div class='line' id='LC57'>	/opt/local/etc/my.cnf</div><div class='line' id='LC58'><br></div><div class='line' id='LC59'>log <span class="s2">&quot;configuring Quickbackup&quot;</span></div><div class='line' id='LC60'>svccfg -s quickbackup-percona setprop quickbackup/username <span class="o">=</span> astring: <span class="k">${</span><span class="nv">QB_US</span><span class="k">}</span></div><div class='line' id='LC61'>svccfg -s quickbackup-percona setprop quickbackup/password <span class="o">=</span> astring: <span class="k">${</span><span class="nv">QB_PW</span><span class="k">}</span></div><div class='line' id='LC62'>svcadm refresh quickbackup-percona</div><div class='line' id='LC63'><br></div><div class='line' id='LC64'>log <span class="s2">&quot;shutting down an existing instance of MySQL&quot;</span></div><div class='line' id='LC65'><span class="k">if</span> <span class="o">[[</span> <span class="s2">&quot;$(svcs -Ho state percona)&quot;</span> <span class="o">==</span> <span class="s2">&quot;online&quot;</span> <span class="o">]]</span><span class="p">;</span> <span class="k">then</span></div><div class='line' id='LC66'>	svcadm disable -t percona</div><div class='line' id='LC67'>	sleep 2</div><div class='line' id='LC68'><span class="k">fi</span></div><div class='line' id='LC69'><br></div><div class='line' id='LC70'>log <span class="s2">&quot;starting the new MySQL instance&quot;</span></div><div class='line' id='LC71'>svcadm <span class="nb">enable </span>percona</div><div class='line' id='LC72'><br></div><div class='line' id='LC73'>log <span class="s2">&quot;waiting for the socket to show up&quot;</span></div><div class='line' id='LC74'><span class="nv">COUNT</span><span class="o">=</span><span class="s2">&quot;0&quot;</span><span class="p">;</span></div><div class='line' id='LC75'><span class="k">while</span> <span class="o">[[</span> ! -e /tmp/mysql.sock <span class="o">]]</span><span class="p">;</span> <span class="k">do</span></div><div class='line' id='LC76'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sleep 1</div><div class='line' id='LC77'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="o">((</span><span class="nv">COUNT</span><span class="o">=</span>COUNT+1<span class="o">))</span></div><div class='line' id='LC78'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="o">[[</span> <span class="nv">$COUNT</span> -eq <span class="m">60</span> <span class="o">]]</span><span class="p">;</span> <span class="k">then</span></div><div class='line' id='LC79'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;log <span class="s2">&quot;ERROR Could not talk to MySQL after 60 seconds&quot;</span></div><div class='line' id='LC80'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nv">ERROR</span><span class="o">=</span>yes</div><div class='line' id='LC81'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">break </span>1</div><div class='line' id='LC82'>&nbsp;&nbsp;<span class="k">fi</span></div><div class='line' id='LC83'><span class="k">done</span></div><div class='line' id='LC84'><span class="o">[[</span> -n <span class="s2">&quot;${ERROR}&quot;</span> <span class="o">]]</span> <span class="o">&amp;&amp;</span> <span class="nb">exit </span>31</div><div class='line' id='LC85'>log <span class="s2">&quot;(it took ${COUNT} seconds to start properly)&quot;</span></div><div class='line' id='LC86'><br></div><div class='line' id='LC87'>sleep 1</div><div class='line' id='LC88'><br></div><div class='line' id='LC89'><span class="o">[[</span> <span class="s2">&quot;$(svcs -Ho state percona)&quot;</span> <span class="o">==</span> <span class="s2">&quot;online&quot;</span> <span class="o">]]</span> <span class="o">||</span> <span class="se">\</span></div><div class='line' id='LC90'>&nbsp;&nbsp;<span class="o">(</span> log <span class="s2">&quot;ERROR MySQL SMF not reporting as &#39;online&#39;&quot;</span> <span class="o">&amp;&amp;</span> <span class="nb">exit </span><span class="m">31</span> <span class="o">)</span></div><div class='line' id='LC91'><br></div><div class='line' id='LC92'>log <span class="s2">&quot;running the access lockdown SQL query&quot;</span></div><div class='line' id='LC93'>mysql -u root -e <span class="s2">&quot;${MYSQL_INIT}&quot;</span> &gt;/dev/null <span class="o">||</span> <span class="se">\</span></div><div class='line' id='LC94'>&nbsp;&nbsp;<span class="o">(</span> log <span class="s2">&quot;ERROR MySQL query failed to execute.&quot;</span> <span class="o">&amp;&amp;</span> <span class="nb">exit </span><span class="m">31</span> <span class="o">)</span></div></pre></div></td>
         </tr>
       </table>
  </div>

  </div>
</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <form accept-charset="UTF-8" class="js-jump-to-line-form">
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" autofocus>
    <button type="submit" class="button">Go</button>
  </form>
</div>

        </div>

      </div><!-- /.repo-container -->
      <div class="modal-backdrop"></div>
    </div><!-- /.container -->
  </div><!-- /.site -->


    </div><!-- /.wrapper -->

      <div class="container">
  <div class="site-footer">
    <ul class="site-footer-links right">
      <li><a href="https://status.github.com/">Status</a></li>
      <li><a href="http://developer.github.com">API</a></li>
      <li><a href="http://training.github.com">Training</a></li>
      <li><a href="http://shop.github.com">Shop</a></li>
      <li><a href="/blog">Blog</a></li>
      <li><a href="/about">About</a></li>

    </ul>

    <a href="/" aria-label="Homepage">
      <span class="mega-octicon octicon-mark-github" title="GitHub"></span>
    </a>

    <ul class="site-footer-links">
      <li>&copy; 2014 <span title="0.03360s from github-fe138-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="/site/terms">Terms</a></li>
        <li><a href="/site/privacy">Privacy</a></li>
        <li><a href="/security">Security</a></li>
        <li><a href="/contact">Contact</a></li>
    </ul>
  </div><!-- /.site-footer -->
</div><!-- /.container -->


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-suggester-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="fullscreen-contents js-fullscreen-contents js-suggester-field" placeholder=""></textarea>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped tooltipped-w" aria-label="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped tooltipped-w"
      aria-label="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <a href="#" class="octicon octicon-x close js-ajax-error-dismiss" aria-label="Dismiss error"></a>
      Something went wrong with that request. Please try again.
    </div>


      <script crossorigin="anonymous" src="https://assets-cdn.github.com/assets/frameworks-8c6e10f6700610e693b29e274318b3714523ca3e.js" type="text/javascript"></script>
      <script async="async" crossorigin="anonymous" src="https://assets-cdn.github.com/assets/github-53b1cad44f4d246c4d6b5d8f660705e5f21288c1.js" type="text/javascript"></script>
      
      
        <script async src="https://www.google-analytics.com/analytics.js"></script>
  </body>
</html>

