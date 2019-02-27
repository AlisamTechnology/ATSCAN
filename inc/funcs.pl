#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
use IO::Socket::INET;
use LWP::UserAgent;
use HTTP::Cookies;
use HTTP::Request;
use POSIX qw(strftime);
## Copy@right Alisam Technology see License.txt

#########################################################################################################################
## FUNCTS
our ($payloads, $exploit, $expHost, $data, $mlevel, $dork, $Target, $V_RANG, $noQuery, $mdom, $replace, $replaceFROM, $unique, 
     $ifinurl, $pat2, $limit, $port, $output, $ifend, $ipUrl, $noverbose, $V_IP, $expIp, $interactive, $command, $uplog, $validShell, 
	 $validText, $exclude, $all, $repair, $zoneH, $cokie, $bugtraq, $mindex, $Hstatus, $content, $msource, $fullHeaders, $geoloc, $getlinks);

our($userSetting, $proxy, $system, $agent, $ua, $psx, $prandom, $password, $brandom, $mrandom, $zone, $motor, $nobanner, $beep, $timeout, $dateupdate, $freq, 
    $method, $checkVersion, $get, $post, $scriptbash, $shodan, $apikey, $cx);

our ($WpSites, $JoomSites, $xss, $lfi, $JoomRfi, $WpAfd, $adminPage, $subdomain, $mupload, $mzip, $searchIps, $eMails, $regex, $ping);

our @z=($WpSites, $JoomSites, $xss, $lfi, $JoomRfi, $WpAfd, $adminPage, $subdomain, $mupload, $mzip, $searchIps, $eMails, $regex,
        $port, $data, $ping);

our (@aTscans, @payloads, @exploits, @dorks, @aTsearch, @aTcopy, @aTtargets, @c, @OTHERS, @DS, @DT, @TT, @proxies, @connected_proxies, @ErrT,
     @defaultHeaders, @userHeaders, @validTexts, @excludes, @ZT, @validShells, @commands, @bugs, @connected_apikeys, @apikeys);

#########################################################################################################################
## PRINT FILES 
sub printFile {
  my ($File, $context)=@_;
  open (FILE, '>>', $File);
  binmode(FILE, ":utf8");
  print FILE "$context\n";
  close(FILE);
}

#########################################################################################################################
## CHECK EMPTY FORDERS
sub is_folder_empty {
  my $dirname = $_[0];
  opendir(my $dh, $dirname);
  return scalar(grep { $_ ne "." && $_ ne ".." } readdir($dh)) == 0;
}

#########################################################################################################################
## CHECK USER SETTING
sub checkSetting {
  my $object=$_[0];
  my ($l1, @ans);
  open(F2, $userSetting);
  while (my $l=<F2>) {
    chomp $l;
    if ($l=~/$object\s(.*)/) {
      $l1=$l;
      @ans=split(" ", $l);
      $l1=~s/$ans[0]\s//ig;
    }
  }
  close(F2);
  return $l1;
}

#########################################################################################################################
## CHECK FOR UPDATE
sub get_lastUpdate {
  my @lastUpdate;
  open (UPLOG, $uplog);
  while (my $lastUpdate=<UPLOG>) {
    chomp $lastUpdate;
    if (length($lastUpdate) > 1) {
      push @lastUpdate, $lastUpdate if length($lastUpdate) > 1;
    }
  }
  close(UPLOG);
  return $lastUpdate[0];
}

#########################################################################################################################
## BUILT ARRAYS
sub buildArraysLists {
  my $buildArrays=$_[0];
  my @buildArrays=();
  if (-e $buildArrays) {
    open (UAL, $buildArrays);
    while (my $buildArray=<UAL>) {
      chomp $buildArray;
      if ($buildArray!~ /^\#/) {
        push @buildArrays, $buildArray;
      }
    }
  }else{
    $buildArrays=~s/\s+$//g;
    $buildArrays=~s/^\[OTHER]//g;
    @buildArrays=split /\[OTHER\]/, $buildArrays;
  }
  return @buildArrays;
}

#########################################################################################################################
## BUILD PROXIES ARRAY
sub getProx {
  my $getProx=$_[0];
  if ($getProx=~/:[0-9]/) { @proxies=split / /, $getProx; }
  else{ @proxies=buildArraysLists($getProx); }
  return @proxies;
}

#########################################################################################################################
## DELETE USER SETTING
sub deletSetting {
  my @config=get_configuration();
  our (@LI2, $userSetting);
  my $val=$_[0];
  unlink $userSetting;
  open FH, ">", $userSetting;
  for my $lines(@config) {
    if ($lines!~/^$val\s(.*)/) {
      print FH "$lines";
    }
  }
  close FH;
}

#########################################################################################################################
## CHECK USER CONFIGURATION
$password=checkSetting("password");
$interactive=checkSetting("interactive") if !defined $interactive;
$proxy=checkSetting("proxy") if !defined $proxy;
$apikey=checkSetting("apikey") if !defined $apikey;
$cx=checkSetting("cx") if !defined $cx;
$prandom=checkSetting("proxy-random") if !defined $prandom;
$payloads=checkSetting("payload") if !defined $payloads;
$brandom=checkSetting("b-random") if !defined $brandom;
$mrandom=checkSetting("m-random") if !defined $mrandom;  
$mlevel=checkSetting("level") if !defined $mlevel;
$method=checkSetting("method") if !defined $get and !defined $post;
$zone=checkSetting("zone") if !defined $zone;
$motor=checkSetting("motor") if !defined $motor;
$nobanner=checkSetting("nobanner") if !defined $nobanner;
$noverbose=checkSetting("noverbose") if !defined $noverbose;
$beep=checkSetting("beep") if !defined $beep;
$ifend=checkSetting("ifend") if !defined $ifend;
$unique=checkSetting("unique") if !defined $unique;
$timeout=checkSetting("timeout") if !defined $timeout;
$freq=checkSetting("freq") if !defined $freq;
$limit=checkSetting("limit") if !defined $limit;
$command=checkSetting("command") if !defined $command;
$dateupdate=checkSetting("update");


# my %use_configuration=(\$payloads=>\@payloads, \$command=>\@commands, \$apikey=>\@apikeys, \$exploit=>\@exploits, \$expHost=>\@exploits, 
                       # \$expIp=>\@exploits, \$validText=>\@validTexts, \$exclude=>\@excludes, \$validShell=>\@validShells);
# foreach our $key(keys %use_configuration) {
  # if (defined $key) {
    # @$use_configuration{$key} = $use_configuration{$key};
    # @$use_configuration{$key} = $use_configuration{$key} = buildArraysLists($key);
  # }
# }

##########################################################################################################################
## SET PROXY
 if (defined $proxy || $proxy) { @proxies=getProx($proxy); }
 if (defined $prandom || $prandom) { @proxies=getProx($prandom); }

#########################################################################################################################
## USER ARRAYS
if (defined $payloads || $payloads) { @payloads=buildArraysLists($payloads); }

#########################################################################################################################
## EXTERN COMMANDS ARRAYS
if (defined $command || $command) { @commands=buildArraysLists($command); }

#########################################################################################################################
## API KEYS
if (defined $apikey || $apikey) { @apikeys=buildArraysLists($apikey); }

#########################################################################################################################
## EXPLOITS ARRAYS
if (defined $exploit || $exploit) { @exploits=buildArraysLists($exploit); }
if (defined $expHost) { @exploits=buildArraysLists($expHost); }
if (defined $expIp) { @exploits=buildArraysLists($expIp); }

#########################################################################################################################
## VALIDATION ARRAYS
if (defined $validText) { @validTexts=buildArraysLists($validText); }
if (defined $exclude) { @excludes=buildArraysLists($exclude); }
if (defined $validShell) { @validShells=buildArraysLists($validShell); }

#########################################################################################################################
if (!defined $shodan && !defined $bugtraq) {
  if (defined $mlevel) {
    if (defined $dork) { @dorks=buildArraysLists($dork); }
    elsif (defined $Target) {
      _build_me($Target, "1");
    }
  }else{
    if (defined $Target) {
      _build_me($Target, "");
	}
  }
}

#########################################################################################################################
## BUILD DORK AND TARGET ARRAYS 
sub _build_me {
  my ($ob, $iflevel)=@_;
  if (($ob=~/$V_RANG/)&&($1<=255 && $2<=255 && $3<=255 && $4<=255 && $5<=255 && $6<=255 && $7<=255 && $8<=255)) { 
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
			  if ($iflevel) {
                push @dorks, $newIp;
			  }else{
                push @aTsearch, $newIp;
			  }
            }
          }
	    }
      }
  }else{
    if ($iflevel) {
	  @dorks=buildArraysLists($ob); 
	}else{
	  @aTsearch=buildArraysLists($ob); 
	}
  }
}

#########################################################################################################################
## MAX POSITIVE SCAN RESULTS
## Change for more positive scans!!
$limit="500" if !defined $limit;

#########################################################################################################################
## SET RANDOM FREQUENCY START TIME
sub get_frequecy {
  my $now = strftime "%H%M%S", localtime;
  return $now;
}

#########################################################################################################################
## START FREQ
our $start=get_frequecy();
#########################################################################################################################
## BROWSER
our (@sys, @vary, @systems);
binmode STDOUT, ":utf8";
for my $sys(@sys) {
  for my $vary(@vary) {
    my $ag="$sys) $vary";
    push @systems, $ag;
  }
}

#########################################################################################################################
## CREATE COOKIES IN DISK
my $cksFile;
if ($cokie) {
  $cksFile=$cokie;
}else{
  $cksFile="$Bin/inc/conf/user/cookies.txt";
}
my $cookies = HTTP::Cookies->new(
    file     => $cksFile,
    autosave => 1,
    ignore_discard => 1,
);

#########################################################################################################################
## HEADERS
@defaultHeaders = ();
our $headers;
if (defined $headers) {
  @defaultHeaders=split (",", $headers);
  foreach my $hdr(@defaultHeaders) {
    $ua->push_header($hdr);
  }
}

#########################################################################################################################
## SET AGENT
$agent="Mozilla/5.0 (".$systems[rand @systems];
$ua=LWP::UserAgent->new( agent => $agent);
$ua->cookie_jar($cookies);
$ua->env_proxy;
if (defined $timeout || $timeout) {
  $ua->timeout($timeout);
}

#########################################################################################################################
## CURRENT PROXY
sub get_psx {
  return $proxies[rand @proxies];
}

sub get_conected_psx {
  return $connected_proxies[rand @connected_proxies];
}

#########################################################################################################################
## CHECK PROXY CONNECTION
sub check_proxy_connect {
  my $psx=shift;
  $ua->proxy([qw/ http https ftp ftps socks4 socks5 /] => $psx); $ua->cookie_jar({ });
  my $r=$ua->get($ipUrl);
  return $r->content if $r->is_success;
}

#########################################################################################################################
## CHECK APIKEY CONNECTION
sub check_apikey_connect {
  my $api=$_[0];
  my $u;
  if (defined $shodan) { $u="https://api.shodan.io/shodan/host/search?key=$api&query=camera"; }  
  else{ $u="https://www.googleapis.com/customsearch/v1?key=$api&cx=$cx&q=googleapis"; }
  return $ua->get($u)->decoded_content;
}

#########################################################################################################################
## CHECK APIKEY LIST
sub get_conected_apikey {
  return $connected_apikeys[rand @connected_apikeys];
}

#########################################################################################################################
## CHECK PROXY LIST
sub check_list_prx {
  print $c[4]."[!]$c[10] Checking proxy connection...";
  for my $psx(@proxies) {
    my $r=check_proxy_connect($psx);
    if (!$r) { 
	  print $c[2]."\n[!] Failed to connect with [$psx]";
	}else{
	  push @connected_proxies, $psx;
	}
  }
  print_connecttions(scalar @connected_proxies, scalar @proxies, "proxies");
}

#########################################################################################################################
## CHECK APIKEY LIST
sub check_list_apikey {
  print $c[4]."[!]$c[10] Checking apikey connection...";
  for my $apk(@apikeys) {
    my $r=check_apikey_connect($apk);
    if ($r!~/(\"Bad Request\"|\"dailyLimitExceeded\"|Please upgrade your API|Can\'t connect to api|This server could not verify that you are authorized)/) { 
      push @connected_apikeys, $apk;
	}else{
	  print $c[2]."\n[!] Failed to connect with [$apk]";
	  print $c[4]."\n    Message: [$1]";
	}
  }
  print_connecttions(scalar @connected_apikeys, scalar @apikeys, "apikeys");
}

#########################################################################################################################
## PRINT CONNECTIONS RESULT
sub print_connecttions {
  my ($x, $y, $txt)=@_;
  print "$c[3] OK\n" if $x eq $y;
  if ($x < 1) {
	print $c[2]."\n[!] Cannot connect with any of given $txt!\n"; logoff();
  }elsif($x < $y) {
	print $c[3]."\n[!] OK! $c[4]Only running $txt in list will be used ($x)!\n";
  }
  print "\n";
  sleep 1;   
}

#########################################################################################################################
## CHECK CONNECTION
sub testConnection {
  print $c[4]."[!] $DT[31]\n";
  if (defined $apikey || $apikey || $proxy || defined $proxy || $prandom || defined $prandom) {
    if ($proxy || defined $proxy || $prandom || defined $prandom) {
      check_list_prx();
    }
    if (defined $apikey || $apikey) {
      check_list_apikey();
	}
  }else{
    my $respons=$ua->get($ipUrl);
    if (!$respons->is_success) {
      print $c[2]."[!] $DT[11]\n[!] $DT[10]\n".$c[4]."[!] $ErrT[23]\n"; logoff();
	}
  }
  sleep 1;
}

#########################################################################################################################
## CHECK RANDOM PROXY AGENT
sub  ckeck_ext_founc { 
  my $pnt=$_[0];
  if (defined $brandom || $brandom) {
    if ($freq || defined $freq) { make_freq($pnt); }
    else{ getNewAgent($pnt); }
  }
  if (defined $prandom || $prandom) {
    if ($freq || defined $freq) { 
	  make_freq($pnt); 
	}else{ 
	  newIdentity($pnt);
	}
  }
}

#########################################################################################################################
## MEKE FREQUENCY RANDOM 
sub make_freq {
  my $pnt=$_[0];
  my $yes;
  if ($freq || defined $freq) {
    my $stop=get_frequecy();
    if ($freq || defined $freq) {
      my $def=$stop - $start; 
      if ($def >= $freq) {
        if (defined $brandom || $brandom) { getNewAgent(); }
        if (defined $prandom || $prandom) { newIdentity($pnt); }
      }
    }
  }
}

#########################################################################################################################
## RENEW IDENTITY 
sub newIdentity {
  my $pnt=$_[0];
  my $scalar=scalar @connected_proxies;
  my $psx=get_conected_psx() if !$psx;
  if ($scalar eq 1) {
    if ($psx=~/(localhost|127.0.0.1)/) {
	  my $x=0;
	  while (!$x) {
        system("[ -z 'pidof tor' ] || pidof tor | xargs sudo kill -HUP -1;");
	    my $r=check_proxy_connect($psx);
	    if ($r) { 
		  $x++;
		  print $c[1]."    $ErrT[21] $c[8]  $ZT[24] [$r]\n" if $pnt;
		}
	  }
	}
  }else{
	my $newpsx=$psx;
	$psx=get_conected_psx() while $psx eq $newpsx;
  }
  $ua->proxy([qw/ http https ftp ftps /] => $psx); $ua->cookie_jar({ });
  print $c[1]."    $DS[11] $c[10]  $psx\n" if $pnt;
}

#########################################################################################################################
## RENEW AGENT
sub getNewAgent {
  my $currentagent=$agent;
  my $fin=0;
  while (!$fin) {
    $agent="Mozilla/5.0 (".$systems[rand @systems];
    if ($currentagent ne $agent) {
      $fin=1;
    }   
  }
  $ua=LWP::UserAgent->new( agent => $agent, cookie_jar => HTTP::Cookies->new());
}

#########################################################################################################################
## CHECK VERSION LOG
sub compareme {
  my ($same);
  our ($logUrl, $script_bac, $scriptv);
  my $response=$ua->get($logUrl);
  if ($response->is_success) {
    unlink $script_bac if -e $script_bac;
    printFile($script_bac, $response->decoded_content); 
    use File::Compare;      
    if (compare($script_bac, $scriptv) == 0) {
      $same="yes";
      unlink $script_bac;
    }else{ $same="no"; }
  }else{ $same="yes"; }
  return ($same, $response);
}

#########################################################################################################################
## RETURN NEGATIVE SCAN
sub negative { ltak(); print $c[4]."[!] $DT[1]\n"; }

#########################################################################################################################
## DESCLAIMER
sub desclaimer {
  our ($nobanner, $checkVersion);
  if (defined $nobanner) { mtak(); ptak(); }
  print $c[10]."  $OTHERS[11] \n  $OTHERS[12]  \n  $OTHERS[13] \n"; 
  if (defined $dork || defined $Target || defined $shodan || defined $bugtraq) {
    our $uplog;
    if (-e $uplog) { require "$Bin/inc/conf/upad.pl"; }
  }
  mtak(); ptak();
  if (defined $dork || defined $Target || defined $checkVersion || defined $repair || defined $shodan || defined $bugtraq) {    
    testConnection();
  }
}

#########################################################################################################################
## BGN SCAN TITLE
sub scanTitleBgn { print $c[11]."[!] "; timer(); print " ::: $DS[67] "; }

#########################################################################################################################
## END SCAN TITLE
sub scanTitleEnd { print $c[11]." $DS[4] :::\n"; ptak(); }

#########################################################################################################################
## GET CLEAN TARGETS DOMAINE
sub IfDup { my @aTsearch=(); @aTsearch=@aTtargets; @aTtargets=(); }

#########################################################################################################################
## GET DOMMAINE AND REMOVE PROTOCOL
sub removeDupNoProtocol {
  for my $URL(@aTsearch) { $URL=removeProtocol($URL); $URL=~s/www.//s; saveCopy($URL); }
  my @aTsearch=checkDuplicate(@aTsearch); IfDup();
}

#########################################################################################################################
## MEKE SEARCH COPY
sub makeCopy { my @aTcopy=(); push @aTcopy, @aTsearch; }

#########################################################################################################################
## RESTAURE SEARCH COPY
sub restaureSearch { my @aTsearch=(); push @aTsearch, @aTcopy; @aTcopy=(); }

#########################################################################################################################
## REMOVE DUPLICATE DOMAINES WPAFD/JOOMRFI/SUBDOMAINS/ADMIN
sub removeDupDom { 
  makeCopy();
  for my $URL(@aTsearch) { $URL=getHost($URL); saveCopy($URL); }
  my @aTsearch=checkDuplicate(@aTsearch); IfDup();
}

#########################################################################################################################
## SAVE NON DUPLICATE DOMAINES
sub saveCopy { my $URL=$_[0]; push @aTtargets, $URL; }

#########################################################################################################################
## REMOVE DUPLICATE RESULTS
sub checkDuplicate {
  my @array=@_;
  sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
  }
  my @filtered = uniq(@array);
  return (@filtered);
}

#########################################################################################################################
## REMOVE URLS PROTOCOL
sub removeProtocol { 
  my $URL=$_[0];
  my %replace=('http://' => '', 'https://'=>'', 'ftp://'=>'', 'ftps://'=>'', 'socks://'=>'', 'socks4://'=>'', 'socks5://'=>'');
  $URL=~s/$_/$replace{ $_}/g for keys %replace;
  return $URL;
}

#########################################################################################################################
## GET TARGET PROTOCOL
sub getTargetProtocol {
  my $URL=$_[0];
  my $protocol="";
  my @protocols=('http:', 'https:', 'ftp:', 'ftps:', 'socks:', 'socks4:', 'socks5:');
  for my $targetProtocol(@protocols) {
    if (index($URL, $targetProtocol) != -1) { $protocol=$targetProtocol; }
  }
  return $protocol;
}

#########################################################################################################################
## GET PORTS PROTOCOL
sub portProtocol { 
  my $por=$_[0];
  my %proto=('21'=>'FTP', '22'=>'SSH', '23'=>'TELNET', '25'=>'SMTP', '53'=>'DNS', '69'=>'TFTP', '80'=>'HTTP', '109'=>'POP2', '110'=>'POP3', '123'=>'NTP', '137'=>'NETBIOS-NS', '135'=>'MSRPC',
  '138'=>'NETBIOS-DGM', '139'=>'NETBIOS-SSN', '143'=>'IMAP', '156'=>'SQL-SERVER', '389'=>'LDAP', '443'=>'HTTPS', '444'=>'SNPP', '445'=>'SHARING', '546'=>'DHCP-CLIENT', '547'=>'DHCP-SERVER',
  '554'=>'RTSP', '902'=>'ISS-REALSECURE', '912'=>'APEX-MESH', '995'=>'POP3-SSL', '993'=>'IMAP-SSL', '2086'=>'WHM/CPANEL', '2087'=>'WHM/CPANEL', '2082'=>'CPANEL', '2083'=>'CPANEL',
  '2869'=>'ICSLAP', '3306'=>'MYSQL', '5357'=>'WSDAPI', '8443'=>'PLESK', '10000'=>'VIRTUALMIN/WEBMIN');
  my $portProtocol="UNKNOWN";
  for my $key (keys %proto) {
    if ($key eq $por) {
      $portProtocol=$proto{$key};
    }
  }
  return $portProtocol;
}
#########################################################################################################################
## REMOVE QUERY STRING
sub removeQuery { 
  my $URL=$_[0];
  my $protocol=getTargetProtocol($URL);
  $URL=removeProtocol($URL);
  $URL=~s/=.*/=/g;
  $URL="$protocol//$URL";	
  return $URL;
}

#########################################################################################################################
## BUILD REPLACE 
our @replace=($replace, $replaceFROM);
our @replaceParts;
sub checkVreplace {
  @replace=($replace, $replaceFROM);
  for (@replace) {
    if (defined $_) {
      $_=~s/\s\=\>/=>/g;
      $_=~s/\=\>\s/=>/g;
      @replaceParts=split("=>", $_);
    }
  }
}

#########################################################################################################################
## CHECK TARGETS FOR REPLACE OPTION
sub control {
  my $URL=$_[0];
  our @replaceParts;
  if (defined $noQuery) {
    $URL=removeQuery($URL);
  }
  if (defined $mdom || defined $expHost) {               
	$URL=getHost($URL);
  }  
  if (defined $replace) {
    $URL=~s/\Q$replaceParts[0]/$replaceParts[1]/ig;
  }
  if (defined $replaceFROM) {
    $URL=~s/$replaceParts[0](.*)//s;
    $URL=~s/$replaceParts[0]//ig;
    $URL=$URL.$replaceParts[1];
  }  
  if (defined $expIp) {
    my $ips=checkExtraInfo($URL);
    if ($ips) { $URL=inet_ntoa($ips); }else{ print "$c[2] $TT[11]\n"; next; }
  }
  return $URL;
}

#########################################################################################################################
## GET DOMAIN
sub getHost {
  my $URL=$_[0];
  my $protocol=getTargetProtocol($URL);
  $URL=removeProtocol($URL);   
  $URL=~s/\/.*//s;
  $URL="$protocol//$URL";
  return $URL;
}

#########################################################################################################################
## CLEAN URL
sub cleanURL {
  my $URL=$_[0];
  my %replace=( 'http://' => '', 'https://' => '', 'www\.' => '', 'ftp://' => '', 'ftps://' => '');
  $URL=~s/$_/$replace{ $_}/g for keys %replace;
  $URL=~s/\/.*//s;
  return $URL;
}

#########################################################################################################################
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
#########################################################################################################################
## GET FILTRED URLS
sub filterUr {
  my ($URL, $dorkToCheeck)=@_;
  my $U="";
  if (defined $unique || $unique) {
    if (index($URL, $dorkToCheeck) != -1) { $U=$URL; }
  }
  if (defined $ifinurl) {
    if (index($URL, $ifinurl) != -1) { $U=$URL; }
  }
  return $U;
}

#########################################################################################################################
## VALIDATE URL PARTS
sub validateURL {
  my $vURL=$_[0];
  $vURL=cleanURL($vURL);
  return $vURL if $vURL=~/([a-zA-Z0-9\-\_]\.)?([a-zA-Z0-9\-\_]\.)[a-zA-Z]/;
}

#########################################################################################################################
## CHECK SCANS HEADERS
sub checkHeaders {
  my ($ct, $dt, $et)=@_;
  if ($ct) { scanTitleBgn(); }
  if ($dt) { removeDupDom(); }
  if ($et) { removeDupNoProtocol(); }
}

#########################################################################################################################
## COUNT RESULTS
sub OO { 
  return scalar @aTscans;
}

#########################################################################################################################
## END SCAN PROCESS
sub subfin {
  our $ifend;
  print $c[4]."[!] "; timer(); print " $DT[3]!\n";
  if (defined $ifend || $ifend) { print chr(7); }
}

#########################################################################################################################
## COUNT SCAN RESULTS
sub countResultLists {
  my $o=OO();
  if ($o==$limit) { 
    print $c[3]."[!] $DT[34] ($limit result\/s)!\n";
  }else{
    print $c[3]."[!] ".$o." $DT[4]\n";
  }
}

#########################################################################################################################
## SEARCH REGEX FILTER
sub doRegex { 
  my $searchRegex=$_[0];
  for my $URL(@aTsearch) {
    if ($URL=~/$searchRegex/) { saveCopy($URL); }
  }
}

#########################################################################################################################
## REPLACE REFERENCIES TARGET HOST HOSTIP
sub replaceReferencies {
  my ($URL, $ref)=@_;
  if ($ref=~/\-HOSTIP/) {
    my $ips=checkExtraInfo($URL);
    if ($ips) {
      my $ad=inet_ntoa($ips);
      $ref=~s/\-\-HOSTIP/$ad/ig;
    }
    else{
      print "$c[2] $TT[11]\n";
    }
  }elsif ($ref=~/\-HOST/) {
    $URL=getHost($URL);   
    $ref=~s/\-\-HOST/$URL/ig;
  }elsif ($ref=~/\-TARGET/) {
    $ref=~s/\-\-TARGET/$URL/ig;
  }
  return $ref;
}

#########################################################################################################################
## ZONE-H
sub zoneH {
  my ($URL, $zoneH)=@_;
  my @zoneD=split("=>", $zoneH);
  my $url=replaceReferencies($URL, $zoneD[1]);
  $url=~s/\s//ig;
  my $zoneHurl="http://www.zone-h.org/notify/single";
  my $ua = LWP::UserAgent->new;
  my $res = $ua->post($zoneHurl,
                  Content => ['defacer' => $zoneD[0],
				              'domain1' => $url,
				              'hackmode' => '15',
				              'reason' => '1',
				              'Gönder' => 'Send',
				              ]);
  if ($res->content =~ /color\=\"red\"\>(.*)<\/font\><\/li\>/) {
    my $znh=$1;
    if ($znh=~m/OK/) {
      print $c[1]."    $ZT[25]  ".$c[3] . "$znh \n";
    }elsif ($znh=~m/ERROR/) {
      print $c[1]."    $ZT[25]  ".$c[4] . "$znh \n";
    }
  }else{
	print $c[1]."    $ZT[25]  ".$c[4] ."$ZT[23]\n";
  }
}

#########################################################################################################################
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

#########################################################################################################################
## BUILT POSITIVE SCAN RESULTS LIST
sub saveme { 
  my ($URL1, $sep)=@_;
  my $o=OO();
  if ($o < $limit) {
    push @aTscans, $URL1;
    if (defined $output) { printFile("$output", " $URL1"); }
  }
}

#########################################################################################################################
## SCAN TITLE
sub title { 
  if (defined $output) { my $SCAN_TITLE=$_[0];  printFile("$output", "="x30 ."\n$SCAN_TITLE\n"."="x30); }
}

#########################################################################################################################
## CHECK IF THERE MORE SCANS TO DO
sub getK {
  our @z;
  my ($x, $y)=@_; my $k=0; splice @z, $x, $y;
  for (@z) { if (defined $_) { $k++; } } return $k;  
}

#########################################################################################################################
## EXTERN COMMAND EXECUTION
sub checkExternComnd {
  my ($URL1, $command)=@_;
  my $ic=0;
  for my $comnd(@commands) {
    $ic++;
    buildExtCommands($URL1, $comnd, $ic, scalar(@commands));
  }
}

#########################################################################################################################
## BUILD EXTERN COMMAND
sub buildExtCommands {
  my ($URL1, $comnd, $ic, $ic2)=@_;
  $comnd=replaceReferencies($URL1, $comnd);
  print $c[1]."    $DT[24] $c[10] [".$ic."/".$ic2."] [$comnd]\n";
  getComnd($URL1, $comnd);
  print $c[1]. "." x 75 ."\n";
}

#########################################################################################################################
## CHMOD 777
sub nochmod {
  my ($path, $action)=@_;
  sleep(1);
  print $c[2]."[!] Couldn't have write permitions: $path !\n";
  if ($action) { logoff(); } 
}

#########################################################################################################################
## FILE WRITE ERRORS
sub cc { sleep(1); print $c[3]."OK\n"; }
sub bb { sleep(1); print $c[4]."Failed!\n"; }
sub dd { sleep(1); print $c[4]."[!] $DT[8]\n"; }

#########################################################################################################################
## PING IP
sub checkIsAlive {
  my ($URL, $psx1)=@_;
  $URL= removeProtocol($URL) if $URL !~/$V_IP/;
  my $doping=0;
  my $p = Net::Ping->new("icmp", $timeout);
  if ($p->ping($URL)) { $doping++; }
  $p->close();
  if ($doping==0) {
    titleSCAN();
    print "$c[2]$TT[22] $TT[23]\n";
  }else{
    print "$c[1]    $TT[21] $c[3] $TT[22] $TT[24]\n";
    saveme($URL, "") if !defined $port;
    if (defined $command) { checkExternComnd($URL, $command); }
  }
  sleep(1);
  return $doping;
}

#########################################################################################################################
## SOCKET PROXY
sub getHostAndPort {
  my $px=$_[0];
  $px=removeProtocol($px);
  my @sk=split(":", $px);
  return ($sk[0], $sk[1]);
}

#########################################################################################################################
## CHECK PROXY RANDOM USE
sub checkPoxyUse1 {
  my $psx=$_[0];
  my ($ProxyAddr, $ProxyPort);
  if (defined $proxy || $proxy || defined $prandom || $prandom) {
    if (defined $prandom || $prandom) {
      newIdentity("1");
    }
    ($ProxyAddr, $ProxyPort) = getHostAndPort($psx);
  }
  return ($ProxyAddr, $ProxyPort);
}

#########################################################################################################################
## CHECK SCAN ARGUMENTS
sub Targs {
  my @Targs=($xss, $data, $lfi, $ifinurl, $WpSites, $Hstatus, $validText, $adminPage, $subdomain, $JoomRfi, $WpAfd, $mindex, $port,
             $mupload, $mzip, $JoomSites, $eMails, $searchIps, $regex, $command, $ping, $interactive, $validShell, $exclude, $repair,
             $bugtraq, $zoneH, $content, $msource, $fullHeaders, $command, $geoloc, $getlinks, $shodan);
  my $Targ=0;
  for (@Targs) { $Targ++ if defined $_; }
  return $Targ;
}

#########################################################################################################################
## JSON DECODE 
sub _json {
  my $shoRes =$_[0];
  my $json = JSON->new->allow_nonref;
  return $json->decode( $shoRes );
}

#########################################################################################################################
## CHECK CPAN MODULES
sub checkCpanModules {
  eval { require JSON; };
  if($@) { 
    print $c[4]."[!] ERROR! This scan require JSON module! do you want to install? [Y/n]: $c[10]";
    my $re=<STDIN>;
    chomp ($re);
    if ($re!~/(N|n)/) {
      system("cpan App::cpanminus && cpanm JSON");
    }
  }
  if($@) { print $c[4]."[!] Failed to install JSON\n"; logoff(); }
}

#########################################################################################################################

1;
