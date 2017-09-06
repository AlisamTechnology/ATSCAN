#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## HELP
  our (@c);
  print $c[11]."[::] COMMANDS\n";
  ltak();
  print ""
  ."$c[5] --proxy       $c[10] | Set tor proxy for scans [EX: --proxy \"socks://localhost:9050\"]\n"
  ."$c[5]               $c[10] | Set proxy [EX: --proxy \"http://12.45.44.2:8080\"] \n"
  ."$c[5]               $c[10] | Set proxy list [EX: --proxy list.txt] \n"
  ."$c[5] -m            $c[10] | Set engine motors default bing \n"
  ."$c[5]               $c[10] | EX: -m [Bing: 1][Google: 2][Ask: 3][Yandex: 4][Sogou: 5][All: all]\n"
  ."$c[5] --proxy-random$c[10] | Random proxy \n"
  ."$c[5]               $c[10] | [EX: --proxy-random list.txt] or --proxy-random \"socks://localhost:9050\"]\n"
  ."$c[5] --m-random    $c[10] | Random of all disponibles engines \n"
  ."$c[5] --brandom     $c[10] | Random all disponibles agents \n"
  ."$c[5] --timeout     $c[10] | set browser timeout (in seconds)\n"
  ."$c[5] --freq        $c[10] | Random time frequency (in seconds) \n" 
  ."$c[5] --dork | -d   $c[10] | Dork to search [Ex: house [OTHER]cars [OTHER]hotel] \n"
  ."$c[5] -t            $c[10] | Target \n"
  ."$c[5] --level | -l  $c[10] | Scan level (+- Number of page results to scan) \n"
  ."$c[5] -p            $c[10] | Set test parameter EX:id,cat,product_ID \n"
  ."$c[5] --save | -s   $c[10] | Output file.\n"
  ."$c[5] --source      $c[10] | Html output folder.\n" 
  ."$c[5] --content     $c[10] | Print response content.\n"  
  ."$c[5] --data        $c[10] | data. See examples \n"
  ."$c[5] --post        $c[10] | Use post method \n"
  ."$c[5] --get         $c[10] | Use get method \n"
  ."$c[5] --header      $c[10] | Set headers. \n"
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
  ."$c[5] --sql         $c[10] | Xss scan \n"
  ."$c[5] --lfi         $c[10] | Local file inclusion \n"
  ."$c[5] --joomrfi     $c[10] | Scan for joomla local file inclusion.\n"
  ."$c[5] --shell       $c[10] | Shell link [Ex: http://www.site.com/shell.txt] \n"
  ."$c[5] --wpafd       $c[10] | Scan wordpress sites for arbitery file download\n"
  ."$c[5] --admin       $c[10] | Get site admin page \n"
  ."$c[5] --shost       $c[10] | Get site subdomains \n"
  ."$c[5] --tcp         $c[10] | TCP port \n"
  ."$c[5] --udp         $c[10] | UDP port \n"
  ."$c[5] --sites       $c[10] | Sites in the server \n"
  ."$c[5] --wp          $c[10] | Wordpress sites in the server\n"
  ."$c[5] --joom        $c[10] | Joomla sites in the server\n"
  ."$c[5] --upload      $c[10] | Get sites with upload files in the server  \n"
  ."$c[5] --zip         $c[10] | Get sites with zip files in the server \n"
  ."$c[5] --md5         $c[10] | Convert to md5 \n"
  ."$c[5] --encode64    $c[10] | Encode base64 string \n"
  ."$c[5] --decode64    $c[10] | decode base64 string \n"
  ."$c[5] --TARGET      $c[10] | Will be replaced by target in extern command \n"
  ."$c[5] --HOST        $c[10] | Will be replaced by host in extern command \n"
  ."$c[5] --HOSTIP      $c[10] | Will be replaced by host IP in extern command \n"
  ."$c[5] --PORT        $c[10] | Will be replaced by open port in extern command \n"
  ."$c[5] --ip          $c[10] | Crawl to get Ips\n"
  ."$c[5] --regex       $c[10] | Crawl to get strings matching regex\n"
  ."$c[5] --noquery     $c[10] | Remove string value from Query url \n"
  ."$c[5]               $c[10] | Ex: site.com/index.php?id=string] \n"  
  ."$c[5] --command     $c[10] | Extern Command to execute\n"
  ."$c[5] --email       $c[10] | Get emails \n"
  ."$c[5] rang(x-y)     $c[10] | EX: --exp/expHost \"/index.php?id=rang(1-9)\" --sql OR -t \"site.com/index.php?id=rang(1-9)\" --sql\n"
  ."$c[5]               $c[10] | site.com/index.php?id=1->9 \n"
  ."$c[5] repeat(txt-y) $c[10] | EX: --exp/expHost \"/index.php?id=repeat(../-9)wp-config.php\" --sql OR -t \"site.com/index.php?id=../wp-config.php\"\n"
  ."$c[5]               $c[10] | In site.com/index.php?id=../wp-config.php then site.com/index.php?id=../../wp-config.php 9 times\n"
  ."$c[5] [DATA/DATAFILE]$c[10]| To separate data values ex: --data \"name:username [DATA]email:xxxxxx [DATA]pass:xxxxx\"\n"
  ."$c[5]               $c[10] | Wordlist: --data \"name:username [DATA]email:xxxx\@xx.com [DATAFILE]pass:\/root/Desktop\/list.txt\"\n"
  ."$c[5] [OTHER]       $c[10] | To separate all others values (dork exploit payload proxy target..) \n"
  ."$c[5]               $c[10] | Ex: --dork \"dork1 [OTHER]DORK2 [OTHER]DORK3\"\n"
  ."$c[5] --pass        $c[10] | Set password for tool use. \n"  
  ."$c[5] --config      $c[10] | Set configuration. \n"  
  ."$c[5] --update      $c[10] | Update tool. \n"  
  ."$c[5] --uninstall   $c[10] | Uninstall tool \n\n";
  
  ltak(); print $c[11]." [::] EXAMPLES: \n";
  
  ltak(); print $c[12]."  PROXY: \n".$c[10]
  ."   Tor: --proxy socks://localhost:9050 \n"
  ."   Proxy: --proxy <proxy> [Ex: http://12.32.1.5:8080] | --proxy <list.txt>.\n".$c[10]."\n\n";  
  ltak(); print $c[12]."  SET HEADERS: \n".$c[10]
  ."   --header \"Authorization:Basic YWRtaW46YWRtaW4 [OTHER]keep_alive:1\"\n\n" ;  
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
  ."   Search and rand: atscan -d <dork> -l <level> --expHost \"/index.php?id=rang(1-9)\" --sql\n"  
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
  ."   atscan -t \"site.com?index.php?id=rang(1-10)\" --sql\n"
  ."   atscan -t <target> --expHost \"/index.php?id=rang(1-10)\" --sql\n"
  ."   atscan -t <target> --expHost \"/index.php?id=repeat(../-9)wp-config.php\" \n\n";
  
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
  ."             atscan -t <target> --data \"username:john[DATA]pass:1234 --post | --get\n"
  ."  Wordlist: atscan -t <target> --data \"name:username [DATA]email:xxxx\@xx [DATAFILE]pass:\/root/Desktop\/list.txt\"\n"
  ."  Post + Validation: --data \"name:userfile[DATAFILE]value:file.txt\" -v <string> | --status <code> --post | --get\n\n";
  
  ltak(); print $c[12]."  EXTERNAL COMMANDES: \n".$c[10]
  ."   atscan --dork <dork | dorks.txt> --level <level> --command \"curl -v --TARGET\" \n"
  ."   atscan --dork <dork | dorks.txt> --level <level> --command \"curl -v --HOST\" \n"
  ."   atscan --dork <dork | dorks.txt> --level <level> --command \"nmap -sV -p 21,22,80 --HOSTIP\" \n"
  ."   atscan -t <target> --port 80 --udp --command \"nmap -sV -p --PORT --TARGET\" \n" 
  ."   atscan -d \"index of /lib/scripts/dl-skin.php\" -l 20 -m 2 --command \"php WP-dl-skin.php-exploit.php --TARGET\" \n\n";
  
  ltak(); print $c[12]."  MULTIPLE SCANS: \n".$c[10]
  ."   atscan --dork <dork> --level <10> --sql --lfi --wp ..\n"
  ."   atscan --dork <dork> --level <10> --replace <string> --with <string> --exp/expHost <exploit> [--sql | --lfi | --wp |...]\n"
  ."   atscan -t <ip> --level <10> [--sql | --lfi | --wp |...]\n"
  ."   atscan -t <targets> [--sql | --lfi | --wp |...]\n\n";
  
  ltak(); print $c[12]."  PAYLOADS USE: \n".$c[10]
  ."   atscan --dork <dork> --level <10> [--lfi | --sql ..] --payload <payload | payloads.txt> \n\n";
  
  ltak(); print $c[12]."  SEARCH VALIDATION: \n".$c[10]
  ."   atscan -d <dork | dorks.txt> -l <level> --status <code> | --valid <string> \n"
  ."   atscan -d <dork | dorks.txt> -l <level> --ifinurl <string> \n"
  ."   atscan -d <dork | dorks.txt> -l <level> --regex <regex> --valid <string>\n"
  ."   atscan -d <dork | dorks.txt> -l <level> --unique \n\n";
  
  ltak(); print $c[12]."  SCAN VALIDATION: \n".$c[10]
  ."   atscan -t <target | targets.txt> [--status <code> | --valid <string>] \n"
  ."   atscan -t <target | targets.txt> [--status <code> | --valid <string> --none] \n"
  ."   atscan -d <dork | dorks.txt> -l <level> --exp/expHost <payload> --status <code> | --valid <string> \n"
  ."   atscan -d <dorks.txt> -l <level> --replace <string> --with <string> --status <code> | --valid <string> \n"
  ."   atscan -d <dork | dorks.txt> -l <level> [--admin | --sql ..] --status <code> | --valid <string> \n"  
  ."   atscan -d <dorks.txt> -l <level> --replace <string> --with <string> --status <code> | --valid <string>\n"
  ."   atscan -d <dorks.txt> -l <level> --replace <string> --with <string> --full --status <code> | --valid <string>\n"
  ."   atscan -d <dorks.txt> -l <level> --replace <string> --with <string> --exp/expHost <payload> --status <code> | --valid <string>\n"
  ."   atscan --data \"name:userfile[DATAFILE]value:file.txt\" --post -v <string> | --status <code> \n"
  ."   atscan -d <dork | dorks.txt> -l <level> [--sql | --shost ..] --status <code> | --valid <string> \n\n";
  
  ltak(); print $c[12]."  UPDATE TOOL: \n".$c[10]."   --update\n";
  
  ltak(); print $c[12]."  UNINSTALL TOOL: \n".$c[10]."   atscan --uninstall\n";
  ltak(); ltak();

1;
