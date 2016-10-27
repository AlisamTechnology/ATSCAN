#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## INFO PANEL TEXT
my @TT=("TEAM", "TOOL", "PATH", "PERL", "SYST", "ALISAM TECHNOLOGY", "ATSCAN SCANNER", "atscan <arg> / Help: atscan [--help | -h | -?]", "<option> \/ Help: perl",
"[--help|-h|-?]", "TIMEOUT", "Cannot get IP!", "Random", "No changes have been made!", "[!] Random not allowed when engines are defined!", "[!] Level not defined or not numeric!",
"[!] You have to set a method: --get or --post!", "[!] You have to validate data post! ex: -v text or --status 200", "No response recieved!", "ifinurl", "is not an IP address!");

## OTHERS DIALOG TEXT
my @OTHERS=("Target", "Exp", "CMD", "MD5", "STRING", "Usage", "found!", "A scan is requiered! EX: --sql or validation EX: --status 200", "[!] ATSCAN will be removed from your system! [Y/N]:", 
"[!] ATSCAN was moved successfully", "You cannot use payloads here! Use --exp", "Discleamer: Using ATSCAN to Attack targets without prior mutual consent is",
"illegal! It is your own responsibility to obey laws! Alisam Technology is", "not linked to any kind of loss or misuse or damage caused by this program!", "REPLC",
"[!] Type C to Continue or O to Exit!: ", "PARAM", "No parameter found!", "You cannot validate two times!", "METHOD", "Checking for updates..");

## USER AUTH
my @AUTH=("Login:", "Incorrect password!", "A password is already assigned! Do you want to remove it ? [y/n]:", "Password successfully removed!",
          "You will set an user password and will be requiered for each use!", "Enter password or press Cotrol+C to cancel", "Password successfully generated!", "No password have been set!",
          "Password must have at least 3 caracters!", "Tool will restart in", "THIS IS YOUR CONFIGURATION:", "No configuation found!", "Invalid option!", "is already configured use reset command first!",
          "Couldn't interpret your command!", "No configuation file found!", "Type your setting or exit to cancel:");

## ERRORS DIALOG TEXT
my @ErrT=("LFI:", "MYSQL:", "AFD:", "Microsoft:", "Oracle:", "DB2:", "ODBC:", "POSTGRESQL:", "SYBASE:", "BOSSWEB:", "JDBC:", "Java Infinitydb:", "PHP:", "ASP:", "LUA:", "UNDEFINED:", "Mariadb:",
          "Possible Shell:", "ERRORS ", "Permissions\! Failed to write in", "Checking proxy connection via", "INFO:", "New Identity IP",
          "Traying again my solve problem or set timeout --time <time in s>", "Possible errors detected!");

## GENERAL DIALOG TEXT
my @DT=("Target\(s\) Found", "No Results Found\!", "Error\! Not a Valid Target\!", "SCAN FINISHED\!", "Unique Result\(s\) Found\!", "No Target list found\!", "[!] The tool is up to date!",
"Tool updeted with success\!", "Couldn't auto check for updates!", "Exploit\(s\)", "Check Your Connection or Proxy Setting\!", "Your Internet connection seems not active\!",
"Dorks\(s\)", "Results saved in", "Uppss.. Cannot process scan\!", "Possible solutions:", "Target must have protocol [http[s]://].", "Given target file path is not true.",
"Please change list extension to [.txt]!", "You have to set a scan for exploited targets\![sql\|lfi\|...]", "To scan server sites You have to set level [Ex: --level 10]\!",
"Invalid option\! --ifinurl or --unique needs dork search\!", "Invalid option\! [Ex: --replace <value> --with <value>]", "Invalid option\! Ex: t- <ip> --port 80 [--udp | --tcp]",
"COMND", "Invalid options\!", "Min level is 10 [--level >=10]", "Engines: [Bing: 1][Google: 2][Ask: 3][Yandex: 4][Sogou: 5][All: all]",
"Tool uses default payloads & validation\! You can use your owns using args!\n    Ex: --exp [payload] -v [string] or --payload [your payloads]", "Some thing wrong!",
"Failed to renew identity with", "Please wait...", "POST", "is an IP [Use\!: -t <ip> --level 20 <opcion>]", "Max Positive results defined by user reached",
"Undefined", "Redirect To: ", "Proxy(s)", "Random engine just when using engine!", "Do you want to update tool?", "You have to set scan level [Ex: --level 10]",
"You have to set shell link! [Ex: http://www.site.co.uk/r57.txt]", "Conflict!! Please change", "file ext to [.txt]!", "found!");

## SCAN DIALOG TEXT
my @DS=("DORK", "INFO", "SERVER", "HTTP", "SCAN", "PAYLD", "EXPLOIT", "PORT", "TYPE", "TARGET", "IP", "PROXY", "VALID", "HTTP/1.1", "EXPLOIT", "GET", "EXTRA", "SHELL", "LEVEL", "OUTPUT",
        "EXT CMD", "TASK", "BING", "GOOGLE", "ASK [com]", "YANDEX [com]", "SOGOU [com]", "BING GOOGLE ASK YANDEX DOGOU", "DEFAULT BING", "ENGINE", "Unique Results", "Ifinurl", "URL REGEX",
        "Validate URL", "Server Sites", "WP sites", "JOOM sites", "Subdomains", "No extra info", "Beep Sound", "Remove Query", "Regex", "Open", "Closed", "Random Proxy", "Tor Proxy", "No Proxy",
        "Range", "Replace", "Vul Param:", "Upload", "External Command", "Update Version", "E-mails", "Encode Base64", "Decode Base64", "Get host", "Pause Mode", "ADMIN", "PORTS", "SQL",
        "LFI", "RFI", "AFD", "TCP", "UDP", "ZIP", "STARTING", "Md5", "Proxy");

## CMS SCAN TYPES
my @cms=("CMS", "Wordpress", "Joomla", "Textpattern", "SMF", "PhpBB!", "VBulletin", "MyBB", "CloudFlare", "Post Nuke", "Drupal", "ATutor", "Php Nuke", "Moodle", "Adapt Cms", "Silver Stripe",
         "Modx", "XOOPS", "Oscommerce", "PrestaShop", "B2evolution", "Smart Solutions", "Zen Cart", "concrete5", "OpenCart");

## SCAN TITLES
my @SCAN_TITLE=("SEARCH ENGINE", "VALIDATION", "Validate by HTTP header is not allowed here!\n", "WORDPRESS SITES", "JOOMLA SITES", "SQL", "LOCAL FILE INCLUSION", "JOOMLA REMOTE FILE INCLUSION",
                "WORDPRESS ARBITRARY FILE DOWNLOAD", "ADMIN PAGE", "SUBDOMAINS", "UPLOAD FILES", "ZIP FILES", "E-MAILS", "WORDPRESS BRUTE FORCE", "JOOMLA BRUTE FORCE", "EXTERN COMMAND SUBPROCESS",
                "MD5 GENERATOR", "ENCODE BASE64", "DECODE BASE64", "PORTS", "IP", "USER REGEX", "AGENT", "FILTER", "REGEX");

## INSTALL / UNINSTALL / UPDATE
my @ZT=("Copying user components...", "Placing main script...", "Placing components...", "Placing README.md", "Checking others components...", "Moving", "Restauring user files...",
        "Deleting install files...", "Deleting", "Printing update log...");

## MENU
sub get_text_tt { return @TT; }
sub get_text_others { return @OTHERS; }
sub get_text_auth { return @AUTH; }
sub get_text_ErrT { return @ErrT; }
sub get_text_dt { return @DT; }
sub get_text_ds { return @DS; }
sub get_text_cms { return @cms; }
sub get_text_zt { return @ZT; }
sub get_text_scan_title { return @SCAN_TITLE; }

1;
