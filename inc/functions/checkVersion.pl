#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
use File::Path;
## Copy@right Alisam Technology see License.txt

## CHECK VERSION AND UPDATE
our ($scriptUrl, $script_bac, $script, $logUrl, $scriptv, $userSetting, $scriptInstall, $scriptComplInstall, $scriptCompletion,
     $scriptbash, $readme, $uplog, $fulldate, $interactive, $repair, @userSetting, @ErrT, @DT, @c, @OTHERS, @AUTH, @ZT);

my $er="[!] Error! Cannot";
#############################################
print $c[4]."[i] $OTHERS[20]\n";
my ($same, $response)=compareme();
if ($same eq "yes") {   
  print $c[3]."$DT[6]\n";
}else{
  if (defined $repair) {
    print $c[3]."[i] Repairing tool..!\n";
  }else{
    print $c[3]."[i] An update is aviable!\n";
  }
  if (-e $userSetting) {
    print $c[10]."[i] $ZT[0]...\n";
    open my $dle, '<', $userSetting or nochmod($userSetting, "");
    chomp(@userSetting = <$dle>);
    close $dle;
  }
    
  my ($r, $ht, $stats, $serverh)=getHtml($scriptUrl, "");
  if (!$r->is_success) { print "\n"; dd(); exit(); }
   
  #############################################  
  print $c[10]."[i] $ZT[1]...\n";
  open (LE, '>', $script) or nochmod($script, "exit");
  print LE $r->decoded_content; close(LE);
  
  #############################################
  print $c[10];
  system("git clone https://github.com/AlisamTechnology/ATSCAN.git $Bin/atscan_update");
  if (!-d "$Bin/atscan_update") { print "\n"; dd(); exit(); }
  print $c[10]."[i] $ZT[2]..\n";
  system "sudo cp -r $Bin/atscan_update/inc $Bin";
  if (!-d "$Bin/inc") { bb(); exit(); }
  sleep(1);
  
  #############################################
  if (-d "/usr/share/doc/atscan") {
    my @f=("README.md", "License.txt");
    print $c[10]."[i] $ZT[5] License files...\n";
    for my $f(@f) {
      system "sudo cp -r $Bin/atscan_update/$f /usr/share/doc/atscan/";
      if (!-e "/usr/share/doc/atscan/$f") {
        print $c[3]."$er write to /usr/share/doc/atscan/$f!\n";
      }
    }
  }
  sleep(1);
  
  ##############################################
  print $c[10]."[i] $ZT[4]...\n";
  open (FILE, '>>', $scriptv) or nochmod($scriptv, "");
  print FILE "\n"; close(FILE);
  sleep(1);
  
  ################################################  
  if (-e $scriptbash) {
    if (-d $scriptCompletion) {
      my $scbs="$scriptCompletion/atscan";        
      unlink $scbs if -e $scbs;
      print $c[10]."[i] $ZT[5] bash Completion... \n";
      system "sudo cp $scriptComplInstall $scriptCompletion/";
      if (!-e "$scriptCompletion/atscan") {
        print $c[3]."$er write to $scriptCompletion!\n";
      }
      sleep(1);

      #############################################
      print $c[10]."[i] Creating desktop entries....\n";
      
	  system "sudo cp $Bin/atscan_update/inc/conf/desktop/kali-atscan.desktop /usr/share/applications/";
	  system "sudo cp $Bin/atscan_update/inc/conf/desktop/kali-atscan.desktop /usr/share/kali-menu/applications/";
	  unlink "/usr/share/applications/atscan.desktop" if -e "/usr/share/applications/atscan.desktop";
      
      if (-d "/usr/share/icons/hicolor/16x16/apps/") {        
	    system "sudo cp $Bin/atscan_update/inc/conf/desktop/16x16/kali-atscan-menu.png /usr/share/icons/hicolor/16x16/apps/";
	    if (!-e "/usr/share/icons/hicolor/16x16/apps/kali-atscan-menu.png") { print $c[3]."$er write in /usr/share/icons/hicolor/16x16/apps/!\n"; }
	    unlink "/usr/share/icons/hicolor/16x16/apps/atscan-menu.png" if -e "/usr/share/icons/hicolor/16x16/apps/atscan-menu.png";

	    system "sudo cp $Bin/atscan_update/inc/conf/desktop/22x22/kali-atscan-menu.png /usr/share/icons/hicolor/22x22/apps/";
	    if (!-e "/usr/share/icons/hicolor/22x22/apps/kali-atscan-menu.png") { print $c[3]."$er write in /usr/share/icons/hicolor/22x22/apps/!\n"; }
	    unlink "/usr/share/icons/hicolor/22x22/apps/atscan-menu.png" if -e "/usr/share/icons/hicolor/22x22/apps/atscan-menu.png";

	    system "sudo cp $Bin/atscan_update/inc/conf/desktop/24x24/kali-atscan-menu.png /usr/share/icons/hicolor/24x24/apps/";
	    if (!-e "/usr/share/icons/hicolor/24x24/apps/kali-atscan-menu.png") { print $c[3]."$er write in /usr/share/icons/hicolor/24x24/apps/!\n"; }
	    unlink "/usr/share/icons/hicolor/24x24/apps/atscan-menu.png" if -e "/usr/share/icons/hicolor/24x24/apps/atscan-menu.png";

	    system "sudo cp $Bin/atscan_update/inc/conf/desktop/48x48/kali-atscan-menu.png /usr/share/icons/hicolor/48x48/apps/";
	    if (!-e "/usr/share/icons/hicolor/48x48/apps/kali-atscan-menu.png") { print $c[3]."$er write in /usr/share/icons/hicolor/48x48/apps/!\n"; }
	    unlink "/usr/share/icons/hicolor/48x48/apps/atscan-menu.png" if -e "/usr/share/icons/hicolor/48x48/apps/atscan-menu.png";

	    system "sudo cp $Bin/atscan_update/inc/conf/desktop/256x256/kali-atscan-menu.png /usr/share/icons/hicolor/256x256/apps/";
	    if (!-e "/usr/share/icons/hicolor/256x256/apps/kali-atscan-menu.png") { print $c[3]."$er write in /usr/share/icons/hicolor/256x256/apps/!\n"; }
	    unlink "/usr/share/icons/hicolor/256x256/apps/atscan-menu.png" if -e "/usr/share/icons/hicolor/256x256/apps/atscan-menu.png";

        my @deskFiles=("/usr/share/icons/hicolor/16x16/apps/kali-atscan-menu.png", "/usr/share/icons/hicolor/22x22/apps/kali-atscan-menu.png", "/usr/share/icons/hicolor/24x24/apps/kali-atscan-menu.png",
                       "/usr/share/icons/hicolor/48x48/apps/kali-atscan-menu.png", "/usr/share/icons/hicolor/256x256/apps/kali-atscan-menu.png");
      }
    }
  }
  sleep(1);
  
  ##############################################
  print $c[10]."[i] $ZT[9]...\n";
  open (MN, '>', $uplog) or nochmod($uplog, "");
  print MN "$fulldate"; close(MN);
  sleep(1);
  
  ##############################################
  unlink $userSetting if -e $userSetting;   
  if (@userSetting) {
    print $c[10]."[i] $ZT[6]... \n";
    open (FE, '>>', $userSetting) or nochmod($userSetting, "");
    for my $spss(@userSetting) {
      print FE "$spss\n";
    }
    close(FE);
  }  
  sleep(1);

  ###############################################
  print $c[10]."[i] Removing Desktop entries...\n";
  system "rm -rf $Bin/inc/conf/desktop";
  if (-d "$Bin/inc/conf/desktop") {
    print $c[3]."$er remove $Bin/inc/conf/desktop!\n";
  }
  sleep(1);

  ###############################################
  print $c[10]."[i] $ZT[7].. \n";
  system "rm -rf $Bin/atscan_update";
  if (-d "$Bin/atscan_update") {
    print $c[3]."$er remove $Bin/atscan_update!\n";
  }
  sleep(1);
  
  ###############################################
  my @unlinks=($scriptComplInstall, $scriptInstall, $Bin."/README.md", $Bin."/License.txt", $script_bac);
  for my $unlink(@unlinks) {
    unlink $unlink if -e $unlink;
    if (-e $unlink) {
      print $c[3]."$er remove $unlink!\n";
    }
  }
  sleep(1);
  
  #################################################
  print "$c[10]\n".$response->decoded_content.""; 
  if (substr($0, -3) ne '.pl') {
    my $zs=$script.".pl";
    unlink $zs if -e $zs or nochmod($zs, "");
  }
  print $c[3]."[i] $DT[7]...\n";
}

1;
