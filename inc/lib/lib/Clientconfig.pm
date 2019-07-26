package Clientconfig;

use strict;
use warnings;
use FindBin '$Bin';
use Exploits;
use Exporter;
use POSIX qw(strftime);
use Dialog;

## Copy@right Alisam Technology see License.txt

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(ClientConfiguration checkSetting);
my @pars=("set", "reset", "options", "exit");
my @ser=("proxy", "prandom", "command", "zone", "timeout", "update", "motor", "all", "password", "freq", "level", "method", "interactive", "limit", "apikey", "cx");
my @ValueOn=("interactive", "brandom", "mrandom", "unique", "nobanner", "noverbose", "beep", "ifend");
my @res=(@ser, @ValueOn);

my $userSetting  = $Bin."/inc/user/userSetting";
my $script_bac   = $Bin."/version_bac.log";
my $deskIcon     = $Bin."/inc/user/desktop/";
my $deskIcoConf  = "/usr/share/applications";

my @c            = Print::colors();
my @AUTH         = Exploits::AUTH();

my $res1=join("|", @res);
my $x1="/usr/share/applications/atscan.desktop";
my (@l22, @l22bak);

###########################################################################################################
## CHECK USER SETTING
sub checkSetting {
  my $object = $_[0];
  my ($l1, @ans);
  open(F2, $userSetting);
  while (my $l = <F2>) {
    chomp $l;
    if ($l =~ /$object\s(.*)/) {
      $l1 = $l;
      @ans = split(" ", $l);
      $l1 =~ s/$ans[0]\s//ig;
    }
  }
  close(F2);
  return $l1;
}

#########################################################################################################################
## DELETE USER SETTING
sub deletSetting {
  my @config=get_configuration();
  our (@LI2);
  my $val=$_[0];
  unlink $userSetting;
  open FH, ">", $userSetting;
  for my $lines(@config) {
    if ($lines!~/^$val\s(.*)/) {
      print FH "$lines";
    }
  }
  close FH;
}

###########################################################################################################
## USER CONFIGUATION
sub get_configuration {
  my $act = $_[0];
  my @configuration;
  if (-e $userSetting) {
    open(F1, $userSetting);
    while (my $set = <F1>) {
      if (!($set =~ /^$/)) {
        push @configuration, $set;
      }
    }
    close( F1 );
  }
  return @configuration;
}

####################################################################################################
## CHECK IMPUT PARTS
sub cleanImput {
  my ($ps, $res) = @_;
  my ($act, $op, $vl);
  my @pars2;
  for my $par(@pars) {
    if ($ps=~/\b$par\b/) {
      $act=$par;
      @pars2=split(" ", $ps);
      if (($pars2[1] && (grep /$pars2[1]/, @{$res})) || ($pars2[0] eq "options") || ($pars2[1] eq "exit")) {
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
## CONFIG
sub ClientConfiguration {
  Print::separaBlocks;
  print $c[11]."[::] CONFIGURATION\n";
  if (-e $userSetting) {
    print $c[4]."[!] Options with \"on\" like a value cannot be changed!\n";
    print $c[10];
    print "+==========================================================================+\n";
    print "| $c[11]OPTION      $c[10] | $c[11]VALUE       $c[10] | $c[11]DESCRIPTION  $c[10]                              |\n";
    print "+==========================================================================+\n";
    print "| $c[5]proxy       $c[10] | <proxy>      | Proxy                                      |\n";
    print "| $c[5]apikey      $c[10] | <apikey>     | Apikey                                     |\n";
    print "| $c[5]cx          $c[10] | <ID>         | Googleapis search ID                       |\n";
    print "| $c[5]prandom     $c[10] | <proxy_file> | Random proxy                               |\n";
    print "| $c[5]motor       $c[10] | <motor>      | Search engine motor                        |\n";
    print "| $c[5]timeout     $c[10] | <timeout>    | Browser time out                           |\n";
    print "| $c[5]level       $c[10] | <level>      | Number of Engine results                   |\n";
    print "| $c[5]password    $c[10] | <password>   | Set tool password                          |\n";
    print "| $c[5]method      $c[10] | <get/post>   | get/post method                            |\n";
    print "| $c[5]freq        $c[10] | <in sec>     | Random frequency                           |\n";
    print "| $c[5]zone        $c[10] | <zone>       | Engine zone                                |\n";
    print "| $c[5]limit       $c[10] | <limit>      | Results limit reach                        |\n";
    print "| $c[5]update      $c[10] | <in days>    | Check for updates frequency                |\n";
    print "| $c[5]command     $c[10] | <command>    | Execute extern command                     |\n";
    print "| $c[5]brandom     $c[10] | on           | Random browser                             |\n";
    print "| $c[5]mrandom     $c[10] | on           | Random engine                              |\n";
    print "| $c[5]unique      $c[10] | on           | Unique results                             |\n";
    print "| $c[5]nobanner    $c[10] | on           | Hide tool banner                           |\n";
    print "| $c[5]noverbose   $c[10] | on           | No scan verbose                            |\n";
    print "| $c[5]beep        $c[10] | on           | Beep sound when positive result            |\n";
    print "| $c[5]ifend       $c[10] | on           | Beep when process finish                   |\n";
    print "| $c[5]interactive $c[10] | on           | Boots in Interactive (intalled tool only)  |\n";
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
          Print::separaBlocks();
          Dialog::confHlp(); 
          Print::separaBlocks();
		  print "\n";
        }elsif ($ps=~/^(set\s|reset\s|options)/) {
          ($act, $op, $vl)=cleanImput($ps, \@res);
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
                    Print::printFile($userSetting, "interactive on");
                    print $c[3]."[i] interactive was activated!\n";
                  }else{
                    print $c[4]."[!] $AUTH[24]!\n"
                  }
                }
                ##################  
                elsif ($op eq "password") {
                  $vl=Digest::MD5::md5_hex($vl);
                  Print::printFile($userSetting, "password $vl");
                  print $c[3]."[i] Password was set!\n";
                }else{
                  if (-e $op) {
                    open(F, $op);
                    while (my $st=<F>) {
                      unlink $Bin."/inc/conf/user/$op.txt" if -e $Bin."/inc/conf/user/$op.txt";
                      Print::printFile($Bin."/inc/conf/user/$op.txt", "$st");
                    }
                    close(F);
                    Print::printFile($userSetting, "$op $Bin/inc/conf/user/$op.txt\n");
                    print $c[3]."[i] $op => $Bin/inc/conf/user/$op.txt\n";
                  }else{
                    Print::printFile($userSetting, "$op $vl");
                    print $c[3]."[i] $op => $vl\n";
                  }
                }
              }
            ####################################################################################################
            }elsif ($act eq "reset") {
              @confReset = get_configuration();
              if ($op eq "all") {        
                for my $y(@res) {
                  system "rm $Bin/inc/conf/user/$y.txt" if -e $Bin."/inc/conf/user/$y.txt";
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
                my $userfile=$Bin."/inc/conf/user/$op.txt";
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
                  my $fname=$Bin."/inc/conf/user/$printConf3[0].txt";
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
    print $c[2]."   [!] $AUTH[15]\n"; exit();
  }
}

####################################################################################################
####################################################################################################

1;
