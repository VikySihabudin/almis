using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Collections;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;
using Waindo.Conn;

public partial class Pages_Dokumen_ServicesProjectForm : System.Web.UI.Page
{
    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    string query;
    DataTable dt;
    SqlCommand command;
    SqlDataAdapter sda;
    SqlConnection conn;
    protected String lanjut = "";
    protected String except = "";
    protected String userid = "";
    protected String groups = "";

    protected String param1 = "";
    protected String param2 = "";
    protected String param3 = "";
    protected String param4 = "";
    protected String param5 = "";
    protected String param6 = "";
    protected String param7 = "";
    protected String param8 = "";
    protected String param9 = "";
    protected String param10 = "";
    protected String param11 = "";
    protected String param12 = "";
    protected String param13 = "";
    protected String param14 = "";
    protected String param15 = "";
    protected String param16 = "";
    protected String param17 = "";
    protected String param18 = "";
    protected String param19 = "";
    protected String param20 = "";
    protected String param21 = "";
    protected String param22 = "";
    protected String param23 = "";
    protected String param24 = "";
    protected String param25 = "";
    protected String param26 = "";
    protected String param27 = "";
    protected String param28 = "";
    protected String param29 = "";
    protected String param30 = "";
    protected String param31 = "";
    protected String param32 = "";

    protected String output = "";
    protected String sql = "";

    ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();
        }

        isiPerusa();

        bool normal = true;
        if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());
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

    private bool ServiceSelect(string sm)
    {
        switch (sm)
        {
            case "LC":

                var param1x = Request.Params["param1"].ToString();

                ALMIS.ExecuteSTP eSTP_L = new ALMIS.ExecuteSTP();
                eSTP_L.Datas();
                DataSet ds_L = new DataSet();
                ds_L = eSTP_L.List5("P_REQUES_D", param1x, "", "", "", "");

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

                    Response.Write("</row>");
                }

                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                return false;

            case "LB":

                var param1= Request.Params["param1"].ToString();

                ALMIS.ExecuteSTP eSTP_Lx = new ALMIS.ExecuteSTP();
                eSTP_Lx.Datas();
                DataSet ds_Lx = new DataSet();
                ds_Lx = eSTP_Lx.List5("P_REQUES_D", param1, "", "", "", "");

                dt = ds_Lx.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");



                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UserssIDents"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UserssNamess"].ToString()) + "</cell>");

                    Response.Write("</row>");
                }

                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                return false;

            case "LD":

                var param1d = Request.Params["param1"].ToString();

                ALMIS.ExecuteSTP eSTP_Lxd = new ALMIS.ExecuteSTP();
                eSTP_Lxd.Datas();
                DataSet ds_Lxd = new DataSet();
                ds_Lxd = eSTP_Lxd.List5("P_REQUES_D", param1d, "", "", "", "");

                dt = ds_Lxd.Tables[0];

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

                    Response.Write("</row>");
                }

                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                return false;

            case "LP":

                var param1p = Request.Params["param1"].ToString();

                ALMIS.ExecuteSTP eSTP_Lxp = new ALMIS.ExecuteSTP();
                eSTP_Lxp.Datas();
                DataSet ds_Lxp = new DataSet();
                ds_Lxp = eSTP_Lxp.List5("P_REQUES_D", param1p, "", "", "", "");

                dt = ds_Lxp.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");



                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UserssIDents"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UserssNamess"].ToString()) + "</cell>");

                    Response.Write("</row>");
                }

                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                return false;

            case "LA":

                var param1a = Request.Params["param1"].ToString();

                ALMIS.ExecuteSTP eSTP_Lxa = new ALMIS.ExecuteSTP();
                eSTP_Lxa.Datas();
                DataSet ds_Lxa = new DataSet();
                ds_Lxa = eSTP_Lxa.List5("P_REQUES_D", param1a, "", "", "", "");

                dt = ds_Lxa.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");



                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UserssIDents"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UserssNamess"].ToString()) + "</cell>");

                    Response.Write("</row>");
                }

                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                return false;

            case "LPA":

                var param1pa = Request.Params["param1"].ToString();

                ALMIS.ExecuteSTP eSTP_Lxpa = new ALMIS.ExecuteSTP();
                eSTP_Lxpa.Datas();
                DataSet ds_Lxpa = new DataSet();
                ds_Lxpa = eSTP_Lxpa.List5("P_REQUES_D", param1pa, "", "", "", "");

                dt = ds_Lxpa.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");



                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UserssIDents"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UserssNamess"].ToString()) + "</cell>");

                    Response.Write("</row>");
                }

                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                return false;

            case "LPM":

                var param1pm = Request.Params["param1"].ToString();

                ALMIS.ExecuteSTP eSTP_Lxpm = new ALMIS.ExecuteSTP();
                eSTP_Lxpm.Datas();
                DataSet ds_Lxpm = new DataSet();
                ds_Lxpm = eSTP_Lxpm.List5("P_REQUES_D", param1pm, "", "", "", "");

                dt = ds_Lxpm.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");



                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UserssIDents"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UserssNamess"].ToString()) + "</cell>");

                    Response.Write("</row>");
                }

                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                return false;

            case "LDH":

                var param1dh = Request.Params["param1"].ToString();

                ALMIS.ExecuteSTP eSTP_Lxdh = new ALMIS.ExecuteSTP();
                eSTP_Lxdh.Datas();
                DataSet ds_Lxdh = new DataSet();
                ds_Lxdh = eSTP_Lxdh.List5("P_REQUES_D", param1dh, "", "", "", "");

                dt = ds_Lxdh.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");



                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UserssIDents"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UserssNamess"].ToString()) + "</cell>");

                    Response.Write("</row>");
                }

                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                return false;

            case "LOD":

                var param1od = Request.Params["param1"].ToString();

                ALMIS.ExecuteSTP eSTP_Lxod = new ALMIS.ExecuteSTP();
                eSTP_Lxod.Datas();
                DataSet ds_Lxod = new DataSet();
                ds_Lxod = eSTP_Lxod.List5("P_REQUES_D", param1od, "", "", "", "");

                dt = ds_Lxod.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");



                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UserssIDents"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UserssNamess"].ToString()) + "</cell>");

                    Response.Write("</row>");
                }

                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                return false;

            case "CRUD":
                Response.ContentType = "text/plain";
                Response.Write(CRUD());
                Response.End();
                return false;


            default:
                Response.ContentType = "text/plain";
                Response.End();
                return true;
        }
    }

    private String CRUD()
    {

        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();

        }

        if (Request.Params["param1"] is object) param1 = Request.Params["param1"].ToString();
        if (Request.Params["param2"] is object) param2 = Request.Params["param2"].ToString();
        if (Request.Params["param3"] is object) param3 = Request.Params["param3"].ToString();
        if (Request.Params["param4"] is object) param4 = Request.Params["param4"].ToString();
        if (Request.Params["param5"] is object) param5 = Request.Params["param5"].ToString();
        if (Request.Params["param6"] is object) param6 = Request.Params["param6"].ToString();
        if (Request.Params["param7"] is object) param7 = Request.Params["param7"].ToString();
        if (Request.Params["param8"] is object) param8 = Request.Params["param8"].ToString();
        if (Request.Params["param9"] is object) param9 = Request.Params["param9"].ToString();
        if (Request.Params["param10"] is object) param10 = Request.Params["param10"].ToString();
        if (Request.Params["param11"] is object) param11 = Request.Params["param11"].ToString();
        if (Request.Params["param12"] is object) param12 = Request.Params["param12"].ToString();
        if (Request.Params["param13"] is object) param13 = Request.Params["param13"].ToString();
        if (Request.Params["param14"] is object) param14 = Request.Params["param14"].ToString();
        if (Request.Params["param15"] is object) param15 = Request.Params["param15"].ToString();
        if (Request.Params["param16"] is object) param16 = Request.Params["param16"].ToString();
        if (Request.Params["param17"] is object) param17 = Request.Params["param17"].ToString();
        if (Request.Params["param18"] is object) param18 = Request.Params["param18"].ToString();
        if (Request.Params["param19"] is object) param19 = Request.Params["param19"].ToString();
        if (Request.Params["param20"] is object) param20 = Request.Params["param20"].ToString();
        if (Request.Params["param21"] is object) param21 = Request.Params["param21"].ToString();
        if (Request.Params["param22"] is object) param22 = Request.Params["param22"].ToString();
        if (Request.Params["param23"] is object) param23 = Request.Params["param23"].ToString();
        if (Request.Params["param24"] is object) param24 = Request.Params["param24"].ToString();
        if (Request.Params["param25"] is object) param25 = Request.Params["param25"].ToString();
        if (Request.Params["param26"] is object) param26 = Request.Params["param26"].ToString();
        if (Request.Params["param27"] is object) param27 = Request.Params["param27"].ToString();
        if (Request.Params["param28"] is object) param28 = Request.Params["param28"].ToString();
        if (Request.Params["param29"] is object) param28 = Request.Params["param29"].ToString();
        if (Request.Params["param30"] is object) param30 = Request.Params["param30"].ToString();
        if (Request.Params["param31"] is object) param31 = Request.Params["param31"].ToString();
        if (Request.Params["param32"] is object) param32 = Request.Params["param32"].ToString();

        try
        {

            output = param1;

            if (output == "I" || output == "E" || output == "D")
            {

                ////eSTP.Datas();
                ////ds = eSTP.List32("P_REQUES", "X", param2, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
                ////dt = ds.Tables[0];

                ////if (dt.Rows.Count > 0)
                ////{
                ////    if (output == "E")
                ////        output = "noedit";

                ////    if (output == "D")
                ////        output = "nodelete";

                ////    if (output == "A")
                ////        output = "noadd";

                ////    return output;
                ////}

                eSTP.Datas();
                eSTP.save32("P_REQUES", param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14, param15, param16, param17, param18, param19, param20, param21, param22, param23, param24, param25, param26, param27, param28, userid, param30, param31, param32);

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