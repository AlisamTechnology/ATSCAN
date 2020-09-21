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
    for (@ERR) {
      if ($ht=~/$_/g) {
        if (grep( /^$_$/, @V_LFI)) { push(@E1, $_); }
        if (grep( /^$_$/, @V_XSS)) { push(@E2, $_); }
        if (grep( /^$_$/, @V_AFD)) { push(@E3, $_); }
        if (grep( /^$_$/, @E_MICROSOFT)) { push(@E4, $_); }
        if (grep( /^$_$/, @E_ORACLE)) { push(@E5, $_); }
        if (grep( /^$_$/, @E_DB2)) { push(@E6, $_); }
        if (grep( /^$_$/, @E_ODBC)) { push(@E7, $_); }
        if (grep( /^$_$/, @E_POSTGRESQL)) { push(@E8, $_); }
        if (grep( /^$_$/, @E_SYBASE)) { push(@E9, $_); }
        if (grep( /^$_$/, @E_JBOSSWEB)) { push(@E10, $_); }
        if (grep( /^$_$/, @E_JDBC)) { push(@E11, $_); }
        if (grep( /^$_$/, @E_JAVA)) { push(@E12, $_); }
        if (grep( /^$_$/, @E_PHP)) { push(@E13, $_); }
        if (grep( /^$_$/, @E_ASP)) { push(@E14, $_); }
        if (grep( /^$_$/, @E_LUA)) { push(@E15, $_); }
        if (grep( /^$_$/, @E_UNDEFINED)) { push(@E16, $_); }
        if (grep( /^$_$/, @E_MARIADB)) { push(@E17, $_); }
        if (grep( /^$_$/, @E_SHELL)) { push(@E18, $_); }
      }
    }
    if (@E1) { for (@E1) { Print::print_errors($ErrT[0], $_); } }    
    if (@E2) { for (@E2) { Print::print_errors($ErrT[1], $_); } }
    if (@E3) { for (@E3) { Print::print_errors($ErrT[2], $_); } }
    if (@E4) { for (@E4) { Print::print_errors($ErrT[3], $_); } }
    if (@E5) { for (@E5) { Print::print_errors($ErrT[4], $_); } }
    if (@E6) { for (@E6) { Print::print_errors($ErrT[5], $_); } }
    if (@E7) { for (@E7) { Print::print_errors($ErrT[6], $_); } }
    if (@E8) { for (@E8) { Print::print_errors($ErrT[7], $_); } }
    if (@E9) { for (@E9) { Print::print_errors($ErrT[8], $_); } }
    if (@E10) { for (@E10) { Print::print_errors($ErrT[9], $_); } }
    if (@E11) { for (@E11) { Print::print_errors($ErrT[10], $_); } }
    if (@E12) { for (@E12) { Print::print_errors($ErrT[11], $_); } }
    if (@E13) { for (@E13) { Print::print_errors($ErrT[12], $_); } }
    if (@E14) { for (@E14) { Print::print_errors($ErrT[13], $_); } }
    if (@E15) { for (@E15) { Print::print_errors($ErrT[14], $_); } }
    if (@E16) { for (@E16) { Print::print_errors($ErrT[15], $_); } }
    if (@E17) { for (@E17) { Print::print_errors($ErrT[16], $_); } }
    if (@E18) { for (@E18) { Print::print_errors($ErrT[17], $_); } }
  }
}   


1;