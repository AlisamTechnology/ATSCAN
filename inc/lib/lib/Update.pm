package Update;

use strict;
use warnings;
use FindBin '$Bin';
use Exporter;
use Target;
use Subs;
use Print;
use Getme;
use POSIX qw(strftime);

## Copy@right Alisam Technology see License.txt

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(update repair);

## CHECK VERSION AND UPDATE
my $scriptUrl          = Subs::scriptUrl();
my $script_bac         = Subs::script_bac();
my $script             = Subs::script();
my $logUrl             = Subs::logUrl();
my $scriptv            = Subs::scriptv();
my $scriptInstall      = Subs::scriptInstall();
my $scriptComplInstall = Subs::scriptComplInstall();
my $scriptCompletion   = Subs::scriptCompletion();
my $scriptbash         = Subs::scriptbash();
my $readme             = Subs::readme();
my $uplog              = Subs::uplog();
my $fulldate           = Subs::fulldate();
my $userSetting        = Subs::userSetting();

my @c = Print::colors();
my @ErrT = Exploits::ErrT();
my @ZT = Exploits::ZT();
my @DT = Exploits::DT();
my @DS = Exploits::DS();
my @OTHERS = Exploits::OTHERS();
my @TT = Exploits::TT();

my $er="[!] Error! Cannot";

##########################################################################################################
## REPAIR
sub repair {
  my ($ua, $fullHeaders, $repair) = @_; 
  print $c[4]."[i] Trying to repair tool...\n";
  open (LME, '>', $scriptv) or Print::nochmod($scriptv, "exit");
  print LME "REPAIR"; 
  close(LME);
  update($ua, $fullHeaders, $repair);
}

##########################################################################################################
## UPDATE
sub update {
  my ($ua, $fullHeaders, $repair) = @_; 
  my @userSetting;
  print $c[4]."[i] $OTHERS[20]\n";
  my ($same, $st, $th) = Subs::compareme($ua, $fullHeaders);
  if ($same eq "yes") {   
    print $c[3]."$DT[6]\n";
    print $c[4]."[!]$c[10] To force update use --repair argument!\n";
  }else{
    if (defined $repair) {
      print $c[3]."[i] Repairing tool..!\n";
    }else{
      print $c[3]."[i] An update is aviable!\n";
    }
    if (-e $userSetting) {
      print $c[10]."[i] $ZT[0]...\n";
      open my $dle, '<', $userSetting or Print::nochmod($userSetting, "");
      chomp(@userSetting = <$dle>);
      close $dle;
    }
	my $getit = new Getme();
    my ($redirect, $r, $ht, $stats, $serverh, $fh) = $getit->navget($ua, $scriptUrl, $fullHeaders, "", "");
    if ($stats ne 200) { print "\n"; Print::dd(); exit(); }
   
    #############################################  
    print $c[10]."[i] $ZT[1]...\n";
    open (LE, '>', $script) or Print::nochmod($script, "exit");
    print LE $ht; close(LE);
  
    #############################################
    print $c[10];
    system("git clone https://github.com/AlisamTechnology/ATSCAN.git $Bin/atscan_update");
    if (!-d "$Bin/atscan_update") { print "\n"; Print::dd(); exit(); }
    print $c[10]."[i] $ZT[2]..\n";
    system "sudo cp -r $Bin/atscan_update/inc $Bin";
    if (!-d "$Bin/inc") { Print::bb(); exit(); }
    sleep(1);
  
    #############################################
    if (-d "/usr/share/doc/atscan") {
      my @f=("README.md", "License.txt");
      print $c[10]."[i] $ZT[5] License files...\n";
      for my $f(@f) {
        system "sudo cp -r $Bin/atscan_update/$f /usr/share/doc/atscan/";
        if (!-e "/usr/share/doc/atscan/$f") {
          print $c[4]."$er write to /usr/share/doc/atscan/$f!\n";
        }
      }
    }
    sleep(1);
  
    ##############################################
    print $c[10]."[i] $ZT[4]...\n";
    open (FILE, '>>', $scriptv) or Print::nochmod($scriptv, "");
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
          print $c[2]."$er write to $scriptCompletion!\n";
        }
        sleep(1);

        #############################################
        print $c[10]."[i] Creating desktop entries....\n";
        if (-d "/usr/share/icons/hicolor/16x16/apps/") {
	      system "sudo cp $Bin/atscan_update/inc/user/desktop/16x16/atscan-menu.png /usr/share/icons/hicolor/16x16/apps/";
	      if (!-e "/usr/share/icons/hicolor/16x16/apps/atscan-menu.png") { print $c[2]."$er write in /usr/share/icons/hicolor/16x16/apps/!\n"; }
	
	      system "sudo cp $Bin/atscan_update/inc/user/desktop/22x22/atscan-menu.png /usr/share/icons/hicolor/22x22/apps/";
	      if (!-e "/usr/share/icons/hicolor/22x22/apps/atscan-menu.png") { print $c[2]."$er write in /usr/share/icons/hicolor/22x22/apps/!\n"; }
	
	      system "sudo cp $Bin/atscan_update/inc/user/desktop/24x24/atscan-menu.png /usr/share/icons/hicolor/24x24/apps/";
	      if (!-e "/usr/share/icons/hicolor/24x24/apps/atscan-menu.png") { print $c[2]."$er write in /usr/share/icons/hicolor/24x24/apps/!\n"; }
	
	      system "sudo cp $Bin/atscan_update/inc/user/desktop/48x48/atscan-menu.png /usr/share/icons/hicolor/48x48/apps/";
	      if (!-e "/usr/share/icons/hicolor/48x48/apps/atscan-menu.png") { print $c[2]."$er write in /usr/share/icons/hicolor/48x48/apps/!\n"; }
	
	      system "sudo cp $Bin/atscan_update/inc/user/desktop/256x256/atscan-menu.png /usr/share/icons/hicolor/256x256/apps/";
	      if (!-e "/usr/share/icons/hicolor/256x256/apps/atscan-menu.png") { print $c[2]."$er write in /usr/share/icons/hicolor/256x256/apps/!\n"; }
     
          my @deskFiles=("/usr/share/icons/hicolor/16x16/apps/atscan-menu.png", "/usr/share/icons/hicolor/22x22/apps/atscan-menu.png", "/usr/share/icons/hicolor/24x24/apps/atscan-menu.png",
                       "/usr/share/icons/hicolor/48x48/apps/atscan-menu.png", "/usr/share/icons/hicolor/256x256/apps/atscan-menu.png");
        }
      }
    }
    sleep(1);
  
    ##############################################
    print $c[10]."[i] $ZT[9]...\n";
    open (MN, '>', $uplog) or Print::nochmod($uplog, "");
    print MN "$fulldate"; close(MN);
    sleep(1);
  
    ##############################################
    unlink $userSetting if -e $userSetting;   
    if (@userSetting) {
      print $c[10]."[i] $ZT[6]... \n";
      open (FE, '>>', $userSetting) or Print::nochmod($userSetting, "");
      for my $spss(@userSetting) {
        print FE "$spss\n";
      }
      close(FE);
    }  
    sleep(1);

    ###############################################
    print $c[10]."[i] Removing Desktop entries...\n";
    system "rm -rf $Bin/inc/user/desktop";
    if (-d "$Bin/inc/user/desktop") {
      print $c[3]."$er remove $Bin/inc/user/desktop!\n";
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
    print "$c[10]\n".$th.""; 
    if (substr($0, -3) ne '.pl') {
      my $zs=$script.".pl";
      unlink $zs if -e $zs or Print::nochmod($zs, "");
    }
    print $c[3]."[i] $DT[7]...\n";
  }
  Print::separaBlocks();
}

##########################################################################################################
1;
