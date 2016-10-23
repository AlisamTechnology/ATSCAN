#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
use File::Path;
## Copy@right Alisam Technology see License.txt

## CHECK FOR UPDATES
our ($uplog, $script_bac, $fulldate, @c);
my (@date1, @date2);

open (UPLOG, $uplog);
while (my $lg=<UPLOG>) {
  chomp $lg;
  @date1=split(":", $lg);   
}
@date2=split(":", $fulldate);    

if ($date1[1]<$date2[1]) {
  updateMessage();
}else{
  if (($date1[0]+10)<$date2[0]) {
    updateMessage();
  }
}

sub updateMessage  {
  my ($same, $response)=compareme();
  if (!$same) {
    print $c[4]."  [!] A new update is aviable! To update: --update\n";
  }
}      

1;
