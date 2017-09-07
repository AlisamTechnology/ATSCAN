#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## SEPARATIONS
our (@c);
sub mtak { my $sn1="_" x 80; print $c[1]."$sn1\n"; }
sub dpoints { my $sn2=":" x 66; print $c[1]."    "; timer(); print "$sn2\n"; }
sub ptak { my $sn3="-" x 80; print $c[1]."$sn3\n"; }
sub points  { my $sn4="=" x 76; print $c[1]."    $sn4\n"; }
sub ltak { my $sn5="-" x 80; print $c[1]."$sn5\n"; }
sub stak { my $sn6="-" x 76; print $c[1]."    $sn6\n"; }
sub stakScan { my $ee=":" x 68; print $c[1]."$ee\n"; }
our $sp=" " x 11;

1;
