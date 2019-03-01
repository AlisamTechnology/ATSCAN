#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## DELETED TOOTL FILES
my @deteted_files=(
                   $Bin."/inc/theme/separators.pl",
                   $Bin."/inc/theme/colors.pl",
                   $Bin."/inc/index.pl",
                   $Bin."/inc/functions/ArgsList.pl",
                   $Bin."/inc/bottom.pl",
                   $Bin."/inc/header.pl",
				   $Bin."/inc/conf/usr/atscan"
				   );

for (@deteted_files) { unlink $_ if -e $_; }

## ALL ARRAYS
our (@XSS, @LFI, @RFI, @ADFWP, @ADMIN, @SUBDOMAIN, @UPLOAD, @ZIP, @TT, @OTHERS, @AUTH, @ErrT, @DT, @DS, @cms, @SCAN_TITLE, @E_MICROSOFT, @E_ORACLE, @E_DB2, @E_ODBC, @E_POSTGRESQL, @E_SYBASE,
     @E_JBOSSWEB, @E_JDBC, @E_JAVA, @E_PHP, @E_ASP, @E_LUA, @E_UNDEFINED, @E_MARIADB, @E_SHELL, @strings, @browserlangs, @googleDomains, @Ids, @MsIds, @sys, @vary, @buildArrays, @dorks, @z, @ZT, 
     @payloads, @exploits, @data, @proxies, @aTsearch, @aTscans, @defaultHeaders, @userHeaders, @aTtargets, @aTcopy, @ports, @motor, @motors, @systems, @mrands, @allMotors, @V_WP, @V_JOOM, @V_TP, @V_SMF, @V_VB, @V_MyBB,
     @V_CF, @V_DRP, @V_PN, @V_AT, @V_PHPN, @V_MD, @V_ACM, @V_SS, @V_MX, @V_XO, @V_OSC, @V_PSH, @V_BB2, @V_MG, @V_ZC, @V_CC5, @V_OCR, @V_XSS, @V_LFI,@V_TODO, @V_AFD, @TODO, @V_VALID, @ERR, @CMS,
     @validTexts, @excludes)=();

## SET COLORS
## Negro       0;30     Gris Obscuro  1;30
## Azul        0;34     Azul Claro    1;34
## Verde       0;32     Verde Claro   1;32
## Cyan        0;36     Cyan Claro    1;36
## Rojo        0;31     Rojo Claro    1;31
## Purpura     0;35     Fiuscha       1;35
## Café        0;33     Amarillo      1;33
## Gris Claro  0;37     Blanco        1;37

my $col="\033[0;30m \033[1;30m \033[0;31m \033[0;32m \033[0;33m \033[1;33m \033[0;34m \033[0;35m \033[0;36m \033[1;36m \033[0;37m \033[1;37m \033[1;34m \033[1;31m \033[1;32m";
our @c;
if ($^O!~/Win/) { @c=split / /, $col; }
else{ $col=" ," x 13; $col.=" "; @c=split /,/, $col; }

## SEPARATORS
sub mtak { my $sn1="_" x 80; print $c[1]."$sn1\n"; }
sub dpoints { my $sn2=":" x 66; print $c[1]."    "; timer(); print "$sn2\n"; }
sub ptak { my $sn3="-" x 80; print $c[1]."$sn3\n"; }
sub points  { my $sn4="=" x 76; print $c[1]."    $sn4\n"; }
sub ltak { my $sn5="-" x 80; print $c[1]."$sn5\n"; }
sub stak { my $sn6="-" x 76; print $c[1]."    $sn6\n"; }
sub stakScan { my $ee=":" x 68; print $c[1]."$ee\n"; }
our $sp=" " x 11;

## CONFIGURE 
require "$Bin/inc/conf/configure.pl";

## ADVISE
sub advise {
  if (-e "/usr/bin/atscan") {
    print $c[11]."[!] $OTHERS[5]:$c[5] atscan$c[11] [$c[5]options$c[11]] or $c[5]atscan$c[11] [$c[5]--help$c[11]|$c[5]-h$c[11]|$c[5]-?$c[11]] or $c[5]atscan$c[11] [$c[5]--interactive$c[11]]\n";
  }else{
    print $c[5]."[!] $OTHERS[5]: perl ./",basename($0)," $TT[8] ./",basename($0)," $TT[9]\n";
  }
  logoff();
}

## EXIT 
sub logoff { deleteLists(); exit(); }

## BANNER
sub banner { require "$Bin/inc/theme/banner.pl"; }

## BAD ARGUMENTS
sub badArgs { banner(); advise(); }


1;
