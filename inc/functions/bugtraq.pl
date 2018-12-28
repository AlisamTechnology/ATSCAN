#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

###############################################################################
###############################################################################
## BUGTRAQ
our($bugtraq, $ua, $limit, $server, $output, @c);
my (@bugs, @bugId, @bugTitle, @bugDate, @bugLink, @bugWarning, @refer);
my $ser="=" x 39;
my $copy;
###############################################################################
###############################################################################
## BUGTRAQ ARRAYS
if (defined $bugtraq) { @bugs=buildArraysLists($bugtraq); }
if (defined $output && !-d $output) { print $c[4]."[!] $output must be a directory!\n"; logoff(); }
###############################################################################
###############################################################################
## GET BUGS
sub bugs {
  my $e = strftime "%Y.%m.%d.", localtime;
  for my $btq(@bugs) {
    for(my $npages=1;$npages<=1;$npages+=1) {
      my $u="$server/search/wlb/DESC/AND/$e.1999.1.1/$npages/10/$btq/";   
      my $bugSearch=$ua->get($u);
      $bugSearch->as_string;
      my $Res=$bugSearch->content;
      $Res = escape($Res);
      if ($bugSearch->is_success) {
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
## ISSUE TITLE
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
###############################################################################
###############################################################################
## ISSUE DATE
sub bugDate {
  my $Res=$_[0];
  while ($Res=~m/<h6><span class=\"label\slabel\-default\">(.*)<\/span>/g) {
    push @bugDate, $1;
  }
}
###############################################################################
###############################################################################
## ISSUE RISK
sub bugWarning {
  my $Res=$_[0];
  while ($Res=~m/<span class=\"label\slabel\-(warning|danger|success)\"\>(.*)<\/span>/g) {
    push @bugWarning, $2;
  }
}
###############################################################################
###############################################################################
## STRING ESCAPE
sub escape {
  my $escap=$_[0];
  $escap = uri_unescape($escap);
  $escap=decode_entities($escap);
  return $escap;
}
###############################################################################
###############################################################################
## SHOW BUG 
sub viewBug {
  my $r=$_[0];
  my @se;
  unlink "$Bin/temp.txt" if -e "$Bin/temp.txt";
  my $uw="$server/issue/WLB-$r";   
  my $bugView=$ua->get($uw);
  $bugView->as_string;
  my $rBug=$bugView->decoded_content;
  $rBug=escape($rBug);
  $rBug=~ s/<([^>]|\n)*>//g;
  open (SA, '>>', "$Bin/temp.txt");
  binmode(SA, ":utf8");
  print SA "$rBug";
  close(SA);
  open (SA, "$Bin/temp.txt");
  my $ea=0;
  print "\n";                          
  while (my $se=<SA>) {
    chomp $se;
    if ($se=~/window.adsbygoogle/) { $ea++; }
    if ($se=~/adsbygoogle/ && $ea>1) { last; }
    $se=~s/\&#039;|&quot;/'/g;
    $se=~s/\&amp;/&/g;
    $se=~s/\&gt;/>/g;
    $se=~s/\&lt;/</g;
    if ($se!~/window.adsbygoogle|^\s*$/ && $ea>0) {
      print " $se\n";      
      if (defined $output) { printFile($copy, "$se\n"); }
    }                      
  }
  close(SA);
  if (defined $output) { print $c[4]."[i] Issue saved in $copy\n"); }
}
###############################################################################
###############################################################################
sub printBugs {
  my $m=scalar(grep { defined $_} @bugTitle);
  for(my $nbugs=0;$nbugs<$m;$nbugs+=1) {
    my $x=$nbugs+1;
    print $c[1]." ============================================================================\n ";
    timer() ;
    print "[$x/$m]\n";
    print $c[1]." ISSUE  $c[6]$bugTitle[$nbugs]\n";
    print $c[1]." DATE   $c[10]$bugDate[$nbugs]\n";
    print $c[1]." RISK   $c[10]$bugWarning[$nbugs]\n";
    print $c[1]." REFER  $c[10]$bugId[$nbugs]\n";
    push @refer, "$bugTitle[$nbugs]=>$bugId[$nbugs]";
    sleep 1;
    if ((defined $limit or $limit) && ($x eq $limit)) { last; }
  }
}


###############################################################################
###############################################################################
## TODO
testConnection();
bugs();
my $m=scalar(grep { defined $_} @bugTitle);
print $c[11];
timer();
print " EXPLORING [$bugtraq] ISSUES...\n";
sleep 2;
print $c[3]."[i] $m Results found!\n";
sleep 2;
if ($m>0) {
  printBugs();
  print $c[1]."$ser\n";
  ###############################################################################
  ###############################################################################
  ## VIEW ISSUE
  my $w;
  while (!$w) {
    print $c[10]."[!] [$c[4]REFER$c[10] = view ";
    print "and save ";
    print "issue] [$c[4]back$c[10] = list issues] [$c[4]exit$c[10] = exit]: $c[10]";
    my $rr=<STDIN>;
    chomp ($rr);
    my @r=split(" ", $rr);
    for my $r(@r) {
      if ($r=~/exit/) { $w=1; }
      elsif ($r=~/back/) {
        printBugs();
        print $c[1]."$ser\n";
      }
      elsif ($r=~/[0-9]/ && grep( /^$r$/, @bugId)) {
        print $c[1]."$ser\n";
        print $c[1]." REFER  $c[10]$r\n";
        for my $refer(@refer) {
          if ($refer=~/$r/) {
            $refer=~s/\=>.*//;
            print $c[1]." ISSUE  $c[10]$refer\n";
            if (defined $output) {
              my $PT=$refer;
              $PT=~s/\s/\_/;
              $copy="$output/$PT.txt";
              printFile($copy, "$ser\n### $refer\n");
            }
          }
        }
        print $c[1]." ----------------------------------------------------------------------------\n";
        print $c[6];
        viewBug($r);
        print $c[1]."$ser=\n";
      }elsif ($r) {
        print $c[4]."[!] Cannot interpret your command!\n";
      }
    }
  }
}
###############################################################################
###############################################################################

1;
