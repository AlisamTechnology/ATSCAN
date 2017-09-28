#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

our (@OTHERS, @c, @TT);

## ADVISE
sub advise {
  if (-e "/usr/bin/atscan") {
    print $c[5]."[!] $OTHERS[5]: $TT[7]\n";
  }else{
    print $c[5]."[!] $OTHERS[5]: perl ./",basename($0)," $TT[8] ./",basename($0)," $TT[9]\n";
  }
  logoff();
}

## EXIT 
sub logoff { deleteLists(); exit(); }

## BANNER
sub banner { require "$Bin/inc/theme/banner.pl"; }

## BAD ARGUMENTS
sub badArgs { banner(); advise(); }

1;
