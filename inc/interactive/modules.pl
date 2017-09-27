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
    @NoValRequierd, @INTERcomnd, %INTERcomnd);
our (@INTERshell, @INTERparam, @INTERcommand, @INTERPortScan, @INTERDataScan, @INTERpayload, @INTERdecryp, @INTERadvanced);
our (%INTERshell, %INTERparam, %INTERcommand, %INTERPortScan, %INTERDataScan, %INTERpayload, %INTERdecryp, %INTERadvanced);

#BUILD ARGUMENTS
my (@ARGUMENTS, %ARGUMENTS);
my ($mod, $scn, $first, $first1, $interScan);
(@INTERCOMNDS, @INTERSCANS, @INTERCOMNDSFIN, %INTEROPTION, $mod, $scn, $first, $first1, $interScan)=();

# MAIN
sub main {
  print "$c[10]\[!] $AUTH[17]!\n";
  my @OPT;
  while (!$mod) {
    my $module=form("1");
    if ($module =~ /use\s(advanced|normal)/) {
      @OPT=split(" ", $module);
      $mod = $OPT[1];
      print $c[3]."Mode => [$mod]\n";
    }
    if ($module eq "options") {
      print "\n";
      InterHelpArgs1("use", "MODE", "", "", "");
      for my $MODULE (@MODULES) {
        for my $key (keys %MODULES) {
        my $value = $MODULES{$key};
        if ($MODULE eq $key) {
          tableOpts($MODULE, "", $value, "ARGUMENT");
        }
      } 
    }
    helpSeparator();  
    print "\n";
    }
  }
  return ($mod);
}

## MAIN2
sub main2 {
  my $mod=$_[0];
  my (@SCANS2, %SCANS2, @SCANS3, %SCANS3);
  push @SCANS2, @SCANS;
  push @SCANS3, @SCANS2;
  %SCANS2=(%SCANS2, %SCANS);
  %SCANS3=(%SCANS3, %SCANS2);
  my $validCmnds2=(join("|", @SCANS3));
  my @INTERSCANS2;
  print "$c[10]\[!] $AUTH[18]!\n";
  while (!$scn) {
    $first=form("2"); 
    if ($first =~ /use\s(.*)/) {
      $first=~s/use\s//ig;
      my @OPT=split(" ", $first);
      if ($mod eq "advanced") {
        for my $opt(@OPT) {
          if ($opt=~/$validCmnds2/) {
            push @INTERSCANS, "--$opt";
            push @INTERSCANS2, "$opt";
            if (scalar(@OPT) > 1) {
              $scn="multi";
            }else{
              $scn=$OPT[0];
            }
          }
        }        
      }else{ ## NORMAL MODE
        if (scalar(@OPT) < 2) {
          push @INTERSCANS, "--$OPT[0]";
          push @INTERSCANS2, $OPT[0];
          $scn=$OPT[0];
        }
      }
      print $c[3]."Modules => " if scalar(@INTERSCANS2) > 0;
      for my $INTERSCANS2(@INTERSCANS2) {
        print "[$INTERSCANS2]";
      }
      print "\n" if scalar(@INTERSCANS2) > 0;
      for my $INT(@INTERSCANS) {
        getExtratArgs($INT);
      }
    }    
    if ($first eq "options") {
      print "\n$c[11]  Mode($c[13]$mod$c[11]\) \n";
      InterHelpArgs1("use", "MODULE", "", "", "");
      for my $SCAN(@SCANS3) {
        for my $key (keys %SCANS3) {
          my $value = $SCANS3{$key};
          if ($SCAN eq $key) {
            tableOpts($SCAN, "", $value, "ARGUMENT");
          }
        }
      }
      helpSeparator();
      print "\n";
    }
  }
  return ($mod, $scn);
}

## MAIN 3
sub main3 {
  my ($mod, $scn)=@_;
  my $validCmnds=(join("|", @ARGUMENTS));
  print "$c[10]\[!] $AUTH[19]!\n";
  print "$c[4]\[!] $AUTH[20]!\n";
  while ((scalar @INTERCOMNDSFIN) < 1) {
    while (!$first1 or $first1 ne "run") {
      $first1=form("4");
      if ($first1 eq "options") {
        for my $ARGUMENT(@ARGUMENTS) {
          checkIfConfig($ARGUMENT);
        }
        my $prefix=getPrefix();
        print "\n$c[11]  Module($c[13]$mod$c[11] > $c[13]$prefix$c[11]\)\n";
        InterHelpArgs("set", "ARGUMENT", "VALUE", "");
      }
      if ($first1 =~ /set\s/) {
        $first1 =~ s/set\s//ig;
        my @OPT1=split(" ", $first1);
        if ($OPT1[0] =~ /$validCmnds/ && grep(/^$OPT1[0]$/, @ARGUMENTS)) {
          if (!$OPT1[1]) {
            if (grep( /^$OPT1[0]$/, @NoValRequierd)) {
              push @INTERCOMNDS, "--$OPT1[0]";
              $INTEROPTION{"$OPT1[0]"}="on";
              print "$c[3]$OPT1[0] => [on]\n";
            }
          }else{
            my $first3 = $first1;
            $first3 =~ s/$OPT1[0]\s//ig;
            my $last = "$OPT1[0] $first3";
            push @INTERCOMNDS, "--$OPT1[0] \"$first3\"";
            $INTEROPTION{"$OPT1[0]"}=$first3;
            print "$c[3]$OPT1[0] => [$first3]\n";
          }
        }
        dorkOtarget($OPT1[0]);
      }
      if ($first1 eq "run") {          
        for my $eew(@INTERSCANS) {
          if ($eew !~ /(advanced|normal|multi|ports|commands|form|validation)/) {
            push @INTERCOMNDSFIN, $eew;
          }
        }
        push @INTERCOMNDSFIN, @INTERCOMNDS;
        my $fullComnd = join(" ", @INTERCOMNDSFIN);
        (@INTERCOMNDS, @INTERSCANS, @INTERCOMNDSFIN, %INTEROPTION, $mod, $scn, $first, $first1)=();
        if (-e $scriptbash) {
          system ("atscan $fullComnd");
        }else{
          system ("perl $Bin/atscan.pl $fullComnd");
        }
        mainAll();
      }
    }
  }
}

## BUILD ARGUMENTS ARRAY
sub getExtratArgs {
  my $scn=$_[0];
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

# TARGET OR DORK
sub dorkOtarget {
  my $checkDorkOtarget=$_[0];
  if ($checkDorkOtarget eq "dork") {
    if (grep( /^target$/, @ARGUMENTS)) {
      updateARGUMENTS("target");
    }
  }
  if ($checkDorkOtarget eq "target") {
    if (grep( /^dork$/, @ARGUMENTS)) {
      updateARGUMENTS("dork");
    }
  }
}

## UPDATE ARGUMENTS
sub updateARGUMENTS {
  my $updateARGUMENT=$_[0];
  my $index = 0;
  $index++ until $ARGUMENTS[$index] eq $updateARGUMENT;
  splice(@ARGUMENTS, $index, 1);
}

##
sub getPreInter {
  my ($prefix, $interScn);
  $prefix=getPrefix();
  if (scalar (@INTERSCANS) < 1) {
    $interScn="mode";
  }else{
    $interScn="module";
  }
  return ($prefix, $interScn);
}

## FORM
sub form {
  my $process=$_[0];
  my $ord="";
  print $c[11]."atscan";
  my ($prefix, $interScn)=getPreInter();
  if ($mod) {
    print "$c[11] $interScn(";
    print "$c[13]$mod";
    if ($prefix) {
      print "$c[11] > $c[13]$prefix";
    }
    print "$c[11]\)";  
  }
  print " > ";
  print "$c[10]";
  $ord=<STDIN>;
  chomp ($ord);
  if ($ord eq "config") { ClientConfiguration(); ltak(); }
  if ($ord eq "help") { ltak(); print "\n"; interHelp(); ltak(); }
  if ($ord eq "back") { back($process); }
  if ($ord eq "run" && scalar(@INTERCOMNDS) < 1) { runArg($process); }
  if ($ord eq "exit") {
    print "$c[3]\[!] Bey! :)\n";
    logoff($mod);
  }
  return $ord;
}

## RUN
sub runArg {
  my $process=$_[0];
  print $c[2]."[!] $AUTH[21]!\n\n";
  if ($process eq "2") {
    (@ARGUMENTS, %ARGUMENTS, %INTEROPTION, @INTERSCANS)=();
    main2($mod);
  }elsif ($process eq "4") {
    (%INTEROPTION)=();
    main3($mod, $scn);
  }else{
    mainAll();
  }
}

## PREFIX
sub getPrefix {
  my $prefix;
  if (scalar(@INTERSCANS) == 1) {          
    $prefix=$INTERSCANS[0];
    $prefix=~s/--//ig;
  }elsif (scalar(@INTERSCANS) > 1) { 
    $prefix="multi";
  }
  return $prefix;
}

## BACK
sub back {
  my $process=$_[0];
  ($scn, $interScan)=();
  (@ARGUMENTS, %ARGUMENTS, %INTEROPTION, @INTERSCANS)=();
  if ($process eq "2") { mainAll(); }
  elsif ($process eq "4") { main2($mod); }
  else{ mainAll(); }
}

## HELP HEADER
sub tableOpts {
  my ($rr, $aa, $zz, $isArg)=@_;
  my $pz="$rr ";
  my $keyLength = length($rr) ;
  my $addLenght= 12 - $keyLength;
  print "$c[10]  | $c[5]$rr$c[10]";
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
      print "| $aa";
    }
  }
  print "\n";
}

## HELP ARGUMENTS
sub InterHelpArgs1 {
  my ($j1, $j2, $j3, $j4, $isArg)=@_;
  print "$c[10]  + Usage: > $j1 [$j2]";
  if ($j3) {
    print "[$j3]\n$c[4]  $AUTH[22]!";
  }
  print "\n";
  my $keyLength2 = length($j2);
  my $addLenght2= 26 - $keyLength2;
  my $addLenght3= 14 - $keyLength2;
  helpSeparator();
  print "$c[11]  | $j2";
  print " " x $addLenght3;
  print "$c[10]\| $c[11]DESC";
  if ($j3) {
    print " " x $addLenght2;
    print "$c[10]\| $c[11]VAL* ";
    print "$c[10]\| $c[11]$j3";  
  }
  print "\n";
  helpSeparator();
  return ($j1, $j2, $j3, $j4, $isArg);
}

## CHECK PRECONFIGURED ARGUMENTS
sub checkIfConfig {
  our $userSetting;
  my $chekArgumnt=$_[0];
  my $row;
  open(my $fh, $userSetting);
  while ($row = <$fh>) {
    chomp $row;
    if (($row =~ /$chekArgumnt/) and ($row !~ /(config|password|##)/)) {
      $row =~ s/$chekArgumnt//g;
      $row =~ s/ //g;
      $INTEROPTION{"$chekArgumnt"}=$row;
      push @INTERCOMNDS, "--$chekArgumnt $row";
    }
  }
}

## CHECK SELECTED ARGUMENTS
sub InterHelpArgs {
  my ($j1, $j2, $j3, $j4)=@_;
  my $isArg="";
  ($j1, $j2, $j3, $j4, $isArg)=InterHelpArgs1($j1, $j2, $j3, $j4, $isArg);
  for my $ARGUMENT(@ARGUMENTS) {
    my $value3=getH($ARGUMENT);
    if (exists $INTEROPTION{$ARGUMENT}) {
      for my $key (keys %INTEROPTION) {
        my $value = $INTEROPTION{$key};
        if ($ARGUMENT eq $key) {
          tableOpts($key, $value, $value3, $isArg);
        }
      }
    }else{
      tableOpts($ARGUMENT, "", $value3, $isArg);
    }
  }
  helpSeparator();
  print "\n";
}

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

## ALL MAIN
sub mainAll {
  (@ARGUMENTS, @INTERCOMNDS, @INTERSCANS, @INTERCOMNDSFIN, %INTEROPTION, $mod, $scn, $first, $first1)=();
  while ((scalar @INTERSCANS) < 1) {
    my $mo=main();
    my ($mod, $scn)=main2($mo);
    main3($mod, $scn);
  }
}
##############################################################################################

1;
