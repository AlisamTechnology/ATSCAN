#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

our ($scriptv, @c);
print $c[4]."[i] Trying to repair tool...\n";
open (LME, '>', $scriptv) or nochmod($scriptv, "exit");
print LME "REPAIR"; close(LME);
checkVersion();
  
1;
