package Checkerrors;

use strict;
use Socket;
use Exploits;
use Print;

my @ISA = qw(Exporter);
my @EXPORT_OK = qw(check_Errors);

## Copy@right Alisam Technology see License.txt

my @V_XSS        = Exploits::V_XSS(); 
my @V_LFI        = Exploits::V_LFI(); 
my @V_AFD        = Exploits::V_AFD(); 
my @E_MICROSOFT  = Exploits::E_MICROSOFT(); 
my @E_ORACLE     = Exploits::E_ORACLE(); 
my @E_DB2        = Exploits::E_DB2(); 
my @E_ODBC       = Exploits::E_ODBC(); 
my @E_POSTGRESQL = Exploits::E_POSTGRESQL(); 
my @E_SYBASE     = Exploits::E_SYBASE(); 
my @E_JBOSSWEB   = Exploits::E_JBOSSWEB();
my @E_JDBC       = Exploits::E_JDBC(); 
my @E_JAVA       = Exploits::E_JAVA(); 
my @E_PHP        = Exploits::E_PHP(); 
my @E_ASP        = Exploits::E_ASP(); 
my @E_LUA        = Exploits::E_LUA(); 
my @E_UNDEFINED  = Exploits::E_UNDEFINED(); 
my @E_MARIADB    = Exploits::E_MARIADB(); 
my @E_SHELL      = Exploits::E_SHELL();
my @ERR=(@V_LFI, @V_XSS, @V_AFD, @E_MICROSOFT, @E_ORACLE, @E_DB2, @E_ODBC, @E_POSTGRESQL, @E_SYBASE, @E_JBOSSWEB, @E_JDBC, @E_JAVA, @E_PHP, @E_ASP, @E_UNDEFINED, @E_MARIADB, @E_SHELL);
my @ErrT = Exploits::ErrT();

#############################################################################################################################
## DEFINE ERRORS
sub check_Errors {
  my $ht = $_[0];  
  my $ERROR=join("|", @ERR);
  if ($ht =~ /$ERROR/) {
    Print::title_errors();
    my (@E1, @E2, @E3, @E4, @E5, @E6, @E7, @E8, @E9, @E10, @E11, @E12, @E13, @E14, @E15, @E16, @E17, @E18, @E19);
    for my $ERR(@ERR) {
      if ($ht=~/$ERR/g) {
        if (grep( /^$ERR$/, @V_LFI)) { push(@E1, $ERR); }
        if (grep( /^$ERR$/, @V_XSS)) { push(@E2, $ERR); }
        if (grep( /^$ERR$/, @V_AFD)) { push(@E3, $ERR); }
        if (grep( /^$ERR$/, @E_MICROSOFT)) { push(@E4, $ERR); }
        if (grep( /^$ERR$/, @E_ORACLE)) { push(@E5, $ERR); }
        if (grep( /^$ERR$/, @E_DB2)) { push(@E6, $ERR); }
        if (grep( /^$ERR$/, @E_ODBC)) { push(@E7, $ERR); }
        if (grep( /^$ERR$/, @E_POSTGRESQL)) { push(@E8, $ERR); }
        if (grep( /^$ERR$/, @E_SYBASE)) { push(@E9, $ERR); }
        if (grep( /^$ERR$/, @E_JBOSSWEB)) { push(@E10, $ERR); }
        if (grep( /^$ERR$/, @E_JDBC)) { push(@E11, $ERR); }
        if (grep( /^$ERR$/, @E_JAVA)) { push(@E12, $ERR); }
        if (grep( /^$ERR$/, @E_PHP)) { push(@E13, $ERR); }
        if (grep( /^$ERR$/, @E_ASP)) { push(@E14, $ERR); }
        if (grep( /^$ERR$/, @E_LUA)) { push(@E15, $ERR); }
        if (grep( /^$ERR$/, @E_UNDEFINED)) { push(@E16, $ERR); }
        if (grep( /^$ERR$/, @E_MARIADB)) { push(@E17, $ERR); }
        if (grep( /^$ERR$/, @E_SHELL)) { push(@E18, $ERR); }
      }
    }
    if (@E1) { for my $E(@E1) { Print::print_errors($ErrT[0], $E); } }    
    if (@E2) { for my $E(@E2) { Print::print_errors($ErrT[1], $E); } }
    if (@E3) { for my $E(@E3) { Print::print_errors($ErrT[2], $E); } }
    if (@E4) { for my $E(@E4) { Print::print_errors($ErrT[3], $E); } }
    if (@E5) { for my $E(@E5) { Print::print_errors($ErrT[4], $E); } }
    if (@E6) { for my $E(@E6) { Print::print_errors($ErrT[5], $E); } }
    if (@E7) { for my $E(@E7) { Print::print_errors($ErrT[6], $E); } }
    if (@E8) { for my $E(@E8) { Print::print_errors($ErrT[7], $E); } }
    if (@E9) { for my $E(@E9) { Print::print_errors($ErrT[8], $E); } }
    if (@E10) { for my $E(@E10) { Print::print_errors($ErrT[9], $E); } }
    if (@E11) { for my $E(@E11) { Print::print_errors($ErrT[10], $E); } }
    if (@E12) { for my $E(@E12) { Print::print_errors($ErrT[11], $E); } }
    if (@E13) { for my $E(@E13) { Print::print_errors($ErrT[12], $E); } }
    if (@E14) { for my $E(@E14) { Print::print_errors($ErrT[13], $E); } }
    if (@E15) { for my $E(@E15) { Print::print_errors($ErrT[14], $E); } }
    if (@E16) { for my $E(@E16) { Print::print_errors($ErrT[15], $E); } }
    if (@E17) { for my $E(@E17) { Print::print_errors($ErrT[16], $E); } }
    if (@E18) { for my $E(@E18) { Print::print_errors($ErrT[17], $E); } }
  }
}   


1;