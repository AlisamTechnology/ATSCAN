package Login;

use strict;
use warnings;
use FindBin '$Bin';
use Term::ReadKey;
use Print;
use Digest::MD5;
use Exploits;

## Copy@right Alisam Technology see License.txt

my @ISA       = qw(Exporter);
my @EXPORT_OK = qw(login);
my @AUTH      = Exploits::AUTH();
my @c         = Print::colors();

my $passwd;
sub questionlog {
  print $c[4]."[!] $AUTH[0] ";
  ReadMode 2;
  chomp($passwd=ReadLine(0));
  ReadMode 0;
  return $passwd;
}

sub login {
  my $password = $_[0];
  $passwd = questionlog();
  $passwd = Digest::MD5::md5_hex($passwd);
  if ($password ne $passwd) { 
    print $c[2]."\n[i] $AUTH[1]\n"; 
	$passwd = questionlog();
  }
  print "$c[3] Logged in!\n"; 
  Print::separaBlocks();
}


1;
