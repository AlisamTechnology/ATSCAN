#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## SCAN HTML CMS
sub checkCms { 
  my $html=$_[0];
  our @CMS;
  for my $CMS(@CMS) { if ( $html=~/$CMS/ ) { my $CMS1=$CMS; checkCmsType($CMS1); last; } }
}

## CHECK CMS
sub checkCmsType {
  my $CMS1=$_[0];
  our (@V_WP, @V_JOOM, @V_TP, @V_SMF, @V_PhpBB, @V_VB, @V_MyBB, @V_CF, @V_PN, @V_DRP, @V_AT, @V_PHPN, @V_MD, @V_ACM, @V_SS, @V_MX, @V_XO, @V_OSC, @V_PSH, @V_BB2, @V_MG, @V_ZC, @V_CC5, @V_OCR, @cms, @c);
  if (grep( /^$CMS1$/, @V_WP)) { print $c[1]."    $cms[0]     $c[4]$cms[1]\n"; } 
  if (grep( /^$CMS1$/, @V_JOOM)) { print $c[1]."    $cms[0]     $c[4]$cms[2]\n"; }
  if (grep( /^$CMS1$/, @V_TP)) { print $c[1]."    $cms[0]     $c[4]$cms[3]\n"; }
  if (grep( /^$CMS1$/, @V_SMF)) { print $c[1]."    $cms[0]     $c[4]$cms[4]\n"; }
  if (grep( /^$CMS1$/, @V_PhpBB)) { print $c[1]."    $cms[0]     $c[4]$cms[5]\n"; }
  if (grep( /^$CMS1$/, @V_VB)) { print $c[1]."    $cms[0]     $c[4]$cms[6]\n"; }
  if (grep( /^$CMS1$/, @V_MyBB)) { print $c[1]."    $cms[0]     $c[4]$cms[7]\n"; }
  if (grep( /^$CMS1$/, @V_CF)) { print $c[1]."    $cms[0]     $c[4]$cms[8]\n"; }
  if (grep( /^$CMS1$/, @V_PN)) { print $c[1]."    $cms[0]     $c[4]$cms[9]\n"; }
  if (grep( /^$CMS1$/, @V_DRP)) { print $c[1]."    $cms[0]     $c[4]$cms[10]\n"; } 
  if (grep( /^$CMS1$/, @V_AT)) { print $c[1]."    $cms[0]     $c[4]$cms[11]\n"; }
  if (grep( /^$CMS1$/, @V_PHPN)) { print $c[1]."    $cms[0]     $c[4]$cms[12]\n"; }
  if (grep( /^$CMS1$/, @V_MD)) { print $c[1]."    $cms[0]     $c[4]$cms[13]\n"; }
  if (grep( /^$CMS1$/, @V_ACM)) { print $c[1]."    $cms[0]     $c[4]$cms[14]\n"; }
  if (grep( /^$CMS1$/, @V_SS)) { print $c[1]."    $cms[0]     $c[4]$cms[15]\n"; }
  if (grep( /^$CMS1$/, @V_MX)) { print $c[1]."    $cms[0]     $c[4]$cms[16]\n"; }
  if (grep( /^$CMS1$/, @V_XO)) { print $c[1]."    $cms[0]     $c[4]$cms[17]\n"; }
  if (grep( /^$CMS1$/, @V_OSC)) { print $c[1]."    $cms[0]     $c[4]$cms[18]\n"; }
  if (grep( /^$CMS1$/, @V_PSH)) { print $c[1]."    $cms[0]     $c[4]$cms[19]\n"; }
  if (grep( /^$CMS1$/, @V_BB2)) { print $c[1]."    $cms[0]     $c[4]$cms[20]\n"; }
  if (grep( /^$CMS1$/, @V_MG)) { print $c[1]."    $cms[0]     $c[4]$cms[21]\n"; }
  if (grep( /^$CMS1$/, @V_ZC)) { print $c[1]."    $cms[0]     $c[4]$cms[22]\n"; }
  if (grep( /^$CMS1$/, @V_CC5)) { print $c[1]."    $cms[0]     $c[4]$cms[23]\n"; }
  if (grep( /^$CMS1$/, @V_OCR)) { print $c[1]."    $cms[0]     $c[4]$cms[24]\n"; }
}

1;
