#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
use File::Path;
## Copy@right Alisam Technology see License.txt

##
our ($uplog, $script_bac, $fulldate, $dateupdate, @c);
my (@date1, @date2);

## PRINT UPATE ALERT
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
## CHECK FOR UPDATE
my $lastupdate=get_lastUpdate();
if ($dateupdate) {
  if (($dateupdate + $lastupdate) < $fulldate) { updateMessage(); }
}else{
  if (($lastupdate + 10) < $fulldate) { updateMessage(); }
}

1;
