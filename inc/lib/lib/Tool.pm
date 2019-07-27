package Tool;

use strict;
use warnings;
use FindBin '$Bin';
use Exporter;
use Exploits;
use Subs;
use Print;
use Banner;
use File::Basename;

## Copy@right Alisam Technology see License.txt

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(tool);

my $scriptv      = Subs::scriptv();
my @c            = Print::colors();
my @OTHERS       = Exploits::OTHERS();
my @TT           = Exploits::TT;
my $version      = Banner::version();

## INFO TOOL
sub tool {
    use Config;
    print $c[1]." [::] $TT[0]:: ".$c[3]."$TT[5]\n".$c[1]." [::] $TT[1]:: ".$c[3]."$TT[6] [V $version]\n".$c[1]." [::] $TT[2]:: ".$c[3].$Bin."/",basename($0)," \n";
    print $c[1]." [::] $TT[3]:: ".$c[3]."[$^V]\n".$c[1]." [::] $TT[4]:: ".$c[3]."[$Config{ osname} $Config{ archname}]\n".$c[1]." [::] MORE:: ".$c[3]."$OTHERS[21]\n";
    print $c[3]."             $OTHERS[22]\n";
    my $sn3="-" x 80; 
	print $c[1]."$sn3\n";
}

1;