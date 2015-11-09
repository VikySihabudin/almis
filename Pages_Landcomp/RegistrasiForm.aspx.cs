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

public partial class Pages_RegistrasiForm : System.Web.UI.Page
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
    protected String RegistrasiEdit = ""; //0
    protected String RegistrasiDelete = ""; //1
    protected String RegistrasiView = ""; //2
    protected String RegistrasiAssign = "";//3

    private string _stFAsli;

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            if (Session["userid"] is object)
            {
                userid = Session["userid"].ToString();
            }

            isiPerusa();
            isiJenisKelamin();
            isiPekerjaan();
            isiTandaIdentitas();
            isilanjut();
            isiKecamatan();
            isikabupaten();
            isiStatus();
            
            isiDesa();
            isipernah();
            isiSHM();
            isiPerolehanTanah();
            isiInfrastruktur();
            isiKondisiLahan();
            
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

        RegistrasiView = dt.Rows[2]["Registrasi"].ToString(); //0
        RegistrasiEdit = dt.Rows[2]["RegistrasiEdit"].ToString(); //1
        RegistrasiDelete = dt.Rows[2]["RegistrasiDelete"].ToString(); //2
        RegistrasiAssign = dt.Rows[2]["RegistrasiAssign"].ToString(); //3

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
            if (RegistrasiView.ToString() != "1")
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
            if (RegistrasiEdit.ToString() != "1")
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
            if (RegistrasiDelete.ToString() != "1")
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

    public void isikabupaten()
    {
        query = @"SELECT mkabupIdkabu, mkabupNmkabu FROM ALMIS.MKABUP";
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
    }

    public void isiKecamatan()
    {
        query = @"SELECT mcamatIdcamt, mcamatNmcamt FROM ALMIS.MCAMAT";
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
    }

    public void isiDesa()
    {
        query = @"SELECT mdesaaIddesaa, mdesaaNmdesa FROM ALMIS.MDESAA ";
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
    }



    private void isiPekerjaan()
    {
        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    ALMIS.CODESS
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
    }

    private void isilanjut()
    {
        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    ALMIS.CODESS
                    WHERE   codessHeadss = 4
                            AND codessStatss = 1
                    ORDER BY codessCodess DESC";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddLanjut.Items.Clear();
            
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddLanjut.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
    }

    private void isiJenisKelamin()
    {
        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    ALMIS.CODESS
                    WHERE   codessHeadss = 1
                            AND codessStatss = 1";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddJenisKelamin.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddJenisKelamin.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
    }

    private void isiTandaIdentitas()
    {

        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    ALMIS.CODESS
                    WHERE   codessHeadss = 3
                            AND codessStatss = 1";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddTandaIdentitas.Items.Clear();
            ddTandaIdentitas.Items.Add(new ListItem("Pilih Identitas", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddTandaIdentitas.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
    }

    private void isiStatus()
    {
        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    ALMIS.CODESS
                    WHERE   codessHeadss = 5
                            AND NOT codessCodess IN (0,3,4)";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddStatus.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddStatus.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
    }

    private void isipernah()
    {
        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    ALMIS.CODESS
                    WHERE   codessHeadss = 7
                            AND NOT codessCodess IN (0,3,4)";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            //ddStatus.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DDQuest1.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
                ddQuest2.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
                ddSengketa.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
                ddDiagunkan.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
                DDPecahanAlasHak.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }


    }


    private void isiSHM()
    {
        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    ALMIS.CODESS
                    WHERE   codessHeadss = 16
                            AND codessStatss = 1";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddSHM.Items.Clear();
            ddSHM.Items.Add(new ListItem("Pilih Identitas Lahan ", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddSHM.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
    }

    private void isiPerolehanTanah()
    {
        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    ALMIS.CODESS
                    WHERE   codessHeadss = 17
                            AND codessStatss = 1";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddPerolehanLahan.Items.Clear();
            ddPerolehanLahan.Items.Add(new ListItem("Pilih Perolehan Lahan", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddPerolehanLahan.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
    }

    public string IsiKelengkapan(String id)
    {
        Connection conn;
        String sql = "";
        String output = "";
        conn = new Connection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal2"].ConnectionString);
        String param1 = "";
        param1 = Request.Params["param1"].ToString();

        if (param1 == "1")
            param1 = "10";
        if (param1 == "2")
            param1 = "11";
        if (param1 == "3")
            param1 = "12";
        if (param1 == "4")
            param1 = "13";

        try
        {
            sql = @"
                    SELECT  codessCodess ,
                            codessDescs1
                    FROM    ALMIS.CODESS
                    WHERE   codessHeadss = " + param1 + " AND codessStatss = 1";


            DataTable dt = new DataTable();
            dt = conn.sqlQuery(sql);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                output += dt.Rows[i]["codessCodess"].ToString() + "^" + dt.Rows[i]["codessDescs1"].ToString() + "|";
                //output += dt.Rows[i]["kph"].ToString() + "|";

            }
            dt.Dispose();
            conn.myConnectionClose();
        }
        catch (Exception msg)
        {
            Response.Write(msg.Message);
        }
        return output;
    }



    private void isiInfrastruktur()
    {

        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    ALMIS.CODESS
                    WHERE   codessHeadss = 15
                            AND codessStatss = 1";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddInfrastruktur.Items.Clear();
            ddInfrastruktur.Items.Add(new ListItem("Pilih Infrastruktur", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddInfrastruktur.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
    }

    private void isiKondisiLahan()
    {

        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    ALMIS.CODESS
                    WHERE   codessHeadss = 14
                            AND codessStatss = 1";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddKondisiLahan.Items.Clear();
            ddKondisiLahan.Items.Add(new ListItem("Pilih Kondisi Lahan", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddKondisiLahan.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
    }

    private bool ServiceSelect(string sm)
    {
        switch (sm)
        {
            case "V": // Untuk Menampilkan Data Form Registrasi
                
                var Param1 = Request.Params["param1"].ToString();
                var Param2 = Request.Params["param2"].ToString();



                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List36("P_REGIST", Param1, Param2, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

                dt = ds.Tables[0];

                Response.ContentType = "text/plain";

                Response.Write(dt.Rows[0]["registNmrReg"].ToString() + "|"); //0
                Response.Write(dt.Rows[0]["penlapNmrPen"].ToString() + "|"); //1
                Response.Write(dt.Rows[0]["registIdents"].ToString() + "|"); //2
                Response.Write(dt.Rows[0]["MidentNamass"].ToString() + "|"); //3
                Response.Write(dt.Rows[0]["MidentIdents"].ToString() + "|"); //4
                Response.Write(dt.Rows[0]["MidentNamass"].ToString() + "|"); //5
                Response.Write(dt.Rows[0]["MidentJnsKel"].ToString() + "|"); //6
                Response.Write(dt.Rows[0]["MidentTmplhr"].ToString() + "|"); //7
                Response.Write(dt.Rows[0]["MidentTgllhr"].ToString() + "|"); //8 
                Response.Write(dt.Rows[0]["MidentPekerj"].ToString() + "|"); //9
                Response.Write(dt.Rows[0]["MidentNmrPeg"].ToString() + "|"); //10
                Response.Write(dt.Rows[0]["MidentAlamat"].ToString() + "|"); //11
                Response.Write(dt.Rows[0]["MidentJnsIdn"].ToString() + "|"); //12
                Response.Write(dt.Rows[0]["MidentNmrHps"].ToString() + "|"); //13
                Response.Write(dt.Rows[0]["MidentStatus"].ToString() + "|"); //14
                Response.Write(dt.Rows[0]["MidentNmPsng"].ToString() + "|"); //15
                Response.Write(dt.Rows[0]["MidentTmpPas"].ToString() + "|"); //16
                Response.Write(dt.Rows[0]["MidentTglPas"].ToString() + "|"); //17
                Response.Write(dt.Rows[0]["MidentThnNkh"].ToString() + "|"); //18 
                Response.Write(dt.Rows[0]["registTy1Sts"].ToString() + "|"); //19
                Response.Write(dt.Rows[0]["registTy1Sts"].ToString() + "|"); //20
                Response.Write(dt.Rows[0]["registTy2Jml"].ToString() + "|"); //21
                Response.Write(dt.Rows[0]["registTy2Sts"].ToString() + "|"); //22
                Response.Write(dt.Rows[0]["registAlshak"].ToString() + "|"); //23
                Response.Write(dt.Rows[0]["registSHMsss"].ToString() + "|"); //24
                Response.Write(dt.Rows[0]["registSHMNmr"].ToString() + "|"); //25
                Response.Write(dt.Rows[0]["registSKTsss"].ToString() + "|"); //26
                Response.Write(dt.Rows[0]["registSKTNmr"].ToString() + "|"); //27
                Response.Write(dt.Rows[0]["registTahuns"].ToString() + "|"); //28
                Response.Write(dt.Rows[0]["praregLokkab"].ToString() + "|"); //29
                Response.Write(dt.Rows[0]["praregLokkec"].ToString() + "|"); //30
                Response.Write(dt.Rows[0]["praregLokdes"].ToString() + "|"); //31
                Response.Write(dt.Rows[0]["registLuasss"].ToString() + "|"); //32
                Response.Write(dt.Rows[0]["registBtsutr"].ToString() + "|"); //33
                Response.Write(dt.Rows[0]["registBtsslt"].ToString() + "|"); //34
                Response.Write(dt.Rows[0]["registBtstmr"].ToString() + "|"); //35
                Response.Write(dt.Rows[0]["registBtsbrt"].ToString() + "|"); //36
                Response.Write(dt.Rows[0]["registTy3Sts"].ToString() + "|"); //37
                Response.Write(dt.Rows[0]["registTy3Thn"].ToString() + "|"); //38
                Response.Write(dt.Rows[0]["registTy4Sts"].ToString() + "|"); //39
                Response.Write(dt.Rows[0]["registTy4Thn"].ToString() + "|"); //40
                Response.Write(dt.Rows[0]["registTy5Sts"].ToString() + "|"); //41
                Response.Write(dt.Rows[0]["registTy5Thn"].ToString() + "|"); //42
                Response.Write(dt.Rows[0]["registKtergn"].ToString() + "|"); //43
                Response.Write(dt.Rows[0]["registEkspsi"].ToString() + "|"); //44
                Response.Write(dt.Rows[0]["registLanjut"].ToString() + "|"); //45
                Response.Write(dt.Rows[0]["registKeteks"].ToString() + "|"); //46
				Response.Write(dt.Rows[0]["registKodper"].ToString() + "|"); //47

                dt.Dispose();

                Response.End();
                Response.End();
                return false;
            case "cek":

                var Param1x = Request.Params["param1"].ToString();
                var Param2x = Request.Params["param2"].ToString();



                ALMIS.ExecuteSTP eSTPx = new ALMIS.ExecuteSTP();
                eSTPx.Datas();
                DataSet dsx = new DataSet();
                dsx = eSTPx.List36("P_REGIST", Param1x, "", "", "", "", "", "", "", "", "", "", Param2x, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

                dt = dsx.Tables[0];

                Response.ContentType = "text/plain";

                Response.Write(dt.Rows[0]["duplikat"].ToString() + "|"); //0
                Response.Write(dt.Rows[0]["registNmrReg"].ToString() + "|"); //1

                dt.Dispose();

                Response.End();
                return false;

            case "LAN":

                var param1LAN = Request.Params["param1"].ToString();
                var param2LAN = Request.Params["param2"].ToString();

                ALMIS.ExecuteSTP eSTP_LAN = new ALMIS.ExecuteSTP();
                eSTP_LAN.Datas();
                DataSet ds_LAN = new DataSet();
                ds_LAN = eSTP_LAN.List36("P_REGIST", param1LAN, param2LAN, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

                dt = ds_LAN.Tables[0];

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
                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                Response.End();

                return false;

            case "LAY":

                var param1LAY = Request.Params["param1"].ToString();
                var param2LAY = Request.Params["param2"].ToString();

                ALMIS.ExecuteSTP eSTP_LAY = new ALMIS.ExecuteSTP();
                eSTP_LAY.Datas();
                DataSet ds_LAY = new DataSet();
                ds_LAY = eSTP_LAY.List36("P_REGIST", param1LAY, param2LAY, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

                dt = ds_LAY.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");

                for (int i = 0; i < 1; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentNmAyah"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentTglAyh"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentKrjAyh"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["midentAlmAyh"].ToString()) + "</cell>");
                    Response.Write("</row>");
                }

                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                Response.End();

                return false;

            case "LIB":

                var param1LIB = Request.Params["param1"].ToString();
                var param2LIB = Request.Params["param2"].ToString();

                ALMIS.ExecuteSTP eSTP_LIB = new ALMIS.ExecuteSTP();
                eSTP_LIB.Datas();
                DataSet ds_LIB = new DataSet();
                ds_LIB = eSTP_LIB.List36("P_REGIST", param1LIB, param2LIB, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

                dt = ds_LIB.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");

                for (int i = 0; i < 1; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentNmIbus"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentTglIbu"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentKrjIbu"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["midentAlmIbu"].ToString()) + "</cell>");
                    Response.Write("</row>");
                }

                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                Response.End();

                return false;

            case "CRUD":
                Response.ContentType = "text/plain";
                Response.Write(Save());
                Response.End();
                return false;

            case "ddkl":
                Response.ContentType = "text/plain";
                Response.Write(IsiKelengkapan("1"));
                Response.End();
                return false;

            case "IA":

                string param1IA = Request.Params["param1"].ToString();
                string param2IA = Request.Params["param2"].ToString();
                string param3IA = Request.Params["param3"].ToString();
                string param4IA = Request.Params["param4"].ToString();
                string param5IA = Request.Params["param5"].ToString();
                string param6IA = Request.Params["param6"].ToString();


                ALMIS.ExecuteSTP eSTP_IA = new ALMIS.ExecuteSTP();
                eSTP_IA.Datas(); 
                eSTP_IA.save9("P_REGIST_D", param1IA, param2IA, "", param3IA, param4IA, param5IA, param6IA,"","");

                return false;

            case "SA": // Untuk Menampilkan Data Grid Kondisi Lahan Dan Ifra Stuktur

                var param1SA = Request.Params["param1"].ToString();
                var param2SA = Request.Params["param2"].ToString();
                var param3SA = Request.Params["param3"].ToString();

                ALMIS.ExecuteSTP eSTP_SA = new ALMIS.ExecuteSTP();
                eSTP_SA.Datas();
                DataSet ds_SA = new DataSet();
                ds_SA = eSTP_SA.List9("P_REGIST_D", param1SA, param2SA, "", param3SA, "", "","","","");

                dt = ds_SA.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["registKondis"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["registKeters"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace("Delete^javascript:Hapus(\"" + "DA" + "\",\"" + "DA" + "\",\"" + dt.Rows[i]["registNmrReg"].ToString() + "\",\"" + dt.Rows[i]["registSequen"].ToString() + "\",\"" + dt.Rows[i]["registSequen"].ToString() + "\");^_self") + "</cell>");

                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();

                Response.End();

                return false;
            case "DA":

                string param1DA = Request.Params["param1"].ToString();
                string param2DA = Request.Params["param2"].ToString();
                string param3DA = Request.Params["param3"].ToString();

                ALMIS.ExecuteSTP eSTP_DA = new ALMIS.ExecuteSTP();
                eSTP_DA.Datas();
                eSTP_DA.save8("P_REGIST_D", param1DA, param2DA, "", "", "", param3DA,"","");

                return false;

            case "ListUploadIdentitasLahan":

                var Param1z = Request.Params["param1"].ToString();
                var Param2z = Request.Params["IDRegistrasi"].ToString();

                String path_pic = (HttpContext.Current.Request.Url.AbsolutePath).ToLower();


                ALMIS.ExecuteSTP eSTPz = new ALMIS.ExecuteSTP();
                eSTPz.Datas();
                DataSet dsz = new DataSet();
                dsz = eSTPz.List36("P_REGIST", Param1z, Param2z, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

                dt = dsz.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");

                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["codessDescs1"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumFiless"].ToString()) + "</cell>");

                    Response.Write("<cell>" + "Download^" + path_pic + "?sm=df&amp;namafile=" + dt.Rows[i]["hdocumIdLink"].ToString() + "&amp;filelama=" + dt.Rows[i]["hdocumFiless"].ToString() + "</cell>");
                    //Response.Write("<cell>" + "Delete^" + path_pic + "?sm=Deletepic&amp;IDSOURCE=" + dt.Rows[i]["IDSource"].ToString() + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace("Delete^javascript:DeletePic(\"" + dt.Rows[i]["hdocumIdLink"].ToString()) + "\",\"" + Param2z + "\");^_self" + "</cell>");

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

                var Param1a = Request.Params["param1"].ToString();
                var Param2a = Request.Params["IDRegistrasi"].ToString();

                String path_pica = (HttpContext.Current.Request.Url.AbsolutePath).ToLower();


                ALMIS.ExecuteSTP eSTPa = new ALMIS.ExecuteSTP();
                eSTPa.Datas();
                DataSet dsa = new DataSet();
                dsa = eSTPa.List9("P_REGIST_D", Param1a, Param2a, "", "", "", "","","","");

                dt = dsa.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");

                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["codessDescs1"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["codessDescs2"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumFiless"].ToString()) + "</cell>");

                    Response.Write("<cell>" + "Download^" + path_pica + "?sm=df&amp;namafile=" + dt.Rows[i]["hdocumIdLink"].ToString() + "&amp;filelama=" + dt.Rows[i]["hdocumFiless"].ToString() + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace("Delete^javascript:DeletePic(\"" + dt.Rows[i]["hdocumIdLink"].ToString()) + "\",\"" + Param2a + "\");^_self" + "</cell>");

                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumIdSour"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["hdocumIdLink"].ToString()) + "</cell>");
                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();
                //conn.myConnectionClose();
                Response.End();
                return false;

            case "SaveUploadRegistrasi":
                Response.ContentType = "text/plain";
                Response.Write(SaveUploadRegistrasi());
                Response.End();
                return false;

            case "SaveUploadKelengkapan":
                Response.ContentType = "text/plain";
                Response.Write(SaveUploadKelengkapan());
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

            default:
                Response.ContentType = "text/plain";
                Response.End();
                return true;
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
        String param17 = ""; if (Request.Params["param17"] is object) param17 = Request.Params["param17"].ToString();
        String param18 = ""; if (Request.Params["param18"] is object) param18 = Request.Params["param18"].ToString();
        String param19 = ""; if (Request.Params["param19"] is object) param19 = Request.Params["param19"].ToString();
        String param20 = ""; if (Request.Params["param20"] is object) param20 = Request.Params["param20"].ToString();
        String param21 = ""; if (Request.Params["param21"] is object) param21 = Request.Params["param21"].ToString();
        String param22 = ""; if (Request.Params["param22"] is object) param22 = Request.Params["param22"].ToString();
        String param23 = ""; if (Request.Params["param23"] is object) param23 = Request.Params["param23"].ToString();
        String param24 = ""; if (Request.Params["param24"] is object) param24 = Request.Params["param24"].ToString();
        String param25 = ""; if (Request.Params["param25"] is object) param25 = Request.Params["param25"].ToString();
        String param26 = ""; if (Request.Params["param26"] is object) param26 = Request.Params["param26"].ToString();
        String param27 = ""; if (Request.Params["param27"] is object) param27 = Request.Params["param27"].ToString();
        String param28 = ""; if (Request.Params["param28"] is object) param28 = Request.Params["param28"].ToString();
        String param29 = ""; if (Request.Params["param29"] is object) param29 = Request.Params["param29"].ToString();
        String param30 = ""; if (Request.Params["param30"] is object) param30 = Request.Params["param30"].ToString();
        String param31 = ""; if (Request.Params["param31"] is object) param31 = Request.Params["param31"].ToString();
        String param32 = ""; if (Request.Params["param32"] is object) param32 = Request.Params["param32"].ToString();
        String param33 = ""; if (Request.Params["param33"] is object) param33 = Request.Params["param33"].ToString();
        String param34 = ""; if (Request.Params["param34"] is object) param34 = Request.Params["param34"].ToString();
        String param35 = ""; if (Request.Params["param35"] is object) param35 = Request.Params["param35"].ToString();
        String param36 = ""; if (Request.Params["param36"] is object) param36 = Request.Params["param36"].ToString();
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
                ds = eSTP.List36("P_REGIST", "X", param2, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
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

            if (output == "E" || output == "D" || output == "A")
            {
                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                eSTP.save36("P_REGIST", param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14, param15, param16, param17, param18, param19, param20, param21, param22, param23, param24, param25, param26, param27, param28, param29, param30, param31, userid, param33, param34, param35, "0");

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


            _stNomor = gn.GenerateNumber("", 101, 3, _stDates, userid);

            AjaxFileUploadIdentitasLahan.SaveAs(uploadFolder + _stNomor + ext.getExtsion());
            e.PostedUrl = string.Format(e.FileName + "|" + _stNomor + "|" + userid + "|" + wilayah);

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

            uf.UploadFilesWeb("I", user, _stDates, "Registrasi", param5, uploadFolder, IDRegistrasi, _stNomor + extension, _stNamaFile, _stUploadKeterangan,"","");
        }

        var _stOutput = IDRegistrasi;

        return _stOutput;
    }


    public void AjaxFileUploadKelengkapan_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
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


            _stNomor = gn.GenerateNumber("", 101, 3, _stDates, userid);

            AjaxFileUploadKelengkapan.SaveAs(uploadFolder + _stNomor + ext.getExtsion());
            e.PostedUrl = string.Format(e.FileName + "|" + _stNomor + "|" + userid + "|" + wilayah);

        }
    }


    private String SaveUploadKelengkapan()
    {
        string IDRegistrasi = Request.Params["IDREGISTRASI"].ToString();
        string _stNamaFile = Request.Params["NAMA"].ToString();
        string _stKeterangan = Request.Params["KETERANGAN"].ToString();
        string _stNomor = Request.Params["NOMOR"].ToString();

        ALMIS.UploadFile uf = new ALMIS.UploadFile();
        uf.Datas();

        string _stDates = DateTime.Today.ToString("yyyyMMdd");

        string param1 = Request.Params["param1"].ToString();
        string param4 = Request.Params["param4"].ToString();
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

        eSTP.save9("P_REGIST_D", param1, IDRegistrasi, "", param4, param5, _stKeterangan, "", "","");

        if (param4=="1"){param4 = "10";}
        if (param4=="2"){param4 = "11";}
        if (param4=="3"){param4 = "12";}
        if (param4  =="4"){param4 = "13";}

        if (extension != ".exe")
        {

            uf.UploadFilesWeb("I", user, _stDates, "Registrasi", param4, uploadFolder, IDRegistrasi, _stNomor + extension, _stNamaFile, param5,"","");
        }

        var _stOutput = IDRegistrasi;

        return _stOutput;
    }

}