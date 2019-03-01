#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
use POSIX qw(strftime);
## Copy@right Alisam Technology see License.txt

## CLEAR
if ($^O!~/Win/) { printf "\033c"; }else{ system("cls"); }

## 
our @TODO=();
our $validText;
our @V_VALID=($validText) if defined $validText;
our (@buildArrays, @dorks, @payloads, @exploits, @data, @aTsearch, @aTscans, @aTtargets, @aTcopy, @ports, @motor, @motors, @systems)=();
our (@V_LFI, @V_XSS, @V_AFD, @E_MICROSOFT, @E_ORACLE, @E_DB2, @E_ODBC, @E_POSTGRESQL, @E_SYBASE, @E_JBOSSWEB, @E_JDBC, @E_JAVA, @E_PHP, @E_ASP, @E_UNDEFINED, @E_MARIADB, @E_SHELL, @DT);
our (@V_WP, @V_JOOM, @V_TP, @V_SMF, @V_PhpBB, @V_VB, @V_MyBB, @V_CF, @V_DRP, @V_PN, @V_AT, @V_PHPN, @V_MD, @V_ACM, @V_SS, @V_MX, @V_XO, @V_OSC, @V_PSH, @V_BB2, @V_MG, @V_ZC, @V_CC5, @V_OCR);
our @ERR=(@V_LFI, @V_XSS, @V_AFD, @E_MICROSOFT, @E_ORACLE, @E_DB2, @E_ODBC, @E_POSTGRESQL, @E_SYBASE, @E_JBOSSWEB, @E_JDBC, @E_JAVA, @E_PHP, @E_ASP, @E_UNDEFINED, @E_MARIADB, @E_SHELL);
our @CMS=(@V_WP, @V_JOOM, @V_TP, @V_SMF, @V_PhpBB, @V_VB, @V_MyBB, @V_CF, @V_DRP, @V_PN, @V_AT, @V_PHPN, @V_MD, @V_ACM, @V_SS, @V_MX, @V_XO, @V_OSC, @V_PSH, @V_BB2, @V_MG, @V_ZC, @V_CC5, @V_OCR);

our ($Version, $logoVersion, $scriptUrl, $logUrl, $ipUrl, $conectUrl, $script, $scriptInstall, $script_bac, $scriptbash, $scriptv,
     $scriptCompletion, $scriptComplInstall, $readme, $uplog, $replace, $replaceFROM, $server, $geoServer, @configuration);

$Version="16.0.6";
$logoVersion="V $Version";
$scriptUrl="https://raw.githubusercontent.com/AlisamTechnology/ATSCAN/master/atscan.pl";
$logUrl="https://raw.githubusercontent.com/AlisamTechnology/ATSCAN/master/inc/conf/version.log";
$ipUrl="http://dynupdate.no-ip.com/ip.php";
$conectUrl="http://www.bing.com";
$server="https://cxsecurity.com";
$geoServer="https://www.onyphe.io/api/geoloc";

## DEFINE SCAN LISTS 
$scriptv=$Bin."/inc/conf/version.log";
$script=$Bin."/atscan";
if (substr($0, -3) eq '.pl') { $script.=".pl"; }
$scriptComplInstall="$Bin/inc/conf/atscan";
$scriptInstall="$Bin/install.sh";
$script_bac=$Bin."/version_bac.log";
$uplog="$Bin/inc/conf/uplog.log";
$scriptbash="/usr/bin/atscan";
$scriptCompletion="/etc/bash_completion.d";
$readme="/usr/share/doc/atscan";
our $userSetting="$Bin/inc/conf/userSetting";
our $deskIcon="$Bin/inc/conf/desktop/";
our $deskIcoConf="/usr/share/applications";
unlink "$Bin/inc/conf/user/cookies.txt" if -e "$Bin/inc/conf/user/cookies.txt";

## DATE
our $date = strftime "%H:%M:%S", localtime;
our $fulldate = strftime "%Y%j", localtime;

## TIMER
sub timer { my $time=strftime "%H:%M:%S", localtime; print "[$time]"; }

## DELETE CLEAR LISTS
unlink $script_bac if -e $script_bac;

## USER CONFIGUATION
sub get_configuration {
  @configuration=();
  if (-e $userSetting) {
    open(F1, $userSetting);
    while (my $set=<F1>) {             
      if (!($set=~/^$/)) {
        push @configuration, $set;
      }
    }
    close( F1 );
  }
  return @configuration;
}

## LOAD PAYLOADS  
require "$Bin/inc/payloads.pl";
## LOAD DIALOG TEXT
require "$Bin/inc/theme/dialog.pl";
## VALIDATION CODE ERRORS
require "$Bin/inc/errors/codeErrors.pl";
## ENGINE
require "$Bin/inc/search/engine.pl";
require "$Bin/inc/functions/validate.pl";


## MAIL VALIDATION
our ($searchRegex, $regex);
our $V_EMAIL='((([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})';
our $V_IP='((\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3}))';
our $V_RANG='(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\-(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})';
our $V_SEARCH='((https?|ftps?):\/\/([^>\"\<\'\(\)\#\s]*))';
our $V_REGEX=$regex;
our $S_REGEX=$searchRegex;

## ENGINE MOTORS
our $motor1="http://www.bing.com/search?q=MYDORK&first=MYNPAGES&FORM=PERE&cc=MYBROWSERLANG";
our $motor2="http://www.google.MYGOOGLEDOMAINE/search?q=MYDORK&start=MYNPAGES";
our $motor3="http://www.ask.com/web?q=MYDORK&page=MYNPAGES&qid=MYID";
our $motor4="http://www.yandex.com/search/?msid=MYMSID&text=MYDORK&lr=25402&p=MYNPAGES";
our $motor5="http://www.sogou.com/web?query=MYDORK&page=MYNPAGES&ie=utf8";
our $motor6="https://www.exalead.com/search/web/results/?q=MYDORK&elements_per_page=10&start_index=MYNPAGES";
our $motor7="https://www.googleapis.com/customsearch/v1?key=MYAPIKEY&cx=MYCX&q=MYDORK&start=MYNPAGES";

our @mrands=($motor1, $motor2, $motor3, $motor4, $motor5, $motor6, $motor7);
our @allMotors=($motor1, $motor2, $motor3, $motor4, $motor5, $motor6, $motor7);
our $pat2='inurl:|intitle:|intext:|allinurl:|index of:|site:(.*)\+|\+site:(.*)';
our $paylNote="[i] $DT[28]\n";


1;
