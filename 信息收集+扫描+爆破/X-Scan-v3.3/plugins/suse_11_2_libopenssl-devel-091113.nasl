
#
# (C) Tenable Network Security, Inc.
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(42856);
 script_version("$Revision: 1.1 $");
 script_name(english: "SuSE 11.2 Security Update:  libopenssl-devel (2009-11-13)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing a security patch for libopenssl-devel");
 script_set_attribute(attribute: "description", value: "The TLS/SSLv3 protocol as implemented in openssl prior to
this update was not able to associate data to a
renegotiated connection. This allowed man-in-the-middle
attackers to inject HTTP requests in a HTTPS session
without being noticed. For example Apache's mod_ssl was
vulnerable to this kind of attack because it uses openssl.
Please note that renegotiation will be disabled by this
update and may cause problems in some cases.
(CVE-2009-3555: CVSS v2 Base Score: 6.4)
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:P/A:P");
script_set_attribute(attribute: "solution", value: "Run yast to install the security patch for libopenssl-devel");
script_set_attribute(attribute: "see_also", value: "https://bugzilla.novell.com/show_bug.cgi?id=553641");
script_end_attributes();

 script_cve_id("CVE-2009-3555");
script_summary(english: "Check for the libopenssl-devel package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");
if ( rpm_check( reference:"libopenssl-devel-0.9.8k-3.5.3", release:"SUSE11.2", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"libopenssl-devel-0.9.8k-3.5.3", release:"SUSE11.2", cpu:"x86_64") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"libopenssl0_9_8-0.9.8k-3.5.3", release:"SUSE11.2", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"libopenssl0_9_8-0.9.8k-3.5.3", release:"SUSE11.2", cpu:"x86_64") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"libopenssl0_9_8-32bit-0.9.8k-3.5.3", release:"SUSE11.2", cpu:"x86_64") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"openssl-0.9.8k-3.5.3", release:"SUSE11.2", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"openssl-0.9.8k-3.5.3", release:"SUSE11.2", cpu:"x86_64") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"openssl-certs-0.9.8h-28.2.1", release:"SUSE11.2", cpu:"noarch") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"openssl-doc-0.9.8k-3.5.3", release:"SUSE11.2", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"openssl-doc-0.9.8k-3.5.3", release:"SUSE11.2", cpu:"x86_64") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
exit(0,"Host is not affected");
