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
using Waindo.Conn;
using System.IO;

public partial class Pages_Pengukuran : System.Web.UI.Page
{
    Connection conn2;
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
    protected String PengukuranT0Edit = ""; //0
    protected String PengukuranT0Delete = ""; //1
    protected String PengukuranT0View = ""; //2
    protected String PengukuranT0Assign = "";//3
    string _stFAsli;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] is object)
            {
                userid = Session["userid"].ToString();
            }

            isikabupaten();
            isiKecamatan();
            isiDesa();
            isiPerusa();
            isiLanjut();
            bool normal = true;
            if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());
            HakAkses();
        }
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

    public void HakAkses()
    {

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

        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();

            if (Session["lanjut"] is object)
            {
                lanjut = Session["lanjut"].ToString();
            }

            if (Session["except"] is object)
            {
                except = Session["except"].ToString();
            }
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

        PengukuranT0View = dt.Rows[5]["PengukuranT0"].ToString(); //0
        PengukuranT0Edit = dt.Rows[5]["PengukuranT0Edit"].ToString(); //1
        PengukuranT0Delete = dt.Rows[5]["PengukuranT0Delete"].ToString(); //2
        PengukuranT0Assign = dt.Rows[5]["PengukuranT0Assign"].ToString(); //3

        dt.Dispose();

        if (Param1 == "")
        {

            Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
            Response.Write("alert('Tidak Ada Aksi Yang Ada Pilih');");
            Response.Write("location.href = '../Pages//home.aspx';");
            Response.Write("</script>");

        }

        else if (Param1 == "V")
        {
            if (PengukuranT0View.ToString() != "1")
            {
                if (groups.ToString() != "1")
                {
                    Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
                    Response.Write("alert('Anda Tidak Memiliki Akses Untuk Melihat Di Modul Ini');");
                    Response.Write("location.href = '../Pages//home.aspx';");
                    Response.Write("</script>");
                }
            }
        }

        else if (Param1 == "E")
        {
            if (PengukuranT0Edit.ToString() != "1")
            {
                if (groups.ToString() != "1")
                {
                    Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
                    Response.Write("alert('Anda Tidak Memiliki Akses Untuk Edit Di Modul Ini');");
                    Response.Write("location.href = '../Pages//home.aspx';");
                    Response.Write("</script>");
                }
            }
        }

        else if (Param1.ToString() == "D")
        {
            if (PengukuranT0Delete.ToString() != "1")
            {
                if (groups.ToString() != "1")
                {
                    Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
                    Response.Write("alert('Anda Tidak Memiliki Akses Untuk Delete Di Modul Ini');");
                    Response.Write("location.href = '../Pages//home.aspx';");
                    Response.Write("</script>");
                }
            }
        }

        else
        {
            Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
            Response.Write("alert('Aksi Yang Anda Cari Tidak Ditemukan');");
            Response.Write("location.href = '../Pages//home.aspx';");
            Response.Write("</script>");
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
            case "V":

                var Param1 = Request.Params["param1"].ToString();
                var Param2 = Request.Params["param2"].ToString();
                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List24("P_PENGTO", Param1, Param2, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

                dt = ds.Tables[0];

                Response.ContentType = "text/plain";
                Response.Write(dt.Rows[0]["pengtoNmrPid"].ToString() + "|"); //0
                Response.Write(dt.Rows[0]["pengtoDatess"].ToString() + "|"); //1
                Response.Write(dt.Rows[0]["registNmrReg"].ToString() + "|"); //2
                Response.Write(dt.Rows[0]["pengtoTgljdw"].ToString() + "|"); //3
                Response.Write(dt.Rows[0]["MidentNamass"].ToString() + "|"); //4
                Response.Write(dt.Rows[0]["MidentIdents"].ToString() + "|"); //5
                Response.Write(dt.Rows[0]["MidentNmrHps"].ToString() + "|"); //6
                Response.Write(dt.Rows[0]["MidentAlamat"].ToString() + "|"); //7
                Response.Write(dt.Rows[0]["registDatess"].ToString() + "|"); //8
                Response.Write(dt.Rows[0]["pengtoKeteks"].ToString() + "|"); //9
                Response.Write(dt.Rows[0]["pengtoEkseps"].ToString() + "|"); //10
                Response.Write(dt.Rows[0]["pengtoTglpen"].ToString() + "|"); //11
                Response.Write(dt.Rows[0]["pengtoToLMss"].ToString() + "|"); //12
                Response.Write(dt.Rows[0]["pengtoToSurv"].ToString() + "|"); //13
                Response.Write(dt.Rows[0]["pengtoAppsur"].ToString() + "|"); //14
                Response.Write(dt.Rows[0]["pengtoAppTss"].ToString() + "|"); //15
                Response.Write(dt.Rows[0]["pengtoDiteri"].ToString() + "|"); //16
                Response.Write(dt.Rows[0]["pengtoKtergn"].ToString() + "|"); //17
                Response.Write(dt.Rows[0]["pengtoLanjut"].ToString() + "|"); //18
                Response.Write(dt.Rows[0]["pengtoOverlp"].ToString() + "|"); //19
                Response.Write(dt.Rows[0]["pengtoIdents"].ToString() + "|"); //20
                Response.Write(dt.Rows[0]["pengtoNamPLK"].ToString() + "|"); //21
                Response.Write(dt.Rows[0]["pengtoLuasPL"].ToString() + "|"); //22
		
                dt.Dispose();

                Response.End();
                Response.End();
                return false;

            //return false;

            case "CRUD":
                Response.ContentType = "text/plain";
                Response.Write(CRUD());
                Response.End();
                return false;

            case "ID":
                Response.ContentType = "text/plain";
                Response.Write(SaveDetail());
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

            case "SavePic":
                Response.ContentType = "text/plain";
                Response.Write(SaveUploadGIFDUMP());
                Response.End();
                return false;

            case "DOCpic":

                String path_pic = (HttpContext.Current.Request.Url.AbsolutePath).ToLower();

                string IDREGISTRASI = Request.Params["IDREGISTRASI"].ToString();
                string param1 = Request.Params["param1"].ToString();

                ALMIS.ExecuteSTP eSTPx = new ALMIS.ExecuteSTP();
                eSTPx.Datas();
                DataSet dsx = new DataSet();
                dsx = eSTPx.List24("P_PENGTO", param1, IDREGISTRASI, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

                dt = dsx.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");

                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumFiless"].ToString()) + "</cell>");

                    Response.Write("<cell>" + "Download^" + path_pic + "?sm=df&amp;namafile=" + dt.Rows[i]["hdocumIdLink"].ToString() + "&amp;filelama=" + dt.Rows[i]["hdocumFiless"].ToString() + "</cell>");
                    //Response.Write("<cell>" + "Delete^" + path_pic + "?sm=Deletepic&amp;IDSOURCE=" + dt.Rows[i]["IDSource"].ToString() + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace("Delete^javascript:DeletePic(\"" + dt.Rows[i]["hdocumIdLink"].ToString()) + "\",\"" + IDREGISTRASI + "\");^_self" + "</cell>");

                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumIdSour"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumIdLink"].ToString()) + "</cell>");

                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();
                Response.End();


                return false;

            case "SD":

                var param1SA = Request.Params["param1"].ToString();
                var param2SA = Request.Params["param2"].ToString();

                ALMIS.ExecuteSTP eSTP_SA = new ALMIS.ExecuteSTP();
                eSTP_SA.Datas();
                DataSet ds_SA = new DataSet();
                ds_SA = eSTP_SA.List9("P_PENGTO_D", param1SA, param2SA, "", "", "", "", "", "", "");

                dt = ds_SA.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pengtoNamPlk"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pengtoLuaPlk"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pengtoStatus"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pengtoIdents"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pengtoSequen"].ToString()) + "</cell>");

                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();

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
        String param12 = ""; if (Request.Params["param12"] is object) param12 = Request.Params["param12"].ToString();
        String param13 = ""; if (Request.Params["param13"] is object) param13 = Request.Params["param13"].ToString();
        String param14 = ""; if (Request.Params["param14"] is object) param14 = Request.Params["param14"].ToString();
        String param15 = ""; if (Request.Params["param15"] is object) param15 = Request.Params["param15"].ToString();
        String param16 = ""; if (Request.Params["param16"] is object) param16 = Request.Params["param16"].ToString();
        String param17 = ""; if (Request.Params["param17"] is object) param17 = Request.Params["param17"].ToString();
        String param18 = ""; if (Request.Params["param18"] is object) param18 = Request.Params["param18"].ToString();
        String param19 = ""; if (Request.Params["param19"] is object) param19 = Request.Params["param19"].ToString();
        String param20 = ""; if (Request.Params["param20"] is object) param20 = Request.Params["param20"].ToString();
        String param21 = ""; if (Request.Params["param21"] is object) param21 = Request.Params["param21"].ToString();
        String param22 = ""; if (Request.Params["param22"] is object) param22 = Request.Params["param22"].ToString();
        String param23 = ""; if (Request.Params["param23"] is object) param23 = Request.Params["param23"].ToString();
        String param24 = ""; if (Request.Params["param24"] is object) param24 = Request.Params["param24"].ToString();
        String sql = "";
        String output = "";

        try
        {
            
            output = param1;

            if (output == "E" || output == "D" || output == "A")
            {
                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List24("P_PENGTO", "X", param2, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
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


            if (output == "I" || output == "E" || output == "D")
            {              

                param18 = userid;

                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                eSTP.save24("P_PENGTO", param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14, param15, param16, param17, param18, param19, param20, param21, param22, param23, "0");

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

    private String SaveDetail()
    {
        String param1 = ""; if (Request.Params["param1"] is object) param1 = Request.Params["param1"].ToString();
        String param2 = ""; if (Request.Params["param2"] is object) param2 = Request.Params["param2"].ToString();
        String param3 = ""; if (Request.Params["param3"] is object) param3 = Request.Params["param3"].ToString();
        String param4 = ""; if (Request.Params["param4"] is object) param4 = Request.Params["param4"].ToString();
        String param5 = ""; if (Request.Params["param5"] is object) param5 = Request.Params["param5"].ToString();
        String param6 = ""; if (Request.Params["param6"] is object) param6 = Request.Params["param6"].ToString();
        String param7 = ""; if (Request.Params["param7"] is object) param7 = Request.Params["param7"].ToString();
        String param8 = ""; if (Request.Params["param8"] is object) param8 = Request.Params["param8"].ToString();
        String param9 = ""; if (Request.Params["param9"] is object) param9 = Request.Params["param9"].ToString();

        try
        {


                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                eSTP.save9("P_PENGTO_D", param1, param2, param3, param4, param5, param6, param7, param8, param9);

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            Response.End();
            return ex.Message;
        }

        return param1;
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
        query = @"SELECT mdesaaIddesaa, mdesaaNmdesa FROM almis.MDESAA WHERE mdesaaIdcamt = " + ddKecamatan.SelectedValue.ToString();
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

    public void AjaxFileUploadGIFDUMP_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    {

        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();
        }

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


            _stNomor = gn.GenerateNumber("", 101, 4, _stDates, userid);

            FileGIFDUMP.SaveAs(uploadFolder + _stNomor + ext.getExtsion());
            e.PostedUrl = string.Format(e.FileName + "|" + _stNomor + "|" + userid + "|" + wilayah);

        }
    }

    private String SaveUploadGIFDUMP()
    {
        string IDREGISTRASI = Request.Params["IDREGISTRASI"].ToString();
        string _stNamaFile = Request.Params["NAMA"].ToString();
        string _stKeterangan = Request.Params["KETERANGAN"].ToString();
        string _stNomor = Request.Params["NOMOR"].ToString();

        ALMIS.UploadFile uf = new ALMIS.UploadFile();
        uf.Datas();

        string _stDates = DateTime.Today.ToString("yyyyMMdd");

        string param1 = Request.Params["param1"].ToString();
        string user = Request.Params["user"].ToString();
        string wilayah = Request.Params["wilay"].ToString();


        string _stUploadKeterangan = "";
        _stUploadKeterangan = _stKeterangan;

        string uploadFolder = Request.PhysicalApplicationPath + "uploadDocument\\";
        string extension = Path.GetExtension(_stNamaFile);

        ALMIS.paramz ext = new ALMIS.paramz();

        ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
        eSTP.Datas();
        DataSet ds = new DataSet();

        //eSTP.save5("P_PENGTO_D", param1, IDREGISTRASI, "", param5, _stKeterangan);

        if (extension != ".exe")
        {

            uf.UploadFilesWeb("I", user, _stDates, "Pengukuran", "", uploadFolder, IDREGISTRASI, _stNomor + extension, _stNamaFile, _stUploadKeterangan,"","");
        }

        var _stOutput = ID;

        return _stOutput;
    }


}


              
