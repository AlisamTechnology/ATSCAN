#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

our (@AUTH, @c, $scriptPass, $script);
my $ps;
sub question {
  print $c[10]."[!] $AUTH[5]:$c[10] ";
  $ps=<STDIN>;
  chomp ($ps);
  return $ps;
}

if (-e $scriptPass) {
  print $c[2]."[!] $AUTH[2]$c[10] ";
  my $askMe=<STDIN>;
  chomp ($askMe);
  if($askMe=~/(y|Y)/) {
    chomp $askMe; unlink $scriptPass; sleep(2); print $c[3]."[!] $AUTH[3]\n";
  }else{
    print $c[4]."[!] $AUTH[7]\n";
    logoff();
  }
}else{
  print $c[4]."[!] $AUTH[4]\n";
  $ps=question();
  if (length($ps)<3) {
    print $c[2]."[!] $AUTH[8]\n";
    $ps=question();
  }
    
  $ps=Digest::MD5->md5_hex($ps);
  printFile($scriptPass, $ps);   
  use Time::HiRes qw(usleep);
  local $| = 1;
  my @nums = -3 .. -1;
  print $c[3]."[!] $AUTH[6] $AUTH[9] ";
  foreach my $c (@nums) {
    print "$c";
    usleep(1000000);
    print ("\b" x length($c));
  }
  print "\n";
  system("perl $script || atscan");
}
logoff();

1;
