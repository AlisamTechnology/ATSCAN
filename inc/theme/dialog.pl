#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## INFO PANEL TEXT
my @TT=("TEAM", "TOOL", "PATH", "PERL", "SYST", "ALISAM TECHNOLOGY", "ATSCAN SCANNER", "atscan [options] or [Help: --help|-h|-?][Interactive: --interactive]", "<option> \/ Help: perl",
"[--help|-h|-?|--interactive(simple mode)]", "TIMEOUT", "Cannot get IP!", "Random", "No changes have been made!", "[!] Random not allowed when engines are defined!", "[!] Level not defined or not numeric!",
"[!] You have to set a method: --get or --post!", "[!] You have to validate data post! ex: -v text or --status 200", "No response recieved!", "ifinurl", "is not an IP address!",
"STATUS", "Host is", "Not Alive!", "Alive");

## OTHERS DIALOG TEXT
my @OTHERS=("Target", "Exp", "CMD", "MD5", "STRING", "Usage", "found!", "A scan is required! EX: --sql or validation EX: --status 200", "[!] ATSCAN will be removed from your system! [Y/N]:", 
"[i] ATSCAN was moved successfully", "You cannot use payloads here! Use --exp", "Disclaimer: Using ATSCAN to Attack targets without prior mutual consent is",
"illegal! It is your own responsibility to obey laws! Alisam Technology is", "not linked to any kind of loss or misuse or damage caused by this program!", "REPLC",
"[!] Type C to Continue or O to Exit!: ", "PARAM", "No parameter found!", "You cannot validate two times!", "METHOD", "Checking for updates..");

## USER AUTH
my @AUTH=("Login:", "Incorrect password!", "A password is already assigned! Do you want to remove it ? [y/n]:", "Password successfully removed!",
          "You will set an user password and will be required for each use!", "Enter password or press Cotrol+C to cancel", "Password successfully generated!", "No password have been set!",
          "Password must have at least 3 caracters!", "Tool will restart in", "THIS IS YOUR CONFIGURATION:", "No configuation found!", "Invalid option!", "is already configured use reset command first!",
          "Couldn't interpret your command!", "No configuation file found!", "Type your setting or [exit = exit]", "Choose a mode or type \"options\" to list aviable modes",
          "Choose a module or type \"options\" to list aviable modules", "Set arguments or type \"options\" to list arguments or \"run\" to execute", "How to use arguments? type \"help\" for help!",
          "Opss.. Nothing to run", "+ VAL* = This command Require a value");

## ERRORS DIALOG TEXT
my @ErrT=("LFI:", "MYSQL:", "AFD:", "Microsoft:", "Oracle:", "DB2:", "ODBC:", "POSTGRESQL:", "SYBASE:", "BOSSWEB:", "JDBC:", "Java Infinitydb:", "PHP:", "ASP:", "LUA:", "UNDEFINED:", "Mariadb:",
          "Possible Shell:", "ERRORS ", "Permissions\! Failed to write in", "Checking proxy connection via", "INFO:", "New Identity IP",
          "Traying again my solve problem or set timeout --time <time in s>", "Possible errors detected!");

## GENERAL DIALOG TEXT
my @DT=("Target\(s\) Found", "No Results Found\!", "Error\! Not a Valid Target\!", "SCAN FINISHED\!", "Unique Result\(s\) Found\!", "No Target list found\!", "[i] The tool is up to date!",
"Tool updeted with success\!", "Couldn't auto check for updates!", "Exploit\(s\)", "Check Your Connection or Proxy Setting\!", "Your Internet connection seems not active\!",
"Dorks\(s\)", "Results saved in", "Uppss.. Cannot process scan\!", "Possible solutions:", "Target must have protocol [http[s]://] OR file does not exist!", "Given target file path is not true.",
"Please change list extension to [.txt]!", "You have to set a scan for exploited targets\![sql\|lfi\|...]", "To scan server sites You have to set level [Ex: --level 10]\!",
"Invalid option\! --ifinurl or --unique needs dork search\!", "Invalid option\! [Ex: --replace <value> --with <value>]", "Invalid option\! Ex: t- <ip> --port 80 [--udp | --tcp]",
"COMMND", "Invalid options\!", "Min level is 10 [--level >=10]", "Engines: [Bing: 1][Google: 2][Ask: 3][Yandex: 4][Sogou: 5][All: all]",
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
                "MD5 GENERATOR", "ENCODE BASE64", "DECODE BASE64", "PORTS PING", "IP", "USER REGEX", "AGENT", "FILTER", "REGEX");

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

## HELP
sub interHelp {
  my $prf=$_[0];
  our (@c);
  
  print $c[11]."[::] COMMANDS\n";
  ltak();
  print ""
  ."$c[5] --proxy       $c[10] | Set tor proxy for scans [EX: --proxy \"socks://localhost:9050\"]\n"
  ."$c[5]               $c[10] | Set proxy [EX: --proxy \"http://12.45.44.2:8080\"] \n"
  ."$c[5]               $c[10] | Set proxy list [EX: --proxy list.txt] \n"
  ."$c[5] --motor| -m   $c[10] | Set engine motors default bing \n"
  ."$c[5]               $c[10] | EX: -m [Bing: 1][Google: 2][Ask: 3][Yandex: 4][Sogou: 5][All: all]\n"
  ."$c[5] --proxy-random$c[10] | Random proxy \n"
  ."$c[5]               $c[10] | [EX: --proxy-random list.txt] or --proxy-random \"socks://localhost:9050\"]\n"
  ."$c[5] --m-random    $c[10] | Random of all disponibles engines \n"
  ."$c[5] --brandom     $c[10] | Random all disponibles agents \n"
  ."$c[5] --timeout     $c[10] | set browser timeout (in seconds)\n"
  ."$c[5] --freq        $c[10] | Random time frequency (in seconds) \n" 
  ."$c[5] --dork | -d   $c[10] | Dork to search [Ex: house [OTHER]cars [OTHER]hotel] \n"
  ."$c[5] --target | -t $c[10] | Target \n"
  ."$c[5] --level | -l  $c[10] | Scan level (+- Number of page results to scan) \n"
  ."$c[5] --param | -p  $c[10] | Set test parameter EX:id,cat,product_ID \n"
  ."$c[5] --zone        $c[10] | Set search engine country \n"
  ."$c[5] --save | -s   $c[10] | Output file.\n"
  ."$c[5] --source      $c[10] | Html output folder.\n" 
  ."$c[5] --content     $c[10] | Print response content.\n"
  ."$c[5] --post        $c[10] | Use post method \n"
  ."$c[5] --get         $c[10] | Use get method \n"
  ."$c[5] --header      $c[10] | Set headers. \n"
  ."$c[5] --ping        $c[10] | Ping host. \n"
  ."$c[5] --host        $c[10] | Domain name [Ex: site.com] \n"
  ."$c[5] --nobanner    $c[10] | Hide tool banner\n"
  ."$c[5] --beep        $c[10] | Produce beep sound if positive scan found.\n"
  ."$c[5] --ifend       $c[10] | Produce beep sound when scan process is finished.\n"
  ."$c[5] --noinfo      $c[10] | Jump extra results info.\n"
  ."$c[5] --limit       $c[10] | Pause when scan reaches the defined amount of positive results.\n"
  ."$c[5] --valid | -v  $c[10] | Validate by string \n"
  ."$c[5] --status      $c[10] | Validate by http header status \n"
  ."$c[5] --ifinurl     $c[10] | Get targets with exact string matching\n"
  ."$c[5] --sregex      $c[10] | Get targets with exact regex matching\n"
  ."$c[5] --none        $c[10] | Get negative validation or engine regex matching.\n"
  ."$c[5]               $c[10] | use with -v --status --ifinurl --s/regex commands\n"
  ."$c[5] --notin       $c[10] | Get targets where string does not exist in html\n"
  ."$c[5] --unique      $c[10] | Get targets with exact dork matching\n"
  ."$c[5] --replace     $c[10] | String to replace \n"
  ."$c[5] --with        $c[10] | String to replace with \n"
  ."$c[5] --full        $c[10] | --replace --full Will replace all url parametres from string to the end\n"
  ."$c[5] --payload     $c[10] | Use your own payloads instead of tool ones\n"
  ."$c[5] --exp | -e    $c[10] | Exploit/Payload will be added to full target\n"
  ."$c[5] --expHost     $c[10] | Exploit will be added to the host\n"
  ."$c[5] --expIp       $c[10] | Exploit will be added to the host ip\n"
  ."$c[5] --shell       $c[10] | Shell link [Ex: http://www.site.com/shell.txt] \n"
  ."$c[5] --tcp         $c[10] | TCP port \n"
  ."$c[5] --udp         $c[10] | UDP port \n"
  ."$c[5] --md5         $c[10] | Convert to md5 \n"
  ."$c[5] --encode64    $c[10] | Encode base64 string \n"
  ."$c[5] --decode64    $c[10] | decode base64 string \n"
  ."$c[5] --TARGET      $c[10] | Will be replaced by target in extern command \n"
  ."$c[5] --HOST        $c[10] | Will be replaced by host in extern command \n"
  ."$c[5] --HOSTIP      $c[10] | Will be replaced by host IP in extern command \n"
  ."$c[5] --PORT        $c[10] | Will be replaced by open port in extern command \n"
  ."$c[5] --regex       $c[10] | Crawl to get strings matching regex\n"
  ."$c[5] --noquery     $c[10] | Remove string value from Query url \n"
  ."$c[5]               $c[10] | Ex: site.com/index.php?id=string] \n"  
  ."$c[5] --command     $c[10] | Extern Command to execute\n"
  ."$c[5] rang(x-y)     $c[10] | EX: --exp/expHost \"/index.php?id=rang(1-9)\" --sql OR -t \"site.com/index.php?id=rang(1-9)\" --sql\n"
  ."$c[5]               $c[10] | site.com/index.php?id=1->9 \n"
  ."$c[5] repeat(txt-y) $c[10] | EX: --exp/expHost \"/index.php?id=repeat(../-9)wp-config.php\" --sql OR -t \"site.com/index.php?id=../wp-config.php\"\n"
  ."$c[5]               $c[10] | In site.com/index.php?id=../wp-config.php then site.com/index.php?id=../../wp-config.php 9 times\n"
  ."$c[5] [DATA/DATAFILE]$c[10]| To separate data values ex: --data \"name:username [DATA]email:xxxxxx [DATA]pass:xxxxx\"\n"
  ."$c[5]               $c[10] | Wordlist: --data \"name:username [DATA]email:xxxx\@xx.com [DATAFILE]pass:\/root/Desktop\/list.txt\"\n"
  ."$c[5] [OTHER]       $c[10] | To separate all others values (dork exploit payload proxy target..) \n"
  ."$c[5]               $c[10] | Ex: --dork \"dork1 [OTHER]DORK2 [OTHER]DORK3\"\n"
  ."$c[5] --config      $c[10] | Configuration panel\n"
}

1;
