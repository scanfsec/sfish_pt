#
# (C) Tenable Network Security, Inc.
#



include("compat.inc");

if (description) {
  script_id(17650);
  script_version ("$Revision: 1.7 $"); 

  script_cve_id("CVE-2005-0961");
  script_bugtraq_id(12943);
  script_xref(name:"OSVDB", value:"15095");

  script_name(english:"Horde Parent Frame Page Title XSS");

 script_set_attribute(attribute:"synopsis", value:
"The remote web server contains a PHP script that is prone to a cross-
site scripting attack." );
 script_set_attribute(attribute:"description", value:
"The version of Horde installed on the remote host suffers from a
cross-site scripting vulnerability in which an attacker can inject
arbitrary HTML and script code via the page title of a parent frame,
enabling him to steal cookie-based authentication credentials and
perform other such attacks." );
 script_set_attribute(attribute:"see_also", value:"http://lists.horde.org/archives/announce/2005/000176.html" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to Horde version 3.0.4 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:N/I:P/A:N" );
script_end_attributes();

 
  summary["english"] = "Checks for parent page title XSS vulnerability in Horde";
  script_summary(english:summary["english"]);
 
  script_category(ACT_GATHER_INFO);
  script_family(english:"CGI abuses : XSS");
 
  script_copyright(english:"This script is Copyright (C) 2005-2009 Tenable Network Security, Inc.");

  script_dependencies("horde_detect.nasl");
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_require_ports("Services/www", 80);

  exit(0);
}

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");

port = get_http_port(default:80);
if (!can_host_php(port:port)) exit(0);

# Test an install.
install = get_kb_item(string("www/", port, "/horde"));
if (isnull(install)) exit(0);
matches = eregmatch(string:install, pattern:"^(.+) under (/.*)$");
if (!isnull(matches)) {
  ver = matches[1];

  if (ver =~ "^([12]\.|3\.0\.([0-3]|4-RC))")
  {
   security_warning(port);
   set_kb_item(name: 'www/'+port+'/XSS', value: TRUE);
  }
}
