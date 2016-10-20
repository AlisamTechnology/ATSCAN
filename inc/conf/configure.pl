#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## ALISAM TECHNOLOGY 2015
######################################################################################################################################################################################################
######################################################################################################################################################################################################
if ($^O!~/Win/) { printf "\033c"; }else{ system("cls"); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
our ($Hstatus, $validText, $WpSites, $JoomSites, $xss, $lfi, $JoomRfi, $WpAfd, $adminPage, $subdomain, $mupload, $mzip, $eMails, $command, $mmd5, $mencode64, $mdecode64, $port, $msites,
$mdom, $Target, $exploit, $p, $tcp, $udp, $full, $proxy, $prandom, $help, $output, $replace, $with, $dork, $mlevel, $unique, $shell, $nobanner, $beep, $ifinurl, $noinfo, $motor, $timeout,
$limit, $checkVersion, $searchIps, $regex, $searchRegex, $noQuery, $ifend, $uninstall, $post, $get, $brandom, $data, $payloads, $mrandom, $content, $pass, $updtd);
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## VERSION
our ($Version, $logoVersion, $scriptUrl, $logUrl, $ipUrl, $conectUrl, $script, $scriptInstall, $script_bac, $scriptbash, $scriptPass, $scriptv, $scriptCompletion, $scriptComplInstall);
$Version="11.6";
$logoVersion="V $Version";
$scriptUrl="https://raw.githubusercontent.com/AlisamTechnology/ATSCAN/master/atscan.pl";
$logUrl="https://raw.githubusercontent.com/AlisamTechnology/ATSCAN/master/inc/conf/version.log";
$ipUrl="http://dynupdate.no-ip.com/ip.php";
$conectUrl="http://www.bing.com";
######################################################################################################################################################################################################
## DEFINE SCAN LISTS  ################################################################################################################################################################################
$scriptv=$Bin."/inc/conf/version.log";
$script=$Bin."/atscan";
if (substr($0, -3) eq '.pl') { $script.=".pl"; }
$scriptComplInstall="$Bin/inc/conf/atscan";
$scriptInstall="$Bin/install.sh";
$scriptPass=$Bin."/inc/conf/conf.xml";
$script_bac=$Bin."/version_bac.log";
$scriptbash="/usr/bin/atscan";
$scriptCompletion="/etc/bash_completion.d";
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## DELETE CLEAR LISTS
sub deleteLists {
  our (@buildArrays, @dorks, @userArraysList, @exploits, @data, @proxies, @aTsearch, @aTscans, @aTtargets, @aTcopy, @ports, @motor, @motors, @systems)=();
  unlink our $script_bac;
}
deleteLists();
######################################################################################################################################################################################################
## COLORS ############################################################################################################################################################################################
require "$Bin/inc/theme/colors.pl";
our @c=get_colors();
######################################################################################################################################################################################################
## LOAD PAYLOADS  ####################################################################################################################################################################################
require "$Bin/inc/payloads.pl";
our @XSS=get_xss_payloads();
our @LFI=get_lfi_payloads();
our @RFI=get_rfi_payloads();
our @ADFWP=get_adfwp_payloads();
our @ADMIN=get_admin_payloads();
our @SUBDOMAIN=get_subdomain_payloads();
our @UPLOAD=get_upload_payloads();
our @ZIP=get_zip_payloads();

## LOAD DIALOG TEXT
require "$Bin/inc/theme/dialog.pl";
our @TT=get_text_tt();
our @OTHERS=get_text_others();
our @AUTH=get_text_auth();
our @ErrT=get_text_ErrT();
our @DT=get_text_dt();
our @DS=get_text_ds();
our @cms=get_text_cms();
our @SCAN_TITLE=get_text_scan_title();

## VALIDATION CODE ERRORS
require "$Bin/inc/errors/codeErrors.pl";
our @E_MICROSOFT=get_validate_microsoft();
our @E_ORACLE=get_validate_oracle();
our @E_DB2=get_validate_db2();
our @E_ODBC=get_validate_odbc();
our @E_POSTGRESQL=get_validate_postgresql();
our @E_SYBASE=get_validate_sysbase();
our @E_JBOSSWEB=get_validate_jbossweb();
our @E_JDBC=get_validate_jdbc();
our @E_JAVA=get_validate_java();
our @E_PHP=get_validate_php();
our @E_ASP=get_validate_asp();
our @E_LUA=get_validate_lua();
our @E_UNDEFINED=get_validate_undefined();
our @E_MARIADB=get_validate_mariadb();
our @E_SHELL=get_validate_shell();

## ENGINE
our (@buildArrays, @dorks, @userArraysList, @exploits, @data, @aTsearch, @aTscans, @aTtargets, @aTcopy, @ports, @motor, @motors, @systems)=();
require "$Bin/inc/search/engine.pl";
our @strings=get_strings();
our @browserlangs=get_browserlangs();
our @googleDomains=get_googleDomains();
our @Ids=get_Ids();
our @MsIds=get_MsIds();
our @sys=get_sys();
our @vary=get_vary();
our $nolisting=get_nolisting();

require "$Bin/inc/functions/validate.pl";
our @V_WP=get_validate_wp();
our @V_JOOM=get_validate_joom();
our @V_TP=get_validate_tp();
our @V_SMF=get_validate_smf();
our @V_PhpBB=get_validate_phpbb();
our @V_VB=get_validate_vb();
our @V_MyBB=get_validate_mybb();
our @V_CF=get_validate_cf();
our @V_DRP=get_validate_drp();
our @V_PN=get_validate_pn();
our @V_AT=get_validate_at();
our @V_PHPN=get_validate_phpn();
our @V_MD=get_validate_md();
our @V_ACM=get_validate_acm();
our @V_SS=get_validate_ss();
our @V_MX=get_validate_mx();
our @V_XO=get_validate_xo();
our @V_OSC=get_validate_osc();
our @V_PSH=get_validate_psh();
our @V_BB2=get_validate_bb2();
our @V_MG=get_validate_mg();
our @V_ZC=get_validate_zc();
our @V_CC5=get_validate_cc5();
our @V_OCR=get_validate_ocr();
our @V_XSS=get_validate_xss();
our @V_LFI=get_validate_lfi();
our @V_TODO=get_validate_todo();
our @V_AFD=get_validate_afd();
our @TODO=();
our @V_VALID=($validText) if defined $validText;
our @ERR=(@V_LFI, @V_XSS, @V_AFD, @E_MICROSOFT, @E_ORACLE, @E_DB2, @E_ODBC, @E_POSTGRESQL, @E_SYBASE, @E_JBOSSWEB, @E_JDBC, @E_JAVA, @E_PHP, @E_ASP, @E_UNDEFINED, @E_MARIADB, @E_SHELL);
our @CMS=(@V_WP, @V_JOOM, @V_TP, @V_SMF, @V_PhpBB, @V_VB, @V_MyBB, @V_CF, @V_DRP, @V_PN, @V_AT, @V_PHPN, @V_MD, @V_ACM, @V_SS, @V_MX, @V_XO, @V_OSC, @V_PSH, @V_BB2, @V_MG, @V_ZC, @V_CC5, @V_OCR);
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## MAIL VALIDATION
our $V_EMAIL='((([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})';
our $V_IP='((\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3}))';
our $V_RANG='(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\-(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})';
our $V_SEARCH='((https?|ftps?):\/\/([^>\"\<\'\(\)\#\s]*))';
our $V_REGEX=$regex;
our $S_REGEX=$searchRegex;
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## ENGINE MOTORS
our $motor1="http://www.bing.com/search?q=MYDORK&first=MYNPAGES&FORM=PERE&cc=MYBROWSERLANG";
our $motor2="http://www.google.MYGOOGLEDOMAINE/search?q=MYDORK&start=MYNPAGES";
our $motor3="http://www.ask.com/web?q=MYDORK&page=MYNPAGES&qid=MYID";
our $motor4="http://www.yandex.com/search/?msid=MYMSID&text=MYDORK&lr=25402&p=MYNPAGES";
our $motor5="http://www.sogou.com/web?query=MYDORK&page=MYNPAGES&ie=utf8";
our $motorparam="1|2|3|4|5|all";
our @mrands=($motor1, $motor2, $motor3, $motor4, $motor5);
our $mrand=$mrands[rand @mrands];
our @allMotors=($motor1, $motor2, $motor3, $motor4, $motor5);
our $pat2='inurl:|intitle:|intext:|allinurl:|index of|site:(.*)\+|\+site:(.*)';
our $paylNote="[!] $DT[28]\n";
######################################################################################################################################################################################################
######################################################################################################################################################################################################
our $browserLang=$browserlangs[rand @browserlangs];
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## GOOGLE DOMAINS
our $googleDomain=$googleDomains[rand @googleDomains];
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## ID RANDOM
our $Id=$Ids[rand @Ids];
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## MSID RANDOM
our $MsId=$MsIds[rand @MsIds];
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## MAX POSITIVE SCAN RESULTS
## Chnage for more positive scans!!
$limit="500" if !defined $limit;
$timeout=10 if !defined $timeout;
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## BUILD PROXIES ARRAY
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## BROWSER 
use IO::Socket::INET;
use LWP::UserAgent;
use HTTP::Cookies;
use HTTP::Request;
binmode STDOUT, ":utf8";
for my $sys(@sys) {
  for my $vary(@vary) {
    my $ag="$sys) $vary";
    push @systems, $ag;
  }
}
our ($system, $agent, $ua);
$agent="Mozilla/5.0 (".$systems[rand @systems];
$ua=LWP::UserAgent->new( agent => $agent, cookie_jar => HTTP::Cookies->new());
$ua->default_header('Accept' => ('text/html'));
$ua->env_proxy;
$ua->timeout($timeout);
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## RENEW AGENT
sub getNewAgent {
  $agent="Mozilla/5.0 (".$systems[rand @systems];
  $ua=LWP::UserAgent->new( agent => $agent, cookie_jar => HTTP::Cookies->new());
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## SET BROWSER
our ($psx);
sub UA { $ua->proxy([qw/ http https ftp ftps /] => $psx); $ua->cookie_jar({ }); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## SCAN DETAILS
sub scanDetail { if (!defined $mlevel) { desclaimer(); print $c[4]."[!] $DT[31]\n" if !defined $proxy && !defined $prandom; testConnection(); } }
####################################################################################################################################################################################################
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## AUTH
####################################################################################################################################################################################################
## USER PASS AUTH ##################################################################################################################################################################################
sub logg { require "$Bin/inc/functions/log.pl"; }
sub password { require "$Bin/inc/functions/setPass.pl"; }
sub ckvrsn { require "$Bin/inc/functions/checkVersion.pl"; }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
1;
######################################################################################################################################################################################################
######################################################################################################################################################################################################
