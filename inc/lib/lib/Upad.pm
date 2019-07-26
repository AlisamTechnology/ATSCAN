package Upad;

use strict;
use warnings;
use FindBin '$Bin';
use Exporter;
use Target;
use Subs;
use Print;
use Getme;

## Copy@right Alisam Technology see License.txt

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(updateAlert);

##
my $uplog      = Subs::uplog();
my $script_bac = Subs::uplog();
my $fulldate   = Subs::fulldate();
my @c          = Print::colors();

## PRINT UPATE ALERT
sub updateAlert  {
  my ($ua, $fullHeaders) = @_;
  if (-e "/usr/bin/atscan") {
    my ($same, $st) = Subs::compareme($ua, $fullHeaders);
    if ($st eq 200) {
      if ($same ne "yes") { 
	    print $c[4]."[i] A new update is aviable! Usage: atscan --update\n";
		Print::separaBlocks();
      }else{
        open (MN, '>', $uplog) or Print::nochmod($uplog, "");
        print MN "$fulldate"; close(MN);
      }
    }else{
      print "  "; 
	  Print::dd();
	  Print::separaBlocks();
    }
  }  
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

## CHECK FOR UPDATE
sub checkforupdates {
  my ($ua, $fullHeaders, $dateupdate) = @_;
  my $lastupdate= get_lastUpdate();
  if ($dateupdate) {
    if (($dateupdate + $lastupdate) < $fulldate) { updateAlert($ua, $fullHeaders); }
  }else{
    if ($lastupdate < $fulldate) { updateAlert($ua, $fullHeaders); }
  }
}


1;
