#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## ALL ARRAYS
our (@c, @XSS, @LFI, @RFI, @ADFWP, @ADMIN, @SUBDOMAIN, @UPLOAD, @ZIP, @TT, @OTHERS, @AUTH, @ErrT, @DT, @DS, @cms, @SCAN_TITLE, @E_MICROSOFT, @E_ORACLE, @E_DB2, @E_ODBC, @E_POSTGRESQL, @E_SYBASE,
     @E_JBOSSWEB, @E_JDBC, @E_JAVA, @E_PHP, @E_ASP, @E_LUA, @E_UNDEFINED, @E_MARIADB, @E_SHELL, @strings, @browserlangs, @googleDomains, @Ids, @MsIds, @sys, @vary, @buildArrays, @dorks, @z, @ZT, 
     @userArraysList, @exploits, @data, @proxies, @aTsearch, @aTscans, @defaultHeaders, @userHeaders, @aTtargets, @aTcopy, @ports, @motor, @motors, @systems, @mrands, @allMotors, @V_WP, @V_JOOM, @V_TP, @V_SMF, @V_VB, @V_MyBB,
     @V_CF, @V_DRP, @V_PN, @V_AT, @V_PHPN, @V_MD, @V_ACM, @V_SS, @V_MX, @V_XO, @V_OSC, @V_PSH, @V_BB2, @V_MG, @V_ZC, @V_CC5, @V_OCR, @V_XSS, @V_LFI,@V_TODO, @V_AFD, @TODO, @V_VALID, @ERR, @CMS,
     @validTexts, @exclude)=();

## SEPARATORS
require "$Bin/inc/theme/separators.pl";

## CONFIGURE 
require "$Bin/inc/conf/configure.pl";

## GET FUNCTIONS 
require "$Bin/inc/header.pl";

1;
