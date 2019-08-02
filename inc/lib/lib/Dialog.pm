package Dialog;

use strict;
use warnings;
use FindBin '$Bin';
use Print;
use Exploits;

## Copy@right Alisam Technology see License.txt

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(interHelp confHlp hardArgs scansArgs interUsage shofilters printshohelp 
                   shosearchqueryhelp shosearchfacetshelp shoserachpagehelp shosearchminifyhelp 
				   shosearchadvise _print_apis_alert sho_menu advisePages adviseLimit credit);

my @c = Print::colors();
my @ErrT = Exploits::ErrT();
my @ZT = Exploits::ZT();
my @DT = Exploits::DT();
my @DS = Exploits::DS();
my @OTHERS = Exploits::OTHERS();
my @SCAN_TITLE = Exploits::SCAN_TITLE();
my @TT = Exploits::TT();

## HELP
sub interHelp {
  my $prf=$_[0];
  confHlp();
  print ""
  ."$c[5] --dork | -d   $c[10] | Dork to search [Ex: house [OTHER]cars [OTHER]hotel] \n"
  ."$c[5] --target | -t $c[10] | Target \n"
  ."$c[5] --param | -p  $c[10] | Set test parameter EX:id,cat,product_ID or -p all to test all params\n"
  ."$c[5] --save | -s   $c[10] | Output file.\n"
  ."$c[5] --getlinks    $c[10] | Get all target html links.\n"
  ."$c[5] --source      $c[10] | Html output folder.\n" 
  ."$c[5] --content     $c[10] | Print response content.\n"
  ."$c[5] --header      $c[10] | Set headers Ex: --header \"Authorization => 'Basic YWRtaW46YWRtaW4', keep_alive => '1'\" \n"
  ."$c[5] --ping        $c[10] | Ping host. \n"
  ."$c[5] --host        $c[10] | Domain name [Ex: site.com] \n"
  ."$c[5] --valid | -v  $c[10] | Validate strings at least 1 is matching\n"
  ."$c[5] --validAll    $c[10] | Validate strings all are matching\n"
  ."$c[5] --exclude     $c[10] | Validate by excluding strings\n"
  ."$c[5] --excludeAll  $c[10] | Validate by excluding all strings\n"  
  ."$c[5] --status      $c[10] | Validate by http header status \n"
  ."$c[5] --server      $c[10] | Validate by server \n"
  ."$c[5] --ifinurl     $c[10] | Get targets with exact string matching\n"
  ."$c[5] --sregex      $c[10] | Get targets with exact regex matching\n"
  ."$c[5] --replace     $c[10] | Exact string to replace \n"
  ."$c[5] --replaceFROM $c[10] | Replace from string to the end of target\n"
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
  ."$c[5] rang(x-y)     $c[10] | EX: --exp/expHost \"/index.php?id=rang(1-9)\" --sql OR -t \"site.com/index.php?id=rang(1-9)\" --sql\n"
  ."$c[5]               $c[10] | site.com/index.php?id=1->9 \n"
  ."$c[5] repeat(txt-y) $c[10] | EX: --exp/expHost \"/index.php?id=repeat(../-9)wp-config.php\" --sql OR -t \"site.com/index.php?id=../wp-config.php\"\n"
  ."$c[5]               $c[10] | In site.com/index.php?id=../wp-config.php then site.com/index.php?id=../../wp-config.php 9 times\n"
  ."$c[5] [OTHER]       $c[10] | To separate all others values (dork exploit proxy target..) \n"
  ."$c[5]               $c[10] | Ex: --dork \"dork1 [OTHER]DORK2 [OTHER]DORK3\"\n";
}
## CONFIGURATION HELP
sub confHlp {
  print ""
  ."$c[5] --proxy       $c[10] | Set tor proxy for scans [EX: --proxy \"socks://localhost:9050\"]\n"
  ."$c[5]               $c[10] | Set proxy [EX: --proxy \"http://12.45.44.2:8080\"] \n"
  ."$c[5]               $c[10] | Set proxy list [EX: --proxy list.txt] \n"
  ."$c[5] --motor| -m   $c[10] | Set engine motors default bing \n"
  ."$c[5]               $c[10] | EX: -m bing or google,ask,yandex or all\n"
  ."$c[5] --prandom     $c[10] | Random proxy \n"
  ."$c[5]               $c[10] | [EX: --prandom list.txt] or --prandom \"socks://localhost:9050\"]\n"
  ."$c[5] --mrandom     $c[10] | Random of given engines EX: --mrandom google, ask, bing\n"
  ."$c[5] --brandom     $c[10] | Random all disponibles agents \n"
  ."$c[5] --timeout     $c[10] | set browser timeout (in seconds)\n"
  ."$c[5] --freq        $c[10] | Random time frequency (in seconds) \n"
  ."$c[5] --level | -l  $c[10] | Scan level (Number of results pages to scan) \n"
  ."$c[5] --zone        $c[10] | Set search engine country \n"
  ."$c[5] --post        $c[10] | Post method \n"
  ."$c[5] --get         $c[10] | Get method \n"
  ."$c[5] --beep        $c[10] | Produce beep sound if positive scan found.\n"
  ."$c[5] --ifend       $c[10] | Produce beep sound when scan process is finished.\n"
  ."$c[5] --noverbose   $c[10] | No scan verbose.\n"
  ."$c[5] --nobanner    $c[10] | Hide tool banner\n"
  ."$c[5] --bugtraq     $c[10] | Search exploits\n"
  ."$c[5] --unique      $c[10] | Get targets with exact dork matching\n"
  ."$c[5] --limit       $c[10] | Stop when scan reaches the defined amount of positive results.\n"
  ."$c[5] --shodan      $c[10] | Shodan search\n"
  ."$c[5] --count       $c[10] | Search Shodan without Results\n"
  ."$c[5] --dnsreverse  $c[10] | Reverse DNS Lookup\n"
  ."$c[5] --dnsresolve  $c[10] | DNS Lookup\n"
  ."$c[5] --querysearch $c[10] | Search the directory of saved search queries\n"
  ."$c[5] --query       $c[10] | List the saved search queries\n"
  ."$c[5] --querytags   $c[10] | List the most popular tags\n"
  ."$c[5] --services    $c[10] | List all services that Shodan crawls\n"
  ."$c[5] --myip        $c[10] | My IP Address\n"
  ."$c[5] --level       $c[10] | Number of shodan search result pages\n"
  ."$c[5] --apinfo      $c[10] | My API Plan Information\n"
  ."$c[5] --protocols   $c[10] | List all protocols that can be used when performing on-demand Internet scans via Shodan\n"
  ."$c[5] --ports       $c[10] | List of port numbers that the crawlers are looking for\n"
  ."$c[5] --facets      $c[10] | Shodan search facets\n"
  ."$c[5] --command     $c[10] | Extern Command to execute\n"; 
}

##
sub hardArgs {
  print ""
  ."$c[5] --interactive $c[10] | Tool interactive interface \n"
  ."$c[5] --update      $c[10] | Update tool. \n"
  ."$c[5] --repair      $c[10] | Repair tool. \n"
  ."$c[5] --config      $c[10] | User configuration panel \n"
  ."$c[5] --uninstall   $c[10] | Uninstall tool \n\n";
}

sub scansArgs {
  print ""
  ."$c[5] --wp          $c[10] | Wordpress sites in the server\n"
  ."$c[5] --joom        $c[10] | Joomla sites in the server\n"
  ."$c[5] --xss         $c[10] | Xss scan \n"
  ."$c[5] --sql         $c[10] | Sqli scan \n"
  ."$c[5] --lfi         $c[10] | Local file inclusion \n"
  ."$c[5] --joomrfi     $c[10] | Scan for joomla local file inclusion.\n"
  ."$c[5] --data        $c[10] | Post\/Post data. See examples \n"
  ."$c[5] --vshell      $c[10] | Validate by url Ex: --vshell \"--HOST/shell.php or list.txt\" \n"
  ."$c[5] --zoneH       $c[10] | Upload to Zone-H EX: --zoneH \"notifier => --TARGET\"\n"
  ."$c[5] --cookies     $c[10] | Cookies output file\n"
  ."$c[5] --email       $c[10] | Collect emails \n"
  ."$c[5] --ips         $c[10] | Collect Ips\n"
  ."$c[5] --wpafd       $c[10] | Scan wordpress sites for arbitrary file download\n"
  ."$c[5] --admin       $c[10] | Get site admin page \n"
  ."$c[5] --shost       $c[10] | Get site subdomains \n"
  ."$c[5] --sites       $c[10] | Get ites in the server \n"
  ."$c[5] --upload      $c[10] | Get upload files \n"
  ."$c[5] --zip         $c[10] | Get zip files \n";
}

sub interUsage {
  print ""
  ."+===========================================================================+\n"
  ."| $c[11]EXPRESSION$c[10] | $c[11]USAGE $c[10]                 | $c[11]DESCRIPTION$c[10]                         |\n"
  ."+============+========================+=====================================+\n"
  ."| $c[5]use$c[10]        | use [mode]             | Set normal or advanced mode         |\n"
  ."| $c[5]use$c[10]        | use [module]           | Set module ex sql scan: use sql     |\n"
  ."| $c[5]set$c[10]        | set [ARGUMENT] [VALUE] | Set arguments and values            |\n"
  ."| $c[5]options$c[10]    | options                | Show aviable & configured arguments |\n"
  ."| $c[5]help$c[10]       | help                   | Show help                           |\n"
  ."| $c[5]run$c[10]        | run                    | Execute                             |\n"
  ."| $c[5]config$c[10]     | config                 | User configuration                  |\n"
  ."| $c[5]update$c[10]     | update                 | Update tool                         |\n"
  ."| $c[5]cat$c[10]        | cat [filename]         | Display file                        |\n"
  ."| $c[5]cd$c[10]         | cd [directory]         | Change to directory                 |\n"
  ."| $c[5]ls$c[10]         | ls                     | List directory contents             |\n"
  ."| $c[5]locate$c[10]     | locate [filename]      | Update tool                         |\n"
  ."| $c[5]chmod$c[10]      | chmod [opt][file/dir]  | Change file permissions             |\n"
  ."| $c[5]clear$c[10]      | clear                  | Clear screen                        |\n"
  ."| $c[5]kill$c[10]       | kill [opts] pid        | Stop a process                      |\n"
  ."| $c[5]ps$c[10]         | ps [opts]              | Display running processes           |\n"
  ."| $c[5]mkdir$c[10]      | mkdir [options] dir    | Create a new directory              |\n"
  ."| $c[5]tar$c[10]        | tar [options] filename | extract files from a tarfile        |\n"
  ."| $c[5]cp$c[10]         | cp [opts] source dest  | Copy files and directories          |\n"
  ."| $c[5]mv$c[10]         | mv [opts] source dest  | Rename or move files or directories |\n"
  ."| $c[5]rm$c[10]         | rm [opts] directory    | Remove/delete files and/directories |\n"
  ."| $c[5]git$c[10]        | git [opts]             | Clone from github                   |\n"
  ."| $c[5]wget$c[10]       | wget [opts]            | Retrieve files using wget           |\n"
  ."| $c[5]echo$c[10]       | echo [opts]            | echo display                        |\n"
  ."| $c[5]exit$c[10]       | exit                   | Exit                                |\n"
  ."+===========================================================================+\n\n";
}

sub printshohelp {
  my %shofilters=('query'=>'[String] Shodan search query', 
                'after'=>'Only show results that were collected after the given date (dd/mm/yyyy)', 
                'asn'=>'The Autonomous System Number that identifies the network the device is on', 
				'before'=>'Only show results that were collected before the given date (dd/mm/yyyy', 
				'city'=>'Show results that are located in the given city', 
				'country'=>'Show results that are located within the given country', 
				'geo'=>'There are 2 modes to the geo filter: radius and bounding box. To limit results based on a radius around a pair of latitude/ longitude, provide 3 parameters; ex: geo:50,50,100. If you want to find all results within a bounding box, supply the top left and bottom right coordinates for the region; ex: geo:10,10,50,50', 
				'hash'=>'Hash of the "data" property', 
				'has_ipv6'=>'If "true" only show results that were discovered on IPv6', 
                'has_screenshot'=>'If "true" only show results that have a screenshot available', 
                'hostname'=>'Search for hosts that contain the given value in their hostname', 
				'isp'=>'Find devices based on the upstream owner of the IP netblock', 
				'link'=>'Find devices depending on their connection to the Internet', 
				'net'=>'Search by netblock using CIDR notation; ex: net:69.84.207.0/24', 
				'org'=>'Find devices based on the owner of the IP netblock', 
				'os'=>'Filter results based on the operating system of the device', 
				'port'=>'Find devices based on the services/ ports that are publicly exposed on the Internet', 
                'postale'=>'Search by postal code', 
                'product'=>'Filter using the name of the software/ product; ex: product:Apache', 
                'state'=>'Search for devices based on the state/ region they are located in.', 
				'version'=>'Filter the results to include only products of the given version; ex: product:apache version:1.3.37', 
				'bitcoin.ip'=>'Find Bitcoin servers that had the given IP in their list of peers.', 
				'bitcoin.ip_count'=>'Find Bitcoin servers that return the given number of IPs in the list of peers.', 
				'bitcoin.port'=>'Find Bitcoin servers that had IPs with the given port in their list of peers.', 
				'bitcoin.version'=>'Filter results based on the Bitcoin protocol version.', 
				'http.component'=>'Name of web technology used on the website', 
				'http.component_category'=>'Category of web components used on the website', 
                'http.html'=>'Search the HTML of the website for the given value.', 
                'http.html_hash'=>'Hash of the website HTML', 
				'http.status'=>'Response status code',
				'http.title'=>'Search the title of the website', 
				'ntp.ip'=>'Find NTP servers that had the given IP in their monlist.', 
				'ntp.ip_count'=>'', 
				'ntp.ip_count'=>'Find NTP servers that return the given number of IPs in the initial monlist response.', 
				'ntp.more'=>'Whether or not more IPs were available for the given NTP server.', 
				'ntp.port'=>'Find NTP servers that had IPs with the given port in their monlist.', 
                'ssl'=>'Search all SSL data', 
                'ssl.alpn'=>'Application layer protocols such as HTTP/2 ("h2")', 
				'ssl.chain_count'=>'Number of certificates in the chain', 
				'ssl.version'=>'Possible values: SSLv2, SSLv3, TLSv1, TLSv1.1, TLSv1.2', 
				'ssl.cert.alg'=>'Certificate algorithm', 
				'ssl.cert.expired'=>'Whether the SSL certificate is expired or not; True/ False', 
				'ssl.cert.extension'=>'Names of extensions in the certificate', 
				'ssl.cert.serial'=>'Serial number as an integer or hexadecimal string', 
				'ssl.cert.pubkey.bits'=>'Number of bits in the public key', 
				'ssl.cert.pubkey.type'=>'Public key type', 
				'ssl.cipher.version'=>'SSL version of the preferred cipher', 
				'ssl.cipher.bits'=>'Number of bits in the preferred cipher', 
				'ssl.cipher.name'=>'Name of the preferred cipher', 
				'telnet.option'=>'Search all the options', 
				'telnet.do'=>'The server requests the client to support these options', 
				'telnet.dont'=>'The server requests the client to not support these options', 
                'telnet.will'=>'The server supports these options', 
                'telnet.wont'=>'The server doesnt support these options'
				);


  foreach my $key (keys %shofilters) {
    print "  $c[11]$key: $c[10]$shofilters{$key}\n";
  }
  print "\n";
}

sub advisePages {
  print $c[4]."[!]$c[10] Use --level <number pages> to get more page results! ex: --level 2\n";
  sleep 1;
}

sub shosearchqueryhelp {
  print $c[5]."query:$c[10] [String] Shodan search query. The provided string is used to search the database of banners in Shodan, with the additional option to provide filters inside the search query using a \"filter:value\" format. For example, the following search query would find Apache webservers located in Germany: \"apache country:DE\". The following filters are currently supported:\n\n";
}

sub shosearchfacetshelp {
  print $c[5]."facets (optional):$c[10] [String] A comma-separated list of properties to get summary information on. Property names can also be in the format of \"property:count\", where \"count\" is the number of facets that will be returned for a property (i.e. \"country:100\" to get the top 100 countries for a search query). The following facets are currently supported:\n\n";
}

sub shoserachpagehelp {	
  print $c[5]."page (optional):$c[10] [Integer] The page number to page through results 100 at a time (default: 1)\n\n";
}

sub shosearchminifyhelp {
  print $c[5]."minify:$c[10] minify (optional): [Boolean] True or False; whether or not to truncate some of the larger fields (default: True)\n\n";
}

sub shosearchadvise {
  print $c[4]."[!]$c[10] To learn how to use search filters type \'atscan --shodan --filters\'\n";
}

###########################################################################################
## CREDITS      ###########################################################################
sub credit {
  print $c[4]."[!]$c[10] Accessing to more results by --level <num of results page> require credit!\n";
  sleep 2;
}

## RESULTS LIMIT ##########################################################################
sub adviseLimit {
  my $limit = $_[0];
  if ($limit eq 500) {
    print $c[4]."[!]$c[10] Use --limit to set number of results! ex: --limit 10\n";
    sleep 1;
  }
}

sub sho_menu {
  print $c[11]."[::] SHODAN API MENU:\n";
  Print::separaBlocks();
  print $c[10]
  ."  --apikey      : Your apikey\n"
  ."  --target      : <ip or host or file> Host Information\n"
  ."  --count       : <query or file> Search Shodan without Results\n"
  ."  --dork        : <string or file> Search Shodan\n"
  ."  --tokens      : <string or file> String filters and parameters\n"
  ."  --dnsreverse  : <ip or host or file> Reverse DNS Lookup\n"
  ."  --dnsresolve  : <host or ip or file> DNS Lookup\n"
  ."  --querysearch : <query or file> List the directory of saved search queries\n"
  ."  --query       : List the saved search queries\n"
  ."  --querytags   : List the most popular tags\n"
  ."  --services    : List all services that Shodan crawls\n"
  ."  --myip        : My IP Address\n"
  ."  --ports       : Get  list of port numbers that the crawlers are looking for.\n"
  ."  --apinfo      : API Plan Information\n"
  ."  --protocols   : Shodan used protocols\n"
  ."  --honeyscore  : <ip or host or file> Honeypot score\n"
  ."  --level       : <number of search pages> \n" 
  ."  --limit       : Max results to list\n"
  ."  --save        : Output file\n"
  ."  --command     : Exploit shodan results with extern command\n\n";
  
  print $c[4]."  [!] $c[10]To set proxy and browser random: \'atscan --help\'\n";
  print $c[4]."  [!] $c[10]About filters: atscan --shodan --apikey <apikey> --filters\n";
  print $c[4]."  [!] $c[10]To search exploits use: --bugtraq \n";
  print $c[4]."  [!] $c[10]To avoid typing your apikey in each process configure it in the\n      configuration panel: \'atscan --config\' then \'set apikey <your_apikey>\'\n";
  
  Print::separaBlocks();
}

sub _print_apis_alert {
  print $c[4]."[|] Usage: --apikey <apikey> --cx <ID> [OPTIONS]\n";
  print $c[4]."[|] Googleapis require an apikey and ID\n";
  print $c[4]."[!] Googleapis: https://developers.google.com/custom-search/v1/overview\n";
  exit();
}


1;
