package Interactive;

use strict;
use warnings;
use FindBin '$Bin';
use Print;
use Exploits;
use Module;

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(interactive);

## Copy@right Alisam Technology see License.txt

my @c          = Print::colors();
my @ErrT       = Exploits::ErrT();
my @ZT         = Exploits::ZT();
my @DT         = Exploits::DT();
my @DS         = Exploits::DS();
my @AUTH       = Exploits::AUTH();
my @SCAN_TITLE = Exploits::SCAN_TITLE();
my @TT         = Exploits::TT();
my $scriptbash = "/usr/bin/atscan";

##############################################################################################
##############################################################################################
##############################################################################################
my %INTERadvanced  = Module::INTERadvanced();
my %INTERcomnd  = Module::INTERcomnd();
my %INTERdecryp  = Module::INTERdecryp();
my %INTERparam  = Module::INTERparam();
my %INTERPortScan  = Module::INTERPortScan();
my %INTERshell  = Module::INTERshell();
my %bugtraq  = Module::bugtraq();
my %api  = Module::api();
my %shodan  = Module::shodan();
my %INTERDataScan  = Module::INTERDataScan();
my @NoValRequierd  =  Module::NoValRequierd();
my @interLinuxOpts  =  Module::interLinuxOpts();
my @interExtraOpts  =  Module::interExtraOpts();
my %ARGUMENTSALL  = Module::ARGUMENTSALL();
my %MODULES  = Module::MODULES();
my %INTERlevel  = Module::INTERlevel();
my %INTERdork  = Module::INTERdork();
my %INTERtarget  = Module::INTERtarget();
my %INTERSearchScans  = Module::INTERSearchScans(); 
my %SCANS  = Module::SCANS();
my @INTERcomnd = keys %INTERcomnd;
my @INTERadvanced = keys %INTERadvanced;
my @INTERdecryp = keys %INTERdecryp;
my @INTERparam = keys %INTERparam;
my @INTERPortScan = keys %INTERPortScan;
my @INTERshell = keys %INTERshell;
my @bugtraq = keys %bugtraq;
my @api = keys %api;
my @shodan = keys %shodan;
my @INTERDataScan = keys %INTERDataScan;
my @ARGUMENTSALL = keys %ARGUMENTSALL;
my @INTERSearchScans = keys %INTERSearchScans;
my @INTERtarget = keys %INTERtarget;
my @INTERlevel = keys %INTERlevel; 
my @INTERdork = keys %INTERdork;
my @SCANS = keys %SCANS;
my @MODULES = keys %MODULES;

my %ENGINEARGUMENTS = Module::ENGINEARGUMENTS();
my @ENGINEARGUMENTS=(@INTERdork, @INTERtarget, @INTERSearchScans, @INTERlevel);

my (%INTERcommand, @INTERcommand, @INTERCOMNDS, @INTERSCANS, @INTERCOMNDSFIN, %INTEROPTION);
my (@PREFONF, %PREFONF, %PREFONF2);
my (@ARGUMENTS, %ARGUMENTS);
my ($mod, $scn, $first, $first1);
my $process;


##############################################################################################
##############################################################################################
##############################################################################################
##############################################################################################
# MAIN
sub main {
  processHeader("1");
  my @OPT;
  while (!$mod) {
    my $module=form("1");
    if ($module) {
      $module=~s/use\s//ig;
      @OPT=split(" ", $module);
      if ($OPT[0] eq $ZT[13] or $OPT[0] eq $ZT[14]) {
        $mod = $OPT[0];
        print $c[3]."Mode => [$mod]\n";
      }elsif ($OPT[0] eq $ZT[16]) {
        print "\n";
        InterHelpArgs1("use", "MODE", "", "", "");
        for my $MODULE (@MODULES) {
          for my $key (keys %MODULES) {
            my $value = $MODULES{$key};
            if ($MODULE eq $key) { tableOpts($MODULE, "", $value, "ARGUMENT"); }
          }
        }
        helpSeparator();
        print "\n";
      #########################################################################################
      }elsif ($OPT[0] eq $ZT[20]) {
        interHelpChek("1");
      #########################################################################################
      }else{
        interAdvise($module);
      }
    }
  }
  return ($mod);
}
##############################################################################################
## MAIN2
sub main2 {
  my $mod=$_[0];
  my (@SCANS3, %SCANS3);
  (@INTERSCANS, $scn)=();
  push @SCANS3, @SCANS;
  %SCANS3=(%SCANS3, %SCANS);
  processHeader("2");
  while (!$scn) {
    $first=form("2");
    if ($first) {
      ########################################################################################
      if ($first eq $ZT[16]) {
        print "\n$c[11]Mode($c[13]$mod$c[11]\) \n";
        InterHelpArgs1("use", "MODULE", "", "", "");
        for my $SCAN(@SCANS3) {
          for my $key (keys %SCANS3) {
            my $value = $SCANS3{$key};
            if ($SCAN eq $key) { tableOpts($SCAN, "", $value, "ARGUMENT"); }
          }
        }
        helpSeparator();
        print "\n";
      #########################################################################################
      }elsif ($first eq $ZT[20]) {
        interHelpChek("2");
      ########################################################################################
      }elsif ($first=~/^use\s(.*)/) {
        $first=~s/use\s//ig;
        my $validCntrl=checkFirstParts($first, \@SCANS3);
        if ($validCntrl) {
          my @OPT2=split(" ", $first);
          if ($mod eq $ZT[14]) {
            print $c[3]."$ZT[18] => " ;
            for my $opt2(@OPT2) {
              push @INTERSCANS, "--$opt2";
              if (scalar(@OPT2) > 1) { $scn="multi"; }
              else{ $scn=$OPT2[0]; }
              print "[$opt2]";
            }
            print "\n";
          }else{
            if (scalar(@OPT2) < 2) {
              print $c[3]."$ZT[18] => " ;
              push @INTERSCANS, "--$OPT2[0]";
              $scn=$OPT2[0];
              print "[$OPT2[0]\]\n";
            }
          }
          for my $INT(@INTERSCANS) { getExtratArgs($INT); }
        }
      ########################################################################################
      }else{
        interAdvise($first);
      }
    }
  }
  return ($mod, $scn);
}

##########################################################################################################
## MAIN 3
sub main3 {
  my ($mod, $scn)=@_;
  (@INTERCOMNDSFIN)=();
  processHeader("3");
  while ((scalar @INTERCOMNDSFIN) < 1) {
    $first1=form("4");
    if ($first1) {
      $first1 =~ s/set\s//ig;
      my @OPT1=split(" ", $first1);
      #########################################################################################
      if ($first1 eq $ZT[16]) {
        my $prefix=getPrefix();
        print "\n$c[11]$ZT[18]($c[13]$mod$c[11] > $c[13]$prefix$c[11]\)\n";
        InterHelpArgs("set", "ARGUMENT", "VALUE", "");
      #########################################################################################
      }elsif ($first1 eq $ZT[20]) {
        interHelpChek("3");
      #########################################################################################
      }elsif ($first1 eq "run") {
        for my $eew(@INTERSCANS) {
          if ($eew !~ /(advanced|normal|multi|ports|commands|form|nomodule|Ports)/) { push @INTERCOMNDSFIN, $eew; }
        }
        push @INTERCOMNDS, @PREFONF;
        push @INTERCOMNDSFIN, @INTERCOMNDS;
        my $fullComnd = join(" ", @INTERCOMNDSFIN);
        (@INTERCOMNDSFIN, %INTEROPTION, @INTERCOMNDS, @PREFONF, %PREFONF,  %PREFONF2, $first, $first1)=();
        if (-e $scriptbash) { system ("atscan $fullComnd"); }
        else{ system ("perl $Bin/atscan.pl $fullComnd"); }
        print "\n";
        processHeader("4");
      #########################################################################################
      }elsif (grep/^$OPT1[0]$/, @ARGUMENTS) {
        if (!$OPT1[1]) {
          if (grep( /^$OPT1[0]$/, @NoValRequierd)) {
            push @INTERCOMNDS, "--$OPT1[0]";
            $INTEROPTION{"$OPT1[0]"}="on";
            print "$c[3]$OPT1[0] => [on]\n";
          }
        }else{
          my $first3 = $first1;
          $first3 =~ s/$OPT1[0]\s//ig;          
          print "$c[3]$OPT1[0] => [$first3]\n";
		  if ($OPT1[0] eq "command") { $first3="\"$first3\""; }
          push @INTERCOMNDS, "--$OPT1[0] $first3";
          $INTEROPTION{"$OPT1[0]"}=$first3;
        }
        dorkOtarget($OPT1[0]);
      #########################################################################################
      }else{
        interAdvise($first1);
      }
    }
  }
}
sub interAdvise {
  my $porque=$_[0];
  push @interExtraOpts, @interLinuxOpts;
  if (!grep/^$porque$/, @interExtraOpts) { 
    print $c[4]."[!] $AUTH[14]\n";
  }
}
##############################################################################################
## CHECK FIRST PARTS
sub checkFirstParts {
  my ($first, $scansArray)=@_;
  my @scansArray =@{$scansArray};
  my $cntrl="0";
  my ($validCntrl, @FirstParts)=();
  @FirstParts=split(" ", $first);
  for my $FirstParts(@FirstParts) {
    if (grep/^$FirstParts$/, @scansArray) { $cntrl++; }
  }
  if ($cntrl eq scalar(@FirstParts)) { $validCntrl="1"; }
  return $validCntrl;
}
##############################################################################################
## BUILD ARGUMENTS ARRAY
sub getExtratArgs {
  my $scn=$_[0];
  my (@INTERshell, @INTERparam, @INTERcommand, @INTERPortScan, @INTERDataScan, @INTERdecryp, @INTERtarget, @shodan, 
      @api, @googleapi, @bugtraq);
  my (%INTERshell, %INTERparam, %INTERcommand, %INTERPortScan, %INTERDataScan, %INTERdecryp, %INTERtarget, %shodan, 
       %api, %googleapi, %bugtraq);
  if ($scn) {
    $scn=~s/--//ig;
    if ($scn eq "decrypt") { 
	  push @ARGUMENTS, @INTERdecryp; 
	  %ARGUMENTS=(%ARGUMENTS, %INTERdecryp);
	}
    else{
      push @ARGUMENTS, @ENGINEARGUMENTS;
      %ARGUMENTS = (%ARGUMENTS, %ENGINEARGUMENTS);
      if ($mod eq $ZT[14]) {
        push @ARGUMENTS, @INTERadvanced;
        %ARGUMENTS=(%ARGUMENTS, %INTERadvanced);
        if ($scn eq "sql") { 
		  push @ARGUMENTS, @INTERparam; 
		  %ARGUMENTS=(%ARGUMENTS, %INTERparam);
		}
      }
      if ($scn eq "lfi") { 
	    push @ARGUMENTS, @INTERshell; 
		%ARGUMENTS=(%ARGUMENTS, %INTERshell);
      }
      if ($scn eq "ports") { 
	    push @ARGUMENTS, @INTERPortScan; 
		%ARGUMENTS=(%ARGUMENTS, %INTERPortScan);
	  } 
      push @ARGUMENTS, @ARGUMENTSALL;
      %ARGUMENTS = (%ARGUMENTS, %ARGUMENTSALL);
      if ($scn eq "form") { 
	    push @ARGUMENTS, @INTERDataScan; 
		%ARGUMENTS=(%ARGUMENTS, %INTERDataScan);
	  }else{ 
	    push @ARGUMENTS, @INTERcomnd; 
		%ARGUMENTS=(%ARGUMENTS, %INTERcomnd);
	  }
      if ($scn eq "bugtraq") { 
	    (@ARGUMENTS, %ARGUMENTS)=(); 
		push @ARGUMENTS, @bugtraq; 
		%ARGUMENTS=(%ARGUMENTS, %bugtraq);
	  }
      if ($scn eq "shodan") {
	    (@ARGUMENTS, %ARGUMENTS)=(); 
		push @ARGUMENTS, @api; 
		push @ARGUMENTS, @shodan; 
		%ARGUMENTS=(%ARGUMENTS, %api, %shodan);
	  }
    }
  }
  return (@ARGUMENTS, %ARGUMENTS);
}
##############################################################################################
# TARGET OR DORK
sub dorkOtarget {
  my $checkDorkOtarget=$_[0];
  if ($checkDorkOtarget eq "dork") {
    for my $INTERtarget(@INTERtarget) {
      if (grep( /^$INTERtarget$/, @ARGUMENTS)) { updateARGUMENTS($INTERtarget); }
    }
  }
  if ($checkDorkOtarget eq "target") {
    if (grep( /^dork$/, @ARGUMENTS)) { updateARGUMENTS("dork"); }
  }
}
##############################################################################################
## UPDATE ARGUMENTS
sub updateARGUMENTS {
  my $updateARGUMENT=$_[0];
  my $index = 0;
  $index++ until $ARGUMENTS[$index] eq $updateARGUMENT;
  splice(@ARGUMENTS, $index, 1);
}
##############################################################################################
##
sub getPreInter {
  my ($prefix, $interScn);
  $prefix=getPrefix();
  if (scalar (@INTERSCANS) < 1) { $interScn=$ZT[15]; }
  else{ $interScn=$ZT[17]; }
  return ($prefix, $interScn);
}
##############################################################################################
## FORM
sub form {
  my $process=$_[0];
  my ($ord, $ord1);
  print $c[13]."atscan";
  my ($prefix, $interScn)=getPreInter();
  if ($mod) {
    print "$c[11] $interScn($c[13]$mod";
    print "$c[11] > $c[13]$prefix" if $prefix;
    print "$c[11]\)";  
  }
  print $c[5]." > $c[10]";
  $ord=<STDIN>;
  chomp ($ord);
  if ($ord) {
    my $nnb=ifInterLinuxOpt($ord);
    if ($nnb) {
      system ($ord); processHeader($process); }
    else{
      if ($ord eq "config") { 
	    Clientconfig::ClientConfiguration();
		processHeader($process); 
	  }
      # elsif ($ord eq "update") {
	    # use Update;
	    # Update::update($ua, $fullHeaders, $repair); 
		# processHeader($process);
	  # }
      elsif ($ord eq "usage") { Dialog::interUsage(); processHeader($process); }
      elsif ($ord eq "back") { back($process); }
      elsif ($ord eq "run" && scalar(@INTERCOMNDS) < 1) { runArg($process); }    
      elsif ($ord eq "exit") { print "$c[3]\[!] Bey! :)\n"; exit(); }
      else{ $ord1=1; }
    }
  }
  return $ord if $ord1;
}
sub ifInterLinuxOpt {
  my $ifInterLinuxOpt=$_[0];
  my $nnb=0;
  my @ifInterLinuxOpt=split(" ", $ifInterLinuxOpt);
  for my $interLinuxOpt(@interLinuxOpts) {
    if ($interLinuxOpt eq $ifInterLinuxOpt[0]) { $nnb++; }
  }
  return $nnb;
}
##############################################################################################
## HELP
sub interHelpChek {
  my $process=$_[0];
  print $c[11]."[::] $ZT[19]\n";
  Print::separaBlocks();
  if ($process eq "1") { Dialog::interHelp(); Dialog::scansArgs(); }
  elsif ($process eq "2") { Dialog::scansArgs(); }
  elsif ($process eq "3") { Dialog::interHelp(); }
  Print::separaBlocks();
  processHeader($process);
}
##############################################################################################
## RUN
sub runArg {
  my $process=$_[0];
  print $c[2]."[!] $AUTH[21]!\n\n";
  if ($process eq "2") { (@ARGUMENTS, %ARGUMENTS, %INTEROPTION, @INTERSCANS)=(); main2($mod); }
  elsif ($process eq "4") { (%INTEROPTION)=(); main3($mod, $scn); }
  else{ mainAll(); }
}
##############################################################################################
## PREFIX
sub getPrefix {
  my $prefix;
  if (scalar(@INTERSCANS) == 1) {          
    $prefix=$INTERSCANS[0];
    $prefix=~s/--//ig; }
  elsif (scalar(@INTERSCANS) > 1) { $prefix="multi"; }
  return $prefix;
}
##############################################################################################
## BACK
sub back {
  my $process=$_[0];
  (@ARGUMENTS, %ARGUMENTS, @INTERCOMNDSFIN, %INTEROPTION, @INTERCOMNDS, @INTERSCANS, $scn)=();
  if ($process eq "2") { mainAll(); }
  elsif ($process eq "4") { main2($mod); }
  else{ mainAll(); }
}
##############################################################################################
## HELP HEADER
sub tableOpts {
  my ($rr, $aa, $zz, $isArg)=@_;  
  my $pz="$rr ";
  my $keyLength = length($rr) ;
  my $addLenght= 12 - $keyLength;
  print "$c[10]| $c[5]$rr$c[10]";
  print " " x $addLenght;
  my $keyLength11 = length($zz);
  my $addLenght11 = 22 - $keyLength11;
  print "$c[10]  | $c[10]$zz";
  print " " x $addLenght11;
  if ($rr ne $ZT[14] && $rr ne $ZT[13]) {
    if (!grep( /^$rr$/, @SCANS)) {
      if (grep( /^$rr$/, @NoValRequierd)) { print "|  No  "; }
       else{ print "|  Yes ";
      }
      print "| ";
      if ($aa=~/\*\*/) { $aa=~s/\*\*//g; print "$aa$c[4]\**"; }
      else{ print "$aa"; }
    }
  }
  print "\n";
}
##############################################################################################
## HELP ARGUMENTS
sub InterHelpArgs1 {
  my ($j1, $j2, $j3, $j4, $isArg)=@_;
  print "$c[10]+ $ZT[22]: > $j1 [$j2]";
  if ($j3) {
    print "[$j3]\n$c[4]$AUTH[22]!";
    print "\n$c[4]\[!] [VALUE**] = $AUTH[23]!";
  }
  print "\n";
  my $keyLength2 = length($j2);
  my $addLenght2= 19 - $keyLength2;
  my $addLenght3= 14 - $keyLength2;
  helpSeparator();
  print "$c[11]| $j2";
  print " " x $addLenght3;
  print "$c[10]\| $c[11]$ZT[21]";
  if ($j3) {
    print " " x $addLenght2;
    print "$c[10]\| $c[11]VAL* ";
    print "$c[10]\| $c[11]$j3";  
  }
  print "\n";
  helpSeparator();
  return ($j1, $j2, $j3, $j4, $isArg);
}
##############################################################################################
## CHECK PRECONFIGURED ARGUMENTS
sub checkIfConfig {
  my $chekArgumnt=$_[0];
  my $userSetting="$Bin/inc/user/userSetting";
  (@PREFONF, %PREFONF)=();  
  my $row;
  open(my $fh, $userSetting);
  while ($row = <$fh>) {
    chomp $row;
    if (($row =~ /$chekArgumnt/) and ($row !~ /(config|password|##)/)) {
      $row =~ s/$chekArgumnt//g;
      $row =~ s/ //g;
      $PREFONF{"$chekArgumnt"}="$row**";
      push @PREFONF, "--$chekArgumnt $row";
    }
  }
}
##############################################################################################
## CHECK SELECTED ARGUMENTS
sub InterHelpArgs {
  my ($j1, $j2, $j3, $j4)=@_;
  my $isArg="";
  %PREFONF2=();
  ($j1, $j2, $j3, $j4, $isArg)=InterHelpArgs1($j1, $j2, $j3, $j4, $isArg);
  for my $ARGUMENT(@ARGUMENTS) { 
    checkIfConfig($ARGUMENT);
    %PREFONF2=(%PREFONF2, %INTEROPTION, %PREFONF);     
    my $value3=getH($ARGUMENT);

    if (exists $PREFONF2{$ARGUMENT}) {
      for my $key (keys %PREFONF2) {
        my $value = $PREFONF2{$key};
        if ($ARGUMENT eq $key) { tableOpts($key, $value, $value3, $isArg); }
      }
    }
    else{ tableOpts($ARGUMENT, "", $value3, $isArg); }
  }
  helpSeparator();
  print "\n";
}
##############################################################################################
## GET ARGUMENTS VALUES
sub getH {
  my $H= $_[0];
  my $val;
  for my $key3(keys %ARGUMENTS) {
    if (exists $ARGUMENTS{$H}) {
      my $val2 = $ARGUMENTS{$key3};
      if ($H eq $key3) { $val=$val2; }
    }
  }
  return $val;
}
##############################################################################################
## PROCESS QUESTION
sub processHeader {
  my $process=$_[0];
  print "$c[4]\[!] $c[10]";
  if ($process eq "1") { print "$AUTH[17] \n"; }
  elsif ($process eq "2") { print "$AUTH[18] \n"; }
  elsif ($process eq "3" or $process eq "4") { print "$AUTH[19] \n"; }
}

##############################################################################################
# SEPARATOR LINE
sub helpSeparator {
  print "$c[10]+============================================================================\n";
}

##############################################################################################
##############################################################################################
## ALL MAIN
sub interactive {
  while ((scalar @INTERSCANS) < 1) {
    Print::separator();
    my $mo = main();
    ($mod, $scn) = main2($mo);
    main3($mod, $scn);
  }
}
##############################################################################################
##############################################################################################

1;
