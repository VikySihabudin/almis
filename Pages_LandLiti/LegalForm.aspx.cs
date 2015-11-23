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

public partial class Pages_LandLiti_LegalForm : System.Web.UI.Page
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
                param4 = Request.Params["param4"].ToString();


                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List11("P_LEGALL", param1, "", "", param4, "", "", "", "", "", "", "");

                dt = ds.Tables[0];

                Response.ContentType = "text/plain";

                Response.Write(dt.Rows[0]["LegallKodPer"].ToString() + "|"); //0
                Response.Write(dt.Rows[0]["LegallNmrLeg"].ToString() + "|"); //1
                Response.Write(dt.Rows[0]["VerdokNmrVrd"].ToString() + "|"); //2
                Response.Write(dt.Rows[0]["PredokNmrDok"].ToString() + "|"); //3
                Response.Write(dt.Rows[0]["ClausrNmrClm"].ToString() + "|"); //4
                Response.Write(dt.Rows[0]["ClausrNamass"].ToString() + "|"); //5
                Response.Write(dt.Rows[0]["ClausrLokKab"].ToString() + "|"); //6
                Response.Write(dt.Rows[0]["ClausrLokKec"].ToString() + "|"); //7
                Response.Write(dt.Rows[0]["ClausrLokDes"].ToString() + "|"); //8
                Response.Write(dt.Rows[0]["LegallNoSuPu"].ToString() + "|"); //9
                Response.Write(dt.Rows[0]["LegallTaSuPu"].ToString() + "|"); //10
                

                dt.Dispose();

                Response.End();
                Response.End();
                return false;

            case "LP":

                String path_pic = (HttpContext.Current.Request.Url.AbsolutePath).ToLower();

                var param1LP = Request.Params["param1"].ToString();
                var param2LP = Request.Params["param2"].ToString();

                ALMIS.ExecuteSTP eSTPx = new ALMIS.ExecuteSTP();
                eSTPx.Datas();
                DataSet dsx = new DataSet();
                dsx = eSTPx.List9("P_VERDOK_D", param1LP, param2LP, "", "", "", "", "", "", "");

                dt = dsx.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");

                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["PredokNmrPid"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentNamass"].ToString()) + "</cell>");

                    if (dt.Rows[i]["hdocumIdSour"].ToString() != "")
                    {
                        Response.Write("<cell>" + "Download^" + path_pic + "?sm=df&amp;namafile=" + dt.Rows[i]["hdocumIdLink"].ToString() + "&amp;filelama=" + dt.Rows[i]["hdocumFiless"].ToString() + "</cell>");
                        //Response.Write("<cell>" + "Delete^" + path_pic + "?sm=Deletepic&amp;IDSOURCE=" + dt.Rows[i]["IDSource"].ToString() + "</cell>");
                        Response.Write("<cell>" + RemoveWhiteSpace("Delete^javascript:DeletePic(\"" + dt.Rows[i]["hdocumIdLink"].ToString()) + "\",\"" + param2 + "\");^_self" + "</cell>");
                    }
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumIdSour"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumIdLink"].ToString()) + "</cell>");

                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();
                Response.End();


                return false;

            case "DOCpic":

                String path_pic1 = (HttpContext.Current.Request.Url.AbsolutePath).ToLower();

                string IDPerdok = Request.Params["IDPerdok"].ToString();
                string param1z = Request.Params["param1"].ToString();

                ALMIS.ExecuteSTP eSTPxz = new ALMIS.ExecuteSTP();
                eSTPxz.Datas();
                DataSet dsxz = new DataSet();
                dsxz = eSTPxz.List9("P_VERDOK_D", param1z, IDPerdok, "", "", "", "", "", "", "");

                dt = dsxz.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");

                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>");

                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumFiless"].ToString()) + "</cell>");

                    Response.Write("<cell>" + "Download^" + path_pic1 + "?sm=df&amp;namafile=" + dt.Rows[i]["hdocumIdLink"].ToString() + "&amp;filelama=" + dt.Rows[i]["hdocumFiless"].ToString() + "</cell>");
                    //Response.Write("<cell>" + "Delete^" + path_pic + "?sm=Deletepic&amp;IDSOURCE=" + dt.Rows[i]["IDSource"].ToString() + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace("Delete^javascript:DeletePic(\"" + dt.Rows[i]["hdocumIdLink"].ToString()) + "\",\"" + IDPerdok + "\");^_self" + "</cell>");

                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumIdSour"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumIdLink"].ToString()) + "</cell>");

                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();
                Response.End();


                return false;

            case "df":
                Response.Clear();
                string namafile = (Request.Params["filelama"] is object ? Request.Params["filelama"].ToString() : "");
                String urlfile = (Request.Params["namafile"] is object ? Request.Params["namafile"].ToString() : "");
                String randomfile = (Request.Params["random"] is object ? Request.Params["random"].ToString() : "");
                string type = "";
                switch (namafile.Substring(namafile.Length - 4))
                {
                    case ".htm":
                    case ".html":
                        type = "text/HTML";
                        break;

                    case ".txt":
                        type = "text/plain";
                        break;

                    case ".doc":
                    case ".docx":
                    case ".rtf":
                        type = "Application/msword";
                        break;
                    case ".xls":
                    case ".xlsx":
                        type = "Application/msexcel";
                        break;

                    case ".zip":
                    case ".rar":
                        type = "application/zip";
                        break;

                    case ".pdf":
                        type = "application/pdf";
                        break;
                    case ".jpg":
                        type = "image/JPG";
                        break;
                    case ".pgn":
                        type = "image/PNG";
                        break;
                    case ".tif":
                        type = "image/tif";
                        break;
                }

                Response.AddHeader("content-disposition", "attachment;filename=" + namafile + "");
                Response.ContentType = type;

                Response.WriteFile(Server.MapPath(@"~/uploaddocument/" + Request.Params["namafile"].ToString().Replace("&amp;", "&")));

                Response.End();
                return false;
                break;

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
        param7 = userid;

        String sql = "";
        String output = "";



        try
        {

            output = param1;

            //if (output == "I" || output == "E" || output == "D")
            //{
            ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();

            eSTP.Datas();
            DataSet ds = new DataSet();
            //    ds = eSTP.List10("P_LEGALL", "X", param2, "", "", "", "", "", "", "", "");
            //    dt = ds.Tables[0];

            //    if (dt.Rows.Count > 0)
            //    {
            //        if (output == "E")
            //            output = "noedit";

            //        if (output == "D")
            //            output = "nodelete";

            //        if (output == "A")
            //            output = "noadd";

            //        return output;
            //    }

                eSTP.Datas();
                eSTP.save11("P_LEGALL", param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11);

                return output;
            //}
            //else
            //    output = "gagal";
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