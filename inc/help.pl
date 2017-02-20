#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## HELP
  our (@c);
  print $c[1]."[::] HELP\n";
  ltak();
  print $c[10]
  ."   --proxy       | Set tor proxy for scans [EX: --proxy \"socks://localhost:9050\"]\n"
  ."                 | Set proxy [EX: --proxy \"http://12.45.44.2:8080\"] \n"
  ."                 | Set proxy list [EX: --proxy list.txt] \n"
  ."  -m             | Set engine motors default bing EX: -m [Bing: 1][Google: 2][Ask: 3][Yandex: 4][Sogou: 5][All: all]\n"
  ."  --proxy-random | Random proxy [EX: --proxy-random list.txt] or --proxy-random \"socks://localhost:9050\"]\n"
  ."  --m-random     | Random of all disponibles engines \n"
  ."  --brandom      | Random all disponibles agents \n"
  ."  --timeout      | set browser timeout (in seconds)\n"
  ."  --freq         | Random time frequency (in seconds) \n" 
  ."  --dork | -d    | Dork to search [Ex: house [OTHER]cars [OTHER]hotel] \n"
  ."  -t             | Target \n"
  ."  --level | -l   | Scan level (+- Number of page results to scan) \n"
  ."  -p             | Set test parameter EX:id,cat,product_ID \n"
  ."  --save | -s    | Output file.\n"
  ."  --source       | Html output folder.\n" 
  ."  --content      | Print response content.\n"  
  ."  --data         | data. See examples \n"
  ."  --post         | Use post method \n"
  ."  --get          | Use get method \n"
  ."  --header       | Set headers. \n"
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
  ."  --sql          | Xss scan \n"
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
  ."  rang(x-y)      | EX: --exp \"/index.php?id=rang(1-9)\" --sql OR -t \"site.com/index.php?id=rang(1-9)\" --sql\n"
  ."                 | site.com/index.php?id=1->9 \n"
  ."  repeat(txt-y)  | EX: --exp \"/index.php?id=repeat(../-9)wp-config.php\" --sql OR -t \"site.com/index.php?id=../wp-config.php\"\n"
  ."                 | In site.com/index.php?id=../wp-config.php then site.com/index.php?id=../../wp-config.php 9 times\n"
  ."  [DATA/DATAFILE]| To separate data values ex: --data \"name:username [DATA]email:xxxxxx [DATA]pass:xxxxx\"\n"
  ."                 | Wordlist: --data \"name:username [DATA]email:xxxx\@xx.com [DATAFILE]pass:\/root/Desktop\/list.txt\"\n"
  ."  [OTHER]        | To separate all others values (dork exploit payload proxy target..) ex: --dork \"dork1 [OTHER]DORK2 [OTHER]DORK3\"\n"
  ."  --pass         | Set or edit tool password. \n"
  ."  --config       | Set configuration. \n"  
  ."  --update       | Update tool. \n"  
  ."  --uninstall    | Uninstall tool \n\n";
  
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
  ."   Search and rand: atscan -d <dork> -l <level> --exp \"/index.php?id=rang(1-9)\" --sql\n"  
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
  ."   atscan -t <target> --exp \"/index.php?id=rang(1-10)\" --sql\n"
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
  ."   atscan --dork <dork> --level <10> --replace <string> --with <string> --exp <exploit> [--sql | --lfi | --wp |...]\n"
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
  ."   atscan -d <dork | dorks.txt> -l <level> --exp <payload> --status <code> | --valid <string> \n"
  ."   atscan -d <dorks.txt> -l <level> --replace <string> --with <string> --status <code> | --valid <string> \n"
  ."   atscan -d <dork | dorks.txt> -l <level> [--admin | --sql ..] --status <code> | --valid <string> \n"  
  ."   atscan -d <dorks.txt> -l <level> --replace <string> --with <string> --status <code> | --valid <string>\n"
  ."   atscan -d <dorks.txt> -l <level> --replace <string> --with <string> --full --status <code> | --valid <string>\n"
  ."   atscan -d <dorks.txt> -l <level> --replace <string> --with <string> --exp <payload> --status <code> | --valid <string>\n"
  ."   atscan --data \"name:userfile[DATAFILE]value:file.txt\" --post -v <string> | --status <code> \n"
  ."   atscan -d <dork | dorks.txt> -l <level> [--sql | --shost ..] --status <code> | --valid <string> \n\n";
  
  ltak(); print $c[12]."  UPDATE TOOL: \n".$c[10]."   --update\n";
  
  ltak(); print $c[12]."  UNINSTALL TOOL: \n".$c[10]."   atscan --uninstall\n";
  ltak(); ltak();

1;
