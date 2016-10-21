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
testConnection();
print $c[4]."[!] $OTHERS[20]\n";
my ($response, $html, $status, $serverheader)=getHtml($logUrl, "");
if ($response->is_success) {
  unlink $script_bac if -e $script_bac;
  printFile($script_bac, $response->content);    
  use File::Compare;      
  if (compare($script_bac, $scriptv) == 0) {
    print $c[3]."$DT[6]\n";
    unlink $script_bac; }
  else{
    if (-e $scriptPass) {
      print $c[10]."[!] Copying user components... ";
      chmod +x $scriptPass;
      open my $dle, '<', $scriptPass or nochmod($scriptPass, "");
      chomp(@scriptPass = <$dle>);
      close $dle;
      cc();
    }
    
    my ($r, $ht, $stats, $serverh)=getHtml($scriptUrl, "");
    if (!$r->is_success) { dd(); exit(); }
    
    print $c[10]."[!] Placing main script... ";
    open (LE, '>', $script) or nochmod($script, "exit");
    print LE $r->content; close(LE);
    cc();
    
    print $c[10];
    system("git clone https://github.com/AlisamTechnology/ATSCAN.git $Bin/atscan_update");
    if (!-d "$Bin/atscan_update") { dd(); exit(); }
    
    print $c[10]."[!] Placing components... ";
    dirmove("$Bin/atscan_update/inc/.", "$Bin/inc/");
    if (!-d "$Bin/inc") { bb(); exit(); }
    else{ cc(); }
    
    print $c[10]."[!] Placing README.md to $readme/ ... ";
    fmove("$Bin/atscan_update/README.md", "/usr/share/doc/atscan/");
    if (!-e "/usr/share/doc/atscan/README.md") { bb(); }
    else{ cc(); }

    print $c[10]."[!] Checking others components ... ";
    open (FILE, '>>', $scriptv) or nochmod($scriptv, "");
    print FILE "\n"; close(FILE);
    cc();    
    
    if (-e $scriptbash) {
      if (-d $scriptCompletion) {
        my $scbs="$scriptCompletion/atscan";        
        unlink $scbs if -e $scbs;
        print $c[10]."[!] Moving $scriptComplInstall to $scriptCompletion/... ";
        fmove($scriptComplInstall, "$scriptCompletion/");
        if (!-e "$scriptCompletion/atscan") { bb(); }
        else{ cc(); }
      }
    }      
    if (@scriptPass) {
      for my $spss(@scriptPass) {
        print $c[10]."[!] Restauring user files... ";
        open (FE, '>>', $scriptPass) or nochmod($scriptPass, "");
        print FE "$spss"; close(FE);
        cc();
      }
    }

    print $c[10]."[!] Deleting install files... ";
    system "rm -rf $Bin/atscan_update";
    if (!-d "$Bin/atscan_update") { cc(); }
    else{ bb(); }
    
    my @unlinks=($scriptComplInstall, $scriptInstall, $script_bac, $Bin."/version.log", $Bin."/README.md");
    for my $unlink(@unlinks) {
      print $c[10]."[!] Deleting $unlink... ";
      unlink $unlink if -e $unlink;
      if (!-e $unlink) { cc(); }      
    }

    print $c[3]."[!] $DT[7]\n";
    print "$c[10]\n".$response->content.""; 
    if (substr($0, -3) ne '.pl') {
      my $zs=$script.".pl";
      unlink $zs if -e $zs or nochmod($zs, "");
    }
  }
}else{ 
  dd();
}
exit();
######################################################################################################################################################################################################
######################################################################################################################################################################################################
1;
######################################################################################################################################################################################################
######################################################################################################################################################################################################
