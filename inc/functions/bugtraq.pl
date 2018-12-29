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
my $e = strftime "%Y.%m.%d.", localtime;
my $copyPath="$Bin/inc/conf/user/temp.txt";
my $ser="=" x 39;
###############################################################################
###############################################################################
## BUGTRAQ ARRAYS
if (defined $bugtraq) { @bugs=buildArraysLists($bugtraq); }
if (defined $output && !-d $output) { print $c[4]."[!] \"$output\" must be a directory!\n"; logoff(); }
unlink $copyPath if -e $copyPath;
###############################################################################
###############################################################################
## SEPARATORS
sub sep { print $c[1]." ===========================================================================\n"; }

###############################################################################
###############################################################################
## GET BUGS
sub bugs {
  for my $btq(@bugs) {
    for(my $npages=1;$npages<=3;$npages+=1) {
      my $u="$server/search/wlb/DESC/AND/$e 1999.1.1/$npages/30/$btq/";
      $u=~s/\s//g;
      my $bugSearch=$ua->get($u);
      $bugSearch->as_string;
      my $Res=$bugSearch->content;
      $Res=escape($Res);
      if ($bugSearch->is_success) {
        bugTitle($Res);
        bugDate($Res);
        bugWarning($Res);
      }else{
        print "[!]$c[4] Cannot coonect to server. try again in a few minutes!\n";
        logoff();
      }
    }
  }
}

###############################################################################
###############################################################################
## HELP
sub helpme {
  sep();
  print $c[11]." [+] OPTIONS:\n";
  print $c[11]."   ID   $c[10] View and save issues. Ex: ID1 or ID2 ID3..\n";
  print $c[11]."   list $c[10] List issues\n";
  print $c[11]."   exit $c[10] Exit\n";
  sep();
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
    if ($bugref=~m/WLB\-(.*)/g) { push @bugId, $1; }
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
sub printBugs {
  my $m=scalar(grep { defined $_} @refer);
  my $x=0;
  for my $refer(@refer) {
    $x++;
    print "$c[1] ";
    timer();
    print "[$x/$m]\n";
    my @rer=split("=>", $refer);
    print $c[1]." ISSUE  $c[6]$rer[0]\n";
    print $c[1]." ID     $c[10]$rer[1]\n";
    print $c[1]." RISK   $c[10]$rer[2]\n";
    print $c[1]." DATE   $c[10]$rer[3]\n";
    sep();
    sleep 1;
  }
}

###############################################################################
###############################################################################
## SHOW BUG 
sub viewBug {
  my $refer=$_[0];
  my @rer2=split("=>", $refer);
  my $copy;
  if (defined $output) {
    my $bp=$rer2[0];
    $bp=~s/(\s|\/)/-/g;
    $bp=~s/(\(|\)|\[|\])//g;
    $copy="$output/$bp.txt";
    printFile($copy, "### $rer2[0]\n");
  }
  sep();
  print $c[1]." ISSUE  $c[6]$rer2[0]\n";
  print $c[1]." ID     $c[10]$rer2[1]\n";
  
  print $c[1]." ---------------------------------------------------------------------------\n";  
  my @se;
  my $uw="$server/issue/WLB-$rer2[1]";  
  my $bugView=$ua->get($uw);
  $bugView->as_string;
  my $rBug=$bugView->decoded_content;
  $rBug=escape($rBug);
  $rBug=~ s/<([^>]|\n)*>//g;
  
  open (SA, '>>', $copyPath);
  binmode(SA, ":utf8");
  print SA "$rBug";
  close(SA);
  
  open (SA, $copyPath);
  my $ea=0;
  print "$c[6]\n";                          
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
  if (defined $output) { 
    print $c[1]." ---------------------------------------------------------------------------\n";
    print $c[4]." [i]$c[10] Issue saved in \"$copy\"\n";
  }
  sep();
}
###############################################################################
###############################################################################
###############################################################################
## MAIN
testConnection();
bugs();
my $m=scalar(grep { defined $_} @bugTitle);
print $c[11];
timer();
print " EXPLORING [$bugtraq] ISSUES...\n";
sleep 2;
if (scalar(grep { defined $_} @bugTitle)<1) {
  print $c[4]."[!] No results found!\n";
  logoff();
}
print $c[3]."[i] $m Results found!\n";
if (defined $limit) {
  print $c[4]."[!] Results limited to [$limit Result\/s] !\n";
}

print $c[1]."============================================================================\n" if $m>0;
sleep 2;

if ($m>0) {
  my $x=0;
  for(my $nbugs=0;$nbugs<$m;$nbugs+=1) {
    my $fcc="$bugTitle[$nbugs]=>$bugId[$nbugs]=>$bugWarning[$nbugs]=>$bugDate[$nbugs]";
    $x++;
    if (defined $limit or $limit) {
      if ($x<=$limit) { push @refer, $fcc; }
    }
    else{ push @refer, $fcc; }
  }
  printBugs();
  my $rr;
  while (!$rr or $rr!~/exit/) {
    print $c[4]." [!]$c[10] Type <your option> or \"options\" for help: ";
    $rr=<STDIN>;
    chomp ($rr);
    print "\n";
    my @r=split(" ", $rr);
    for my $r(@r) {
      if ($r!~/([0-9]|options|list|exit)/) {
        print $c[4]." [!] Cannot interpret your command!\n";
      }
      if ($r=~/options/) { helpme(); }
      if ($r=~/[0-9]/ && grep( /^$r$/, @bugId)) {
        for my $refer(@refer) {
          if ($refer=~/$r/) { viewBug($refer); }
        }
      }
      if ($r=~/list/) {
        print $c[4]." [i] Listing issues..\n\n";
        sleep 1;
        printBugs();
      }
    }
  }
  @refer=();
}
  
###############################################################################
###############################################################################
###############################################################################

1;
