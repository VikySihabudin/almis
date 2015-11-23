using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using Waindo.Conn;

public partial class Login : System.Web.UI.Page
{
    private LDAP ldap = new LDAP();

    DataTable dt;
    private string groupsid;

    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    SqlDataAdapter sda;
    SqlConnection conn;
    string query;


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strcon = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);

        int LDAPx = 0;

        if (LDAPx == 0)
        {
            SqlCommand com = new SqlCommand("CheckUser", con);
            com.CommandType = CommandType.StoredProcedure;
            SqlParameter p1 = new SqlParameter("username", txtusername.Text);
            SqlParameter p2 = new SqlParameter("password", txtpassword.Text);
            com.Parameters.Add(p1);
            com.Parameters.Add(p2);
            con.Open();
            
            SqlDataReader rd = com.ExecuteReader();
            if (rd.HasRows)
            {
                rd.Read();
                Session.Timeout = 600;
                Session["userid"] = rd["userid"].ToString();
                Session["namass"] = rd["namass"].ToString();
                Session["groups"] = rd["groups"].ToString();
                Session["lanjut"] = rd["lanjut"].ToString();
                Session["except"] = rd["excepts"].ToString();
                Session["groupNm"] = rd["groupNm"].ToString();
                
                
                Response.Redirect("Pages/home.aspx");
            }
            else
            {
                Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
                Response.Write("alert('Username atau Password Salah..');");
                
                Response.Write("location.href = 'login.aspx';");
                Response.Write("</script>");

            }
            con.Close();
            
        }

        else if (ldap.Login(txtusername.Text, txtpassword.Text))
        {
            DataTable dt = getUserDetail(txtusername.Text);
            if (dt == null)
            {
                Response.Write("<script language=\"javascript\" type=\"text/javascript\">alert('Maaf anda tidak memiliki hak akses aplikasi ini');</script>");
                //Response.Redirect("Login.aspx");
            }
            else
            {
                var ipaddress = "";
                ipaddress = GetUserIP().ToString();
                Session.Timeout = 600;
                var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                var stringChars = new char[15];
                var random = new Random();

                //for (int i = 0; i < stringChars.Length; i++)
                //{
                //    stringChars[i] = chars[random.Next(chars.Length)];
                //}

                //var finalString = new String(stringChars);

                //Session["idunik"] = finalString;
                //Session["userID"] = (string)dt.Rows[0]["usrgpUsrId"].ToString();
                //Session["userNames"] = (string)dt.Rows[0]["usersNames"].ToString();
                //Session["groupID"] = (string)dt.Rows[0]["usrgpGrpId"].ToString();
                //Session["groupName"] = (string)dt.Rows[0]["groupNames"].ToString();
                //Session["usersWilay"] = (string)dt.Rows[0]["usersWilay"].ToString();
                //Session["ipaddress"] = ipaddress.ToString();
                //string groupid = (string)dt.Rows[0]["usrgpGrpId"].ToString();
                //if (groupid.Equals("23") || groupid.Equals("24"))
                //{
                //    Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
                //    Response.Write("location.href = 'pages/MenuAwalInspeksi.aspx';");
                //    Response.Write("</script>");
                //}

                //Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
                //Response.Write("location.href = 'pages/MenuAwalFlex.aspx';");
                //Response.Write("</script>");
                ////Response.Redirect("pages/MenuUtama.aspx");

                SqlCommand com = new SqlCommand("CheckUser", con);
                com.CommandType = CommandType.StoredProcedure;
                SqlParameter p1 = new SqlParameter("username", txtusername.Text);
                SqlParameter p2 = new SqlParameter("password", txtpassword.Text);
                com.Parameters.Add(p1);
                com.Parameters.Add(p2);
                con.Open();

                SqlDataReader rd = com.ExecuteReader();
                if (rd.HasRows)
                {
                    rd.Read();
                    Session.Timeout = 600;
                    Session["userid"] = rd["userid"].ToString();
                    Session["namass"] = rd["namass"].ToString();
                    Session["groups"] = rd["groups"].ToString();
                    Session["lanjut"] = rd["lanjut"].ToString();
                    Session["except"] = rd["excepts"].ToString();

                    Response.Redirect("pages/home.aspx");
                }
                else
                {
                    Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
                    Response.Write("alert('Username atau Password Salah..');");
                    Response.Write("location.href = 'login.aspx';");
                    Response.Write("</script>");

                }
                dt.Dispose();

            }

        }


    }
    private string GetUserIP()
    {
        string ipList = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (!string.IsNullOrEmpty(ipList))
        {
            return ipList.Split(',')[0];
        }

        return Request.ServerVariables["REMOTE_ADDR"];
    }

    public DataTable getDataTable(string query)
    {
        dt = new DataTable();
        conn = new SqlConnection(connstring);
        conn.Open();
        sda = new SqlDataAdapter(query, conn);
        dt = new DataTable();
        sda.Fill(dt);
        conn.Close();
        return dt;
    }

    public DataTable getUserDetail(String name)
    {
        String sql = "";
        string ipaddress = "";
        string peremban = "";
        System.Web.HttpBrowserCapabilities browser = Request.Browser;
        peremban = browser.Type;
        if (peremban == "Desktop")
        {
            peremban = "Chrome";
        }
        else
        {
            peremban = peremban;
        }
        ipaddress = GetUserIP().ToString();
        //conn = new Connection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString());
        //string strcon = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ConnectionString;

        try
        {
            sql = " select a.UsrgrpUserss,c.UserssNamess,b.GroupIDents,b.GroupsNamess "
            + "from USRGRP a "
            + "    left join GROUPS b ON a.UsrgrpGroups=b.GroupIDents "
              + "  left join USERSS c ON a.UsrgrpUserss=c.UserssIDents "
                    + "where a.UsrgrpUserss ='" + name + "' "
                + "";

            dt = getDataTable(sql);
            if (dt.Rows.Count < 1)
            {
                dt = null;
            }
            //string sql2 = "INSERT INTO PGN.USERS_LOG(usersIdsss,logontime,keterangan) values ('" + name + "',getdate(),'" + ipaddress + ", " + peremban + ", Login') ";
            //dt2 = conn.sqlQuery(sql2);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }

        return dt;
    }

}
//}
