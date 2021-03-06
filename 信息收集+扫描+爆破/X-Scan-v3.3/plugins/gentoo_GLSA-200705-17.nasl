# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200705-17.xml
# It is released under the Nessus Script Licence.
# The messages are release under the Creative Commons - Attribution /
# Share Alike license. See http://creativecommons.org/licenses/by-sa/2.0/
#
# Avisory is copyright 2001-2006 Gentoo Foundation, Inc.
# GLSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description)
{
 script_id(25288);
 script_version("$Revision: 1.5 $");
 script_xref(name: "GLSA", value: "200705-17");
 script_cve_id("CVE-2007-1359");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200705-17 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200705-17
(Apache mod_security: Rule bypass)


    Stefan Esser discovered that mod_security processes NULL characters as
    terminators in POST requests using the
    application/x-www-form-urlencoded encoding type, while other parsers
    used in web applications do not.
  
Impact

    A remote attacker could send a specially crafted POST request, possibly
    bypassing the module ruleset and leading to the execution of arbitrary
    code in the scope of the web server with the rights of the user running
    the web server.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All mod_security users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=www-apache/mod_security-2.1.1"
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-1359');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200705-17.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200705-17] Apache mod_security: Rule bypass');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'Apache mod_security: Rule bypass');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "www-apache/mod_security", unaffected: make_list("ge 2.1.1"), vulnerable: make_list("lt 2.1.1")
)) { security_warning(0); exit(0); }
exit(0, "Host is not affected");
