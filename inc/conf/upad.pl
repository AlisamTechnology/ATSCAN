#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
use File::Path;
## Copy@right Alisam Technology see License.txt

##
our ($uplog, $script_bac, $fulldate, $dateupdate, @c);
my (@date1, @date2);

## LAST UPDATE
open (UPLOG, $uplog);
while (my $lg=<UPLOG>) {
  chomp $lg;
  if (!$dateupdate) { $dateupdate=1; }
  if (($dateupdate + $lg) < $fulldate) { updateMessage(); }
}

## CHECK FOR UPDATE
sub updateMessage  {
  my ($same, $rp)=compareme();
  if ($rp->is_success) {
    if ($same ne "yes") { print $c[4]."  [i] A new update is aviable! To update: --update\n"; }
    else{
      open (MN, '>', $uplog) or nochmod($uplog, "");
      print MN "$fulldate"; close(MN);
    }
  }else{
    print "  "; dd();
  }
}      

1;
