#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if(description)
{
 script_id(11997);
 script_version("$Revision: 1.6 $");

 script_name(english:"DSSAGENT Software Detection");

 script_set_attribute(attribute:"synopsis", value:
"A potentially unwanted program is installed on this host." );
 script_set_attribute(attribute:"description", value:
"The remote host is using the DSSAGENT program.  
You should ensure that:
- the user intended to install DSSAGENT (it is sometimes silently 
  installed) 
- the use of DSSAGENT matches your corporate mandates and security 
  policies.

To remove this sort of software, you may wish to check out ad-aware or 
spybot." );
 script_set_attribute(attribute:"see_also", value:"http://www.safersite.com/PestInfo/d/dssagent.asp" );
 script_set_attribute(attribute:"solution", value: "Uninstall this software");
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_end_attributes();

 script_summary(english:"DSSAGENT detection");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2004-2009 Tenable Network Security, Inc.");
 script_family(english:"Windows");
 script_dependencies("smb_hotfixes.nasl");
 script_require_keys("SMB/registry_full_access");
 script_require_ports(139, 445);
 exit(0);
}

# start the script

include("smb_func.inc");
if ( ! get_kb_item("SMB/registry_full_access") ) exit(0);

path[0] = "software\broderbund software\dss";
path[1] = "software\broderbund software\dss";



port = kb_smb_transport();
if(!port || ! get_port_state(port) )exit(0);

login = kb_smb_login();
pass  = kb_smb_password();
domain = kb_smb_domain();

          
soc = open_sock_tcp(port);
if(!soc) exit(0);

session_init(socket:soc, hostname:kb_smb_name());
r = NetUseAdd(login:login, password:pass, domain:domain, share:"IPC$");
if ( r != 1 ) exit(0);

handle = RegConnectRegistry(hkey:HKEY_LOCAL_MACHINE);
if ( isnull(handle) )
{
 NetUseDel();
 exit(0);
}


for (i=0; path[i]; i++) {
       key_h = RegOpenKey(handle:handle, key:path[i], mode:MAXIMUM_ALLOWED);
       if ( !isnull(key_h) ) 
       { 
         RegCloseKey(handle:key_h);
         RegCloseKey(handle:handle);
	 security_hole(kb_smb_transport()); 
	 NetUseDel();
	 exit(0);
       }
}


RegCloseKey(handle:handle);
NetUseDel();
