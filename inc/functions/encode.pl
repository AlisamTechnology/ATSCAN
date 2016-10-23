#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

our (@c, @OTHERS);

## MD5 ENCODE BASE64 DECODE BASE 64
sub scanCode {
  my ($title, $string, $scan1, $scan2, $scan3)=@_;
  my @aTscans=();
  scanTitleBgn(); print $c[11]."$title"; scanTitleEnd();
  points(); dpoints(); points();
  print $c[1]."    $OTHERS[4]  $c[10]$string\n";
  titleSCAN();
  if ($scan1) { print "$c[3]".Digest::MD5->md5_hex($string)."\n"; }
  if ($scan2) { print "$c[3]".encode_base64($string)."\n"; }
  if ($scan3) { print "$c[3]".decode_base64($string)."\n"; }
  points(); dpoints(); points();
}

1;
