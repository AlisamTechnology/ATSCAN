#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## INFO TOOL
our ($logoVersion, $toolInfo, @TT, @c);
if (defined $toolInfo) {
  use Config;
  print $c[1]." [::] $TT[0]:: ".$c[3]."$TT[5]\n".$c[1]." [::] $TT[1]:: ".$c[3]."$TT[6] [$logoVersion]\n".$c[1]." [::] $TT[2]:: ".$c[3]."$Bin/",basename($0)," \n";
  print $c[1]." [::] $TT[3]:: ".$c[3]."[$^V]\n".$c[1]." [::] $TT[4]:: ".$c[3]."[$Config{ osname} $Config{ archname}]\n";
  ptak();
}

1;
