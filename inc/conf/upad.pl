#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
use File::Path;
## Copy@right Alisam Technology see License.txt

## CHECK FOR UPDATES
our ($uplog, $script_bac, $fulldate, $dateupdate, @c);
my (@date1, @date2);

## date of last update
open (UPLOG, $uplog);
while (my $lg=<UPLOG>) {
  chomp $lg;
  @date1=split(":", $lg);
}

## day number + current day
@date2=split(":", $fulldate); ## days number + current day 

## if date of last update is great than 1 year
if ($date1[1]<$date2[1]) {
  updateMessage();
}else{
  ## check i day number is great than 10 days : check updates frequency
  if ($dateupdate) {
    if (($date1[0]+$dateupdate)<$date2[0]) { updateMessage(); }
  }else{
    if (($date1[0]+10)<$date2[0]) { updateMessage(); }
  }
}

## print update message
sub updateMessage  {
  my ($same, $rp)=compareme();
  if ($rp->is_success) {
    if ($same ne 0) { print $c[4]."  [i] A new update is aviable! To update: --update\n"; }
    else{
      open (MN, '>', $uplog) or nochmod($uplog, "");
      print MN "$fulldate"; close(MN);
    }
  }else{
    print "  "; dd();
  }
}      

1;
