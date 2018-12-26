#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

###############################################################################
###############################################################################
## BUGTRAQ
our($bugtraq, $ua, @c);
my (@bugs, @bugId, @bugTitle, @bugDate, @bugLink, @bugWarning);
###############################################################################
###############################################################################
## BUGTRAQ ARRAYS
if (defined $bugtraq) { @bugs=buildArraysLists($bugtraq); }

###############################################################################
###############################################################################
## GET BUGS
sub bugs {
  my $e = strftime "%Y.%m.%d.", localtime;
  for my $btq(@bugs) {
    for(my $npages=1;$npages<=2;$npages+=1) {
      my $u="https://cxsecurity.com/search/wlb/DESC/AND/$e.1999.1.1/$npages/10/$btq/";   
      my $bugSearch=$ua->get($u);
      $bugSearch->as_string;
      if ($bugSearch->is_success) {
        my $Res=$bugSearch->content;
        bugTitle($Res);
        bugDate($Res);
        bugWarning($Res);
      }
    }
  }
  if (scalar(grep { defined $_} @bugTitle)<1) {
    print $c[4]."[!] No results found!\n";
  }
}
###############################################################################
###############################################################################
sub bugTitle {
  my $Res=$_[0];
  while ($Res=~m/<A href=\"(.*)\" title=\"(.*)\"\s/g) {
    push @bugTitle, "$2";
    push @bugLink, "$1";
    my $bugref=$1;
    if ($bugref=~m/WLB\-(.*)/g) {
      push @bugId, $1;
    }
  }
}
sub bugDate {
  my $Res=$_[0];
  while ($Res=~m/<h6><span class=\"label\slabel\-default\">(.*)<\/span>/g) {
    push @bugDate, $1;
  }
}
sub bugWarning {
  my $Res=$_[0];
  while ($Res=~m/<span class=\"label\slabel\-(warning|danger|success)\"\>(.*)<\/span>/g) {
    push @bugWarning, $2;
  }
}

###############################################################################
###############################################################################
## TODO
testConnection();
bugs();
my $m=scalar(grep { defined $_} @bugTitle);
if ($m>0) {
  print $c[10];
  timer();
  print " EXPLORING BUGS...\n";
  sleep 2;
  print $c[3]."[i] $m Results found!\n";
  sleep 1;
}
for(my $nbugs=0;$nbugs<$m;$nbugs+=1) {
  if ($nbugs<=$m) {
    print $c[1]." ============================================================================\n ";
    timer() ;
    my $x=$nbugs+1;
    print "[$x/$m]\n";
  }
  print $c[1]." TITLE  $c[6]$bugTitle[$nbugs]\n";
  print $c[1]." DATE   $c[10]$bugDate[$nbugs]\n";
  print $c[1]." RISK   $c[10]$bugWarning[$nbugs]\n";
  print $c[1]." REFER  $c[10]$bugId[$nbugs]\n";
  sleep 1;
}
print $c[1]."=============================================================================\n";
###############################################################################
###############################################################################
my $w;
while (!$w) {
  print $c[4]."[!] To view full bug info use: get <REFER> OR exit to exit: $c[10]";
  my $r=<STDIN>;
  chomp ($r);
  if ($r=~/exit/) { $w=1; }
  if ($r=~/get\s[0-9]/) {
    print $c[1]." REFER  $c[10]$r\n";
    print $c[1]." LINK   $c[10]https://cxsecurity.com/issue/WLB-$r\n";
    print $c[1]." ============================================================================\n ";
  }
}

###############################################################################
###############################################################################

1;
