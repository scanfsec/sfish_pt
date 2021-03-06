# This script was automatically generated from the 733-1 Ubuntu Security Notice
# It is released under the Nessus Script Licence.
# Ubuntu Security Notices are (C) 2005 Canonical, Inc.
# USN2nasl Convertor is (C) 2005 Tenable Network Security, Inc.
# See http://www.ubuntulinux.org/usn/
# Ubuntu(R) is a registered trademark of Canonical, Inc.

if (! defined_func("bn_random")) exit(0);
include('compat.inc');

if (description) {
script_id(36746);
script_version("$Revision: 1.1 $");
script_copyright("Ubuntu Security Notice (C) 2009 Canonical, Inc. / NASL script (C) 2009 Tenable Network Security, Inc.");
script_category(ACT_GATHER_INFO);
script_family(english: "Ubuntu Local Security Checks");
script_dependencies("ssh_get_info.nasl");
script_require_keys("Host/Ubuntu", "Host/Ubuntu/release", "Host/Debian/dpkg-l");

script_xref(name: "USN", value: "733-1");
script_summary(english:"evolution-data-server vulnerability");
script_name(english:"USN733-1 : evolution-data-server vulnerability");
script_set_attribute(attribute:'synopsis', value: 'These remote packages are missing security patches :
- evolution-data-server 
- evolution-data-server-common 
- evolution-data-server-dbg 
- evolution-data-server-dev 
- libcamel1.2-10 
- libcamel1.2-8 
- libcamel1.2-dev 
- libebook1.2-5 
- libebook1.2-9 
- libebook1.2-dev 
- libecal1.2-3 
- libecal1.2-7 
- libecal1.2-dev 
- libedata-book1.2-2 
- libedata-book1.2-dev 
- libedata-cal1.2-1 
- libedata-cal1.2-6 
- libedata-cal1.2-dev 
- libedataserver1.2-7 
- libedataserver1.2-9 
- libedataserver1.2-dev 
- li
[...]');
script_set_attribute(attribute:'description', value: 'It was discovered that the Base64 encoding functions in
evolution-data-server did not properly handle large strings. If a user were
tricked into opening a specially crafted image file, or tricked into
connecting to a malicious server, an attacker could possibly execute
arbitrary code with user privileges.');
script_set_attribute(attribute:'solution', value: 'Upgrade to : 
- evolution-data-server-1.12.1-0ubuntu2.1 (Ubuntu 7.10)
- evolution-data-server-common-1.12.1-0ubuntu2.1 (Ubuntu 7.10)
- evolution-data-server-dbg-1.12.1-0ubuntu2.1 (Ubuntu 7.10)
- evolution-data-server-dev-1.12.1-0ubuntu2.1 (Ubuntu 7.10)
- libcamel1.2-10-1.12.1-0ubuntu2.1 (Ubuntu 7.10)
- libcamel1.2-8-1.6.1-0ubuntu7.2 (Ubuntu 6.06)
- libcamel1.2-dev-1.12.1-0ubuntu2.1 (Ubuntu 7.10)
- libebook1.2-5-1.6.1-0ubuntu7.2 (Ubuntu 6.06)
- libebook1.2-9-1.12.1-0ubuntu2.1 (Ubuntu 7.10)
- libebook1.2-dev
[...]');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_end_attributes();

script_cve_id("CVE-2009-0587");
exit(0);
}

include('ubuntu.inc');

if ( ! get_kb_item('Host/Ubuntu/release') ) exit(1, 'Could not gather the list of packages');

extrarep = NULL;

found = ubuntu_check(osver: "7.10", pkgname: "evolution-data-server", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package evolution-data-server-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to evolution-data-server-1.12.1-0ubuntu2.1
');
}
found = ubuntu_check(osver: "7.10", pkgname: "evolution-data-server-common", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package evolution-data-server-common-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to evolution-data-server-common-1.12.1-0ubuntu2.1
');
}
found = ubuntu_check(osver: "7.10", pkgname: "evolution-data-server-dbg", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package evolution-data-server-dbg-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to evolution-data-server-dbg-1.12.1-0ubuntu2.1
');
}
found = ubuntu_check(osver: "7.10", pkgname: "evolution-data-server-dev", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package evolution-data-server-dev-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to evolution-data-server-dev-1.12.1-0ubuntu2.1
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libcamel1.2-10", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libcamel1.2-10-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libcamel1.2-10-1.12.1-0ubuntu2.1
');
}
found = ubuntu_check(osver: "6.06", pkgname: "libcamel1.2-8", pkgver: "1.6.1-0ubuntu7.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libcamel1.2-8-',found,' is vulnerable in Ubuntu 6.06
Upgrade it to libcamel1.2-8-1.6.1-0ubuntu7.2
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libcamel1.2-dev", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libcamel1.2-dev-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libcamel1.2-dev-1.12.1-0ubuntu2.1
');
}
found = ubuntu_check(osver: "6.06", pkgname: "libebook1.2-5", pkgver: "1.6.1-0ubuntu7.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libebook1.2-5-',found,' is vulnerable in Ubuntu 6.06
Upgrade it to libebook1.2-5-1.6.1-0ubuntu7.2
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libebook1.2-9", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libebook1.2-9-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libebook1.2-9-1.12.1-0ubuntu2.1
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libebook1.2-dev", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libebook1.2-dev-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libebook1.2-dev-1.12.1-0ubuntu2.1
');
}
found = ubuntu_check(osver: "6.06", pkgname: "libecal1.2-3", pkgver: "1.6.1-0ubuntu7.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libecal1.2-3-',found,' is vulnerable in Ubuntu 6.06
Upgrade it to libecal1.2-3-1.6.1-0ubuntu7.2
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libecal1.2-7", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libecal1.2-7-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libecal1.2-7-1.12.1-0ubuntu2.1
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libecal1.2-dev", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libecal1.2-dev-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libecal1.2-dev-1.12.1-0ubuntu2.1
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libedata-book1.2-2", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libedata-book1.2-2-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libedata-book1.2-2-1.12.1-0ubuntu2.1
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libedata-book1.2-dev", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libedata-book1.2-dev-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libedata-book1.2-dev-1.12.1-0ubuntu2.1
');
}
found = ubuntu_check(osver: "6.06", pkgname: "libedata-cal1.2-1", pkgver: "1.6.1-0ubuntu7.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libedata-cal1.2-1-',found,' is vulnerable in Ubuntu 6.06
Upgrade it to libedata-cal1.2-1-1.6.1-0ubuntu7.2
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libedata-cal1.2-6", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libedata-cal1.2-6-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libedata-cal1.2-6-1.12.1-0ubuntu2.1
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libedata-cal1.2-dev", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libedata-cal1.2-dev-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libedata-cal1.2-dev-1.12.1-0ubuntu2.1
');
}
found = ubuntu_check(osver: "6.06", pkgname: "libedataserver1.2-7", pkgver: "1.6.1-0ubuntu7.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libedataserver1.2-7-',found,' is vulnerable in Ubuntu 6.06
Upgrade it to libedataserver1.2-7-1.6.1-0ubuntu7.2
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libedataserver1.2-9", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libedataserver1.2-9-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libedataserver1.2-9-1.12.1-0ubuntu2.1
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libedataserver1.2-dev", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libedataserver1.2-dev-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libedataserver1.2-dev-1.12.1-0ubuntu2.1
');
}
found = ubuntu_check(osver: "6.06", pkgname: "libedataserverui1.2-6", pkgver: "1.6.1-0ubuntu7.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libedataserverui1.2-6-',found,' is vulnerable in Ubuntu 6.06
Upgrade it to libedataserverui1.2-6-1.6.1-0ubuntu7.2
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libedataserverui1.2-8", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libedataserverui1.2-8-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libedataserverui1.2-8-1.12.1-0ubuntu2.1
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libedataserverui1.2-dev", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libedataserverui1.2-dev-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libedataserverui1.2-dev-1.12.1-0ubuntu2.1
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libegroupwise1.2-13", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libegroupwise1.2-13-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libegroupwise1.2-13-1.12.1-0ubuntu2.1
');
}
found = ubuntu_check(osver: "6.06", pkgname: "libegroupwise1.2-9", pkgver: "1.6.1-0ubuntu7.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libegroupwise1.2-9-',found,' is vulnerable in Ubuntu 6.06
Upgrade it to libegroupwise1.2-9-1.6.1-0ubuntu7.2
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libegroupwise1.2-dev", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libegroupwise1.2-dev-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libegroupwise1.2-dev-1.12.1-0ubuntu2.1
');
}
found = ubuntu_check(osver: "6.06", pkgname: "libexchange-storage1.2-1", pkgver: "1.6.1-0ubuntu7.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libexchange-storage1.2-1-',found,' is vulnerable in Ubuntu 6.06
Upgrade it to libexchange-storage1.2-1-1.6.1-0ubuntu7.2
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libexchange-storage1.2-3", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libexchange-storage1.2-3-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libexchange-storage1.2-3-1.12.1-0ubuntu2.1
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libexchange-storage1.2-dev", pkgver: "1.12.1-0ubuntu2.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libexchange-storage1.2-dev-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libexchange-storage1.2-dev-1.12.1-0ubuntu2.1
');
}

if (w) { security_hole(port: 0, extra: extrarep); }
else exit(0, "Host is not vulnerable");
