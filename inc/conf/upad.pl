#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
use File::Path;
## Copy@right Alisam Technology see License.txt

## CHECK FOR UPDATES
our ($uplog, $script_bac, $fulldate, @c);
use File::Compare;
unlink $script_bac if -e $script_bac;
printFile($script_bac, $fulldate);
if (compare($uplog, $script_bac) != 0) {  
  print $c[4]."  [!] A new update is aviable! To update: --update\n";
  unlink $script_bac;
}

1;
