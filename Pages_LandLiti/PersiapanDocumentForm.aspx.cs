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

public partial class Pages_LandLiti_PersiapanDocumentForm : System.Web.UI.Page
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

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();
        }

        isiPerusa();

        isikabupaten();
        isiKecamatan();
        isiDesa();
        isiLanjut();
        bool normal = true;
        if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());


    }

    public void isiLanjut()
    {
        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    almis.CODESS
                    WHERE   codessHeadss = 4
                            AND codessStatss = 1 ORDER BY codessCodess DESC";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddLanjut.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddLanjut.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
        dt.Dispose();
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

    public void isikabupaten()
    {
        query = @"SELECT mkabupIdkabu, mkabupNmkabu FROM almis.MKABUP";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddKabupaten.Items.Clear();
            ddKabupaten.Items.Add(new ListItem("Pilih Kabupaten", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddKabupaten.Items.Add(new ListItem(dt.Rows[i]["mkabupNmkabu"].ToString(), dt.Rows[i]["mkabupIdkabu"].ToString()));
            }
        }
        dt.Dispose();
    }

    public void isiKecamatan()
    {
        query = @"SELECT mcamatIdcamt, mcamatNmcamt FROM almis.MCAMAT";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddKecamatan.Items.Clear();
            ddKecamatan.Items.Add(new ListItem("Pilih Kecamatan", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddKecamatan.Items.Add(new ListItem(dt.Rows[i]["mcamatNmcamt"].ToString(), dt.Rows[i]["mcamatIdcamt"].ToString()));
            }
        }
        dt.Dispose();
    }

    public void isiDesa()
    {
        query = @"SELECT mdesaaIddesaa, mdesaaNmdesa FROM almis.MDESAA";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddDesa.Items.Clear();
            ddDesa.Items.Add(new ListItem("Pilih Desa", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddDesa.Items.Add(new ListItem(dt.Rows[i]["mdesaaNmdesa"].ToString(), dt.Rows[i]["mdesaaIddesaa"].ToString()));
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

    private bool ServiceSelect(string sm)
    {
        switch (sm)
        {
            case "V":

                param1 = Request.Params["param1"].ToString();
                param2 = Request.Params["param2"].ToString();

                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List10("P_PREDOK", param1, param2, "", "", "", "", "", "", "", "");

                dt = ds.Tables[0];

                Response.ContentType = "text/plain";

                Response.Write(dt.Rows[0]["ClausrNmrClm"].ToString() + "|"); //0
                Response.Write(dt.Rows[0]["PredokNmrDok"].ToString() + "|"); //1
                Response.Write(dt.Rows[0]["ClausrNamass"].ToString() + "|"); //2
                Response.Write(dt.Rows[0]["ClausrLokKab"].ToString() + "|"); //3
                Response.Write(dt.Rows[0]["ClausrLokKec"].ToString() + "|"); //4
                Response.Write(dt.Rows[0]["ClausrLokDes"].ToString() + "|"); //5
                Response.Write(dt.Rows[0]["ClausrKodPer"].ToString() + "|"); //6
                Response.Write(dt.Rows[0]["PredokLanjut"].ToString() + "|"); //7
                dt.Dispose();


                Response.End();
                Response.End();
                return false;



            case "L":

                param1 = Request.Params["param1"].ToString();
                param2 = Request.Params["param2"].ToString();

                ALMIS.ExecuteSTP eSTP_SA = new ALMIS.ExecuteSTP();
                eSTP_SA.Datas();
                DataSet ds_SA = new DataSet();
                ds_SA = eSTP_SA.List9("P_PREDOK_D", param1, param2, "", "", "", "", "", "", "");

                dt = ds_SA.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["PredokNmrPid"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace("Delete^javascript:Hapus(\"" + "DA" + "\",\"" + "D" + "\",\"" + dt.Rows[i]["PredokNmrPid"].ToString() + "\");^_self") + "</cell>");

                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                Response.End();

                return false;

            case "LP":

                var param1l = Request.Params["param1"].ToString();
                var param2l = Request.Params["param2"].ToString();

                ALMIS.ExecuteSTP eSTPx = new ALMIS.ExecuteSTP();
                eSTPx.Datas();
                DataSet dsx = new DataSet();
                dsx = eSTPx.List9("P_PREDOK_D", param1l, param2l, "", "", "", "", "", "", "");
                dt = dsx.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");

                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pengtoNmrPid"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentNamass"].ToString()) + "</cell>");

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

            case "CRUD_D":
                Response.ContentType = "text/plain";
                Response.Write(CRUD_D());
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

        param1 = Request.Params["param1"].ToString();
        param2 = Request.Params["param2"].ToString();
        param3 = Request.Params["param3"].ToString();
        param4 = Request.Params["param4"].ToString();
        param5 = Request.Params["param5"].ToString();
        param6 = Request.Params["param6"].ToString();
        param7 = Request.Params["param7"].ToString();
        param8 = Request.Params["param8"].ToString();
        param9 = Request.Params["param9"].ToString();
        param10 = Request.Params["param10"].ToString();

        String sql = "";
        String output = "";



        try
        {

            output = param1;

            if (output == "I" || output == "E" || output == "D")
            {
                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();

                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List10("P_PREDOK", "X", param2, "", param4, "", "", "", "", "", "");
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

                eSTP.Datas();
                eSTP.save10("P_PREDOK", param1, param2, param3, param4, userid, param6, param7, param8, param9, param10);

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

    private String CRUD_D()
    {

        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();

        }

        param1 = Request.Params["param1"].ToString();
        param2 = Request.Params["param2"].ToString();
        param3 = Request.Params["param3"].ToString();
        param4 = Request.Params["param4"].ToString();
        param5 = Request.Params["param5"].ToString();
        param6 = Request.Params["param6"].ToString();
        param7 = Request.Params["param7"].ToString();
        param8 = Request.Params["param8"].ToString();
        param9 = Request.Params["param9"].ToString();

        String sql = "";
        String output = "";



        try
        {

            output = param1;

            if (output == "I" || output == "E" || output == "D")
            {
                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();

                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List9("P_PREDOK_D", "X", param2, "", param4, param5, "", "", "", "");
                dt = ds.Tables[0];
                if (output == "I")
                {
                    if (dt.Rows.Count > 0)
                    {

                        if (output == "I")
                            output = "noadd";

                        return output;
                    }
                }
                eSTP.Datas();
                eSTP.save9("P_PREDOK_D", param1, param2, param3, param4, param5, userid, param7, param8, param9);

                if (output == "I")
                    output = "ID";
                if (output == "D")
                    output = "DD";

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