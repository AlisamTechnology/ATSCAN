#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## CHECK IF THERE ANY ERROR IN HTML
our ($sp, @ERR, @V_XSS, @V_LFI, @V_AFD, @E_MICROSOFT, @E_ORACLE, @E_DB2, @E_ODBC, @E_POSTGRESQL, @E_SYBASE, @E_JBOSSWEB, @E_JDBC, @E_JAVA, @E_PHP, @E_ASP, @E_LUA, @E_UNDEFINED, @E_MARIADB,
     @E_SHELL, @c, @ErrT);
sub checkErrors { 
  my $html=$_[0];
  my $ERROR=join("|", @ERR);
  if ($html=~/$ERROR/) {

    my (@E1, @E2, @E3, @E4, @E5, @E6, @E7, @E8, @E9, @E10, @E11, @E12, @E13, @E14, @E15, @E16, @E17, @E18, @E19);
    print $c[1]."    $ErrT[18] $c[4]$ErrT[24]\n";
    for my $ERR(@ERR) {
      if ($html=~/$ERR/g) {
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
    if (@E1) { for my $E(@E1) { printALLerrors($ErrT[0], $E); } }    
    if (@E2) { for my $E(@E2) { printALLerrors($ErrT[1], $E); } }
    if (@E3) { for my $E(@E3) { printALLerrors($ErrT[2], $E); } }
    if (@E4) { for my $E(@E4) { printALLerrors($ErrT[3], $E); } }
    if (@E5) { for my $E(@E5) { printALLerrors($ErrT[4], $E); } }
    if (@E6) { for my $E(@E6) { printALLerrors($ErrT[5], $E); } }
    if (@E7) { for my $E(@E7) { printALLerrors($ErrT[6], $E); } }
    if (@E8) { for my $E(@E8) { printALLerrors($ErrT[7], $E); } }
    if (@E9) { for my $E(@E9) { printALLerrors($ErrT[8], $E); } }
    if (@E10) { for my $E(@E10) { printALLerrors($ErrT[9], $E); } }
    if (@E11) { for my $E(@E11) { printALLerrors($ErrT[10], $E); } }
    if (@E12) { for my $E(@E12) { printALLerrors($ErrT[11], $E); } }
    if (@E13) { for my $E(@E13) { printALLerrors($ErrT[12], $E); } }
    if (@E14) { for my $E(@E14) { printALLerrors($ErrT[13], $E); } }
    if (@E15) { for my $E(@E15) { printALLerrors($ErrT[14], $E); } }
    if (@E16) { for my $E(@E16) { printALLerrors($ErrT[15], $E); } }
    if (@E17) { for my $E(@E17) { printALLerrors($ErrT[16], $E); } }
    if (@E18) { for my $E(@E18) { printALLerrors($ErrT[17], $E); } }
  }
}   

## PRINT HTML ERRORS
sub printALLerrors { my ($ErrT, $E)=@_; print $c[1]."$sp $c[4]$ErrT ".$c[10]."[$E]"; print "\n"; }

1;
