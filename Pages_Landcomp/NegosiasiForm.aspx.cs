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

public partial class Pages_NegosiasiForm : System.Web.UI.Page
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
    protected String userid = "";
    protected String groups = "";
    protected String NegosiasiEdit = ""; //0
    protected String NegosiasiDelete = ""; //1
    protected String NegosiasiView = ""; //2
    protected String NegosiasiAssign = "";//3

    string id;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] is object)
            {
                userid = Session["userid"].ToString();
            }

            isiPerusa();
            isiObject();

            bool normal = true;
            if (normal && (Request.Params["sm"] is object))
            { 
                normal = ServiceSelect(Request.Params["sm"].ToString());

            }

            isiSepakat();
            isiNegoKe();
            HakAkses();
            isiobjek();
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
            Response.Write("location.href = '../login.aspx';");
            Response.Write("</script>");
        }

        ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
        eSTP.Datas();
        DataSet ds = new DataSet();

        ds = eSTP.List8("P_MENU", "CHA", "", groups, "Negosiasi", "", "", "", "");
        dt = ds.Tables[0];

        NegosiasiView = dt.Rows[0]["VIEWXXX"].ToString(); //0
        NegosiasiEdit = dt.Rows[0]["EDITXXX"].ToString(); //1
        NegosiasiDelete = dt.Rows[0]["DELETEX"].ToString(); //2
        NegosiasiAssign = dt.Rows[0]["ASSIGNX"].ToString(); //3

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
            if (NegosiasiView.ToString() != "1")
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
            if (NegosiasiEdit.ToString() != "1")
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
            if (NegosiasiDelete.ToString() != "1")
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

    public void isiSepakat()
    {
        query = @"SELECT codessCodess, codessDescs1 
        FROM almis.CODESS WHERE codessHeadss=6 AND codessStatss=1 ORDER BY codessCodess DESC";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddSepakat.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddSepakat.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }
        dt.Dispose();
    }

    public void isiobjek()
    {

        query = @"SELECT  codessCodess ,
                            codessDescs1
                    FROM    almis.CODESS
                    WHERE   codessHeadss = 14
                            AND codessStatss = 1";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddobj.Items.Clear();
            ddobj.Items.Add(new ListItem("Pilih Kondisi Lahan", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddobj.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
            }
        }


        dt.Dispose();
    }


    public void isiNegoKe()
    {

        var Param2dd = Request.Params["param2"].ToString();


        query = @"SELECT DISTINCT negosiNegoKe 
                            FROM NEGOSI_D a
                            INNER JOIN NEGOSI b
                            ON a.negosiNmrNeg = b.negosiNmrNeg 
                            WHERE b.negosiNmrReg = '" + Param2dd + "'";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddNegosiasi.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddNegosiasi.Items.Add(new ListItem(dt.Rows[i]["negosiNegoKe"].ToString(), dt.Rows[i]["negosiNegoKe"].ToString()));
            }
        }
        
        
        dt.Dispose();
    }


    public void isiObject()
    {
        query = @"  SELECT 'BANGUNAN' codessDescs1, '1' codessCodess ";

        dt = getDataTable(query);

        if (dt.Rows.Count > 0)
        {
            ddObjek.Items.Clear();
           // ddObjek.Items.Add(new ListItem("Pilih Object", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddObjek.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
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

                
            case "L":

                var param1L = Request.Params["param1"].ToString();
                var param2L = Request.Params["param2"].ToString();
                var param5L = Request.Params["param5"].ToString();
                ALMIS.ExecuteSTP eSTP_L = new ALMIS.ExecuteSTP();
                eSTP_L.Datas();
                DataSet ds_L = new DataSet();
                ds_L = eSTP_L.List11("P_NEGOSI_D", param1L, param2L, "", "", param5L, "", "", "", "", "", "");
                dt = ds_L.Tables[0];
                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["negosiDatess"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["negosiObjeks"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["negosiLuasss"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["negosiHMinta"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["negosiJHMinta"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["negosiHTawar"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["negosiJHTawar"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["Selisih"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["negosiSequen"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["negosiNegoKe"].ToString()) + "</cell>");
                    if (dt.Rows[i]["Del"].ToString() != "0")
                    {
                        Response.Write("<cell>" + RemoveWhiteSpace("Delete^javascript:Hapus(\"" + "DND" + "\",\"" + "DND" + "\",\"" + dt.Rows[i]["negosiNmrNeg"].ToString() + "\",\"" + dt.Rows[i]["negosiSequen"].ToString() + "\",\"" + dt.Rows[i]["negosiNegoKe"].ToString() + "\");^_self") + "</cell>");
                    }
                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                Response.End();

                return false;

            case "VNK":

                Response.ContentType = "text/plain";
                var Param1LH = Request.Params["param1"].ToString();
                var Param2LH = Request.Params["param2"].ToString();
                var Param5LH = Request.Params["param5"].ToString();
                ALMIS.ExecuteSTP eSTP_LH = new ALMIS.ExecuteSTP();
                eSTP_LH.Datas();
                DataSet ds_LH = new DataSet();

                ds_LH = eSTP_LH.List11("P_NEGOSI_D", Param1LH, Param2LH, "", "", Param5LH, "", "", "", "", "", "");

                dt = ds_LH.Tables[0];

                Response.ContentType = "text/plain";
                Response.Write(dt.Rows[0]["minta"].ToString() + "|"); //8
                Response.Write(dt.Rows[0]["tawar"].ToString() + "|"); //9
                dt.Dispose();

                Response.End();


                return false;

            case "NK":
                var Param2dd = Request.Params["param2"].ToString();
                
                
                query = @"SELECT DISTINCT negosiNegoKe 
                            FROM NEGOSI_D a
                            INNER JOIN NEGOSI b
                            ON a.negosiNmrNeg = b.negosiNmrNeg 
                            WHERE b.negosiNmrNeg = '" + Param2dd + "'";
                dt = getDataTable(query);
                if (dt.Rows.Count > 0)
                {
                    ddNegosiasi.Items.Clear();
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        ddNegosiasi.Items.Add(new ListItem(dt.Rows[i]["negosiNegoKe"].ToString(), dt.Rows[i]["negosiNegoKe"].ToString()));
                    }
                }
                dt.Dispose();

                return false;

            case "V":
                
                Response.ContentType = "text/plain";
                var Param1 = Request.Params["param1"].ToString();
                var Param2 = Request.Params["param2"].ToString();
                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();

                ds = eSTP.List15("P_NEGOSI", Param1, Param2, "", "", "", "", "", "", "", "", "", "", "", "", "");

                dt = ds.Tables[0];

                Response.ContentType = "text/plain";
                Response.Write(dt.Rows[0]["negosiNmrNeg"].ToString() + "|"); //0
                Response.Write(dt.Rows[0]["registNmrReg"].ToString() + "|"); //1
                Response.Write(dt.Rows[0]["pengtoNmrPid"].ToString() + "|"); //2
                Response.Write(dt.Rows[0]["negosiKetrgn"].ToString() + "|"); //3
                Response.Write(dt.Rows[0]["negosiSepakt"].ToString() + "|"); //4
                Response.Write(dt.Rows[0]["negosiSKGR"].ToString() + "|"); //5
                Response.Write(dt.Rows[0]["negosiKetEks"].ToString() + "|"); //6
                Response.Write(dt.Rows[0]["negosiEkseps"].ToString() + "|"); //7
                Response.Write(dt.Rows[0]["minta"].ToString() + "|"); //8
                Response.Write(dt.Rows[0]["tawar"].ToString() + "|"); //9
                Response.Write(dt.Rows[0]["tglNego"].ToString() + "|"); //10
                Response.Write(dt.Rows[0]["negosiNegoKe"].ToString() + "|"); //11

                //isiNegoKe();


                dt.Dispose();

                Response.End();

                
                return false;

            case "I":

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

                ALMIS.ExecuteSTP eSTP_IA = new ALMIS.ExecuteSTP();
                eSTP_IA.Datas();
                eSTP_IA.save11("P_NEGOSI_D", param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11);

                return false;

            case "CRUD":
                Response.ContentType = "text/plain";
                Response.Write(Save());
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
        //string strCon = System.Configuration.ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal2"].ToString();    

        //conn2 = new Connection(strCon);

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
                  ds = eSTP.List15("P_NEGOSI", "X", param2, "", "", "", "", "", "", "", "", "", "", "","","");
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
                eSTP.save15("P_NEGOSI", param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, userid, param13, param14, param15);
                
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
