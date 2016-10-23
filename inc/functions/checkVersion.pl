#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
use File::Path;
## Copy@right Alisam Technology see License.txt

## CHECK VERSION AND UPDATE
our ($scriptUrl, $script_bac, $script, $logUrl, $scriptv, $scriptPass, $scriptInstall, $scriptComplInstall, $scriptCompletion, $scriptbash, $readme,
     $uplog, $fulldate, @scriptPass, @ErrT, @DT, @c, @OTHERS, @AUTH, @ZT);
print $c[4]."[!] $OTHERS[20]\n";
my ($same, $response)=compareme();
if ($same) {   
  print $c[3]."$DT[6]\n";
}else{
  if (-e $scriptPass) {
    print $c[10]."[!] $ZT[0] ";
    chmod +x $scriptPass;
    open my $dle, '<', $scriptPass or nochmod($scriptPass, "");
    chomp(@scriptPass = <$dle>);
    close $dle;
    cc();
  }
    
  my ($r, $ht, $stats, $serverh)=getHtml($scriptUrl, "");
  if (!$r->is_success) { dd(); exit(); }
    
  print $c[10]."[!] $ZT[1] ";
  open (LE, '>', $script) or nochmod($script, "exit");
  print LE $r->content; close(LE);
  cc();
    
  print $c[10];
  system("git clone https://github.com/AlisamTechnology/ATSCAN.git $Bin/atscan_update");
  if (!-d "$Bin/atscan_update") { dd(); exit(); }
    
  print $c[10]."[!] $ZT[2] ";
  system "sudo cp -r $Bin/atscan_update/inc $Bin";
  if (!-d "$Bin/inc") { bb(); exit(); }
  else{ cc(); }
    
  my @f=("README.md", "License.txt");
  for my $f(@f) {
    print $c[10]."[!] $ZT[5] $f to $readme/... ";
    system "sudo cp -r $Bin/atscan_update/$f /usr/share/doc/atscan/";
    if (!-e "/usr/share/doc/atscan/$f") { bb(); }
    else{ cc(); }
  }
    
  print $c[10]."[!] $ZT[4] ";
  open (FILE, '>>', $scriptv) or nochmod($scriptv, "");
  print FILE "\n"; close(FILE);
  cc();    
    
  if (-e $scriptbash) {
    if (-d $scriptCompletion) {
      my $scbs="$scriptCompletion/atscan";        
      unlink $scbs if -e $scbs;
      print $c[10]."[!] $ZT[5] $scriptComplInstall to $scriptCompletion/... ";
      system "sudo cp $scriptComplInstall $scriptCompletion/";
      if (!-e "$scriptCompletion/atscan") { bb(); }
      else{ cc(); }
    }
  }
    
  print $c[10]."[!] $ZT[9] ";
  open (MN, '>', $uplog) or nochmod($uplog, "");
  print MN "$fulldate"; close(FE);
  sleep(1);
  cc();
    
  if (@scriptPass) {
    for my $spss(@scriptPass) {
       print $c[10]."[!] $ZT[6] ";
      open (FE, '>>', $scriptPass) or nochmod($scriptPass, "");
      print FE "$spss"; close(FE);
      cc();
    }
  }

  print $c[10]."[!] $ZT[7] ";
  system "rm -rf $Bin/atscan_update";
  if (!-d "$Bin/atscan_update") { cc(); }
  else{ bb(); }
    
  my @unlinks=($scriptComplInstall, $scriptInstall, $Bin."/README.md", $Bin."/License.txt", $script_bac);
  for my $unlink(@unlinks) {
    print $c[10]."[!] $ZT[8] $unlink... ";
    unlink $unlink if -e $unlink;
    if (!-e $unlink) { cc(); }      
  }
  sleep(1);
  print $c[3]."[!] $DT[7]\n";
  print "$c[10]\n".$response->content.""; 
  if (substr($0, -3) ne '.pl') {
    my $zs=$script.".pl";
    unlink $zs if -e $zs or nochmod($zs, "");
  }
}

1;
