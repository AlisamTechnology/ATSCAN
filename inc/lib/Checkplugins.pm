package Checkplugins;

use strict;
use Socket;
use Exploits;
use Print;
use Subs;

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(checkPlugins);
my @c = Print::colors();

## Copy@right Alisam Technology see License.txt

###########################################################################################################
## CHECK PLUGINS
sub checkPlugins {
  my $ht = $_[0];  
  my @plugins;
  my @base = ("plugins", "themes");
  for (@base) {
    while ($ht =~ /\/wp-content\/$_\/(.*?)(\/)/g) {
	  $1 =~ s/\/wp-content\/$_\//$_/g;
	  my $chop = $_;
	  chop($chop);
	  my $fullPlug = "$chop => $1";
	  push @plugins, $fullPlug;
	}
  }
  if (scalar @plugins > 0) {
    @plugins = Subs::checkDuplicate(@plugins);
    print $c[1]." PLUGINS$c[4]   [!]$c[10] Plugins detected!\n";
    for (@plugins) {
	  print $c[10]."             - $_\n";
    }
  }
}

###########################################################################################################

1;
