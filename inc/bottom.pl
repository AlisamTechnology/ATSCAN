#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## EXIT
our ($checkVersion, $help, $updtd, $uninstall, $toolInfo, $config);
if (!defined $checkVersion && !defined $help && !defined $updtd && !defined $uninstall && !defined $toolInfo && !defined $config) { subfin(); logoff(); }

1;
