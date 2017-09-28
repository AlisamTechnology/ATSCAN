#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt
## HELP
  our (@c);
  interHelp();
  print ""
  ."$c[5] --wp          $c[10] | Wordpress sites in the server\n"
  ."$c[5] --joom        $c[10] | Joomla sites in the server\n"
  ."$c[5] --sql         $c[10] | Xss scan \n"
  ."$c[5] --lfi         $c[10] | Local file inclusion \n"
  ."$c[5] --joomrfi     $c[10] | Scan for joomla local file inclusion.\n"
  ."$c[5] --data        $c[10] | data. See examples \n"
  ."$c[5] --email       $c[10] | Collect emails \n"
  ."$c[5] --ip          $c[10] | Collect Ips\n"
  ."$c[5] --wpafd       $c[10] | Scan wordpress sites for arbitery file download\n"
  ."$c[5] --admin       $c[10] | Get site admin page \n"
  ."$c[5] --shost       $c[10] | Get site subdomains \n"
  ."$c[5] --sites       $c[10] | Sites in the server \n"
  ."$c[5] --upload      $c[10] | Get sites with upload files in the server  \n"
  ."$c[5] --zip         $c[10] | Get sites with zip files in the server \n"
  ."$c[5] --config      $c[10] | Set configuration. \n"  
  ."$c[5] --update      $c[10] | Update tool. \n"
  ."$c[5] --interactive $c[10] | Tool interactive interface. \n" 
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
  ltak();

1;
