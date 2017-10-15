#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

##############################################################################################
##############################################################################################
##
our(@c, @AUTH, $scriptbash, $activeUconf);
our(@INTERCOMNDS, @INTERSCANS, @INTERCOMNDSFIN, %INTEROPTION, %MODULES, @MODULES, @SCANS, %SCANS, @ENGINEARGUMENTS, @ARGUMENTSALL, %ARGUMENTSALL, %ENGINEARGUMENTS,
    @NoValRequierd, @INTERcomnd, %INTERcomnd, @interExtraOpts, @interLinuxOpts);
our (@INTERshell, @INTERparam, @INTERcommand, @INTERPortScan, @INTERDataScan, @INTERpayload, @INTERdecryp, @INTERadvanced, @INTERtarget);
our (%INTERshell, %INTERparam, %INTERcommand, %INTERPortScan, %INTERDataScan, %INTERpayload, %INTERdecryp, %INTERadvanced, %INTERtarget);
our (@PREFONF, %PREFONF, %PREFONF2);
my (@ARGUMENTS, %ARGUMENTS);
my ($mod, $scn, $first, $first1);
our $process;
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
      if ($OPT[0] eq "normal" or $OPT[0] eq "advanced") {
        $mod = $OPT[0];
        print $c[3]."Mode => [$mod]\n";
      }elsif ($OPT[0] eq "options") {
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
      }elsif ($OPT[0] eq "help") {
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
      if ($first eq "options") {
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
      }elsif ($first eq "help") {
        interHelpChek("2");
      ########################################################################################
      }elsif ($first=~/^use\s(.*)/) {
        $first=~s/use\s//ig;
        my $validCntrl=checkFirstParts($first, \@SCANS3);
        if ($validCntrl) {
          my @OPT2=split(" ", $first);
          if ($mod eq "advanced") {
            print $c[3]."Module => " ;
            for my $opt2(@OPT2) {
              push @INTERSCANS, "--$opt2";
              if (scalar(@OPT2) > 1) { $scn="multi"; }
              else{ $scn=$OPT2[0]; }
              print "[$opt2]";
            }
            print "\n";
          }else{
            if (scalar(@OPT2) < 2) {
              print $c[3]."Module => " ;
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
      if ($first1 eq "options") {
        my $prefix=getPrefix();
        print "\n$c[11]Module($c[13]$mod$c[11] > $c[13]$prefix$c[11]\)\n";
        InterHelpArgs("set", "ARGUMENT", "VALUE", "");
      #########################################################################################
      }elsif ($first1 eq "help") {
        interHelpChek("3");
      #########################################################################################
      }elsif ($first1 eq "run") {
        for my $eew(@INTERSCANS) {
          if ($eew !~ /(advanced|normal|multi|ports|commands|form|nomodule)/) { push @INTERCOMNDSFIN, $eew; }
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
  (@ARGUMENTS, %ARGUMENTS)=();
  our (@INTERshell, @INTERparam, @INTERcommand, @INTERPortScan, @INTERDataScan, @INTERpayload, @INTERdecryp, @INTERtarget);
  our (%INTERshell, %INTERparam, %INTERcommand, %INTERPortScan, %INTERDataScan, %INTERpayload, %INTERdecryp, %INTERtarget);
  if ($scn) {
    $scn=~s/--//ig;
    if ($scn eq "decrypt") { push @ARGUMENTS, @INTERdecryp; %ARGUMENTS=(%ARGUMENTS, %INTERdecryp); }
    else{
      push @ARGUMENTS, @ENGINEARGUMENTS;
      %ARGUMENTS = (%ARGUMENTS, %ENGINEARGUMENTS);
      if ($mod eq "advanced") {
        push @ARGUMENTS, @INTERadvanced;
        %ARGUMENTS=(%ARGUMENTS, %INTERadvanced);
        if ($scn eq "sql") { push @ARGUMENTS, @INTERparam; %ARGUMENTS=(%ARGUMENTS, %INTERparam); }
        
        my @AdvArgs=("sql", "lfi", "admin", "joomfri", "shost", "wpafd", "upload", "zip");
        if (grep( /^$scn$/, @AdvArgs)) {
          push @ARGUMENTS, @INTERpayload; %ARGUMENTS=(%ARGUMENTS, %INTERpayload);
        }
      }
      if ($scn eq "lfi") { push @ARGUMENTS, @INTERshell; %ARGUMENTS=(%ARGUMENTS, %INTERshell); }
      if ($scn eq "ports") { push @ARGUMENTS, @INTERPortScan; %ARGUMENTS=(%ARGUMENTS, %INTERPortScan); }  
      push @ARGUMENTS, @ARGUMENTSALL;
      %ARGUMENTS = (%ARGUMENTS, %ARGUMENTSALL);
      
      if ($scn eq "form") { push @ARGUMENTS, @INTERDataScan; %ARGUMENTS=(%ARGUMENTS, %INTERDataScan); }
      else{ push @ARGUMENTS, @INTERcomnd; %ARGUMENTS=(%ARGUMENTS, %INTERcomnd) }
    }
  }
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
  if (scalar (@INTERSCANS) < 1) { $interScn="mode"; }
  else{ $interScn="module"; }
  return ($prefix, $interScn);
}
##############################################################################################
## FORM
sub form {
  my $process=$_[0];
  my ($ord, $ord1);
  print $c[11]."atscan";
  my ($prefix, $interScn)=getPreInter();
  if ($mod) {
    print "$c[11] $interScn($c[13]$mod";
    print "$c[11] > $c[13]$prefix" if $prefix;
    print "$c[11]\)";  
  }
  print " > $c[10]";
  $ord=<STDIN>;
  chomp ($ord);
  if ($ord) {
    my $nnb=ifInterLinuxOpt($ord);
    if ($nnb) {
      system ($ord); processHeader($process); }
    else{
      if ($ord eq "config") { ClientConfiguration(); processHeader($process); }
      elsif ($ord eq "update") { checkVersion(); processHeader($process); }
      elsif ($ord eq "usage") { interUsage(); processHeader($process); }
      elsif ($ord eq "back") { back($process); }
      elsif ($ord eq "run" && scalar(@INTERCOMNDS) < 1) { runArg($process); }    
      elsif ($ord eq "exit") { print "$c[3]\[!] Bey! :)\n"; logoff(); }
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
  print $c[11]."[::] HELP\n";
  ltak();
  if ($process eq "1") { interHelp(); scansArgs(); }
  elsif ($process eq "2") { scansArgs(); }
  elsif ($process eq "3") { interHelp(); }
  ltak();
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
  my $addLenght11= 22 - $keyLength11;
  print "$c[10]  | $c[10]$zz";
  print " " x $addLenght11;
  if ($rr ne "advanced" && $rr ne "normal") {
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
  print "$c[10]+ Usage: > $j1 [$j2]";
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
  print "$c[10]\| $c[11]DESCRIPTION";
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
  our $userSetting;
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
  my $H=$_[0];
  my $val;
  for my $key3 (keys %ARGUMENTS) {
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
  print "$c[10]\[!] ";
  if ($process eq "1") { print "$AUTH[17] \n"; }
  elsif ($process eq "2") { print "$AUTH[18] \n"; }
  elsif ($process eq "3" or $process eq "4") { print "$AUTH[19] \n"; }
}
##############################################################################################
## ALL MAIN
sub mainAll {
  (@ARGUMENTS, %ARGUMENTS, @INTERCOMNDS, @INTERSCANS, @INTERCOMNDSFIN, %INTEROPTION, $mod, $scn, $first, $first1)=();
  while ((scalar @INTERSCANS) < 1) {
    my $mo=main();
    my ($mod, $scn)=main2($mo);
    main3($mod, $scn);
  }
}
##############################################################################################

1;
