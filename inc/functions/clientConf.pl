#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
use File::Copy qw(copy);
## Copy@right Alisam Technology see License.txt

## USER CONFIGURATION SETTING
our($config, $userSetting, $script_bac, $interactive, $deskIcoConf, @AUTH, @c);
my @ser=("proxy", "proxy-random", "command", "payload", "zone", "timeout", "update", "engine", "all", "password", "freq", "level", "method", "interactive", "limit");
my @ValueOn=("interactive", "b-random", "m-random", "unique", "nobanner", "noinfo", "beep", "ifend");
my @res=(@ser, @ValueOn);

my $res1=join("|", @res);
my $x1="$deskIcoConf/atscan.desktop";
our (@l22, @l22bak);
my @pars=("set", "reset", "options", "exit");

sub ClientConfiguration {
  print $c[11]."[::] CONFIGURATION\n";
  if (-e $userSetting) {
    print $c[4]."[!] Options with \"on\" like a value cannot be changed!\n";
    print $c[10];
    print "+==========================================================================+\n";
    print "| $c[11]OPTION      $c[10] | $c[11]VALUE       $c[10] | $c[11]DESCRIPTION  $c[10]                              |\n";
    print "+==========================================================================+\n";
    print "| proxy        | <proxy>      | Proxy                                      |\n";
    print "| proxy-random | <proxy_file> | Random proxy                               |\n";
    print "| motor        | <motor>      | Search engine                              |\n";
    print "| timeout      | <timeout>    | Browser time out                           |\n";
    print "| level        | <level>      | Number of Engine results                   |\n";
    print "| password     | <password>   | Set tool password                          |\n";
    print "| method       | <get/post>   | get/post method                            |\n";
    print "| freq         | <in sec>     | Random frequency                           |\n";
    print "| payload      | <payload>    | Payload                                    |\n";
    print "| zone         | <zone>       | Engine zone                                |\n";
    print "| limit        | <limit>      | Results limit reach                        |\n";
    print "| update       | <in days>    | Check for updates frequency                |\n";
    print "| command      | <command>    | Execute extern command                     |\n";
    print "| b-random     | on           | Random browser                             |\n";
    print "| m-random     | on           | Random engine                              |\n";
    print "| unique       | on           | Unique results                             |\n";
    print "| nobanner     | on           | Hide tool banner                           |\n";
    print "| noinfo       | on           | Hide extrat target info                    |\n";
    print "| beep         | on           | Beep sound when positive result            |\n";
    print "| ifend        | on           | Beep when process finish                   |\n";
    print "| interactive  | on           | Boots in Interactive (intalled tool only)  |\n";
    print "+==========================================================================+\n";
    print "| $c[11]USAGE: $c[5]set$c[11] [$c[5]OPTION$c[11]][$c[5]VALUE$c[11]] | $c[5]reset$c[11] [$c[5]OPTION$c[11]|$c[5]all$c[11]] | $c[5]options$c[11] | $c[5]help$c[11] | $c[5]exit$c[10]  |\n";
    print "+==========================================================================+\n";
    print "\n";
  
    my ($act, $op, $vl);
    my $finish = 0;
    while(!$finish) {
      my (@confReset, @confSet, @confShown)=();
      print $c[10]."[!] $AUTH[16]: ";
      my $ps=<STDIN>;
      chomp ($ps);
      if ($ps) {
        if ($ps eq "exit") {
          $finish++;
        }elsif ($ps eq "help") {
          print $c[11]."[::] HELP\n";
          ltak();
          confHlp(); ltak(); print "\n";
        }elsif ($ps=~/^(set\s|reset\s|options)/) {
          ($act, $op, $vl)=cleanImput($ps);
          if (($act && ($act ne "options") && !$op) || ($act eq "set" && !$vl)) {
            print $c[4]."[!] $AUTH[14]\n";
          }else{
            ####################################################################################################
            if ($act eq "set") {
              if ((grep/^$op$/, @ValueOn) && ($vl ne "on")) {
                print $c[4]."[!] $vl $AUTH[25]\n";
              }else{
                @confSet=get_configuration();
                for my $configuration(@confSet) {
                  if ($configuration=~/$op/) {
                    deletSetting($op);
                  }
                }
                ##################  
                if ($op eq "interactive") {
                  if (-e $x1) {
                    system("sed -i 's/atscan;/atscan --interactive;/g' $x1");
                    printFile($userSetting, "interactive on");
                    print $c[3]."[i] interactive was activated!\n";
                  }else{
                    print $c[4]."[!] $AUTH[24]!\n"
                  }
                }
                ##################  
                elsif ($op eq "password") {
                  $vl=Digest::MD5->md5_hex($vl);
                  printFile($userSetting, "password $vl");
                  print $c[3]."[i] Password was set!\n";
                }else{
                  if (-e $op) {
                    open(F, $op);
                    while (my $st=<F>) {
                      unlink "$Bin/inc/conf/user/$op.txt" if -e "$Bin/inc/conf/user/$op.txt";
                      printFile("$Bin/inc/conf/user/$op.txt", "$st");
                    }
                    close(F);
                    printFile($userSetting, "$op $Bin/inc/conf/user/$op.txt\n");
                    print $c[3]."[i] $op => $Bin/inc/conf/user/$op.txt\n";
                  }else{
                    printFile($userSetting, "$op $vl");
                    print $c[3]."[i] $op => $vl\n";
                  }
                }
              }
            ####################################################################################################
            }elsif ($act eq "reset") {
              @confReset=get_configuration();
              if ($op eq "all") {        
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
                system("sed -i 's/atscan --interactive;/atscan;/g' $x1");
                print $c[3]."[i] All configuration was reset! \n";
              }else{
                my $userfile="$Bin/inc/conf/user/$op.txt";
                unlink $userfile if -e $userfile;
                deletSetting($op);
                if ($op eq "interactive") {
                  system("sed -i 's/atscan --interactive;/atscan;/g' $x1");
                }
                print $c[3]."[i] $op was reset!\n";
              }
            ####################################################################################################
            }elsif ($act eq "options") {
              @confShown=get_configuration();
              my $a1=0;
              print $c[10]."+"."=" x 70 ."\n";
              print $c[10]."| $c[11]OPTION                  $c[10] | $c[11]VALUE\n";
              print $c[10]."+"."=" x 70 ."\n";
              for my $lines2(@confShown) {
                if ($lines2!~/(##|config)/) {
                  $a1++;
                  my @printConf3=split(" ", $lines2) if (!($lines2=~/^$/));
                  $lines2=~s/$printConf3[0]\s//ig;
                  $lines2 =~ s/\s+$//;              
                  my $length=length($printConf3[0]);
                  my $addlength = 25 - $length;
                  my $fname="$Bin/inc/conf/user/$printConf3[0].txt";
                  print $c[10]."| $c[5]$printConf3[0]";
                  print " " x $addlength;
                  if (-e $fname) {
                    open(F4, $fname);
                    while (my $st=<F4>) {
                      print $c[10]."| $st\n" if (!($st=~/^$/)); 
                    }
                    close(F4);
                  }else{
                    if ($printConf3[0] eq "password") {
                      print $c[10]."| ********\n";
                    }else{
                      print $c[10]."| $lines2\n";
                    }
                  }
                }
              }
              print $c[10]."| $c[4]$AUTH[11]\n" if $a1<1;
              print $c[10]."+"."=" x 70 ."\n\n";
              (@confReset, @confSet, @confShown)=();
            }
          }
        }else{
          print $c[4]."  [!] $AUTH[14]\n";
        }
      }
    }
  }else{
    print $c[2]."   [!] $AUTH[15]\n"; logoff();
  }
}
####################################################################################################
## CHECK IMPUT PARTS
sub cleanImput {
  my $ps=$_[0];
  my ($act, $op, $vl);
  my @pars2;
  for my $par(@pars) {
    if ($ps=~/\b$par\b/) {
      $act=$par;
      @pars2=split(" ", $ps);
      if (($pars2[1] && (grep /$pars2[1]/, @res)) || ($pars2[0] eq "options") || ($pars2[1] eq "exit")) {
        $op=$pars2[1];
        if ($pars2[2]) {
          $ps=~s/$act\s//ig;
          $ps=~s/$op\s//ig;
          $vl=$ps;
        }
      }
    }
  }
  return ($act, $op, $vl);
}
####################################################################################################
####################################################################################################

1;
