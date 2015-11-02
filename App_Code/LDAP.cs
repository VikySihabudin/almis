using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.DirectoryServices;
using System.DirectoryServices.AccountManagement;

/// <summary>
/// Summary description for LDAP
/// </summary>
public class LDAP
{
    private String domainName = "PTADARO";
    private String userName = "gisldap";
    private String password = "Pwdg1sldaplagi+";

    public LDAP()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static DirectoryEntry GetDirectoryEntry()
    {
        DirectoryEntry de = new DirectoryEntry();
        de.Path = "LDAP://PTADARO";
        de.AuthenticationType = AuthenticationTypes.Secure;
        //de.Path = "LDAP://servdev.net";
        //de.AuthenticationType = AuthenticationTypes.Secure;
        return de;
    }

    public bool UserExists(string username)
    {
        DirectoryEntry de = GetDirectoryEntry();
        de.Username = "gisldap";
        de.Password = "Pwdg1sldaplagi+";
        //de.Username = "administrator";
        //de.Password = "general";
        DirectorySearcher deSearch = new DirectorySearcher();

        deSearch.SearchRoot = de;
        deSearch.Filter = "(&(objectClass=user) (|(samaccountname=" + username + ")(cn=" + username + ")))";

        SearchResultCollection results = deSearch.FindAll();

        return results.Count > 0;
    }

    public bool Login(String userName, String password)
    {
            PrincipalContext pc = new PrincipalContext(ContextType.Domain, this.domainName);
            bool isValid = false;
            isValid = pc.ValidateCredentials(userName, password);
            return isValid;
    }
}
