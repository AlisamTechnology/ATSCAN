#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

our (@OTHERS, @c, @TT);

## ADVISE
sub advise {
  if (-e "/usr/bin/atscan") {
    print $c[11]."[!] $OTHERS[5]:$c[5] atscan$c[11] [$c[5]options$c[11]] or $c[5]atscan$c[11] [$c[5]--help$c[11]|$c[5]-h$c[11]|$c[5]-?$c[11]] or $c[5]atscan$c[11] [$c[5]--interactive$c[11]]\n";
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
