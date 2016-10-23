#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## DELETE / UNINSTALL TOOL
our ($uninstall, $scriptbash, $script, $scriptCompletion, $readme, @TT, @c, @OTHERS, @DT, @ZT);
if (defined $uninstall) {
  print $c[2]."$OTHERS[8]";
  print $c[10];
  my $resp=<STDIN>;
  chomp ($resp);
  if ($resp=~/(Y|y)/) {
    my @uninstall=($scriptbash, "$scriptCompletion/atscan", $script);
    for my $mm(@uninstall) {
      print $c[10]."[!] $ZT[8] $mm... ";
      unlink $mm if -e $mm;
      if (!-e $mm) { cc(); }else{ bb(); }
    }
    
    print $c[10]."[!] $ZT[8] $Bin/inc... ";
    system "rm -rf $Bin/inc" if -e "$Bin/inc";
    if (!-d "$Bin/inc") { cc(); }else{ bb(); }
    
    print $c[10]."[!] $ZT[8] $readme... ";
    system "rm -rf $readme if -d $readme";
    if (!-d $readme) { cc(); }else{ bb(); }
    
    if (is_folder_empty($Bin)) {
      system "rm -rf $Bin";
    }
    sleep(1);
    print $c[3]."$OTHERS[9]\n";
  }else{
    print $c[4]."[!] $TT[13]\n";
  }
}
exit();

1;
