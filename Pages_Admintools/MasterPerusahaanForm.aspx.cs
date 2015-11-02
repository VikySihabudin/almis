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

public partial class Pages_MasterPerusahaanForm : System.Web.UI.Page
{

    DataTable dt;
    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    SqlDataAdapter sda;
    SqlConnection conn;
    string query;
    protected String lanjut = "";
    protected String except = "";
    protected String userid = "";
    protected String groups = "";
    protected String MasterPerusahaanEdit = ""; //0
    protected String MasterPerusahaanDelete = ""; //1
    protected String MasterPerusahaanView = ""; //2
    protected String MasterPerusahaanAssign = "";//3

    protected void Page_Load(object sender, EventArgs e)
    {
        bool normal = true;
        if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());
        HakAkses();


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
            Response.Write("location.href = '../Pages/login.aspx';");
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

        ds = eSTP.List8("P_MENU", "CHA", "", groups, "", "", "", "", "");
        dt = ds.Tables[0];

        MasterPerusahaanView = dt.Rows[12]["MasterPerusahaan"].ToString(); //0
        MasterPerusahaanEdit = dt.Rows[12]["MasterPerusahaanEdit"].ToString(); //1
        MasterPerusahaanDelete = dt.Rows[12]["MasterPerusahaanDelete"].ToString(); //2
        MasterPerusahaanAssign = dt.Rows[12]["MasterPerusahaanAssign"].ToString(); //3

        dt.Dispose();

        if (Param1 == "I")
        {
            if (MasterPerusahaanAssign.ToString() != "1")
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

        else if (Param1 == "V")
        {
            if (MasterPerusahaanView.ToString() != "1")
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

        else if (Param1 == "E")
        {
            if (MasterPerusahaanEdit.ToString() != "1")
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

        else if (Param1.ToString() == "D")
        {
            if (MasterPerusahaanDelete.ToString() != "1")
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

        else
        {
            Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
            Response.Write("alert('Aksi Yang Anda Cari Tidak Ditemukan');");
            Response.Write("location.href = '../Pages/home.aspx';");
            Response.Write("</script>");
        }


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
                var Param1 = Request.Params["param1"].ToString();
                var Param2 = Request.Params["param2"].ToString();
                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List9("P_PERUSA", Param1, Param2, "", "", "", "", "", "", "");

                dt = ds.Tables[0];

                Response.ContentType = "text/plain";
                Response.Write(dt.Rows[0]["perusaIdents"].ToString() + "|"); //
                Response.Write(dt.Rows[0]["perusaDatess"].ToString() + "|"); //1
                Response.Write(dt.Rows[0]["perusaNamass"].ToString() + "|"); //2
                Response.Write(dt.Rows[0]["perusaKeterg"].ToString() + "|"); //3
                


                dt.Dispose();

                Response.End();
                Response.End();
                return false;

            //return false;

            case "CRUD":
                Response.ContentType = "text/plain";
                Response.Write(Save());
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
        String sql = "";
        String output = "";

        try
        {

            output = param1;

            if (output == "A")
            {
                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List9("P_PERUSA", "X", param2, "", "", "", "", "", "", "");
                dt = ds.Tables[0];

                if (dt.Rows.Count > 0)
                {
                    if (output == "E")
                        output = "noedit";

                    if (output == "D")
                        output = "nodelete";

                    if (output == "A")
                        output = "noadd";

                    return output;
                }
            }

            if (output == "E" || output == "D" || output == "A" || output == "I")
            {
                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();

                eSTP.save9("P_PERUSA", param1, param2, param3, param4, param5, userid, param7, param8, param9);

                return output;
            }

            else
                output = "gagal";
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