# This script was automatically generated from the dsa-128
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(14965);
 script_version("$Revision: 1.8 $");
 script_xref(name: "DSA", value: "128");
 script_cve_id("CVE-2002-0184");
 script_bugtraq_id(4593);

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-128 security update');
 script_set_attribute(attribute: 'description', value:
'fc found a buffer overflow in the variable expansion code
used by sudo for its prompt. Since sudo is necessarily installed suid
root a local user can use this to gain root access.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2002/dsa-128');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your sudo package immediately.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA128] DSA-128-1 sudo");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-128-1 sudo");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'sudo', release: '2.2', reference: '1.6.2p2-2.2');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
