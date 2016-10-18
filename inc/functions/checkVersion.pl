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
  our ($scriptUrl, $script_bac, $script, $logUrl, $scriptv, $scriptPass, $scriptInstall, $scriptComplInstall, $scriptCompletion, $scriptbash, @scriptPass, @ErrT, @DT, @c, @OTHERS);
  desclaimer();
  print $c[4]."[!] $OTHERS[20] \n[!] $DT[31]\n";
  testConnection();
  if (!-e $scriptv) { print $c[2]."[!] No version.log found! in $Bin/!\n    Dowmload and reinstall tool manually!\n"; logoff(); }
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
      system "rm -rf $Bin/";
      if (-e $script) { print $c[4]." [!] $ErrT[19] $script\n"; logoff(); }
      print $c[3]."\n";
      system("git clone https://github.com/AlisamTechnology/ATSCAN.git $Bin/atscan_update");
    exit();
      dircopy("$Bin/atscan_update", $Bin);
      open (FILE, '>>', $scriptv); print FILE "\n"; close(FILE);
      if (-e $scriptbash) {
        if (-d $scriptCompletion) {
          my $scbs="$scriptCompletion/atscan";
          if (!-e $scbs) { fmove($scriptComplInstall, "$scriptCompletion/"); }
        }
      } 
      unlink $scriptComplInstall if -e $scriptComplInstall;  
      unlink $scriptInstall if -e $scriptInstall; 
      if (@scriptPass) { for my $spss(@scriptPass) { open (FE, '>>', $scriptPass); print FE "$spss"; close(FE); } }     
      system "rm -rf $Bin/atscan_update";     
      system(". ~/.bashrc | chmod +x $script | perl $script --updtd || atscan --updtd");
      mtak(); ptak();
      print $c[3]."[!] $DT[7]$c[10]\n";
      print "\n".$response->content.""; 
    }
    unlink $script_bac if -e $script_bac; 
  }else{ print $c[2]."[!] $DT[8]!\n"; }
  exit();
######################################################################################################################################################################################################
######################################################################################################################################################################################################
1;
######################################################################################################################################################################################################
######################################################################################################################################################################################################
