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

public partial class Pages_UserManagementForm : System.Web.UI.Page
{
    DataTable dt;
    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    string query;
    SqlCommand command;
    SqlDataAdapter sda;
    SqlConnection conn;

    protected String lanjut = "";
    protected String except = "";
    protected String userid = "";
    protected String groups = "";
    protected String UserManagementEdit = ""; //0
    protected String UserManagementDelete = ""; //1
    protected String UserManagementView = ""; //2
    protected String UserManagementAssign = "";//3

    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            stat();
            group();
            bool normal = true;
            if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());
            HakAkses();
            isiPerusa();
        }


        
    }

    public void isiPerusa()
    {
        query = @"SELECT perusanamass,perusaIdents FROM PERUSA";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddprs.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddprs.Items.Add(new ListItem(dt.Rows[i]["perusanamass"].ToString(), dt.Rows[i]["perusaIdents"].ToString()));
            }
        }
        dt.Dispose();
    }

    public void HakAkses()
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
            Response.Write("location.href = '../login.aspx';");
            Response.Write("</script>");
        }

        ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
        eSTP.Datas();
        DataSet ds = new DataSet();

        var Param1 = "";

        bool cek = true;
        if (cek && (Request.Params["param1"] is object))
        {
            Param1 = Request.Params["param1"].ToString();
        }
        else
        {
            Param1 = "";
        }

        ds = eSTP.List8("P_MENU", "CHA", "", groups, "User Management", "", "", "", "");
        dt = ds.Tables[0];

        UserManagementView = dt.Rows[0]["VIEWXXX"].ToString(); //0
        UserManagementEdit = dt.Rows[0]["EDITXXX"].ToString(); //1
        UserManagementDelete = dt.Rows[0]["DELETEX"].ToString(); //2
        UserManagementAssign = dt.Rows[0]["ASSIGNX"].ToString(); //3

        dt.Dispose();

        if (Param1 == "I")
        {
            if (userid.ToString() != "1")
            {
                if (UserManagementAssign.ToString() != "1")
                {
                    if (groups.ToString() != "1")
                    {
                        Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
                        Response.Write("alert('Anda Tidak Memiliki Akses Untuk Menambah Di Modul Ini');");
                        Response.Write("location.href = '../Pages/home.aspx';");
                        Response.Write("</script>");
                    }
                }
            }
        }

        else if (Param1 == "V")
        {
            if (userid.ToString() != "1")
            {
                if (UserManagementView.ToString() != "1")
                {
                    if (groups.ToString() != "1")
                    {
                        Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
                        Response.Write("alert('Anda Tidak Memiliki Akses Untuk Melihat Di Modul Ini');");
                        Response.Write("location.href = '../Pages/home.aspx';");
                        Response.Write("</script>");
                    }
                }
            }
        }

        else if (Param1 == "E")
        {
            if (userid.ToString() != "1")
            {
                if (UserManagementEdit.ToString() != "1")
                {
                    if (groups.ToString() != "1")
                    {
                        Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
                        Response.Write("alert('Anda Tidak Memiliki Akses Untuk Edit Di Modul Ini');");
                        Response.Write("location.href = '../Pages/home.aspx';");
                        Response.Write("</script>");
                    }
                }
            }
        }

        else if (Param1.ToString() == "D")
        {
            if (userid.ToString() != "1")
            {
                if (UserManagementDelete.ToString() != "1")
                {
                    if (groups.ToString() != "1")
                    {
                        Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
                        Response.Write("alert('Anda Tidak Memiliki Akses Untuk Delete Di Modul Ini');");
                        Response.Write("location.href = '../Pages/home.aspx';");
                        Response.Write("</script>");
                    }
                }
            }
        }



        else
        {
            Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
            Response.Write("alert('Aksi Yang Anda Cari Tidak Ditemukan');");
            Response.Write("location.href = '../Pages/home.aspx';");
            Response.Write("</script>");
        }


    }

    public void group()
    {
        query = @"SELECT GroupsNamess, GroupIdents FROM GROUPS";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddGroup.Items.Clear();
            //ddLanjut.Items.Add(new ListItem("Pilih Kabupaten", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddGroup.Items.Add(new ListItem(dt.Rows[i]["GroupsNamess"].ToString(), dt.Rows[i]["GroupIdents"].ToString()));
            }
        }
        dt.Dispose();
    }


    public void stat()
    {
        query = @"SELECT codessCodess, codessDescs1 FROM almis.CODESS WHERE codessHeadss=18 AND codessStatss=1";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddStatusActive.Items.Clear();
            //ddLanjut.Items.Add(new ListItem("Pilih Kabupaten", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddStatusActive.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
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
        return dt;
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
            case "V":

                var param1 = Request.Params["param1"].ToString();
                var param2 = Request.Params["param2"].ToString();

                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List11("P_USERSS", param1, param2, "", "", "", "", "", "", "", "","");
                dt = ds.Tables[0];

                Response.ContentType = "text/plain";
                Response.Write(dt.Rows[0]["UserssIDents"].ToString() + "|"); //0
                //Response.Write(dt.Rows[0]["UserssPasswd"].ToString() + "|"); //1
                Response.Write(dt.Rows[0]["UserssNamess"].ToString() + "|"); //2
                Response.Write(dt.Rows[0]["UserssGroups"].ToString() + "|"); //3
                Response.Write(dt.Rows[0]["UserrsActive"].ToString() + "|"); //4
                Response.Write(dt.Rows[0]["UserssEmails"].ToString() + "|"); //5

                dt.Dispose();

                Response.End();
                Response.End();
                return false;

            case "L":

                var param1L = Request.Params["param1"].ToString();
                var param2L = Request.Params["param2"].ToString();
                ALMIS.ExecuteSTP eSTP_L = new ALMIS.ExecuteSTP();
                eSTP_L.Datas();
                DataSet ds_L = new DataSet();
                ds_L = eSTP_L.List9("P_USRPRS", param1L, param2L, "", "", "", "", "", "", "");

                dt = ds_L.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");


                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["perusaIdents"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["perusaNamass"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UsrprsKeters"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace("Delete^javascript:Hapus(\"" + "ID" + "\",\"" + "DD" + "\",\"" + dt.Rows[i]["usrprsuserss"].ToString() + "\",\"" + dt.Rows[i]["perusaIdents"].ToString() + "\");^_self") + "</cell>");

                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();

                Response.End();

                return false;

            case "CRUD":
                Response.ContentType = "text/plain";
                Response.Write(Save());
                Response.End();
                return false;

            case "ID":
                Response.ContentType = "text/plain";
                Response.Write(ID());
                Response.End();
                return false;

            default:
                Response.ContentType = "text/plain";
                Response.End();
                return true;
        }
    }

    private String Save()
    {

        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();

        }

        String param1 = ""; if (Request.Params["param1"] is object) param1 = Request.Params["param1"].ToString();
        String param2 = ""; if (Request.Params["param2"] is object) param2 = Request.Params["param2"].ToString();
        String param3 = ""; if (Request.Params["param3"] is object) param3 = Request.Params["param3"].ToString();
        String param4 = ""; if (Request.Params["param4"] is object) param4 = Request.Params["param4"].ToString();
        String param5 = ""; if (Request.Params["param5"] is object) param5 = Request.Params["param5"].ToString();
        String param6 = ""; if (Request.Params["param6"] is object) param6 = Request.Params["param6"].ToString();
        String param7 = ""; if (Request.Params["param7"] is object) param7 = Request.Params["param7"].ToString();
        String param8 = ""; if (Request.Params["param8"] is object) param8 = Request.Params["param8"].ToString();
        String param9 = ""; if (Request.Params["param9"] is object) param9 = Request.Params["param9"].ToString();
        String param10 = ""; if (Request.Params["param10"] is object) param10 = Request.Params["param10"].ToString();
        String param11 = ""; if (Request.Params["param11"] is object) param11 = Request.Params["param11"].ToString();
        //String sql = "";
        String output = "";

        try
        {
            output = param1;




            //if (output == "I")
            //{ 
            
            
            
            //}

            if (output == "I" )
            {
                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List11("P_USERSS", "X", param2, param8, "", "", "", userid, "", "", "", "");
                dt = ds.Tables[0];

                if (dt.Rows.Count > 0)
                {
                    if (output == "E")
                        output = "noedit";

                    if (output == "D")
                        output = "nodelete";

                    if (output == "I")
                        output = "notambah";

                    return output;
                }
            }

            if (output == "D" || output == "I" || output == "E")
            {

                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                eSTP.save11("P_USERSS", param1, param2, param3, param4, param5, param6, userid, param8, param9, param10, param11);
                return output;

            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            Response.End();
            return ex.Message;
        }

        return output;
    }

    private String ID()
    {

        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();

        }

        String param1 = ""; if (Request.Params["param1"] is object) param1 = Request.Params["param1"].ToString();
        String param2 = ""; if (Request.Params["param2"] is object) param2 = Request.Params["param2"].ToString();
        String param3 = ""; if (Request.Params["param3"] is object) param3 = Request.Params["param3"].ToString();
        String param4 = ""; if (Request.Params["param4"] is object) param4 = Request.Params["param4"].ToString();
        String param5 = ""; if (Request.Params["param5"] is object) param5 = Request.Params["param5"].ToString();
        String param6 = ""; if (Request.Params["param6"] is object) param6 = Request.Params["param6"].ToString();
        String param7 = ""; if (Request.Params["param7"] is object) param7 = Request.Params["param7"].ToString();
        String param8 = ""; if (Request.Params["param8"] is object) param8 = Request.Params["param8"].ToString();
        String param9 = ""; if (Request.Params["param9"] is object) param9 = Request.Params["param9"].ToString();
        //String sql = "";
        String output = "";

        try
        {
            output = param1;

            if (output == "ID")
            {
                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List9("P_USRPRS", "X", param2, "", param4, "", userid, "", "", "");
                dt = ds.Tables[0];

                if (dt.Rows.Count > 0)
                {
                    output = "notambah";
                    return output;

                }

            }

            if ( output == "ID" || output == "DD" )
            {

                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                eSTP.save9("P_USRPRS", param1, param2, param3, param4, param5, userid, param7, param8, "0");
                return output;

            }



        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            Response.End();
            return ex.Message;
        }

        return output;
    }
}