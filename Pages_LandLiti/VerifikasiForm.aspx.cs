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

using System.Web.Services;


public partial class Pages_LandLiti_VerifikasiForm : System.Web.UI.Page
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
    protected String Upload = "";
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
    protected String output = "";
    protected String sql = "";
    string _stFAsli;

    ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
    DataSet ds = new DataSet();

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


                if (Request.Params["param1"] is object) param1 = Request.Params["param1"].ToString();
                if (Request.Params["param2"] is object) param2 = Request.Params["param2"].ToString();

                eSTP.Datas();
                ds = eSTP.List11("P_VERDOK", param1, param2, "", "", "", "", "", "", "", "", "");

                dt = ds.Tables[0];

                Response.ContentType = "text/plain";

                Response.Write(dt.Rows[0]["ClausrNmrClm"].ToString() + "|"); //0
                Response.Write(dt.Rows[0]["ClausrNamass"].ToString() + "|"); //1
                Response.Write(dt.Rows[0]["ClausrLokKab"].ToString() + "|"); //2
                Response.Write(dt.Rows[0]["ClausrLokKec"].ToString() + "|"); //3
                Response.Write(dt.Rows[0]["ClausrLokDes"].ToString() + "|"); //4
                Response.Write(dt.Rows[0]["VerdokNmrVrd"].ToString() + "|"); //5
                Response.Write(dt.Rows[0]["VerdokLitiga"].ToString() + "|"); //6
                Response.Write(dt.Rows[0]["ClaUsrKodPer"].ToString() + "|"); //7
                Response.Write(dt.Rows[0]["VerdokKeteks"].ToString() + "|"); //8

                dt.Dispose();


                Response.End();
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

                String path1 = Server.MapPath(@"~/uploaddocument/" + Request.Params["namafile"].ToString().Replace("&amp;", "&"));
                if (System.IO.File.Exists(path1)) {
                    Response.AddHeader("content-disposition", "attachment;filename=" + namafile + "");
                    Response.ContentType = type;       
                    Response.WriteFile(path1); 
                
                }

                else {

                    Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
                    Response.Write("alert('Dokumen Tidak Di Temukan');");
                    Response.Write("window.close();");
                    Response.Write("</script>");
                
                }

                Response.End();
                return false;
                break;

            case "DP":
                String KdDok = (Request.Params["KdDok"] is object ? Request.Params["KdDok"].ToString() : "");
                String NamDok = (Request.Params["NamDok"] is object ? Request.Params["NamDok"].ToString() : "");
                String randomfile1 = (Request.Params["random"] is object ? Request.Params["random"].ToString() : "");
                String Sqdok = (Request.Params["Sqdok"] is object ? Request.Params["Sqdok"].ToString() : "");
                String path = Server.MapPath(@"~/uploaddocument/" + NamDok.ToString().Replace("&amp;", "&"));

                if (System.IO.File.Exists(path))
                {
                    System.IO.File.Delete(path);
                }

                Response.ContentType = "text/plain";
                Response.Write(DP());
                Response.End();


                return false;

            case "LP":

                String path_pic = (HttpContext.Current.Request.Url.AbsolutePath).ToLower();

                if (Request.Params["param1"] is object) param1 = Request.Params["param1"].ToString();
                if (Request.Params["param2"] is object) param2 = Request.Params["param2"].ToString();

                eSTP.Datas();
                ds = eSTP.List9("P_VERDOK_D", param1, param2, "", "", "", "", "", "", "");

                dt = ds.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");

                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["ClausrNmrPid"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentNamass"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["codessDescs1"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumFiless"].ToString()) + "</cell>");
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

            case "SavePic":
                Response.ContentType = "text/plain";
                Response.Write(SaveUploadKlaimUser());
                Response.End();
                return false;

            case "DOCpic":

                String path_pic1 = (HttpContext.Current.Request.Url.AbsolutePath).ToLower();

                string IDPerdok = Request.Params["IDPerdok"].ToString();
                if (Request.Params["param1"] is object) param1 = Request.Params["param1"].ToString();
                

                eSTP.Datas();
                ds = eSTP.List9("P_VERDOK_D", param1, IDPerdok, "", "", "", "", "", "", "");

                dt = ds.Tables[0];

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
                    Response.Write("<cell>" + RemoveWhiteSpace("Delete^javascript:DeletePic(\"" + "DP" + "\",\"" + "D" + "\",\"" + dt.Rows[i]["hdocumIdLink"].ToString() + "\",\"" + dt.Rows[i]["hdocumIdSour"].ToString() + "\",\"" + dt.Rows[i]["hdocumSequen"].ToString() + "\");^_self") + "</cell>");

                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumIdSour"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumIdLink"].ToString()) + "</cell>");

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

    private String DP()
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

        String NamDok = ""; if (Request.Params["NamDok"] is object) NamDok = Request.Params["NamDok"].ToString().Replace("&amp;", "&");
        String KdDok = ""; if (Request.Params["KdDok"] is object) KdDok = Request.Params["KdDok"].ToString().Replace("&amp;", "&");
        String Sqdok = ""; if (Request.Params["Sqdok"] is object) Sqdok = Request.Params["Sqdok"].ToString().Replace("&amp;", "&");

        //NamDok = @param7 --IDLink
        //KdDok = @param6 --IDSource
        //Sqdok = @param2 --hdocumSequen

        try
        {

            output = param1;

            if (output == "I" || output == "E" || output == "D")
            {
                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();

                if (output == "I")
                {
                    eSTP.save9("P_VERDOK_D", param1, param2, param3, param4, param5, param6, param7, param8, param9);
                }

                if (output == "D")
                {
                    eSTP.save9("P_VERDOK_D", param1, KdDok, Sqdok, param4, param5, param6, param7, param8, param9);
                    eSTP.save12("P_HDOCUM", param1, Sqdok, param3, param4, param5, KdDok, NamDok, param8, param9, param10, param11, param12);
                    output = "DP";
                }
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

        try
        {

            output = param1;

            if (output == "I" || output == "E" || output == "D")
            {
                eSTP.Datas();
                ds = eSTP.List11("P_VERDOK", "X", param2, "", param4, "", "", "", "", "", "", "");
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
                eSTP.save11("P_VERDOK", param1, param2, param3, param4, userid, param6, param7, param8, param9, param10, param11);

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


    public void AjaxFileUploadVerifikasi_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    {

        if (Session["userid"] is object) userid = Session["userid"].ToString();

        //if (Request.Params["param7"] is object) 
        param7 = ddprs.SelectedValue.ToString();
           
        

        //string user = "";
        string wilayah = "";

        ALMIS.generateNUm gn = new ALMIS.generateNUm();
        gn.Datas();

        string _stNomor;

        string _stDates = DateTime.Today.ToString("yyyyMMdd");

        string uploadFolder = Request.PhysicalApplicationPath + "uploadDocument\\";

        ALMIS.paramz ext = new ALMIS.paramz();

        ext.setExtension(Path.GetExtension(e.FileName));

        

        if (ext.getExtsion() != ".exe")
        {
            _stFAsli = System.IO.Path.GetFileName(e.FileName);

            _stNomor = gn.GenerateNumber(param7, 101, 12, _stDates, userid);

            AjaxFileUploadVerifikasi.SaveAs(uploadFolder + _stNomor + ext.getExtsion());
            e.PostedUrl = string.Format(e.FileName + "|" + _stNomor + "|" + userid + "|" + wilayah);

        }
    }

    private String SaveUploadKlaimUser()
    {
        string IDPerdok = Request.Params["IDPerdok"].ToString();
        string _stNamaFile = Request.Params["NAMA"].ToString();
        string _stKeterangan = Request.Params["KETERANGAN"].ToString();
        string _stNomor = Request.Params["NOMOR"].ToString();

        ALMIS.UploadFile uf = new ALMIS.UploadFile();
        uf.Datas();

        string _stDates = DateTime.Today.ToString("yyyyMMdd");

        string param1 = Request.Params["param1"].ToString();
        string param5 = Request.Params["param5"].ToString();
        string user = Request.Params["user"].ToString();
        string wilayah = Request.Params["wilay"].ToString();
        string param11 = Request.Params["param11"].ToString();

        string _stUploadKeterangan = "";
        _stUploadKeterangan = _stKeterangan;

        string uploadFolder = Request.PhysicalApplicationPath + "uploadDocument\\";
        string extension = Path.GetExtension(_stNamaFile);

        ALMIS.paramz ext = new ALMIS.paramz();

        ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
        eSTP.Datas();
        DataSet ds = new DataSet();

        eSTP.save9("P_VERDOK_D", param1, IDPerdok, "", param5, _stKeterangan, param11, "", "", "");

        if (extension != ".exe")
        {

            uf.UploadFilesWeb("I", user, _stDates, "Verifikasi Dokumen", param5, uploadFolder, IDPerdok, _stNomor + extension, _stNamaFile, _stUploadKeterangan, param11, "");
        }

        var _stOutput = ID;

        return _stOutput;
    }

}