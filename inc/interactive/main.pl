#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

##############################################################################################
##############################################################################################
##
our(@c, $interactive);
my (@INTERCOMNDS, @INTERSCANS, @INTERCOMNDSFIN, %INTEROPTION);
##############################################################################################
# MAIN SCRIPT
require "$Bin/inc/interactive/intro.pl";
require "$Bin/inc/interactive/values.pl";
require "$Bin/inc/interactive/modules.pl";

while ((scalar @INTERSCANS) < 1) {
  mainAll();
}
##############################################################################################
##############################################################################################

1;
