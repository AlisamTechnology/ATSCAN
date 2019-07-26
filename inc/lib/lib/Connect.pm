package Connect;

use strict;
use FindBin '$Bin';
use Exporter;
use Exploits;
use LWP::UserAgent;
use Print;
use UseErrors;

## Copy@right Alisam Technology see License.txt

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(testConnection check_proxy_connect);

my @c      = Print::colors();
my @ErrT   = Exploits::ErrT();
my @ZT     = Exploits::ZT();
my @DT     = Exploits::DT();
my @DS     = Exploits::DS();
my @OTHERS = Exploits::OTHERS();
my @TT     = Exploits::TT();

##########################################################################################################
##########################################################################################################
## CHECK PROXY CONNECTION
sub check_proxy_connect {
  my ($ua, $psx) = @_;
  $ua->proxy([qw/ http https ftp ftps socks4 socks5 /] => $psx); 
  $ua->cookie_jar({ });
  my $r=$ua->get("http://dynupdate.no-ip.com/ip.php");
  return $r->content if $r->is_success;
}

##########################################################################################################

## CHECK APIKEY CONNECTION
sub check_apikey_connect {
  my ($ua, $api, $cx, $shodan) = @_;
  my $u;
  if (defined $shodan) { $u="https://api.shodan.io/shodan/host/search?key=$api&query=camera"; }  
  else{ $u="https://www.googleapis.com/customsearch/v1?key=$api&cx=$cx&q=googleapis"; }
  return $ua->get($u)->decoded_content;
}

##########################################################################################################

## CHECK PROXY LIST
sub check_list_prx {
  my ($ua, $proxies) = @_;
  my @connected_proxies;
  print $c[4]."[!]$c[10] Checking proxy connection...";
  for my $psx(@{$proxies}) {
    my $r = check_proxy_connect($ua, $psx);
    if (!$r) { 
	  print $c[2]."\n[!] Failed to connect with [$psx]";
	}else{
	  push @connected_proxies, $psx;
	}
  }
  print_connecttions(scalar @connected_proxies, scalar @{$proxies}, "proxies");
  return @connected_proxies;
}

#########################################################################################################################
## CHECK APIKEY LIST
sub check_list_apikey {
  my ($ua, $apikeys, $cx, $shodan) = @_;
  my @connected_apikeys;
  print $c[4]."[!]$c[10] Checking apikey connection...";
  for my $apk(@{$apikeys}) {
    my $r = check_apikey_connect($ua, $apk, $cx, $shodan);
    if ($r!~/(\"Bad Request\"|\"dailyLimitExceeded\"|Please upgrade your API|Can\'t connect to api|This server could not verify that you are authorized)/) { 
      push @connected_apikeys, $apk;
	}else{
	  print $c[2]."\n[!] Failed to connect with [$apk]";
	  print $c[4]."\n    Message: [$1]";
	}
  }
  print_connecttions(scalar @connected_apikeys, scalar @{$apikeys}, "apikeys");
  return @connected_apikeys;
}

#########################################################################################################################
## PRINT CONNECTIONS RESULT
sub print_connecttions {
  my ($x, $y, $txt)=@_;
  print "$c[3] OK\n" if ($x > 0 && $x eq $y);
  if ($x < 1) {
	print $c[2]."\n[!] Cannot connect with any of given $txt!\n"; exit();
  }elsif($x > 0 && $x < $y) {
	print $c[3]."\n[!] OK! $c[4]Only running $txt in list will be used ($x)!\n";
  }
  print "\n";
  Print::separaBlocks();
  sleep 1;   
}

#########################################################################################################################
## CHECK CPAN MODULES
sub checkCpanModules {
  eval { require JSON; };
  if($@) { 
    print $c[4]."[!] OOPS! This scan require JSON module! do you want to install? [Y/n]: $c[10]";
    my $re=<STDIN>;
    chomp ($re);
    if ($re=~/(Y|y)/) {
      system("cpan App::cpanminus && cpanm JSON");
	  Print::separaBlocks();
    }
  }
  eval { require JSON; };
  if($@) { print $c[4]."[!] Failed to install JSON\n"; exit(); }
  else{
    print "\n";
    require "$Bin/inc/user/Getjson.pl";
  }
}

#########################################################################################################################
## CHECK CONNECTION
sub testConnection {
  my ($ua, $proxy, $prandom, $apikey, $cx, $motors, $proxies, $apikeys, $shodan) = @_;
  
  my $b = 0;
  my (@connected_proxies, @connected_apikeys);
  for (@{$motors}) { 
    if ($_=~/googleapis./) {
	  $b = 1;
	  UseErrors::_print_apis_alert() if (!defined $apikey || !defined $cx);
	}
  }
  $b=1 if defined $shodan;
  if ($b || defined $proxy || defined $prandom) {
    if ($proxy || defined $proxy || $prandom || defined $prandom) { 
	  @connected_proxies = check_list_prx($ua, \@{$proxies});
	}
    if ($b) { 
	  checkCpanModules(); 
	  @connected_apikeys = check_list_apikey($ua, \@{$apikeys}, $cx, $shodan);
	}
  }else{
    my $respons=$ua->get("http://dynupdate.no-ip.com/ip.php");
    if (!$respons->is_success) { 
	  print $c[2]."[!] $DT[11]\n[!] $DT[10]\n".$c[4]."[!] $ErrT[23]\n"; 
	  exit();
	}
  }
  return (\@connected_proxies, \@connected_apikeys);
}

###########################################################################################################

1;
