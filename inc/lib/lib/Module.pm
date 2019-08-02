package Module;

use strict;
use warnings;
use FindBin '$Bin';
use Exporter;

## Copy@right Alisam Technology see License.txt

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(INTERadvanced INTERcomnd INTERdecryp INTERparam INTERPortScan 
                   INTERshell bugtraq api shodan INTERDataScan NoValRequierd interLinuxOpts 
				   ARGUMENTSALL MODULES INTERlevel INTERdork INTERtarget INTERSearchScans SCANS 
				   interExtraOpts ENGINEARGUMENTS);

##############################################################################################
##############################################################################################
## EXTRAT INTERACTIVE OPTIONS
sub interExtraOpts {
  return ("config", "usage");
}

sub interLinuxOpts {
  return ("cat", "cd", "chmod", "clear", "kill", "ls", "ps", "tar", "mkdir", "locate", "cp", "mv", "rm", "git", "wget", "echo");
}

## MODULES 
sub MODULES {
  return ('normal'=>'normal scan mode', 'advanced'=>'advanced scan mode');
}
## SCANS
sub SCANS {
  return ("xss"=>"xss", "sql"=>"sqli", "lfi"=>"local file inclusion", "joomrfi"=>"joomla rfi", "wpafd"=>"wp file download", "admin"=>"find admin page", "shost"=>"get subdomains",
           "wp"=>"get wordpress sites", "joom"=>"get joomla sites", "upload"=>"get upload files", "zip"=>"get zip files", "decrypt"=>"md5/(en/de)code64",
           "email"=>"collect emails", "ips"=>"collect ips", "ports"=>"scan ports", "commands"=>"extern command", "form"=>"post/get data", "shodan"=>"Shodan search", "bugtraq"=>"Search exploits", "nomodule"=>"no module will be used");
}
## SEARCH ENGINE
sub INTERSearchScans {
  return ("unique"=>"unique tesults", "motor"=>"engine motor", "mrandom"=>"random engine", "zone"=>"search zone");
}
## TARGET
sub INTERtarget {
  return ("target"=>"target");
}
## SEARCH LEVEL
sub INTERlevel {
  return ("level"=>"engine results number");
}
## SEARCH DORK
sub INTERdork {
  return ("dork"=>"search dork");
}
## ALL ARGUMENTS
sub ARGUMENTSALL {
  return ("cx"=>'Google search ID', "apikey"=>'Apikey', "ping"=>"check is alive", "getlinks"=>"Get html links", "status"=>"status code", "valid"=>"content by string", "vshell"=>"validate by url", "zoneH"=>"Upload to Zone-H", "exp"=>"exploit", "proxy"=>"use proxy", "prandom"=>"random proxy", "save"=>"output file",
                   "replace"=>"Exact string replace", "replaceFROM"=>"full string replace", "ifinurl"=>"valid url by string", "noquery"=>"remove query string", "brandom"=>"random browser",
                   "content"=>"response content", "expHost"=>"exploit host", "expIp"=>"exploit target ip", "timeout"=>"browser time out", "validAll"=>"valdate all", "excludeAll"=>"exclude all", "server"=>"validate by server",
                   "host"=>"host name", "cookies"=>"cookies output file");
}
## NOT REQUIRE A VALUE
sub NoValRequierd {
  return ('host', 'tcp', 'udp', 'full', 'unique', 'nobanner', 'beep', 'noverbose', 'ips', 'noquery', 'ifend', 'post', 'get', 'brandom', 'content', 'ping',
                   'HOST', 'PORT', 'HOSTIP', 'TARGET', 'sql', 'lfi', 'wpafd', 'admin', 'wp', 'joom', 'zip', 'email', 'commands', 'form', 'normal', 'bugtraq', 
                   'advanced', 'joomrfi', 'shost', 'email', 'decrypt', 'nomodule', 'popup', 'all', 'geoloc', 'getlinks', 
				   'query', 'querytags', 'services', 'myip', 'apinfo', 'ports', 'Ports', 'shodan');
}
## DATA ARGUMENTS
sub INTERDataScan {
  return ("post"=>"post methode", "get"=>"get methode", "data"=>"data to post/get", "header"=>"data headers");
}
## SHODAN
sub shodan {
  return ("target"=>"ip or host", "count"=>"shodan count", "query"=>"Shodan saved queries", "querysearch"=>"Shodan dirs queries", 
             "querytags"=>"Shodan popular tags", "services"=>"Shosan services", "dnsresolve"=>"Shodan dns resolve", 
			 "dnsreverse"=>"Shodan dns reverse", "myip"=>"My ip address", "apinfo"=>"My api info", "Ports"=>"shodan used ports", 
			 "protocols"=>"shodan used protocols", "facets"=>"Shodan search facets", "filters"=>"shodan api parameters", 
			 "tokens"=>"Filters & parameters", "honeyscore"=>"Honeypot score");
}

## APIKEY
sub api {
  return ("apikey"=>"Apikey", "level"=>"number result pages", "limit"=>"Max results limit", "dork"=>"Query search", "save"=>"Output file", "command"=>"Extern command", 
          "proxy"=>"See help", "prandom"=>"See help");
}
## BUGTRAQ
sub bugtraq { 
  return ("level"=>"number result pages", "limit"=>"Max results limit", "dork"=>"Query search", "save"=>"Output file", "command"=>"Extern command", 
              "proxy"=>"See help", "prandom"=>"See help");
}
## SHELL LFI
sub INTERshell {
  return ("shell"=>"shell url");
}
## PORTS
sub INTERPortScan {
  return ("port"=>"port", "udp"=>"udp port type", "tcp"=>"tcp port type");
}

## SQL INJECT PARAMETER
sub INTERparam {
  return ("param"=>"inject parameter");
}
## DECRYPT
sub INTERdecryp {
  return ("md5"=>"generate md5", "encode64"=>"encode base64", "decode64"=>"decode base64");
}
## EXTERN PROCESS
sub INTERcomnd {
  return ("command"=>"extern process", "popup"=>"New window");
}
## ADVANCED MODE
sub INTERadvanced {
  return ("nobanner"=>"hide banner", "beep"=>"beep sound", "noverbose"=>"no verbose", "ifend"=>"beep at end", "freq"=>"random frequency", "regex"=>"get matching regex",
                    "sregex"=>"valid url by regex", "exclude"=>"negative validation", "all"=>"all", "source"=>"html output folder", "limit"=>"max positive scans", 
					"geoloc"=>"Ip geolocalisation");
}

my %INTERdork = INTERdork();
my %INTERtarget = INTERtarget();
my %INTERSearchScans = INTERSearchScans();
my %INTERlevel = INTERlevel();

sub ENGINEARGUMENTS {
  return(%INTERdork, %INTERtarget, %INTERSearchScans, %INTERlevel);
}

##############################################################################################

1;
