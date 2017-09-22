#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
use File::Copy qw(copy);
## Copy@right Alisam Technology see License.txt

## USER CONFIGURATION SETTING
our($config, $userSetting, $script_bac, @AUTH, @c);
my @res=("proxy", "proxy-random", "show", "payload", "config", "m-random", "b-random", "zone", "timeout", "update", "engine", "nobanner",
         "noinfo", "beep", "ifend", "unique", "all", "config", "exit", "password", "freq", "level", "method", "interactive");
my $res1=join("|", @res);
my $x1="/usr/share/applications/atscan.desktop";
my $x2="/usr/share/applications/atscan.desktop.back";
our ($deskIcon, @l22, @l22bak);

sub ClientConfiguration {
  print $c[1]."[::] CONFIGURATION\n\n";
  if (-e $userSetting) {
    print $c[10];
    print "   +---------------+-------------------------------------+--------------------+\n";
    print "   |    SHOW       |           SET                       |          RESET     |\n";
    print "   +---------------+-------------------------------------+--------------------+\n";
    print "   |               | set interactive on (installed tool) | reset interactive  |\n";
    print "   |               | set proxy <proxy>                   | reset proxy        |\n";
    print "   |               | set proxy-random <proxy>            | reset proxy-random |\n";
    print "   |               | set engine <option>                 | reset engine       |\n";
    print "   |               | set timeout <in s> Default 10       | reset timeout      |\n";    
    print "   |               | set update <in days> Default 10     | reset update       |\n";
    print "   |               | set password <password>             | reset password     |\n";
    print "   |               | set method <get/post>               | reset method       |\n";
    print "   | show config   | set freq <time in s>                | reset freq         |\n";
    print "   |               | set payload <payload>               | reset payload      |\n";
    print "   |               | set zone <zone>                     | reset zone         |\n";    
    print "   |               | set level <level>                   | reset level        |\n";
    print "   |               | set b-random on                     | reset b-random     |\n";
    print "   |               | set m-random on                     | reset m-random     |\n";
    print "   |               | set nobanner on                     | reset nobanner     |\n";
    print "   |               | set noinfo on                       | reset noinfo       |\n";
    print "   |               | set beep on                         | reset beep         |\n";
    print "   |               | set ifend on                        | reset ifend        |\n";
    print "   |               | set unique on                       | reset unique       |\n";
    print "   |               |                                     | reset all          |\n";
    print "   +---------------+-------------------------------------+--------------------+\n";
    print "\n";
  
    my $ps;
    my $finish = 0;
    while(!$finish) {
      my (@confReset, @confSet, @confShown)=();
      print $c[10]."   [!] $AUTH[16]: ";
      $ps=<STDIN>;
      chomp ($ps);
      my @askMes=split(" ", $ps);
      my $xa=scalar(grep { defined $_} @askMes);
      if (($ps!~/$res1/) || (($ps=~/^set\s(.*)/ && $xa!=3) || ($ps=~/^(reset|show)\s(.*)/ && $xa!=2))) {
        print $c[4]."   [!] $AUTH[14]\n";
      }
      ####################################################################################################
      if ($ps eq "exit") {
        $finish++;
      }elsif ($ps=~/^set\s(.*)/) {
        my @askMes=split(" ", $ps);
        my $a=$askMes[1];
        my $b=$askMes[2];
        $b=~s/^'(.*)'$/$1/;
        $b=~s/^"(.*)"$/$1/;
        @confSet=get_configuration();
        for my $configuration(@confSet) {
          if ($configuration=~/$a\s(.*)/) {
            deletSetting($a);
          }
        }
        ##################  
        if ($a eq "interactive") {
          if (-e $x1) {
            copy $x1, $x2;
            unlink $x1;
            open(F23, $x2);
            @l22=<F23>;
            close(F23);
            open(F24, '>>', $x1);
            for my $l22(@l22) {
              $l22=~s/\"atscan\;/\"atscan --interactive\;/ig;
              print F24 "$l22\n";
            }
            close(F24);
            print $c[3]."   [i] $a is Active!\n";
          }
        }
        ##################  
        if ($a eq "config") {
          if ($b eq "on") {
           printFile($userSetting, "config on config\n");
           print $c[3]."   [i] Configuration is on! \n";
          }elsif ($b eq "off") {
            deletSetting("config");
            print $c[3]."   [i] Configuration is off! \n";
          }
        ##################  
        }elsif ($a eq "password") {
          $b=Digest::MD5->md5_hex($b);
          printFile($userSetting, "password $b password\n");
          print $c[3]."   [i] Password was set!\n";
        }else{
          if (-e $b) {
            open(F, $b);
            while (my $st=<F>) {
              unlink "$Bin/inc/conf/user/$a.txt" if -e "$Bin/inc/conf/user/$a.txt";
              printFile("$Bin/inc/conf/user/$a.txt", "$st\n");
            }
            close(F);
            printFile($userSetting, "$a $Bin/inc/conf/user/$a.txt $a");
            print $c[3]."   [i] $a => $Bin/inc/conf/user/$a.txt \n";
          }else{
            printFile($userSetting, "$a $b $a");
            print $c[3]."   [i] $a => $a \n";
          }
        }
      ####################################################################################################
      }elsif ($ps=~/^reset\s(.*)/) {
        my @printConf2=split(" ", $ps);
        @confReset=get_configuration();
        if ($printConf2[1] eq "all") {        
          for my $y(@res) {
            system "rm $Bin/inc/conf/user/$y.txt" if -e "$Bin/inc/conf/user/$y.txt";
          }
          unlink $userSetting;
          open FH, ">", $userSetting;
          for my $ln(@confReset) {
            if ($ln=~/^##/) {
              print FH "$ln";
            }
          }
          close FH;
          print $c[3]."   [i] All configuration was reset! \n";
        }else{
          my $userfile="$Bin/inc/conf/user/$printConf2[1].txt";
          unlink $userfile if -e $userfile;
          deletSetting($printConf2[1]);
          
          if ($printConf2[1] eq "interactive") {
            if (-e $x2 && -e $x1) {
              unlink $x1;
              copy $x2, $x1;
              unlink $x2;
            }        
          }
          print $c[3]."   [i] $printConf2[1] was reset!\n";
        }
      ####################################################################################################
      }elsif ($ps=~/^show\sconfig/) {
        @confShown=get_configuration();
        my $a1=0;
        print $c[10]."   +"."-" x 75 ."\n";
        print $c[10]."   | $c[11]OPTION                  $c[10] | $c[11]VALUE\n";
        print $c[10]."   +"."-" x 75 ."\n";
        for my $lines2(@confShown) {
          if ($lines2!~/(##|config)/) {
            $a1++;
            my @printConf3=split(" ", $lines2) if (!($lines2=~/^$/));
            my $length=length($printConf3[0]);
            my $addlength = 25 - $length;
            my $fname="$Bin/inc/conf/user/$printConf3[0].txt";
            if (-e $fname) {
              open(F4, $fname);
              while (my $st=<F4>) {
                print $c[10]."   | $c[5]$printConf3[0]";
                print " " x $addlength;
                print $c[10]."| $st" if (!($st=~/^$/)); 
              }
              close(F4);
            }else{
              if ($printConf3[0] eq "password") {
                print $c[10]."   | $c[5]$printConf3[0]";
                print " " x $addlength;
                print $c[10]."|********\n";
              }else{
                print $c[10]."   | $c[5]$printConf3[0]";
                print " " x $addlength;
                print $c[10]."| $printConf3[1]\n";
              }
            }
          }
        }
        print $c[10]."   | $c[4]$AUTH[11]\n" if $a1<1;
        print $c[10]."   +"."-" x 75 ."\n\n";
        @confShown=();
      }
      (@confReset, @confSet, @confShown)=();
    }
  }else{
    print $c[2]."   [!] $AUTH[15]\n"; logoff();
  }
}
####################################################################################################

1;
