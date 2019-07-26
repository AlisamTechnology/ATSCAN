package Checkinputs;

use strict;
use Socket;
use Exploits;
use Print;

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(Check_Inputs);
my @c = Print::colors();

## Copy@right Alisam Technology see License.txt

###########################################################################################################
## CHECK PLUGINS
sub Check_Inputs {
  my $ht = $_[0];
  my @V_INPUT = Exploits::V_INPUT();
  my $k;
  for my $input(@V_INPUT) {
    my $type="type=";
    $type.= "\"$input\"";
	my $k;
	if ($ht=~/<input(.*)$type/) {
	  $k = 1;
	} 
  }
  print $c[1]." FORMS    $c[4] [!]$c[10] Form inputs detected!\n" if $k;
}

###########################################################################################################

1;
