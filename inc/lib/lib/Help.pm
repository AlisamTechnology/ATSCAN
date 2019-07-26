package Help;

use strict;
use warnings;
use FindBin '$Bin';
use Exporter;
use Print;
use Subs;

## Copy@right Alisam Technology see License.txt

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(help);
my @c  = Print::colors();

##########################################################################################################  
## HELP
sub help {
  print $c[11]."[::] HELP\n";
  Print::separaBlocks();
  Dialog::interHelp();
  Dialog::scansArgs();
  Dialog::hardArgs();
    
  Print::separaBlocks(); print $c[11]." [::] EXAMPLES: \n";
  
  Print::separaBlocks(); print $c[12]."  PROXY: \n".$c[10]
  ."   Tor: --proxy socks://localhost:9050 \n"
  ."   Proxy: --proxy <proxy> [Ex: http://12.32.1.5:8080] | --proxy <file>.\n".$c[10]."\n\n";  
  Print::separaBlocks(); print $c[12]."  SET HEADERS: \n".$c[10]
  ."   --header \"Authorization => 'Basic YWRtaW46YWRtaW4', keep_alive => '1'\"\n\n" ;  
  Print::separaBlocks(); print $c[12]."  RANDOM: \n".$c[10]
  ."   Random proxy: --prandom [proxy | file] \n"
  ."   Random agent: --brandom \n"
  ."   Random engine: --mrandom [ENGINES]\n\n" ;
  Print::separaBlocks(); print $c[12]."  SEARCH ENGINE: \n".$c[10]
  ."   ENGINES: bing google ask yandex sogou exalead googleapis googlecache or all\n"
  ."   Search: atscan --dork <dork> --level <level> \n"
  ."   Set engine: atscan --dork <dork> --level <level> -m google\n"
  ."   Set selective engines: atscan -d <dork> -l <level> -m google,bing,..\n"
  ."   Search with many dorks: atscan --dork <dork1 [OTHER]dork2 [OTHER]dork3> --level <level> \n"  
  ."   Search and rand: atscan -d <dork> -l <level> --expHost \"/index.php?id=rang(1-9)\" --sql\n"  
  ."   Search + output: atscan --dork <dorks.txt> --level <level> --save\n\n"
  ."   Search + collect emails: atscan -d <dorks.txt> -l <level> --email \n"
  ."   Search + collect site emails: atscan --dork <site:site.com> --level <level> --email \n"
  ."   Specify emails: atscan -d <dorks.txt> -l <level> --email -v \"\@gmail | \@yahoo ..\"\n"
  ."   Search + collect ips: atscan --dork <dork> --level <level> --ips \n\n";
  
  Print::separaBlocks(); print $c[12]."  SHODAN SEARCH: \n".$c[10]
  ."   atscan --shodan --apikey <APIKEY> (Apikey)\n"
  ."   atscan --shodan --target <ip or host or file> (Host Information)\n"
  ."   atscan --shodan --count <query or file> (Search Shodan without Results)\n"
  ."   atscan --shodan --dork <string or file> (Dork)\n"
  ."   atscan --shodan --level <number of results pages> \n" 
  ."   atscan --shodan --dnsreverse <ip or host or file> (Reverse DNS Lookup)\n"
  ."   atscan --shodan --dnsresolve <host or ip or file> (DNS Lookup)\n"
  ."   atscan --shodan --querysearch <query or file> (Search the directory of saved search queries)\n"
  ."   atscan --shodan --query (List the saved search queries)\n"
  ."   atscan --shodan --querytags (List the most popular tags)\n"
  ."   atscan --shodan --services (List all services that Shodan crawls)\n"
  ."   atscan --shodan --myip (My IP Address)\n"
  ."   atscan --shodan --protocols (Sodan used protocols)\n"
  ."   atscan --shodan --ports (Get  list of port numbers that the crawlers are looking for)\n"
  ."   atscan --shodan --apinfo : API Plan Information\n"
  ."   atscan --shodan --tokens : <string or file> (String filters and parameters provided to them)\n" 
  ."   atscan --shodan --honeyscor : <ip or host or file> (Honeypot score)\n"  
  ."   atscan --shodan --command <extern command> (Exploit shodan results with extern command)\n\n";
 
  Print::separaBlocks(); print $c[12]."  GOOGLEAPIS SEARCH: \n".$c[10]
  ."   atscan --apikey <APIKEY> --cx <ID> --dork <query>\n"
  ."   atscan --apikey <APIKEY> --cx <ID> --dork <query> -l 2 -v <string>\n"
  ."   atscan --apikey <APIKEY> --cx <ID> --dork <query> -l 2 --sql\n"
  ."   atscan --apikey <APIKEY> --cx <ID> --dork <query>  -l 2 -c <extern command>\n\n";
 
  Print::separaBlocks(); print $c[12]."  SEARCH EXPLOIT: \n".$c[10]
  ."   atscan --bugtraq --dork <string> Ex: atscan --bugtraq -d joomla -l 1\n"
  ."   atscan --bugtraq --dork <string> -l 1\n"
  ."   atscan --bugtraq --dork <string> -l 1 --limit 10 \n\n";
  
  Print::separaBlocks(); print $c[12]."  REGULAR EXPRESSIONS: \n".$c[10]
  ."   Regex use: atscan [--dork <dork> | -t <target>] --level <level> --regex <regex>\n"
  ."   IP: ((?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.)\\{ 3\\}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?))\n"
  ."   E-mails: ".'((([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})'."\n\n";
  
  Print::separaBlocks(); print $c[12]."  REPEATER: \n".$c[10]
  ."   atscan -t \"site.com?index.php?id=rang(1-10)\" --sql\n"
  ."   atscan -t <target> --expHost \"/index.php?id=rang(1-10)\" --sql\n"
  ."   atscan -t <target> --expHost \"/index.php?id=repeat(../-9)wp-config.php\" \n\n";
  
  Print::separaBlocks(); print $c[12]."  PORTS: \n".$c[10]
  ."   atscan -t <ip> --port <port> [--udp | --tcp] \n"
  ."   atscan -t \(ip start\)-\(ip end\) --port <port> [--udp | --tcp] \n"
  ."   atscan -t <ip> --port \(port start\)-\(port end\) [--udp | --tcp] --command \"your extern command\"\n\n";
  
  Print::separaBlocks(); print $c[12]."  ENCODE / DECODE: \n".$c[10]
  ."   Generate MD5: atscan --md5 <string> \n"
  ."   Encode base64: atscan --encode64 <string>  \n"
  ."   Decode base64: atscan --decode64 <string> \n\n";
  
  Print::separaBlocks(); print $c[12]."  POST/GET DATA: \n".$c[10]
  ."   Post data: atscan -t <target> --data \"field1\=\>value1\, field2\=\>value2\, field3\=\>value3\" --post / get /\n"
  ."             atscan -t <target> --data \"username\=\>john\, pass\=\>1234\" --post / get /\n"
  ."             atscan -t <target> --data \"username\=\>john\, pass\=\>WORDLIST:<list path>\" --post / get / \n"
  ."   Post + Exploit: --exp\/expHost <exploit> --data \"username\=\>john\, pass\=\>1234\" -v <string> | --status <code> --post / get\n"
  ."   Post + Validation: --data \"username\=\>john\, pass\=\>1234\" -v <string> | --status <code> --post / get \n\n";
  
  Print::separaBlocks(); print $c[12]."  EXTERNAL COMMANDES: \n".$c[10]
  ."   atscan --dork <dork | dorks.txt> --level <level> --command \"curl -v --TARGET\" \n"
  ."   atscan --dork <dork | dorks.txt> --level <level> --command \"file\" \n"
  ."   atscan --dork <dork | dorks.txt> --level <level> --command \"curl -v --HOST\" \n"
  ."   atscan --dork <dork | dorks.txt> --level <level> --command \"nmap -sV -p 21,22,80 --HOSTIP\" \n"
  ."   atscan -t <target> --port 80 --udp --command \"nmap -sV -p --PORT --TARGET\" \n" 
  ."   atscan -d \"index of /lib/scripts/dl-skin.php\" -l 20 -m google --command \"php WP-dl-skin.php-exploit.php --TARGET\" \n\n";
  
  Print::separaBlocks(); print $c[12]."  MULTIPLE SCANS: \n".$c[10]
  ."   atscan --dork <dork> --level <2> --sql --lfi --wp ..\n"
  ."   atscan --dork <dork> --level <2> --replace \"string \=\> new_string\" --exp/expHost <exploit> [--sql | --lfi | --wp |...]\n"
  ."   atscan -t <ip> --level <2> [--sql | --lfi | --wp |...]\n"
  ."   atscan -t <targets> [--sql | --lfi | --wp |...]\n\n";
  
  Print::separaBlocks(); print $c[12]."  SEARCH VALIDATION: \n".$c[10]
  ."   atscan -d <dork | dorks.txt> -l <level> --status <code> | --valid <string> \n"
  ."   atscan -d <dork | dorks.txt> -l <level> --ifinurl <string> \n"
  ."   atscan -d <dork | dorks.txt> -l <level> --regex <regex> --valid <string>\n"
  ."   atscan -d <dork | dorks.txt> -l <level> --unique \n"
  ."   atscan -t <target | targets.txt> [--status <code> | --valid <string> | --valid <file>] \n"
  ."   atscan -t <target | targets.txt> [--status <code> | --valid <string>] \n"
  ."   atscan -t <target | targets.txt> [--status <code> | --exclude <string> | --exclude <file>] \n"
  ."   atscan -t <target | targets.txt> --vshell <url/file>  \n"
  ."   atscan -d <dork | dorks.txt> -l <level> --exp/expHost <payload> --status <code> | --valid <string> \n"
  ."   atscan -d <dorks.txt> -l <level> --replace \"string \=\> new_string\" --status <code> | --valid <string> \n"
  ."   atscan -d <dork | dorks.txt> -l <level> [--admin | --sql ..] --status <code> | --valid <string> \n"  
  ."   atscan -d <dorks.txt> -l <level> --replace \"string \=\> new_string\" --status <code> | --valid <string>\n"
  ."   atscan -d <dorks.txt> -l <level> --replaceFROM \"string \=\> new_string\" --status <code> | --valid <string>\n"
  ."   atscan -d <dorks.txt> -l <level> --replace \"string \=\> new_string\" --exp/expHost <payload> --status <code> | --valid <string>\n"
  ."   atscan  -d <dorks.txt> --exp <exploit> --data \"username\=\>john\, pass\=\>1234\" --post --vshell <url/file> | -v <string> | --status <code> \n"
  ."   atscan -d <dork | dorks.txt> -l <level> [--sql | --shost ..] --status <code> | --valid <string> \n\n";
  
  Print::separaBlocks(); print $c[12]."  IP GEOLOCALISATION: \n".$c[10]
  ."   atscan -t <target\/ip> --geoloc \n\n";
  
  Print::separaBlocks(); print $c[12]."  UPDATE TOOL: \n".$c[10]."   --update\n";
  
  Print::separaBlocks(); print $c[12]."  REPAIR TOOL: \n".$c[10]."   --repair\n";
  
  Print::separaBlocks(); print $c[12]."  UNINSTALL TOOL: \n".$c[10]."   atscan --uninstall\n";
  Print::separator();
}

###########################################################################################################

1;
