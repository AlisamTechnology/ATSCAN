#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

our (@SCAN_TITLE, @DS, @TT, @c, @aTscans, @aTsearch, @userArraysList, $limit, @ErrT, $proxy, $V_IP, $prandom, $psx, $command, $port, $udp, $tcp);
## SCAN PORTS
sub scanPorts {
  my ($PORTS, $types)=@_;
  @aTscans=();
  scanTitleBgn(); print $c[11]."$SCAN_TITLE[20]"; scanTitleEnd(); title($SCAN_TITLE[20]);
  my $count=0;
  my $closed1=0;
  my $lj;
  my $lc=scalar(grep { defined $_} @aTsearch);
  my @PORTS=@{ $PORTS };
  my @TYPES=@{ $types };
  if (defined $command) { $lj="1"; }else{ $lj="0"; }
  for my $URL(@aTsearch) {
    $URL=~s/\s+$//;
    my $o=OO();
    if ($o>=$limit) { last; }
    else{
	  $count++;
      points(); dpoints(); points();
      print $c[1]."    $DS[9]  ".$c[7]."[$count/$lc] $URL\n";
      if ($URL!~/$V_IP/) { titleSCAN(); print $c[2]."[$URL] $TT[18]\n"; last; }
      my $c1=0;
      foreach my $port(@PORTS) {
        my $o=OO();
        if ($o<$limit) {
          $c1++;
          points() if $c1>1;
          my $c2=0;
          foreach my $type(@TYPES) {
            if ($o<$limit) {
              $c2++;
              points() if $c2>1;
              my $socket;
              if (defined $proxy || $proxy || defined $prandom || $prandom) {
                if (defined $prandom || $prandom) {
                  newIdentity();
                  print $c[1]."    $ErrT[21] $c[8]  New Identity !\n";
                }
                my $px=removeProtocol($psx);
                if ($px=~/((.*)\:(\d{1,6}))/) {
                  my $ProxyAddr=$1;
                  my $ProxyPort=$2;
                  $socket=IO::Socket::INET->new(ProxyAddr => $ProxyAddr, ProxyPort => $ProxyPort, PeerAddr=> $URL, PeerPort=> $port,Proto=> $type) or $closed1++;
                }
              }else{
                $socket=IO::Socket::INET->new(PeerAddr=> $URL, PeerPort=> $port, Proto=> $type) or $closed1++;
              }                
              close $socket if defined $socket;     
	          print $c[1]."    $DS[7]    $c[10]$port\n $c[1]   $DS[8]    $c[10]$type\n"; titleSCAN();;
	          if ($closed1==0) {
                print $c[3]."$DS[42]\n";
                my $URL1;
                if (defined $command) {
                  $URL1="$URL:$port";
                }else{
                  $URL1="$URL:$port $type";
                }
                saveme($URL1, "");
              }else{
                print $c[2]."$DS[43]\n";
              }
            }
            my $closed1=0;
          }
        }
      }
    }
  }
  ltak(); endScan() if !$lj;
}

## GET OPEN PORTS
sub ports {  
  my (@PORTS, @TYPES, @aTscans)=();
  if ($port=~/(\d+)\-(\d+)/) { @PORTS=($1..$2); }
  else{ @PORTS=split(/ /, $port); } 
  if (defined $udp) { push(@TYPES, "udp"); }
  if (defined $tcp) { push(@TYPES, "tcp"); }
  scanPorts(\@PORTS, \@TYPES);
}

1;
