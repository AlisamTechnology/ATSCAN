package Uninstall;

use strict;
use warnings;
use FindBin '$Bin';
use Exporter;
use Exploits;
use Subs;
use Print;

## Copy@right Alisam Technology see License.txt

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(uninstall);

## DELETE / UNINSTALL TOOL

my $scriptbash        = Subs::scriptbash();
my $scriptCompletion  = Subs::scriptCompletion();
my $readme            = Subs::readme();
my $script            = Subs::script();
my @c                 = Print::colors();
my @OTHERS            = Exploits::OTHERS();
my @DT                = Exploits::DT();
my @ZT                = Exploits::ZT();
my @TT                = Exploits::TT();

######################################################################################################################
## UNINSTALL
sub uninstall {
  print $c[2]."$OTHERS[8]\n";
  print $c[4]."[i] $ZT[31]\n";
  print $c[10]."[!] $ZT[32] ";
  my $resp=<STDIN>;
  chomp ($resp);
  if ($resp=~/(Y|y)/) {
    my @uninstall=($scriptbash, $script, "$scriptCompletion/atscan", "/usr/share/applications/atscan.desktop");
    for my $mm(@uninstall) {
      print $c[10]."[i] $ZT[8] $mm... ";
      unlink $mm if -e $mm;
      if (!-e $mm) { Print::cc(); }else{ Print::bb(); }
    }
    
	my @deleteIcons=( "/usr/share/icons/hicolor/16x16/apps/atscan-menu.png", 
	                  "/usr/share/icons/hicolor/22x22/apps/atscan-menu.png", 
					  "/usr/share/icons/hicolor/24x24/apps/atscan-menu.png", 
					  "/usr/share/icons/hicolor/48x48/apps/atscan-menu.png", 
					  "/usr/share/icons/hicolor/256x256/apps/atscan-menu.png"
					 );
    for my $ico(@deleteIcons) {
      print $c[10]."[i] $ZT[8] $ico... ";
      unlink $ico if -e $ico;
      if (!-e $ico) { Print::cc(); }else{ Print::bb(); }
    }
	
    print $c[10]."[i] $ZT[8] $Bin/inc... ";
    system "rm -rf $Bin/inc" if -d $Bin."/inc";
    if (!-d $Bin."/inc") { Print::cc(); }else{ Print::bb(); }
 
    print $c[10]."[i] $ZT[8] $readme... ";
    system "rm -rf $readme" if -d $readme;
    if (!-d $readme) { Print::cc(); }else{ Print::bb(); }
    my $emty = is_folder_empty($Bin);
    if ($emty) {
      system "rm -rf $Bin";
    }
    sleep(1);
    print $c[3]."$OTHERS[9]\n";
  }else{
    print $c[4]."[i] $TT[13]\n";
  }
}

#########################################################################################################################
## CHECK EMPTY FORDERS
sub is_folder_empty {
  my $dirname = $_[0];
  opendir(my $dh, $dirname);
  return scalar(grep { $_ ne "." && $_ ne ".." } readdir($dh)) == 0;
}

######################################################################################################################

1;
