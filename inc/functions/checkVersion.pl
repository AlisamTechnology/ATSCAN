#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
use File::Path;
## ALISAM TECHNOLOGY 2015
######################################################################################################################################################################################################
######################################################################################################################################################################################################
## CHECK VERSION AND UPDATE
  our ($scriptUrl, $script_bac, $script, $logUrl, $scriptv, @ErrT, @DT, @c);
  desclaimer();
  print $c[4]."[!] $DT[31]\n";
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
      unlink glob "'$Bin/*'";
      rmtree("$Bin/inc/");
      if (-e $script) { print $c[4]." [!] $ErrT[19] $script\n"; logoff(); }
      print $c[3]."\n";
      system("git clone https://github.com/AlisamTechnology/ATSCAN.git $Bin/ATSCAN1");     
      use File::Copy::Recursive qw(fcopy rcopy dircopy fmove rmove dirmove);
      dircopy("$Bin/ATSCAN1", $Bin);
      open (FILE, '>>', $scriptv); print FILE "\n";
      rmtree("$Bin/ATSCAN1");
      system("chmod +x $script | perl $script || atscan");
      mtak(); ptak();
      print $c[3]."[!] $DT[7]$c[10]\n";
      print "\n".$response->content."";  
    }
    unlink $script_bac if -e $script_bac;
    
  }else{ print $c[2]."[!] $DT[8]!\n"; }
  
######################################################################################################################################################################################################
######################################################################################################################################################################################################
1;
######################################################################################################################################################################################################
######################################################################################################################################################################################################
