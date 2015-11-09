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
using System.IO;

using System.Web.Services;


public partial class Pages_MasterIdentitasForm : System.Web.UI.Page
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
    protected String MasterIdentitasEdit = ""; //0
    protected String MasterIdentitasDelete = ""; //1
    protected String MasterIdentitasView = ""; //2
    protected String MasterIdentitasAssign = "";//3
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

    private string _stFAsli;  

    protected void Page_Load(object sender, EventArgs e)
    {

        


        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();
        }

        isiPerusa();
        Bind();

        bool normal = true;
        if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());

        HakAkses();
    }

    


    public void isiPerusa()
    {

        query = @"SELECT perusaNamass,perusaIdents FROM USRPRS 
                  INNER JOIN PERUSA
	                ON UsrprsPerusa = perusaIdents
                   WHERE UsrprsUserss ="+"'"+userid+"'"+"";

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

        MasterIdentitasView = dt.Rows[11]["MasterIdentitas"].ToString(); //0
        MasterIdentitasEdit = dt.Rows[11]["MasterIdentitasEdit"].ToString(); //1
        MasterIdentitasDelete = dt.Rows[11]["MasterIdentitasDelete"].ToString(); //2
        MasterIdentitasAssign = dt.Rows[11]["MasterIdentitasAssign"].ToString(); //3

        dt.Dispose();

        if (Param1 == "")
        {
            if (MasterIdentitasView.ToString() != "1")
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

        else if (Param1 == "F")
        {
            if (MasterIdentitasView.ToString() != "1")
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
            if (MasterIdentitasEdit.ToString() != "1")
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
            if (MasterIdentitasDelete.ToString() != "1")
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

        else if (Param1.ToString() == "I")
        {
            if (MasterIdentitasAssign.ToString() != "1")
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
        return dt;

    }

    public void Bind()
    {
        BindIdentitas();
        BindJenisKelamin();
        BindPekerjaan();
        BindStatus();
    }

    private void BindIdentitas()
    {
        
        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    almis.CODESS
                    WHERE   codessHeadss = 3
                            AND codessStatss = 1";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddIdentitas.Items.Clear();
            ddIdentitas.Items.Add(new ListItem("Pilih Identitas", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
               ddIdentitas.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString())  );
            }
        }
        dt.Dispose();
    }

    private void BindJenisKelamin()
    {
        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    almis.CODESS
                    WHERE   codessHeadss = 1
                            AND codessStatss = 1";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            DDJenisKelamin.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DDJenisKelamin.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
        dt.Dispose();
    }

    private void BindPekerjaan()
    {
        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    almis.CODESS
                    WHERE   codessHeadss = 2
                            AND codessStatss = 1";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddPekerjaan.Items.Clear();
            ddPekerjaan.Items.Add(new ListItem("Pilih Pekerjaan", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddPekerjaan.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }

        if (dt.Rows.Count > 0)
        {
            PopupddPkrjAnak.Items.Clear();
            PopupddPkrjAnak.Items.Add(new ListItem("Pilih Pekerjaan", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                PopupddPkrjAnak.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }

        if (dt.Rows.Count > 0)
        {
            PopupddPkrjSaudara.Items.Clear();
            PopupddPkrjSaudara.Items.Add(new ListItem("Pilih Pekerjaan", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                PopupddPkrjSaudara.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }

        dt.Dispose();
    }

    private void BindStatus()
    {
        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    almis.CODESS
                    WHERE   codessHeadss = 5
                            AND NOT codessCodess IN (0,3,4)";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            DDStatus.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DDStatus.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
        dt.Dispose();
    }

     private bool ServiceSelect(string sm)
     {
       
        switch (sm)
        {

            case "select":

                param1 = Request.Params["param1"].ToString();
                param2 = Request.Params["param2"].ToString();

                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List29("P_MINDENT", param1, param2, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

                dt = ds.Tables[0];

                Response.ContentType = "text/plain";

                Response.Write(dt.Rows[0]["MidentIdents"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentJnsIdn"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentNamass"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentJnsKel"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentTmplhr"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentTgllhr"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentPekerj"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentNmrPeg"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentAlamat"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentNmrHps"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentStatus"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentNmPsng"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentTmpPas"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentTglPas"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentThnNkh"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentNmAyah"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentTglAyh"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentKrjAyh"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentAlmAyh"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentNmIbus"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentTglIbu"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentKrjIbu"].ToString() + "|");
                Response.Write(dt.Rows[0]["MidentAlmIbu"].ToString() + "|");
                Response.Write(dt.Rows[0]["Midentkodper"].ToString() + "|");
                
                

                dt.Dispose();

                Response.End();
                Response.End();

                return false;

            case "SA":

                param1 = Request.Params["param1"].ToString();
                param2 = Request.Params["param2"].ToString();

                ALMIS.ExecuteSTP eSTP_SA = new ALMIS.ExecuteSTP();
                eSTP_SA.Datas();
                DataSet ds_SA = new DataSet();
                ds_SA = eSTP_SA.List12("P_MINDENT_A", param1, param2, "", "", "", "", "", "", "", "", "", "");

                dt = ds_SA.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["midentNamass"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["midentTgllhr"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["midentPkrjan"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["midentAlamat"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace("Delete^javascript:Hapus(\"" +"DA" + "\",\"" + "DA" + "\",\"" + dt.Rows[i]["MidentIdents"].ToString() + "\",\"" + dt.Rows[i]["midentSequen"].ToString() + "\");^_self") + "</cell>");
                    
                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                Response.End();

                return false;

            case "SS":

                param1 = Request.Params["param1"].ToString();
                param2 = Request.Params["param2"].ToString();
               

                ALMIS.ExecuteSTP eSTP_SS = new ALMIS.ExecuteSTP();
                eSTP_SS.Datas();
                DataSet ds_SS = new DataSet();
                ds_SA = eSTP_SS.List12("P_MINDENT_S", param1, param2, "", "", "", "", "", "", "", "", "", "");

                dt = ds_SA.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["midentNamass"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["midentTgllhr"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["midentPkrjan"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["midentAlamat"].ToString()) + "</cell>");
                    //Response.Write("<cell>" + RemoveWhiteSpace("View^javascript:View(\"" + "SS" + "\",\"" + "SS" + "\",\"" + dt.Rows[i]["MidentIdents"].ToString() + "\",\"" + dt.Rows[i]["midentSequen"].ToString() + "\");^_self") + "</cell>");
                    //Response.Write("<cell>" + RemoveWhiteSpace("Edit^javascript:Edit(\"" + "US" + "\",\"" + "US" + "\",\"" + dt.Rows[i]["MidentIdents"].ToString() + "\",\"" + dt.Rows[i]["midentSequen"].ToString() + "\");^_self") + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace("Delete^javascript:Hapus(\"" + "DS" + "\",\"" + "DS" + "\",\"" + dt.Rows[i]["MidentIdents"].ToString() + "\",\"" + dt.Rows[i]["midentSequen"].ToString() + "\");^_self") + "</cell>");

                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                Response.End();

                return false;

            case "ListUploadIdentitasLahan":

                param1 = Request.Params["param1"].ToString();
                param2 = Request.Params["IDRegistrasi"].ToString();

                String path_pic = (HttpContext.Current.Request.Url.AbsolutePath).ToLower();


                ALMIS.ExecuteSTP eSTPz = new ALMIS.ExecuteSTP();
                eSTPz.Datas();
                DataSet dsz = new DataSet();
                dsz = eSTPz.List29("P_MINDENT", param1, param2, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
                

                dt = dsz.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");

                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>");
                    //Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["codessDescs1"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumFiless"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumFiless"].ToString()) + "</cell>");

                    Response.Write("<cell>" + "Download^" + path_pic + "?sm=df&amp;namafile=" + dt.Rows[i]["hdocumIdLink"].ToString() + "&amp;filelama=" + dt.Rows[i]["hdocumFiless"].ToString() + "</cell>");
                    //Response.Write("<cell>" + "Delete^" + path_pic + "?sm=Deletepic&amp;IDSOURCE=" + dt.Rows[i]["IDSource"].ToString() + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace("Delete^javascript:DeletePic(\"" + dt.Rows[i]["hdocumIdLink"].ToString()) + "\",\"" + param2 + "\");^_self" + "</cell>");

                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumIdSour"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumIdLink"].ToString()) + "</cell>");
                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();
                //conn.myConnectionClose();
                Response.End();
                return false;

            case "ListUploadKelengkapan":

                param1 = Request.Params["param1"].ToString();
                param2 = Request.Params["IDRegistrasi"].ToString();

                String path_pica = (HttpContext.Current.Request.Url.AbsolutePath).ToLower();


                ALMIS.ExecuteSTP eSTPa = new ALMIS.ExecuteSTP();
                eSTPa.Datas();
                DataSet dsa = new DataSet();
                dsa = eSTPa.List6("P_REGIST_D", param1, param2, "", "", "", "");

                dt = dsa.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");

                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumFiless"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumFiless"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumFiless"].ToString()) + "</cell>");

                    Response.Write("<cell>" + "Download^" + path_pica + "?sm=df&amp;namafile=" + dt.Rows[i]["hdocumIdLink"].ToString() + "&amp;filelama=" + dt.Rows[i]["hdocumFiless"].ToString() + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace("Delete^javascript:DeletePic(\"" + dt.Rows[i]["hdocumIdLink"].ToString()) + "\",\"" + param2 + "\");^_self" + "</cell>");

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
                dt.Dispose();
                Response.End();
                return false;

            case "SaveUploadRegistrasi":
                Response.ContentType = "text/plain";
                Response.Write(SaveUploadRegistrasi());
                Response.End();
                return false;

            case "IA":

                param1 = Request.Params["param1"].ToString();
                param2 = Request.Params["param2"].ToString();
                param5 = Request.Params["param5"].ToString();
                param6 = Request.Params["param6"].ToString();
                param7 = Request.Params["param7"].ToString();
                param8 = Request.Params["param8"].ToString();
                param11 = Request.Params["param11"].ToString();

                ALMIS.ExecuteSTP eSTP_IA = new ALMIS.ExecuteSTP();
                eSTP_IA.Datas();
                eSTP_IA.save12("P_MINDENT_A", param1, param2, param3, param4, param5, param6, param7, param8, userid, param10, param11, "0");

                dt.Dispose();
                return false;

            case "IS":

                param1 = Request.Params["param1"].ToString();
                param2 = Request.Params["param2"].ToString();
                param5 = Request.Params["param5"].ToString();
                param6 = Request.Params["param6"].ToString();
                param7 = Request.Params["param7"].ToString();
                param8 = Request.Params["param8"].ToString();
                param11 = Request.Params["param11"].ToString();

                ALMIS.ExecuteSTP eSTP_IS = new ALMIS.ExecuteSTP();
                eSTP_IS.Datas();
                eSTP_IS.save12("P_MINDENT_S", param1, param2, "", param4, param5, param6, param7, param8, userid, param10, param11, "0");

                dt.Dispose();
                return false;

            case "DA":

                param1 = Request.Params["param1"].ToString();
                param2 = Request.Params["param2"].ToString();
                param4 = Request.Params["param4"].ToString();

                ALMIS.ExecuteSTP eSTP_DA = new ALMIS.ExecuteSTP();
                eSTP_DA.Datas();
                eSTP_DA.save12("P_MINDENT_A", param1, param2, param3, param4, param5, param6, param7, param8, userid, param10, param11, "0");

                dt.Dispose();
                return false;

            case "DS":

                param1 = Request.Params["param1"].ToString();
                param2 = Request.Params["param2"].ToString();
                param4 = Request.Params["param4"].ToString();

                ALMIS.ExecuteSTP eSTP_DS = new ALMIS.ExecuteSTP();
                eSTP_DS.Datas();
                eSTP_DS.save12("P_MINDENT_S", param1, param2, param3, param4, param5, param6, param7, param8, userid, param10, param11, "0");

                dt.Dispose();
                return false;

            case "CRUD":
                Response.ContentType = "text/plain";
                Response.Write(CRUD());
                dt.Dispose();
                Response.End();
                return false;



            default:
                Response.ContentType = "text/plain";
                dt.Dispose();
                Response.End();
                return true;
        }
    }

     private String SaveUploadRegistrasi()
     {
         string IDRegistrasi = Request.Params["IDREGISTRASI"].ToString();
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

         //eSTP.save5("P_REGIST_U", param1, IDRegistrasi, "", param5, _stKeterangan);

         if (extension != ".exe")
         {

             uf.UploadFilesWeb("I", user, _stDates, "Master Identitas", param5, uploadFolder, IDRegistrasi, _stNomor + extension, _stNamaFile, _stUploadKeterangan,"","");
         }

         var _stOutput = IDRegistrasi;

         return _stOutput;
     }

     private String CRUD()
     {
 
         param1 = Request.Params["param1"].ToString();
         param2 = Request.Params["param2"].ToString();
         
         param4 = Request.Params["param4"].ToString();
         param5 = Request.Params["param5"].ToString();
         param6 = Request.Params["param6"].ToString();
         param7 = Request.Params["param7"].ToString();
         param8 = Request.Params["param8"].ToString();
         param9 = Request.Params["param9"].ToString();
         param10 = Request.Params["param10"].ToString();
         param11 = Request.Params["param11"].ToString();
         param12 = Request.Params["param12"].ToString();
         param13 = Request.Params["param13"].ToString();
         param14 = Request.Params["param14"].ToString();
         param15 = Request.Params["param15"].ToString();
         param16 = Request.Params["param16"].ToString();
         param17 = Request.Params["param17"].ToString();
         param18 = Request.Params["param18"].ToString();
         param19 = Request.Params["param19"].ToString();
         param20 = Request.Params["param20"].ToString();
         param21 = Request.Params["param21"].ToString();
         param22 = Request.Params["param22"].ToString();
         param23 = Request.Params["param23"].ToString();
         param24 = Request.Params["param24"].ToString();
         param25 = Request.Params["param25"].ToString();

         param28 = Request.Params["param28"].ToString();


         String sql = "";
         String output = "";

         try
         {

             output = param1;

                 if (output == "I")
                 {

                     ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                     eSTP.Datas();
                     DataSet ds = new DataSet();
                     ds = eSTP.List29("P_MINDENT", "X", param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14, param15, param16, param17, param18, param19, param20, param21, param22, param23, param24, param25, userid, param27, param28, "0");
                     dt = ds.Tables[0];

                         if (dt.Rows.Count > 0)
                         {
                             if (output == "I")
                                 output = "notambah";

                             return output;
                         }
                 }
                    

             if (output == "I" || output == "E" || output == "D")
             //if (output == "E" || output == "D")
             {

                 ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                 eSTP.Datas();
                 DataSet ds = new DataSet();
                 eSTP.save29("P_MINDENT", param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14, param15, param16, param17, param18, param19, param20, param21, param22, param23, param24, param25, userid, param27, param28, "0");


                 return output;
             }

             //if (output == "I")
             //{

             //    LANDCOMP.ExecuteSTP eSTP = new LANDCOMP.ExecuteSTP();
             //    eSTP.Datas();
             //    DataSet ds = new DataSet();
             //    eSTP.save26("P_MINDENT", "E", param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14, param15, param16, param17, param18, param19, param20, param21, param22, param23, param24, param25, param26);


             //    return output;
             //}

             else
                 output = "gagal";
         }



         catch (Exception ex)
         {
             Response.Write(ex.Message);
             dt.Dispose();
             Response.End();
             return ex.Message;
         }

         return output;
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


     public void AjaxFileUploadIdentitasLahan_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
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


             _stNomor = gn.GenerateNumber("", 101, 10, _stDates, userid);

             AjaxFileUploadIdentitasLahan.SaveAs(uploadFolder + _stNomor + ext.getExtsion());
             e.PostedUrl = string.Format(e.FileName + "|" + _stNomor + "|" + userid + "|" + wilayah);

         }
     }

}