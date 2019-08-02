package UseErrors;
use strict;
use warnings;
use FindBin '$Bin';
use Exporter;
use Exploits;
use Print;
## Copy@right Alisam Technology see License.txt

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(check_arguments1 check_arguments2 check_arguments3 check_arguments4 _print_apis_alert check_scans);

my @c          = Print::colors();
my @ErrT       = Exploits::ErrT();
my @ZT         = Exploits::ZT();
my @DT         = Exploits::DT();
my @DS         = Exploits::DS();
my @OTHERS     = Exploits::OTHERS();
my @SCAN_TITLE = Exploits::SCAN_TITLE();
my @TT         = Exploits::TT();

###########################################################################################################
## USE ERRORS
sub check_arguments1 {
  my ($mrandom, $motor, $mlevel, $dork, $unique, $shodan, $bugtraq) = @_;
  if (defined $mrandom && (!defined $mlevel && !$mlevel)) { print $c[4]."[!] $DT[38]\n"; exit(); }
  if ((!defined $dork) && (defined $unique)) { print $c[4]."[!] $DT[21]\n"; exit(); }
  if (!defined $dork && defined $bugtraq) { print $c[4]."[!] Usage --bugtraq --dork <dork> --level <level>\n"; exit(); }
  if (defined $mlevel || $mlevel) {
    if ($mlevel!~/^[0-9,.E]+$/) { print $c[4]."$TT[15]\n"; exit(); }
  }
  
  ## ARGUMENTS VERIFICATION (LEVEL / PORTS)
  if ((defined $dork)&&(!defined $mlevel && !$mlevel && !defined $shodan)) { print $c[4]."[!] $DT[40]\n"; exit(); }
}

###########################################################################################################
## COUNT SCANS
sub check_scans {
 my ($WpSites, $JoomSites, $xss, $sql, $lfi, $JoomRfi, $WpAfd, $adminPage, $subdomain, $mupload, $mzip, $eMails, $mmd5, $mencode64, $mdecode64, $port)=@_;
 my @scs;
  for ($WpSites, $JoomSites, $xss, $sql, $lfi, $JoomRfi, $WpAfd, $adminPage, $subdomain, $mupload, $mzip, $eMails, $mmd5, $mencode64, $mdecode64, $port) { 
    push @scs, $_ if defined $_;
  }
  if (scalar @scs > 1) { print $c[4]."[!] Multiple scans are not allowed in Version >= 17.0.0!\n"; exit(); }
}

##########################################################################################################
sub check_arguments2 {
  my ($motor, $mrandom, $Target, $dork, $JoomRfi, $shell) = @_;
  ## MORE ARGUMENTS PROCESS VERIFICATION
  if ((defined $dork) || (defined $Target)) { 
    if ((defined $JoomRfi) and (!defined $shell)) { print $c[4]."[!] $DT[41]\n"; exit(); }
  }
  ## CHECK MOTORS ARGUMENTS
  if (defined $motor || $motor) {
    if (defined $mrandom || $mrandom) {
      print $c[4]."$TT[14]\n"; exit();
    }
    abcd($motor);
  }
  if ($motor) { abcd($motor); }
}

##########################################################################################################
sub check_arguments3 {
  my ($shodan, $bugtraq, $apikey, $popup, $command, $zoneH, $dork, $replace, $replaceFROM) = @_;
  ## SHODAN
  if (defined $shodan) {
    if (!defined $apikey) {
      print $c[4]."[!] USAGE: --shodan --apikey <key>\n"; 
	  print $c[4]."[!] You can get an apikey here https://www.shodan.io/\n";
	  exit();
    }
  }

  ## BUGTRAQ
  if (defined $bugtraq) {
    if (!defined $dork) {
      print $c[4]."[!] USAGE: --bugtraq --dork <dork> --level <level>\n"; 
	  exit();
    }
  }

  ## CHECK POPUP ARGUMENT IS USED WITH EXTERN COMMANDS
  if (defined $popup and !defined $command) {
    print $c[4]."[!] --$ZT[26]\n"; exit();
  }

  ## ZONE-H
  if (defined $zoneH) {
    if ($zoneH!~/(.*)=>(.*)/) {
      print $c[4]."[!] zoneH must be \"Notifier => Url\" \n"; exit();
    }
  }

  ## REPLACE
  if (defined $replace || defined $replaceFROM) {
    for ($replace, $replaceFROM) {
      if (defined $_ and $_ !~ /=>/) {
        print $c[4]."[!] $ZT[27] \"STRING => NEW_STRING\"\n"; exit();
      }
    }
  }
}

##########################################################################################################
sub check_arguments4 {
my ($eMails, $port, $ping, $udp, $tcp, $regex, $searchRegex, $searchIps, $Hstatus, $validText, $get, $post, $method, $data, $mupload, $limit) = @_;
  ## ARGUMENTS VERIFICATION PORTS
  if ((defined $port) && (!defined $tcp and !defined $udp)) { print $c[4]."$DT[23]\n"; exit(); }

  if (defined $regex or defined $eMails or defined $searchRegex or defined $searchIps) {
    if (defined $Hstatus) { print $c[4]."[!] $SCAN_TITLE[2]"; exit(); }
  }

  ## ADVISE DATA WITHOUT METHOD
  if (defined $data and (!defined $post && !defined $get && !$method)) { print $c[4]."[!] $TT[16]\n"; exit(); }

  ## CHECK PAUSE ARGUMENT
  if (defined $data) {
    if ($limit<500) {
      if (!defined $Hstatus && !defined $validText) { print $c[4]."[!] $TT[17]\n"; exit(); }
    }
  }
  
  ##PING PORT
  if (defined $ping and !defined $port) { print $c[4]."[!] --ping require --port option!\n"; exit(); }
}

##########################################################################################################
## WORDLIST IN DATA
sub data_alert {
  print $c[4]."[!] $ZT[28]\n"; exit();
}

## IF DATA FILES > 1
sub adviseDataFile {
  print $c[2]."[!] $ZT[29]\n"; exit();
}
##########################################################################################################
## IF DATA FILE NOT EXISTS
sub advise_no_file {
  my $no_file=$_[0];
  print $c[2]."[!] $ZT[30] $no_file !\n"; exit();
}

##########################################################################################################
sub abcd {
  my $abcd=$_[0];
  my @abcd;
  if ($abcd=~/,/) { @abcd=split(",", $abcd); }
  else{ push @abcd, $abcd; }
  for my $ad(@abcd) {
    $ad =~ s/\s//g;
    if ($ad!~/^(bing|ask|google|yandex|sogou|exalead|googleapis|googlecache)$/) { 
	  print $c[2]."[!] $DT[25]\n".$c[4]."$DT[27] \n[!] $OTHERS[5] -m \"google,bing,...\"\n"; exit();
	}
  }
}

##########################################################################################################
sub _print_apis_alert {
  print $c[4]."[|] Usage: --apikey <apikey> --cx <ID> [OPTIONS]\n";
  print $c[4]."[|] Googleapis require an apikey and ID\n";
  print $c[4]."[!] Googleapis: https://developers.google.com/custom-search/v1/overview\n";
  exit();
}

##########################################################################################################

1;
