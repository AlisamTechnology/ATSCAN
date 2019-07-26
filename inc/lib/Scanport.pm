package Scanport;

use strict;
use warnings;
use FindBin '$Bin';
use Print;
use Exploits;
use Getme;
use POSIX qw(strftime);
use Subs;
use open ':std', ':encoding(UTF-8)';
use Net::Ping;
use HTTP::Cookies;
use IO::Socket;

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(ports);

## Copy@right Alisam Technology see License.txt

my @c = Print::colors();
my @ErrT = Exploits::ErrT();
my @ZT = Exploits::ZT();
my @DT = Exploits::DT();
my @DS = Exploits::DS();
my @OTHERS = Exploits::OTHERS();
my @SCAN_TITLE = Exploits::SCAN_TITLE();
my @TT = Exploits::TT();
my $V_IP = Exploits::V_IP();

##########################################################################################################
## PING IP
sub checkIsAlive {
  my ($URL, $psx1, $commands, $timeout)=@_;
  $URL= Subs::removeProtocol($URL) if $URL !~/$V_IP/;
  my $doping=0;
  my $p = Net::Ping->new("icmp", $timeout);
  if ($p->ping($URL)) { $doping++; }
  $p->close();
  if ($doping==0) {
    print $c[1]." SCAN     ";
    print "$c[2] $TT[22] $TT[23]\n";
  }else{
    print "$c[1] $TT[21]   $c[3] $TT[22] $TT[24]\n";
    if (defined $commands && (scalar @{$commands} > 0)) { 
	  Print::checkExternComnd($URL, \@{$commands}); 
	}
  }
  sleep(1);
  return $doping;
}

##########################################################################################################
## SOCKET PROXY
sub getHostAndPort {
  my $px=$_[0];
  $px= Subs::removeProtocol($px);
  my @sk=split(":", $px);
  return ($sk[0], $sk[1]);
}


##########################################################################################################
## SCAN PORTS
sub scanPorts {
  my ($URL, $commands, $port, $udp, $tcp, $proxy, $prandom, $psx, $ping, $PORTS, $types, $timeout)=@_;

  my $count=0;
  my $closed1=0;
  my @PORTS=@{ $PORTS };
  my @TYPES=@{ $types };

  $URL=~s/\s+$//;
  print "\n" if $count>1;
  my $doping = 1;
  if (defined $ping) {
    $doping = checkIsAlive($URL, $psx, \@{$commands}, $timeout);
  }
  
  if ($doping) {
    my $c1=0;
    foreach my $port(@PORTS) {
      $c1++;
      points() if $c1>1;
      my $portProtocol = Subs::portProtocol($port);
      my $c2=0;
      foreach my $type(@TYPES) {
	    $c2++;
        points() if $c2>1;
        print $c[1]." $DS[7]      $c[10]$port [$portProtocol]\n$c[1] $DS[8]      $c[10]$type\n";
        my ($ProxyAddr, $ProxyPort);
        if (defined $proxy || $proxy || defined $prandom || $prandom) {
          ($ProxyAddr, $ProxyPort) = getHostAndPort($psx); 
        }
        print $c[1]." SCAN     ";
              
	    my $socket=IO::Socket::INET->new(ProxyAddr => $ProxyAddr, ProxyPort => $ProxyPort, PeerAddr=> $URL, PeerPort=> $port, Proto=> $type) or $closed1++;
        close($socket) if $socket;
        if ($closed1==0) {
          print $c[3]." $DS[42]\n";
          my $URL1;
          if (defined $commands && (scalar @{$commands}>0)) { $URL1="$URL:$port"; }
          else{ $URL1="$URL:$port $type"; }
          #saveme($URL1, "");
          if (defined $commands and scalar @{$commands}>0) { 
		    Print::checkExternComnd($URL1, $commands); 
		  }
        }else{
          print $c[2]." $DS[43]\n";
        }
        sleep(1);
      }
	}
    Print::separator(); 
  }
}

##########################################################################################################
##
sub points {
  print $c[1]."..................................................\n";
}

##########################################################################################################
## GET OPEN PORTS
sub ports {
  my ($URL1, $commands, $port, $udp, $tcp, $proxy, $prandom, $psx, $ping, $timeout) = @_;
  my (@PORTS, @TYPES);
  $URL1 = Subs::removeProtocol($URL1);
  if (defined $port) {
    if ($port=~/(\d+)\-(\d+)/) { @PORTS=($1..$2); }
    else{ @PORTS=split(/ /, $port); } 
    if (defined $udp) { push(@TYPES, "udp"); }
    if (defined $tcp) { push(@TYPES, "tcp"); }
  }
  scanPorts($URL1, \@{$commands}, $port, $udp, $tcp, $proxy, $prandom, $psx, $ping, \@PORTS, \@TYPES, $timeout);
}

##########################################################################################################

1;
