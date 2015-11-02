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

public partial class Pages_PemberkasanSatuForm : System.Web.UI.Page
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
    protected String PemberkasanEdit = ""; //0
    protected String PemberkasanDelete = ""; //1
    protected String PemberkasanView = ""; //2
    protected String PemberkasanAssign = "";//3
    string _stFAsli;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            isiLanjut();
            isiPerolehan();

            bool normal = true;
            if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());
            HakAkses();
        }
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

        PemberkasanView = dt.Rows[6]["Pemberkasan"].ToString(); //0
        PemberkasanEdit = dt.Rows[6]["PemberkasanEdit"].ToString(); //1
        PemberkasanDelete = dt.Rows[6]["PemberkasanDelete"].ToString(); //2
        PemberkasanAssign = dt.Rows[6]["PemberkasanAssign"].ToString(); //3

        dt.Dispose();

        if (Param1 == "")
        {

            Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
            Response.Write("alert('Tidak Ada Aksi Yang Ada Pilih');");
            Response.Write("location.href = '../Pages/home.aspx';");
            Response.Write("</script>");

        }

        else if (Param1 == "V")
        {
            if (PemberkasanView.ToString() != "1")
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
            if (PemberkasanEdit.ToString() != "1")
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
            if (PemberkasanDelete.ToString() != "1")
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

    public void isiLanjut()
    {
        query = @"SELECT codessCodess, codessDescs1 FROM almis.CODESS WHERE codessHeadss=4
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

    public void isiPerolehan()
    {
        query = @"SELECT codessCodess, codessDescs1 FROM almis.CODESS WHERE codessHeadss=26
                AND codessStatss = 1 ORDER BY codessCodess DESC";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddPerolehanLahan.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddPerolehanLahan.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
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
                ds = eSTP.List16("P_BERKS1", Param1, Param2, "", "", "", "", "", "", "", "", "", "", "", "", "", "");

                dt = ds.Tables[0];

                Response.ContentType = "text/plain";
                Response.Write(dt.Rows[0]["berks1NmrBr1"].ToString() + "|"); //0
                Response.Write(dt.Rows[0]["berks1NmrReg"].ToString() + "|"); //1
                Response.Write(dt.Rows[0]["berks1NmrPid"].ToString() + "|"); //2
                Response.Write(dt.Rows[0]["berks1NmrNeg"].ToString() + "|"); //3
                Response.Write(dt.Rows[0]["berks1Novism"].ToString() + "|"); //4
                Response.Write(dt.Rows[0]["berks1Lanjut"].ToString() + "|"); //5
                Response.Write(dt.Rows[0]["berks1Ketrgn"].ToString() + "|"); //6
                Response.Write(dt.Rows[0]["berks1Ekseps"].ToString() + "|"); //7
                Response.Write(dt.Rows[0]["berks1Keteks"].ToString() + "|"); //8
                dt.Dispose();

                Response.End();
                Response.End();
                return false;

            case "CRUD":
                Response.ContentType = "text/plain";
                Response.Write(Save());
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
                Response.Write(SaveUploadPemberkasan());
                Response.End();
                return false;

            case "DOCpic":

                String path_pic = (HttpContext.Current.Request.Url.AbsolutePath).ToLower();

                string IDPemberkasan = Request.Params["IDPemberkasan"].ToString();
                string param1 = Request.Params["param1"].ToString();

                ALMIS.ExecuteSTP eSTPx = new ALMIS.ExecuteSTP();
                eSTPx.Datas();
                DataSet dsx = new DataSet();
                dsx = eSTPx.List7("P_BERKS1_D", param1, IDPemberkasan, "", "", "", "", "");

                dt = dsx.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");

                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["codessDescs1"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["berks1Ketrgn"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumFiless"].ToString()) + "</cell>");

                    Response.Write("<cell>" + "Download^" + path_pic + "?sm=df&amp;namafile=" + dt.Rows[i]["hdocumIdLink"].ToString() + "&amp;filelama=" + dt.Rows[i]["hdocumFiless"].ToString() + "</cell>");
                    //Response.Write("<cell>" + "Delete^" + path_pic + "?sm=Deletepic&amp;IDSOURCE=" + dt.Rows[i]["IDSource"].ToString() + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace("Delete^javascript:DeletePic(\"" + dt.Rows[i]["hdocumIdLink"].ToString()) + "\",\"" + IDPemberkasan + "\");^_self" + "</cell>");

                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumIdSour"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumIdLink"].ToString()) + "</cell>");

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
        String param12 = ""; if (Request.Params["param12"] is object) param12 = Request.Params["param12"].ToString();
        String param13 = ""; if (Request.Params["param13"] is object) param13 = Request.Params["param13"].ToString();
        String param14 = ""; if (Request.Params["param14"] is object) param14 = Request.Params["param14"].ToString();
        String param15 = ""; if (Request.Params["param15"] is object) param15 = Request.Params["param15"].ToString();
        String param16 = ""; if (Request.Params["param16"] is object) param16 = Request.Params["param16"].ToString();
        //String sql = "";
        String output = "";

        try
        {

            output = param1;

            if (output == "E" || output == "D" || output == "A")
            {
                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List16("P_BERKS1", "X", param2, "", "", "", "", "", "", "", "", "", "", "", "", "", "");
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
         
            if (output == "I" ||  output == "E" || output == "D")
            {
                

                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                eSTP.save16("P_BERKS1", param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, userid, param14, param15, param16);

                
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

    public void AjaxFileUploadPemberkasan_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
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


            _stNomor = gn.GenerateNumber("", 101, 7, _stDates, userid);

            FilePemberkasan.SaveAs(uploadFolder + _stNomor + ext.getExtsion());
            e.PostedUrl = string.Format(e.FileName + "|" + _stNomor + "|" + userid + "|" + wilayah);

        }
    }

    private String SaveUploadPemberkasan()
    {
        string IDPemberkasan = Request.Params["IDPemberkasan"].ToString();
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


        string _stUploadKeterangan = "";
        _stUploadKeterangan = _stKeterangan;

        string uploadFolder = Request.PhysicalApplicationPath + "uploadDocument\\";
        string extension = Path.GetExtension(_stNamaFile);

        ALMIS.paramz ext = new ALMIS.paramz();

        ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
        eSTP.Datas();
        DataSet ds = new DataSet();

        eSTP.save7("P_BERKS1_D", param1, IDPemberkasan, "", param5, _stKeterangan,"","");

        if (extension != ".exe")
        {

            uf.UploadFilesWeb("I", user, _stDates, "Pemberkasan", param5, uploadFolder, IDPemberkasan, _stNomor + extension, _stNamaFile, _stUploadKeterangan,"","");
        }

        var _stOutput = ID;

        return _stOutput;
    }

}