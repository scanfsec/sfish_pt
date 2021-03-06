# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200609-08.xml
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
 script_id(22353);
 script_version("$Revision: 1.4 $");
 script_xref(name: "GLSA", value: "200609-08");
 script_cve_id("CVE-2006-2802");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200609-08 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200609-08
(xine-lib: Buffer overflows)


    xine-lib contains buffer overflows in the processing of AVI.
    Additionally, xine-lib is vulnerable to a buffer overflow in the HTTP
    plugin (xineplug_inp_http.so) via a long reply from an HTTP server.
  
Impact

    An attacker could trigger the buffer overflow vulnerabilities by
    enticing a user to load a specially crafted AVI file in xine. This
    might result in the execution of arbitrary code with the rights of the
    user running xine. Additionally, a remote HTTP server serving a xine
    client a specially crafted reply could crash xine and possibly execute
    arbitrary code.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All xine-lib users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=media-libs/xine-lib-1.1.2-r2"
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-2802');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200609-08.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200609-08] xine-lib: Buffer overflows');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'xine-lib: Buffer overflows');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "media-libs/xine-lib", unaffected: make_list("ge 1.1.2-r2"), vulnerable: make_list("lt 1.1.2-r2")
)) { security_warning(0); exit(0); }
exit(0, "Host is not affected");
