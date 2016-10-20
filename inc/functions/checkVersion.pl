#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
use File::Path;
use File::Copy::Recursive qw(fcopy rcopy dircopy fmove rmove dirmove);
## ALISAM TECHNOLOGY 2015
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## CHECK VERSION AND UPDATE
our ($scriptUrl, $script_bac, $script, $logUrl, $scriptv, $scriptPass, $scriptInstall, $scriptComplInstall, $scriptCompletion, $scriptbash, $readme, @scriptPass, @ErrT, @DT, @c, @OTHERS, @AUTH);
desclaimer();
print $c[4]."[!] $OTHERS[20] \n[!] $DT[31]\n";
testConnection();
my ($response, $html, $status, $serverheader)=getHtml($logUrl, "");
if ($response->is_success) {
  unlink $script_bac if -e $script_bac;
  printFile($script_bac, $response->content);    
  use File::Compare;      
  if (compare($script_bac, $scriptv) == 0) {
    print $c[3]."$DT[6]\n"; }
  else{
    if (-e $scriptPass) {
      open my $dle, '<', $scriptPass;
      chomp(@scriptPass = <$dle>);
      close $dle;
    }
    my ($r, $ht, $stats, $serverh)=getHtml($scriptUrl, "");
    open (LE, '>', $script) or die "Couldn't open: $!"; print LE $r->content; close(LE);
    print $c[3]."\n";
    system("git clone https://github.com/AlisamTechnology/ATSCAN.git $Bin/atscan_update");
    
    print $c[10]."[!] Placing components...!\n";
    dirmove("$Bin/atscan_update/inc/.", "$Bin/inc/");
    
    print $c[10]."[!] Placing README.md to $readme/ ...\n";
    if (!-e "/usr/share/doc/atscan/README.md") {    
      fmove("$Bin/atscan_update/README.md", "/usr/share/doc/atscan/");
    }
    print $c[10]."[!] Checking others components ...\n";
    open (FILE, '>>', $scriptv); print FILE "\n"; close(FILE);
    if (-e $scriptbash) {
      if (-d $scriptCompletion) {
        my $scbs="$scriptCompletion/atscan";
        if (!-e $scbs) { fmove($scriptComplInstall, "$scriptCompletion/"); }
      }
    }            
    if (@scriptPass) { for my $spss(@scriptPass) { open (FE, '>>', $scriptPass); print FE "$spss"; close(FE); } }
    
    print $c[10]."[!] Deleting install files...\n";
    system "rm -rf $Bin/atscan_update"; 
    unlink $scriptComplInstall if -e $scriptComplInstall;  
    unlink $scriptInstall if -e $scriptInstall;
    unlink $script_bac if -e $script_bac; 
    unlink $Bin."/version.log" if -e $Bin."/version.log";
    unlink $Bin."/README.md" if -e $Bin."/README.md";

    if (-e $scriptv) {
      print $c[3]."[!] $DT[7]$c[10]\n";
      print "\n".$response->content.""; 
      if (substr($0, -3) ne '.pl') { my $zs=$script.".pl"; unlink $zs if -e $zs; }
    }else{
      print $c[2]."[!] Uppss.. something went wrong!\n";
    }
  }
}else{ 
  print $c[2]."[!] $DT[8]!\n";
}
exit();
######################################################################################################################################################################################################
######################################################################################################################################################################################################
1;
######################################################################################################################################################################################################
######################################################################################################################################################################################################
