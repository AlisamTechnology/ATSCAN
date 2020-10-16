package ClientMenu;

use strict;

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(check_clientMenu check_clientUpdate);

## Copy@right Alisam Technology see License.txt

##############################################################################################################
## CLIENT MENU
sub check_clientMenu {
  my ($interactive, $config, $uninstall, $toolInfo, $help, $mmd5, $mencode64, $mdecode64) = @_;
  ## INTERACTIVE
  if (defined $interactive || $interactive) {
    use Interactive;
    Interactive::interactive() 
  }

  ## USER CONFIG
  if (defined $config){
    use Clientconfig;
    Clientconfig::ClientConfiguration() 
  }

  ## UNINSTALL  
  if (defined $uninstall){
    use Uninstall;
    Uninstall::uninstall() 
  }

  ## TOOL
  if (defined $toolInfo){
    use Tool;
    Tool::tool() 
  }

  ## HELP
  if (defined $help){
    use Help;
    Help::help() 
  }
  
  ## ENCODE DECODE
  my $cc = 0;
  for ($mmd5, $mencode64, $mdecode64) {
    if (defined $_) {
	  use Encodeme;
	  $cc++;
      Encodeme::encodeme($_, $cc);
    }
  }
}

##UPDATE OR REPAIR
sub check_clientUpdate {
  my ($dork, $Target, $ua, $fullHeaders, $dateupdate, $checkVersion, $repair) = @_;
  ## CHECK VERSION
  if (defined $dork || defined $Target) {
    use Upad;
    Upad::checkforupdates($ua, $fullHeaders, $dateupdate);
  }
  ## UPDATE
  use Update;
  Update::update($ua, $fullHeaders, $repair) if (defined $checkVersion);
  Update::repair($ua, $fullHeaders, $repair) if (defined $repair);
}
##############################################################################################################

1;