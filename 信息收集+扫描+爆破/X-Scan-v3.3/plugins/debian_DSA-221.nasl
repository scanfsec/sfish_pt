# This script was automatically generated from the dsa-221
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(15058);
 script_version("$Revision: 1.10 $");
 script_xref(name: "DSA", value: "221");
 script_cve_id("CVE-2002-1388");
 script_bugtraq_id(6479);

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-221 security update');
 script_set_attribute(attribute: 'description', value:
'Earl Hood, author of mhonarc, a mail to HTML converter, discovered a
cross site scripting vulnerability in this package.  A specially
crafted HTML mail message can introduce foreign scripting content in
archives, by-passing MHonArc\'s HTML script filtering.
For the current stable distribution (woody) this problem has been
fixed in version 2.5.2-1.3.
For the old stable distribution (potato) this problem has been fixed
in version 2.4.4-1.3.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2003/dsa-221');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your mhonarc package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:N/I:P/A:N');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA221] DSA-221-1 mhonarc");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-221-1 mhonarc");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'mhonarc', release: '2.2', reference: '2.4.4-1.3');
deb_check(prefix: 'mhonarc', release: '3.0', reference: '2.5.2-1.3');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
