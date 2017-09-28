#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## GET FUNCTIONS 
require "$Bin/inc/funcs.pl";

## PRINT BANNER 
our ($nobanner, $output, $msource);
if (!defined $nobanner && !$nobanner) { banner(); }
else{ mtak(); ptak(); }

## CLEAN OUTPUT 
if (defined $output) { unlink $output if -e $output; }
if (defined $msource) {
    $msource=~s/\.(.*)//g;
    unlink $msource if -d $msource; mkdir $msource, 755;
}

## PASS LOGIN ##
our $password;
if ($password) { require "$Bin/inc/functions/log.pl"; }

## NO ARGUMENTS ##
our ($dork, $help, $Target, $mmd5, $mencode64, $checkVersion, $data, $uninstall, $toolInfo, $config, $interactive);
our @NoArg=($dork, $help, $Target, $mmd5, $mencode64, $checkVersion, $data, $uninstall, $toolInfo, $config, $interactive);
my $NoArg=0;
for (@NoArg) { $NoArg++ if defined $_; }
advise() if $NoArg<1;

## TOOL CONFIGURATION
require "$Bin/inc/functions/clientConf.pl";

## COMMANDE LINE ERRORS 
require "$Bin/inc/errors/useErrors.pl";

## DEFINE HTML CMS 
require "$Bin/inc/functions/checkCmsType.pl";

## CHECK IF THERE ANY ERROR IN HTML 
require "$Bin/inc/functions/checkErrors.pl";
## PORTS SCAN PROCESS
require "$Bin/inc/functions/scanPorts.pl";

## ENCODE DECODE SCAN PROCESS 
require "$Bin/inc/functions/encode.pl";

## GET ALL PARAMS TO SCAN 
require "$Bin/inc/functions/makeScan.pl";

## PRINT AND BUILD RESULTS 
require "$Bin/inc/search/print.pl";

## SERACH AND SCANS PROCESS 
require "$Bin/inc/search/process.pl";

## INDEX
require "$Bin/inc/index.pl";

1;
