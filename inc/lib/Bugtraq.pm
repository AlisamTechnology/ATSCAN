package Bugtraq;

use strict;
use warnings;
use FindBin '$Bin';
use Print;
use Exploits;
use Getme;
use POSIX qw(strftime);
use URI::Escape;
use HTML::Entities;
use Subs;
use open ':std', ':encoding(UTF-8)';
my @ISA = qw(Exporter);
my @EXPORT_OK = qw(bugs);

## Copy@right Alisam Technology see License.txt

my @c          = Print::colors();
my @ErrT       = Exploits::ErrT();
my @ZT         = Exploits::ZT();
my @DT         = Exploits::DT();
my @DS         = Exploits::DS();
my @AUTH       = Exploits::AUTH();
my @SCAN_TITLE = Exploits::SCAN_TITLE();
my @TT         = Exploits::TT();

###############################################################################
###############################################################################
## BUGTRAQ
#if (!defined $dork) { print $c[4]."[!] Usage --bugtraq --dork <dork> --level <level>\n"; exit(); }
my (@bugId, @bugTitle, @bugDate, @bugLink, @bugWarning, @refer);
my $e = strftime "%Y.%m.%d.", localtime;
my $copyPath="$Bin/inc/user/user/temp.txt";
my $ser="=" x 39;
my %replace=("premex\">" => "", "\&#039;" => "'", "\&quot;" => "'", "\&amp;" => "&", "\&gt;" => ">", "\&lt;" => "<");
###############################################################################
###############################################################################
## SEPARATORS
sub sep { print $c[1]." ===========================================================================\n"; }
###############################################################################
###############################################################################
## GET BUGS
sub bugs {
  my ($ua, $dork, $dorks, $mlevel, $limit, $fullHeaders) = @_;
  for my $btq(@{$dorks}) {
    print $c[11];
    my $now = Subs::now();
    print "[$now] ::: EXPLORING [$btq] ISSUES :::\n";
    sleep 2;
    $btq=~s/\s/%20/g;
    for(my $npages=1;$npages<=$mlevel;$npages+=1) {
      my $u = "https://cxsecurity.com/search/wlb/DESC/AND/$e 1999.1.1/$npages/30/$btq/";
      $u=~s/\s//g;
	  my $getme = new Getme();
	  my ($redir, $re, $ht, $st, $sh, $fh) = $getme->navget($ua, $u, $fullHeaders, "", "");		  
      $re = escape($re);
      if ($st eq 200) {
        bugTitle($ht);
        bugDate($ht);
        bugWarning($ht);
      }else{
        print "[!]$c[4] Cannot coonect to server. try again in a few minutes!\n";
        exit();
      }
    }
  }
  main2($ua, $limit, $fullHeaders);
  Print::separaBlocks();
  exit;
}

###############################################################################
###############################################################################
## HELP
sub helpme {
  sep();
  print $c[11]." [+] OPTIONS:\n";
  print $c[11]."   ID   $c[10] View and save issues. Ex: ID1 or ID2,ID3,..\n";
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
  my $m=scalar @refer;
  my $x=0;
  for my $refer(@refer) {
    $x++;
    print "$c[1] ";
    my $now = Subs::now();
    print "[$now][$x/$m]\n";
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
  my ($ua, $refer, $fullHeaders) = @_;
  my @rer2=split("=>", $refer);
  print $c[1]." ID     $c[10]$rer2[1]\n";
  print $c[1]." ISSUE  $c[6]$rer2[0]\n";
  print $c[1]." ---------------------------------------------------------------------------\n";  
  my @se;
  my $uw="https://cxsecurity.com/issue/WLB-$rer2[1]";
   
  my $getme = new Getme();
  my ($redir, $re, $ht, $st, $sh, $fh) = $getme->navget($ua, $uw, $fullHeaders, "", "");		    
  if ($ht=~/(\spremex\">.*?)<\/DIV><\/P><P\sclass=\"txt\"/s) {
    my $se=$1;
    $se=~s/$_/$replace{ $_}/g for keys %replace;
    print "$c[10]$se\n";
    print $c[1]." ---------------------------------------------------------------------------\n";
    unlink $copyPath if -e $copyPath;
    print $c[4]." [!]$c[10] Output directory or Press Enter to continue: ";
    my $ro=<STDIN>;
    chomp ($ro);
    if ($ro) {
      my $bp=$rer2[0];
      $bp=~s/(\s|\/)/-/g;
      $bp=~s/(\(|\)|\[|\])//g;
      if (-d $ro) {
        my $copy="$ro/$bp.txt";
        $copy =~ s/[\$#@~!*()\[\];,:?'^ `\\]+//g;
        $copy=~s/\/\//\//;
        Print::printFile($copy,		"### $rer2[0]\n#########################################################");
        Print::printFile($copy, "$se\n\n");
        print $c[3]." [i] Issue saved in \"$copy\"\n";
        print $c[1]." ---------------------------------------------------------------------------\n";
      }else{
        print $c[4]." [!] No issue saved! Output must be a directory!\n";
      }
    }else{
      print $c[4]." [!] No output was defined\n";
    }
  }
}

###############################################################################
###############################################################################
###############################################################################
## MAIN 2
sub main2 {
  my ($ua, $limit, $fullHeaders) = @_;
  my $m=scalar @bugTitle;
  if (scalar @bugTitle <1 ) {
    print $c[4]."[!] No results found!\n";
    exit();
  }else{
    if ($limit ne 500) {
      print $c[3]."[!] Results limited to [$limit Result\/s]!\n";
    }else{
      print $c[3]."[i] $m Results found!\n";
    }
  }
  print $c[1]."============================================================================\n" if $m>0;
  sleep 2;

  if ($m > 0) {
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
    print "\n";
    while (!$rr or $rr!~/exit/) {
      print $c[4]." [!]$c[10] Type <your option> or \"options\" for help: ";
      $rr=<STDIN>;
      chomp ($rr);
	  $rr=~s/\s//g;
      print "\n";
      my @r=split(",", $rr);
      for my $r(@r) {
        if ($r!~/([0-9]|options|list|exit)/) {
          print $c[4]." [!] Cannot interpret your command!\n";
        }
        if ($r=~/options/) { helpme(); }
        if ($r=~/[0-9]/ && grep( /^$r$/, @bugId)) {
          for my $refer(@refer) {
            if ($refer=~/$r/) { viewBug($ua, $refer, $fullHeaders); }
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
}
  
###############################################################################
###############################################################################
###############################################################################

1;
