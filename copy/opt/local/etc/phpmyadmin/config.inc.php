<?php
/* Servers configuration */
$i = 0;

/* Server: localhost [1] */
$i++;
$cfg['Servers'][$i]['verbose'] = '';
$cfg['Servers'][$i]['host'] = 'localhost';
$cfg['Servers'][$i]['socket'] = '/tmp/mysql.sock';
$cfg['Servers'][$i]['connect_type'] = 'socket';
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/* End of servers configuration */

$cfg['blowfish_secret'] = 'GEN_BLOWFISH_SECRET';
$cfg['DefaultLang'] = 'en';
$cfg['ServerDefault'] = 1;
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
$cfg['ForceSSL'] = true;
$cfg['UserprefsDisallow'] = array('ServerLibraryDifference_DisableWarning', 'PmaNoRelation_DisableWarning', 'SuhosinDisableWarning', 'VersionCheck');
$cfg['VersionCheck'] = false;
$cfg['PmaNoRelation_DisableWarning'] = true;

?>
