using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;


public partial class Pages_UserManagementList : System.Web.UI.Page
{
    DataTable dt;
    SqlConnection conn;
    SqlDataAdapter sda;

    protected String userid = "";
    protected String groups = "";
    protected String UserManagementView = "";
    protected String UserManagementEdit = "";
    protected String UserManagementDelete = "";
    protected String UserManagementAssign = "";

    string query;
    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        HakAkses();
        isiTeknis();

        bool normal = true;
        if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());

    }

    private void HakAkses()
    {

        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();

            if (Session["groups"] is object)
            {
                groups = Session["groups"].ToString();

            }

        }

        if (!(Session["userid"] is object))
        {
            Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
            Response.Write("alert('Session sudah habis. Silakan login kembali.');");
            Response.Write("location.href = '../Pages/login.aspx';");
            Response.Write("</script>");
        }

        ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
        eSTP.Datas();
        DataSet ds = new DataSet();

        ds = eSTP.List8("P_MENU", "CHA", "", groups, "", "", "", "", "");

        dt = ds.Tables[0];

        UserManagementEdit = dt.Rows[10]["UserManagementEdit"].ToString(); //0
        UserManagementDelete = dt.Rows[10]["UserManagementDelete"].ToString(); //1
        UserManagementView = dt.Rows[10]["UserManagement"].ToString(); //2
        UserManagementAssign = dt.Rows[10]["UserManagementAssign"].ToString(); //3

        dt.Dispose();

        if (groups.ToString() != "1")
        {

            if (UserManagementView.ToString() != "1")
            {
                if (groups.ToString() != "1")
                {
                    Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
                    Response.Write("alert('Anda Tidak Memiliki Akses Untuk Melihat Modul Ini');");
                    Response.Write("location.href = '../Pages_Admintools/home.aspx';");
                    Response.Write("</script>");
                }
            }
        }
    }

    private string RemoveWhiteSpace(string value)
    {
        value = value.Replace("&", "&amp;");
        value = value.Replace("<", "&lt;");
        value = value.Replace(">", "&gt;");
        value = value.Replace("'", "&apos;");
        //value = value.Replace(",", ".");
        value = value.Replace(@"\", "&quot;");
        return value;
    }

    private bool ServiceSelect(string sm)
    {

        switch (sm)
        {
            case "L":

                var param1L = Request.Params["param1"].ToString();
                ALMIS.ExecuteSTP eSTP_L = new ALMIS.ExecuteSTP();
                eSTP_L.Datas();
                DataSet ds_L = new DataSet();
                ds_L = eSTP_L.List10("P_USERSS", param1L, "", "", "", "", "", "", "","","");

                dt = ds_L.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");

               

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UserssIDents"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UserssNamess"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UserssGroups"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UserrsActive"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UserssKodper"].ToString()) + "</cell>");
                    if (groups.ToString() == "1")
                    {

                        Response.Write("<cell>" + RemoveWhiteSpace("View^UserManagementForm.aspx?rand=" + r.Next() + "&param1=V" + "&param2=" + dt.Rows[i]["UserssIDents"].ToString() + "") + "</cell>");
                        Response.Write("<cell>" + RemoveWhiteSpace("Edit^UserManagementForm.aspx?rand=" + r.Next() + "&param1=E" + "&param2=" + dt.Rows[i]["UserssIDents"].ToString() + "") + "</cell>");
                        Response.Write("<cell>" + RemoveWhiteSpace("Delete^UserManagementForm.aspx?rand=" + r.Next() + "&param1=D" + "&param2=" + dt.Rows[i]["UserssIDents"].ToString() + "") + "</cell>");
                    }

                    else
                    {
                        if (UserManagementView.ToString() == "1")
                        {
                            Response.Write("<cell>" + RemoveWhiteSpace("View^UserManagementForm.aspx?rand=" + r.Next() + "&param1=V" + "&param2=" + dt.Rows[i]["UserssIDents"].ToString() + "") + "</cell>");
                        }
                        if (UserManagementEdit.ToString() == "1")
                        {
                            Response.Write("<cell>" + RemoveWhiteSpace("Edit^UserManagementForm.aspx?rand=" + r.Next() + "&param1=E" + "&param2=" + dt.Rows[i]["UserssIDents"].ToString() + "") + "</cell>");
                        }
                        if (UserManagementDelete.ToString() == "1")
                        {
                            Response.Write("<cell>" + RemoveWhiteSpace("Delete^UserManagementForm.aspx?rand=" + r.Next() + "&param1=D" + "&param2=" + dt.Rows[i]["UserssIDents"].ToString() + "") + "</cell>");

                        }
                    }
    
                        
                    
                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                Response.End();

                return false;

            default:
                Response.ContentType = "text/plain";
                Response.End();
                return true;
        }
    }

    public void isiTeknis()
    {
        query = @"SELECT codessDescs1 codessCodess FROM CODESS WHERE codessHeadss = '9'";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddprg.Items.Clear();
            //ddLanjut.Items.Add(new ListItem("Pilih Kabupaten", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddprg.Items.Add(new ListItem(dt.Rows[i]["codessCodess"].ToString()));
            }
        }
        dt.Dispose();
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

}