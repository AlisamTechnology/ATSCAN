package Subs;

use strict;
use warnings;
use FindBin '$Bin';
use Exporter;
use Target;
use Validate;
use Exploits;
use POSIX qw(strftime);
use Print;

## Copy@right Alisam Technology see License.txt

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(compareme getTargetProtocol removeProtocol buildArraysLists buildArrays params checkDuplicate 
                   target_urls rang repeat replaceReferencies getProx _json filterUr checkFilters now 
				   fulldate frequency scriptUrl logUrl ipUrl conectUrl server geoServer scriptv script
				   scriptComplInstall scriptInstall script_bac uplog scriptbash scriptCompletion readme 
				   userSetting deskIcon deskIcoConf getComnd make_freq portProtocol cockies target_urls_repeater);

unlink "$Bin/inc/user/cookies.txt" if -e "$Bin/inc/user/cookies.txt";

my $userSetting = userSetting();  
my $logUrl = logUrl();
my $uplog = uplog();
my $script_bac = script_bac();
my $scriptv = scriptv();
my $V_IP = Exploits::V_IP();

############################################################################################################
##
sub target_urls_repeater {
  my $target_urls = $_[0];
  my @target_urls = @{$target_urls};
  my @repeater_urls1;
  for my $tar(@target_urls) {
    $tar =~ s/\s//g;
	my @targets1;
    if ($tar !~ /^(http|https):\/\//) { $tar = "http://$tar"; }
    my @repeater1 = repeat($tar) if ($tar =~ /repeat\((.*)\-(\d+)\)/);
    push @repeater_urls1, @repeater1;
    my @rang = rang($tar) if ($tar =~ /rang\((\d+)\-(\d+)\)/);
    push @repeater_urls1, @rang;
  }
  push @target_urls, @repeater_urls1;
  return @target_urls;
}

#######################################################################################################
## COOCKIES
sub cockies {
  use HTTP::Cookies;
  my $cookies = $_[0];
  my $coockies_file = $cookies ? $cookies : "$Bin/inc/user/cookies.txt";
  my $cookie = HTTP::Cookies->new(
									file     => $coockies_file, 
									autosave => 1,
									ignore_discard => 1
                                  );
}

#######################################################################################################
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
## MEKE FREQUENCY RANDOM 
sub make_freq {
  my ($freq, $start) = @_;
  my $yes;
  my $stop = Subs::frequency();
  my $def = $stop - $start;
  if ($def >= $freq) {
	$yes = 1;
  }
  return $yes;
}

#########################################################################################################################
## EXECUTE EXTERN PROCESS COMMANDS
sub getComnd {
  my ($u, $comnd)=@_;
  $u=~s/(\sAND|\%27|\<|\>|\"\<|\"\>|\'\<|\'\>|\"\;|\<\%25|\%|\').*//ig;
  if ($u=~/($V_IP)/) {
    $u=removeProtocol($u);
    if ($comnd=~/-PORT/) {
      if ($u=~/(($V_IP)\:(\d{2,6}))/) {
        $u=~s/\:/\./g;
        my @f=split /\./, $u;
        my $Addr="$f[0].$f[1].$f[2].$f[3]";
        my $Port=$f[4];
        $comnd=~s/\-\-TARGET/$Addr/ig;
        $comnd=~s/\-\-PORT/$Port/ig;
      }else{
        $comnd=~s/\-\-TARGET/$u/ig;
      }
    }elsif ($comnd=~/\-HOSTIP/) {
      $u=~s/\:(\d{2,6})//s;
      $comnd=~s/\-\-HOSTIP/$u/ig;
    }else{
      $comnd=~s/\-\-TARGET/$u/ig;
    }    
  }else{
    $comnd=replaceReferencies($u, $comnd);
  }
  return $comnd;
}

#########################################################################################################################
## CHECK VERSION LOG
sub compareme {
  my ($ua, $fullHeaders) = @_;
  my ($same);
  use Getme;
  my $getme = new Getme();
  my ($redir, $re, $ht, $st, $sh, $fh) = $getme->navget($ua, $logUrl, $fullHeaders, "", "");
  if ($st eq 200) {
    unlink $script_bac if -e $script_bac;
    Print::printFile($script_bac, $ht); 
    use File::Compare;      
    if (compare($script_bac, $scriptv) == 0) {
      $same="yes";
      unlink $script_bac;
    }else{ $same="no"; }
  }else{ $same="yes"; }
  return ($same, $st, $ht);
}

#########################################################################################################################
## TIMER
sub now { return strftime ("%H:%M:%S", localtime); }
sub fulldate { return strftime ("%Y%j", localtime); }
sub frequency { return strftime "%H%M%S", localtime; }
sub scriptUrl { return "https://raw.githubusercontent.com/AlisamTechnology/ATSCAN/master/atscan.pl"; }
sub logUrl { return "https://raw.githubusercontent.com/AlisamTechnology/ATSCAN/master/inc/user/version.log"; }
sub ipUrl { return "http://dynupdate.no-ip.com/ip.php"; }
sub conectUrl { return "http://www.bing.com"; }
sub server { return "https://cxsecurity.com"; }
sub geoServer { return "https://www.onyphe.io/api/geoloc"; }
sub scriptv { return $Bin."/inc/user/version.log"; }
sub script {
  my $script = $Bin."/atscan";
  if (substr($0, -3) eq '.pl') { $script.=".pl"; }
  return $script;
}
sub scriptComplInstall { return $Bin."/inc/user/atscan"; }
sub scriptInstall { return $Bin."/install.sh"; }
sub script_bac { return $Bin."/version_bac.log"; }
sub uplog { return $Bin."/inc/user/uplog.log"; }
sub scriptbash { return "/usr/bin/atscan"; }
sub scriptCompletion { return "/etc/bash_completion.d"; }
sub readme { return "/usr/share/doc/atscan"; }
sub userSetting { return $Bin."/inc/user/userSetting"; }
sub deskIcon { return $Bin."/inc/user/desktop/"; }
sub deskIcoConf { return "/usr/share/applications"; }


#########################################################################################################################
## BUILD PROXIES ARRAY
my @proxies;
sub getProx {
  my $getProx = $_[0];
  if ($getProx =~ /:[0-9]/) { @proxies = split / /, $getProx; }
  else{ @proxies = buildArrays($getProx); }
  return @proxies;
}

###########################################################################################################
## VALIDATE URL PARTS
sub validateURL {
  my $vURL = $_[0];
  my $hg = new Target();
  $vURL = $hg->cleanURL($vURL);
  my $coun = () = $vURL =~ /\./g;
  return $vURL if $coun > 0;
}

#########################################################################################################################
## GET FILTERS
sub checkFilters {
  my $dorkToCheeck = $_[0];
  my $pat2='inurl:|intitle:|intext:|allinurl:|index of:|site:(.*)\+|\+site:(.*)';
  my $dmn = "";
  if ($dorkToCheeck=~/(site:(.*)\+|\+site:(.*))/) {
    $dmn=$1;
    $dmn=~s/\+//g;
    $dmn=~s/site:/\./g;
  }
  $dorkToCheeck =~ s/:\s/:/g;
  $dorkToCheeck =~ s/$pat2//g;
  return ($dorkToCheeck);
}

#########################################################################################################################
## GET FILTRED URLS
sub filterUr {
  my ($URL, $dorkToCheeck, $unique, $ifinurl) = @_;
  my $U = "";
  if (defined $unique) {
    if (index($URL, $dorkToCheeck) != -1) { $U = $URL; }
  }
  if (defined $ifinurl) {
    if (index($URL, $ifinurl) != -1) { $U = $URL; }
  }
  return $U;
}

#########################################################################################################################
## JSON DECODE 
sub _json {
  my $shoRes = $_[0];
  my $json = JSON->new->allow_nonref;
  return $json->decode( $shoRes );
}

###########################################################################################################
## GET TARGET PROTOCOL
sub getTargetProtocol {
  my $URL = $_[0];
  my $protocol = "";
  my @protocols = ('http:', 'https:', 'ftp:', 'ftps:', 'socks:', 'socks4:', 'socks5:');
  for my $targetProtocol(@protocols) {
    if (index($URL, $targetProtocol) != -1) { $protocol = $targetProtocol; }
  }
  return $protocol;
}

###########################################################################################################
## REMOVE URLS PROTOCOL
sub removeProtocol { 
  my $URL = $_[0];
  my %replace = ('http://' => '', 'https://'=>'', 'ftp://'=>'', 'ftps://'=>'', 'socks://'=>'', 'socks4://'=>'', 'socks5://'=>'');
  $URL =~ s/$_/$replace{ $_}/g for keys %replace;
  return $URL;
}

###########################################################################################################
## BUILT ARRAYS
sub buildArrays {
  my $buildArrays = $_[0];
  my @buildArrays;
  if (-e $buildArrays) {
    open (UAL, $buildArrays);
    while (my $buildArray = <UAL>) {
      chomp $buildArray;
      if ($buildArray !~ /^\#/) {
        push @buildArrays, $buildArray;
      }
    }
  }else{
    $buildArrays =~ s/\s+$//g;
    $buildArrays =~ s/^\[OTHER]//g;
    @buildArrays = split /\[OTHER\]/, $buildArrays;
  }
  return @buildArrays;
}

###########################################################################################################
## PARAMS
sub params { 
  my ($url, $params) = @_;
  my @params;
  $params =~ s/\s//g;
  if ($params =~/all/) {
	while ($url =~ /((\?|\&).*?)=/g) { 
	  my $ppz = $1;
      $ppz =~ s/\?//g;
	  $ppz =~ s/\&//g; 
	  push @params, $ppz; 
	}
  }else{
	@params = split(",", $params);
  }
  return @params;
}

###########################################################################################################
## CKECK TARGET PARAMETERS
sub check_params {
  my ($tg, $exp, $param) = @_;
  my @add;
  if (index($tg, "\?$param=") != -1) {
	$tg =~ s/\?$param=([^&]*)/\?$param=$1$exp/;
	push @add, $tg;
  }else{
	$tg =~ s/\&$param=([^&]*)/\&$param=$1$exp/;
	push @add, $tg;
  }
  return @add;
}

###########################################################################################################
## INCLUDE EXPLOIT TO TARGET
sub target_urls { 
  my ($url, $params, $exploits, $subdomain, $JoomRFI, $shell) = @_;
  my @target_urls;
  if (scalar @{$exploits} > 0) {
    for my $exp(@{$exploits}) {
	  my $tg = $url;
	  if (defined $subdomain) {
	    $tg = "$exp".$tg;
	  }elsif (defined $JoomRFI) {
	    $tg = $tg."$exp".$shell;
	  }else{
	    $tg = $tg."$exp";
	  }
	  push @target_urls, $tg;
      if (scalar @{$params} > 0) {
	    for my $param(@{$params}) {
	      my @add = check_params($tg, $exp, $param);
		  push @target_urls, @add;
		}
	  }
	}
  }else{
    push @target_urls, $url;
  }
  return @target_urls;
}

###########################################################################################################
## REMOVE DUPLICATE RESULTS
sub checkDuplicate {
  my @array = @_;
  sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
  }
  my @filtered = uniq(@array);
  return (@filtered);
}

###########################################################################################################
## REPEAT
sub repeat {
  my ($url) = $_[0]; 
  my @add;
  if ($url =~ /repeat\((.*)\-(\d+)\)/) { 
	my $i = 0;
    for($i=1;$i<=$2;$i++) {
      my $rangQ = "$1" x $i;
	  my $u = build_repeat($url, $rangQ);
	  push @add, $u;
    }
  }
  return @add;
}

###########################################################################################################
## BUILD REPEATER URLS
sub build_repeat {
  my ($url, $rangQ) = @_;
  $url =~ s/repeat\((.*)\-(\d+)\)/$rangQ/;
  return $url;
}

###########################################################################################################
## RANG 
sub rang {
  my ($url) = $_[0]; 
  my @add;
  if ($url =~ /rang\((\d+)\-(\d+)\)/) {
    my @rangQ = ($1 .. $2);
    for my $rangQ(@rangQ) {
	  my $rng = new Target();
	  $url = $rng->noQuery($url);
	  $url.= $rangQ;
	  push @add, $url;
	}
  }
  return @add;
}

#########################################################################################################################
## REPLACE REFERENCIES TARGET HOST HOSTIP
sub replaceReferencies {
  my ($URL, $ref)=@_;
  if ($ref=~/\-HOSTIP/) {
    my $ipp = new Validate();
    my $ips = $ipp->get_target_ip($URL);
    if ($ips) {
      $ref =~ s/\-\-HOSTIP/$ips/ig;
    }
    else{
      Print::print_general("2", "Cannot get IP!");
    }
  }elsif ($ref =~ /\-HOST/) {
    my $hst = new Target();
    my $host = $hst->host($URL);
    $ref =~ s/\-\-HOST/$URL/ig;
  }elsif ($ref =~ /\-TARGET/) {
    $ref =~ s/\-\-TARGET/$URL/ig;
  }
  return $ref;
}

###########################################################################################################

1;
