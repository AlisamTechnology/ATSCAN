#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## USER CONFIGURATION SETTING
our($config, $userSetting, $script_bac, @AUTH, @c, @configuration);
my @res=("proxy", "proxy-random", "show", "payload", "config", "m-random", "b-random", "zone", "timeout", "update", "engine", "nobanner",
         "noinfo", "beep", "ifend", "unique", "all", "config", "exit", "password", "freq", "level", "method");
my $res1=join("|", @res);
if (-e $userSetting) {
  if (-e $userSetting) {
    my $aa=0;
    if (grep(/^config/, @configuration)) {
        print $c[1]."[::]$c[3] [X] $c[11]CONFIGURATION IS: $c[3]ON\n";
    }else{
      print $c[1]."[::]$c[2] [X] $c[11]CONFIGURATION IS: $c[2]OFF $c[4](Must be active to use configuration!)\n";
    }
    print $c[1]."   +"."-" x 71 ."\n";
    if (grep(/^password/, @configuration)) {
      print "$c[1]    |$c[3] [X] $c[10]Password: $c[3]********\n";
    }
    for my $lines(@configuration) {
      if (($lines=~/$res1/)&&($lines!~/(password|##|config)/ and !($lines=~/^$/))) {
        $aa++;
        my @printConf=split(" ", $lines);
        print "$c[1]   |$c[3] [X] $c[10]$printConf[0]\n";
      }
    }
    print $c[1]."   |$c[2] [x]$c[4] $AUTH[11]\n" if $aa<1;   
    print $c[1]."   +"."-" x 71 ."\n";
    print $c[10];
    print "   +----------------------------------------------------------------------+\n";
    print "   |          ACTIVATION:  set config on  /  set config off               |\n";
    print "   +---------------+---------------------------------+--------------------+\n";
    print "   |    SHOW       |           SET                   |      RESET         |\n";
    print "   +---------------+---------------------------------+--------------------+\n";
    print "   |               | set proxy <proxy>               | reset proxy        |\n";
    print "   |               | set proxy-random <proxy>        | reset proxy-random |\n";
    print "   |               | set engine <option>             | reset engine       |\n";
    print "   |               | set timeout <in s> Default 10   | reset timeout      |\n";    
    print "   |               | set update <in days> Default 10 | reset update       |\n";
    print "   |               | set timeout <in s> Default 10   | reset timeout      |\n";
    print "   |               | set password <password>         | reset password     |\n";
    print "   |               | set method <get/post>           | reset method       |\n";
    print "   | show config   | set freq <time in s>            | reset freq         |\n";
    print "   |               | set payload <payload>           | reset payload      |\n";
    print "   |               | set zone <zone>                 | reset zone         |\n";    
    print "   |               | set level <level>               | reset level        |\n";
    print "   |               | set b-random on                 | reset b-random     |\n";
    print "   |               | set m-random on                 | reset m-random     |\n";
    print "   |               | set nobanner on                 | reset nobanner     |\n";
    print "   |               | set noinfo on                   | reset noinfo       |\n";
    print "   |               | set beep on                     | reset beep         |\n";
    print "   |               | set ifend on                    | reset ifend        |\n";
    print "   |               | set unique on                   | reset unique       |\n";
    print "   |               |                                 | reset all          |\n";
    print "   +---------------+---------------------------------+--------------------+\n";
    print "   |         $c[4]NOTE: Password is required even configuration is off! $c[10]       |\n";
    print "   +----------------------------------------------------------------------+\n\n";
    my $ps;
    my $finish = 0;
    while(!$finish) {
      print $c[10]."   [!] $AUTH[16] ";
      $ps=<STDIN>;
      chomp ($ps);
      my @askMes=split(" ", $ps);
      my $xa=scalar(grep { defined $_} @askMes);
      if (($ps!~/$res1/) || (($ps=~/^set\s(.*)/ && $xa!=3) || ($ps=~/^(reset|show)\s(.*)/ && $xa!=2))) {
        print $c[4]."   [!] $AUTH[14]\n";
      }else{
        $finish=1;
      }
    }
    if ($ps=~/exit/) { logoff(); }    
    if ($ps=~/^set\s(.*)/) {
      my @askMes=split(" ", $ps);
      my $a=$askMes[1];
      my $b=$askMes[2];
      $b=~s/^'(.*)'$/$1/;
      $b=~s/^"(.*)"$/$1/;
      for my $configuration(@configuration) {
        if ($configuration=~/$a\s(.*)/) {
          deletSetting($a);
        }         
      }
      if ($a eq "config") {
        if ($b eq "on") {
          printFile($userSetting, "config on config\n");
        }elsif ($b eq "off") {
          deletSetting("config");
        }
      }elsif ($a eq "password") {
        $b=Digest::MD5->md5_hex($b);
        printFile($userSetting, "password $b password\n");
      }else{
        if (-e $b) {
          open(F, $b);
          while (my $st=<F>) {
            unlink "$Bin/inc/conf/user/$a.txt" if -e "$Bin/inc/conf/user/$a.txt";
            printFile("$Bin/inc/conf/user/$a.txt", "$st\n");
          }
          close(F);
          printFile($userSetting, "$a $Bin/inc/conf/user/$a.txt $a");
        }else{
          printFile($userSetting, "$a $b $a");
        }
      }
      system("atscan --config || perl atscan.pl --config");
    }elsif ($ps=~/^reset\s(.*)/) {
      my @printConf2=split(" ", $ps);
      if ($printConf2[1] eq "all") {        
        for my $y(@res) { system "rm $Bin/inc/conf/user/$y.txt" if -e "$Bin/inc/conf/user/$y.txt"; }       
        my ($pp, $line);
        for $line(@configuration) {
          if ($line=~/^(##)\s/) { $pp=$line; }
        }
        open FH, ">", $userSetting;
        print FH "$pp\n";
        close FH;
      }else{
        my $userfile="$Bin/inc/conf/user/$printConf2[1].txt";
        unlink $userfile if -e $userfile;
        deletSetting($printConf2[1]);
      }
      system("atscan --config || perl atscan.pl --config");
    }elsif ($ps=~/^show\sconfig/) {
      print $c[10]."       +"."-" x 40 ."\n";
      my $a1=0;
      for my $lines2(@configuration) {
        if ($lines2!~/(##|config)/) {
          my @printConf3=split(" ", $lines2) if (!($lines2=~/^$/));
          my $fname="$Bin/inc/conf/user/$printConf3[0].txt";
          if (-e $fname) {
            open(F4, $fname);
            while (my $st=<F4>) {
              $a1++;
              print $c[10]."       | $printConf3[0]: $c[3]$st" if (!($st=~/^$/)); 
            }
            close(F4);
          }else{
            $a1++;
            if ($printConf3[0] eq "password") { print $c[10]."       | $printConf3[0]: $c[10]********\n"; }
            else{ print $c[10]."       | $printConf3[0]: $c[10]$printConf3[1]\n"; }
          }
        }
      }
      print $c[4]."       $AUTH[11]\n" if $a1<1;
      print $c[10]."       +"."-" x 40 ."\n";
      question();
    }
  }else{
    print $c[10]."   [!] $AUTH[15]\n"; logoff();
  }
}
sub question {
  print $c[4]."   [!] Type 1 to edit or 0 to Exit:$c[10] ";
  my$prs=<STDIN>;
  chomp ($prs);
  if ($prs=~/1/) { system("atscan --config || perl atscan.pl --config"); }  
  else{ logoff(); }
}

1;
