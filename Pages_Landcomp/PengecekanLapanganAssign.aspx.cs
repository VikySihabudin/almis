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

public partial class Pages_PengecekanLapanganAssign : System.Web.UI.Page
{
    DataTable dt;
    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    SqlDataAdapter sda;
    SqlConnection conn;
    string query;
    protected String userid = "";
    protected String groups = "";
    protected String PengecekanLapanganEdit = ""; //0
    protected String PengecekanLapanganDelete = ""; //1
    protected String PengecekanLapanganView = ""; //2
    protected String PengecekanLapanganAssign = ""; //3

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();
        }

        isiPerusa();
        HakAkses();

        isiPeriode();
        bool normal = true;
        if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());
    }

    public void isiPerusa()
    {

        query = @"SELECT perusaNamass,perusaIdents FROM USRPRS 
                  INNER JOIN PERUSA
	                ON UsrprsPerusa = perusaIdents
                   WHERE UsrprsUserss =" + "'" + userid + "'" + "";

        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddprs.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddprs.Items.Add(new ListItem(dt.Rows[i]["perusaNamass"].ToString(), dt.Rows[i]["perusaIdents"].ToString()));
            }
        }
        dt.Dispose();
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
            Response.Write("location.href = '../login.aspx';");
            Response.Write("</script>");
        }

        ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
        eSTP.Datas();
        DataSet ds = new DataSet();

        ds = eSTP.List8("P_MENU", "CHA", "", groups, "Pengecekan Lapangan", "", "", "", "");

        dt = ds.Tables[0];

        PengecekanLapanganEdit = dt.Rows[0]["EDITXXX"].ToString(); //0
        PengecekanLapanganDelete = dt.Rows[0]["DELETEX"].ToString(); //1
        PengecekanLapanganView = dt.Rows[0]["VIEWXXX"].ToString(); //2
        PengecekanLapanganAssign = dt.Rows[0]["ASSIGNX"].ToString(); //3


        dt.Dispose();

        if (PengecekanLapanganAssign.ToString() != "1")
        {
            if (groups.ToString() != "1")
            {
                Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
                Response.Write("alert('Anda Tidak Memiliki Akses Untuk Melihat Modul Ini');");
                Response.Write("location.href = '../Pages/home.aspx';");
                Response.Write("</script>");
            }
        }


    }

    public void isiPeriode()
    {
        query = @"SELECT codessDescs1, codessCodess FROM CODESS WHERE codessHeadss = '9'";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddprg.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddprg.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
        dt.Dispose();
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
            case "E":
                Response.ContentType = "text/plain";
                var param1 = Request.Params["param1"].ToString();
                var param2 = Request.Params["param2"].ToString();
                var param5 = Request.Params["param5"].ToString();
                var param6 = Request.Params["param6"].ToString();
                var param13 = Request.Params["param13"].ToString();
                var param14 = Request.Params["param14"].ToString();

                if (Session["userid"] is object)
                {
                    userid = Session["userid"].ToString();

                }

                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                eSTP.save15("P_PENLAP", param1, param2, "", "", param5, param6, "", "", "", "", userid, "", param13, param14, "0");
                Response.End();
                return false;

            case "L":

                var param1L = Request.Params["param1"].ToString();
                var param2L = Request.Params["param2"].ToString();
                var param4L = Request.Params["param4"].ToString();
                var param5L = Request.Params["param5"].ToString();
                var param14L = Request.Params["param14"].ToString();

                ALMIS.ExecuteSTP eSTP_L = new ALMIS.ExecuteSTP();
                eSTP_L.Datas();
                DataSet ds_L = new DataSet();
                ds_L = eSTP_L.List15("P_PENLAP", param1L, param2L, "", param4L, param5L, "", "", "", "", "", userid, "", "", param14L, "");

                dt = ds_L.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["penlapNmrPen"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["praregNmrPra"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentNamass"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["praregLokkec"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["praregLokdes"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["penlapAssign"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["perusaNamass"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["Assign"].ToString()) + "</cell>");
                    
                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                Response.End();

                return false;

            case "UA":
                Response.ContentType = "text/plain";
                Response.Write(UA());
                Response.End();
                return false; 

            default:
                Response.ContentType = "text/plain";
                Response.End();
                return true;
        }
    }

    private String UA()
    {
        var Param1 = Request.Params["param1"].ToString();
        var Param2 = Request.Params["param2"].ToString();
        string output = "";

        try
        {
            ALMIS.ExecuteSTP eSTP_p = new ALMIS.ExecuteSTP();
            eSTP_p.Datas();
            DataSet ds_p = new DataSet();
            ds_p = eSTP_p.List2("C_ADMINS", Param1, Param2);

            dt = ds_p.Tables[0];

            Response.ContentType = "text/plain";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                output += dt.Rows[i]["UserssNamess"].ToString() + "|";
                output += dt.Rows[i]["UserssIdents"].ToString() + "*";
            }
            dt.Dispose();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }

        return output;
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