package Encodeme;

use strict;
use Exploits;
use Subs;
use Digest::MD5 qw(md5_hex);
use MIME::Base64;

## Copy@right Alisam Technology see License.txt

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(encodeme);

my @c = Print::colors();
my @OTHERS = Exploits::OTHERS();

##
sub encodeme {
  my ($string, $scan)=@_;
  Print::separator();
  print $c[1]." $OTHERS[4]   $c[10]$string\n";
  if ($scan eq "1") { print "$c[3]".Digest::MD5->md5_hex($string)."\n"; }
  if ($scan eq "2") { print "$c[3]".encode_base64($string)."\n"; }
  if ($scan eq "3") { print "$c[3]".decode_base64($string)."\n"; }
  Print::separator();
}

1;