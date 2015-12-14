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

public partial class Pages_PraRegistrasiForm : System.Web.UI.Page
{
    //Connection conn2;
    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    string query;
    DataTable dt;
    SqlCommand command;
    SqlDataAdapter sda;
    SqlConnection conn;
    protected String lanjut = "";
    protected String except = "";
    //private string userid;
    //private string groups;
    protected String userid = "";
    protected String groups = "";
    protected String PraRegistrasiEdit = ""; //0
    protected String PraRegistrasiDelete = ""; //1
    protected String PraRegistrasiView = ""; //2
    protected String PraRegistrasiAssign = "";//3

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] is object)
            {
                userid = Session["userid"].ToString();
            }

            HakAkses();
            isiJenisKelamin();
            isiPekerjaan();
            isiTandaIdentitas();
            isiLanjut();
            isiKecamatan();
            isikabupaten();
            group();
            isiDesa();
            isiPerusa();

            bool normal = true;
            if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());
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

        ds = eSTP.List8("P_MENU", "CHA", "", groups, "Pra Registrasi", "", "", "", "");
        dt = ds.Tables[0];

        PraRegistrasiView = dt.Rows[0]["VIEWXXX"].ToString(); //0
        PraRegistrasiEdit = dt.Rows[0]["EDITXXX"].ToString(); //1
        PraRegistrasiDelete = dt.Rows[0]["DELETEX"].ToString(); //2
        PraRegistrasiAssign = dt.Rows[0]["ASSIGNX"].ToString(); //3

        dt.Dispose();

        if (Param1 == "")
        {
            if (PraRegistrasiView.ToString() != "1")
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
            if (PraRegistrasiView.ToString() != "1")
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
            if (PraRegistrasiEdit.ToString() != "1")
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
            if (PraRegistrasiDelete.ToString() != "1")
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
            if (PraRegistrasiAssign.ToString() != "1")
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

        //else
        //{
        //    Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
        //    Response.Write("alert('Aksi Yang Anda Cari Tidak Ditemukan');");
        //    Response.Write("location.href = 'home.aspx';");
        //    Response.Write("</script>");
        //}


    }

   public void group()
    {

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
    }

    private bool ServiceSelect(string sm)
    {
        switch (sm)
        {
            case "select":


                var Param1 = Request.Params["param1"].ToString();
                var Param2 = Request.Params["param2"].ToString();
                
                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List12("almis.P_PRAREG", Param1, Param2, "", "", "", "", "", "", "", "", "","");

                dt = ds.Tables[0];

                Response.ContentType = "text/plain";

                Response.Write(dt.Rows[0]["praregNmrPra"].ToString() + "|"); //0
                Response.Write(dt.Rows[0]["praregIdents"].ToString() + "|"); //1
                Response.Write(dt.Rows[0]["MidentNamass"].ToString() + "|"); //2
                Response.Write(dt.Rows[0]["MidentJnsKel"].ToString() + "|"); //3
                Response.Write(dt.Rows[0]["MidentTmplhr"].ToString() + "|"); //4
                Response.Write(dt.Rows[0]["MidentTgllhr"].ToString() + "|"); //5
                Response.Write(dt.Rows[0]["MidentPekerj"].ToString() + "|"); //6
                Response.Write(dt.Rows[0]["MidentAlamat"].ToString() + "|"); //7
                Response.Write(dt.Rows[0]["MidentNmrHps"].ToString() + "|"); //8
                Response.Write(dt.Rows[0]["MidentJnsIdn"].ToString() + "|"); //9
                Response.Write(dt.Rows[0]["praregLokkab"].ToString() + "|"); //10
                Response.Write(dt.Rows[0]["praregLokkec"].ToString() + "|"); //11
                Response.Write(dt.Rows[0]["praregLokdes"].ToString() + "|"); //12
                Response.Write(dt.Rows[0]["praregLanjut"].ToString() + "|"); //13
                Response.Write(dt.Rows[0]["praregKodper"].ToString() + "|"); //14
                
             
                 dt.Dispose();


                Response.End();
                Response.End();
                return false;

            case "CRUD":
                Response.ContentType = "text/plain";
                Response.Write(CRUD());
                Response.End();
                return false;

            case "dd":
                Response.ContentType = "text/plain";
                Response.Write(Admin());
                Response.End();
                return false;

            default:
                Response.ContentType = "text/plain";
                Response.End();
                return true;
        }
    }


    //protected void btnCari_Click(object sender, EventArgs e)
    //{
    //    cari(txtNoIdentitas.Text.ToString());
    //}

    protected void ddKecamatan_SelectedIndexChanged(object sender, EventArgs e)
    {
        isiDesa();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        reset();
    }

    private String Admin()
    {
        var Param1 = Request.Params["param1"].ToString();
        var Param2 = Request.Params["param2"].ToString();
        string output = "";

        try
        {
            ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
            eSTP.Datas();
            DataSet ds = new DataSet();
            ds = eSTP.List2("almis.C_ADMINS", Param1, Param2);

            dt = ds.Tables[0];

            
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                output += dt.Rows[i]["namass"].ToString() + "|";
                output += dt.Rows[i]["idents"].ToString() + "*";
            }
            dt.Dispose();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        return output;
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
                ds = eSTP.List12("P_PRAREG", "X", param2, param3, param4, param5, param6, param7, param8, userid, param10, param11, "0");
                dt = ds.Tables[0];

                if (dt.Rows.Count > 0)
                {
                    if (output == "E")
                        output = "noedit";

                    if (output == "D")
                        output = "nodelete";

                    if (output == "D")
                        output = "notam";



                    return output;
                }

            }

            if (output == "I" || output == "E" || output == "D")
            {
                
                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                eSTP.save12("P_PRAREG", param1, param2, param3, param4, param5, param6, param7, param8, userid, param10, param11, "0");




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


    public void cari(string id)
    {
        try
        {
            query = @"SELECT  MidentIdents ,
                                MidentNamass ,
                                MidentJnsKel ,
                                MidentTmplhr ,
                                LEFT(CONVERT(VARCHAR(10), MidentTglLhr, 120), 10) MidentTglLhr ,
                                MidentPekerj ,
                                MidentAlamat ,
                                MidentNmrHps ,
                                MidentJnsIdn
                        FROM    almis.Mident
                        WHERE   MidentIdents = '" + id + "'";
            dt = getDataTable(query);
            if (dt.Rows.Count > 0)
            {
                txtNoIdentitas.Text = id;
                txtNama.Text = dt.Rows[0]["MidentNamass"].ToString().Trim();
                txtTempatLahir.Text = dt.Rows[0]["MidentTmplhr"].ToString().Trim();             
                //ddJenisKelamin.SelectedValue = dt.Rows[0]["MidentJnsKel"].ToString();
                //txtTempatLahir.Text = dt.Rows[0]["MidentTmplhr"].ToString().Trim();
                txtTglLahir.Text = dt.Rows[0]["MidentTglLhr"].ToString().Trim();
                //ddJenisKelamin.Text = dt.Rows[0]["MidentJnsKel"].ToString().Trim();
                ddPekerjaan.SelectedValue = dt.Rows[0]["MidentPekerj"].ToString();
                txtAlamat.Text = dt.Rows[0]["MidentAlamat"].ToString().Trim();
                txtNoHandphone.Text = dt.Rows[0]["MidentNmrHps"].ToString().Trim();
                ddTandaIdentitas.SelectedValue = dt.Rows[0]["MidentJnsIdn"].ToString();

                
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Data tidak ditemukan, silahkan tambahkan data di modul master identitas.')", true);
                reset();
            }
        }
        catch (Exception ex)
        {

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

    public void isiJenisKelamin()
    {
        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    almis.CODESS
                    WHERE   codessHeadss = 1
                            AND codessStatss = 1";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddJenisKelamin.Items.Clear();
            //ddJenisKelamin.Items.Add(new ListItem("Laki-laki", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddJenisKelamin.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
        dt.Dispose();
    }

    public void isiPekerjaan()
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
            //ddPekerjaan.Items.Add(new ListItem("Pilih Pekerjaan", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddPekerjaan.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
        dt.Dispose();
    }

    public void isiTandaIdentitas()
    {
        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    almis.CODESS
                    WHERE   codessHeadss = 3
                            AND codessStatss = 1";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddTandaIdentitas.Items.Clear();
            ddTandaIdentitas.Items.Add(new ListItem("Pilih Tanda Identitas", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddTandaIdentitas.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
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
                            AND codessStatss = 1 ORDER BY codessCodess DESC ";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddLanjut.Items.Clear();
           // ddLanjut.Items.Add(new ListItem("Lanjut", "1"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddLanjut.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
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

    public void reset()
    {
        txtNoIdentitas.Text = "";
        //txtNama.Text = "";
        txtNama.Enabled = true;
        ddJenisKelamin.Enabled = true;
        txtTempatLahir.Enabled = true;
        txtTglLahir.Enabled = true;
        ddPekerjaan.Enabled = true;
        txtAlamat.Enabled = true;
        txtNoHandphone.Enabled = true;
        ddTandaIdentitas.Enabled = true;

        //ddJenisKelamin.SelectedValue = "0";
        txtTempatLahir.Text = "";
        txtTglLahir.Text = "";
        ddPekerjaan.SelectedValue = "0";
        txtAlamat.Text = "";
        txtNoHandphone.Text = "";
        ddTandaIdentitas.SelectedValue = "0";
        ddKecamatan.SelectedValue = "0";
        ddDesa.Items.Clear();
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

    
}