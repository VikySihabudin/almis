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


public partial class Pages_SerahTerimaBerkas : System.Web.UI.Page
{
    DataTable dt;
    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    SqlDataAdapter sda;
    SqlConnection conn;
    string query;
    protected String userid = "";
    protected String groups = "";
    protected String SerahTerimaBerkasEdit = ""; //0
    protected String SerahTerimaBerkasDelete = ""; //1
    protected String SerahTerimaBerkasView = ""; //2
    protected String SerahTerimaBerkasAssign = ""; //3 

    //string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    //string query;
    //DataTable dt;
    //SqlCommand command;
    //SqlDataAdapter sda;
    //SqlConnection conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();
        }

        isiPerusa();

        bool normal = true;
        if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());
        HakAkses();
        isiTeknis();

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



    private void HakAkses()
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

        ds = eSTP.List8("P_MENU", "CHA", "", groups, "Serah Terima Berkas", "", "", "", "");

        dt = ds.Tables[0];

        SerahTerimaBerkasEdit = dt.Rows[0]["EDITXXX"].ToString(); //0
        SerahTerimaBerkasDelete = dt.Rows[0]["DELETEX"].ToString(); //1
        SerahTerimaBerkasView = dt.Rows[0]["VIEWXXX"].ToString(); //2
        SerahTerimaBerkasAssign = dt.Rows[0]["ASSIGNX"].ToString(); //3


        dt.Dispose();

        if (SerahTerimaBerkasView.ToString() != "1")
        {
            if (groups.ToString() != "1")
            {
                Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
                Response.Write("alert('Anda Tidak Memiliki Akses Untuk Melihat Modul Ini');");
                Response.Write("location.href = '../Pages/home.aspx';");
                Response.Write("</script>");
            }
        }
    }




    private bool ServiceSelect(string sm)
    {
        switch (sm)
        {

            case "L":

                if (Session["userid"] is object)
                {
                    userid = Session["userid"].ToString();
                }     

                var param1L = Request.Params["param1"].ToString();
                //var param2L = Request.Params["param2"].ToString();

                ALMIS.ExecuteSTP eSTP_L = new ALMIS.ExecuteSTP();
                eSTP_L.Datas();
                DataSet ds_L = new DataSet();
                ds_L = eSTP_L.List12("P_SRHTRM", param1L, "", "", "", "", "", "", userid, "","","", "");

                dt = ds_L.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");


                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["srhtrmNmrReg"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentNamass"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentIdents"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentNmrHps"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["mdesaaNmdesa"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["mcamatNmcamt"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["mkabupNmkabu"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["srhtrmKodper"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["srhtrmAccept"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["srhtrmNmrSTs"].ToString()) + "</cell>");

                    Response.Write("</row>");
                }

                Response.Write("</rows>");
                dt.Dispose();

                Response.End();

                return false;

            case "LS":

                if (Session["userid"] is object)
                {
                    userid = Session["userid"].ToString();
                }

                if (Session["groups"] is object)
                {
                    groups = Session["groups"].ToString();

                }

                var param1LS = Request.Params["param1"].ToString();
                var param2LS = Request.Params["param2"].ToString();

                ALMIS.ExecuteSTP eSTP_LS = new ALMIS.ExecuteSTP();
                eSTP_LS.Datas();
                DataSet ds_LS = new DataSet();
                ds_L = eSTP_LS.List12("P_SRHTRM", param1LS, "", "", param2LS, "", "", userid, groups, "", "", "", "");

                dt = ds_L.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");


                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["srhtrmNmrReg"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentNamass"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentIdents"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentNmrHps"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["mdesaaNmdesa"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["mcamatNmcamt"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["mkabupNmkabu"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["srhtrmUsrSrh"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["srhtrmUsrTrm"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["srhtrmKodper"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["srhtrmAccept"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["srhtrmNmrSTs"].ToString()) + "</cell>");
                    Response.Write("</row>");
                }

                Response.Write("</rows>");
                dt.Dispose();

                Response.End();

                return false;
       
            case "V":
                var Param1 = Request.Params["param1"].ToString();
                var Param2 = Request.Params["param2"].ToString();
                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List12("P_SRHTRM", Param1, Param2, "", "", "", "", "", "", "", "", "", "");

                dt = ds.Tables[0];

                Response.ContentType = "text/plain";
                Response.Write(dt.Rows[0][""].ToString() + "|"); //
                Response.Write(dt.Rows[0][""].ToString() + "|"); //1
                Response.Write(dt.Rows[0][""].ToString() + "|"); //2
                Response.Write(dt.Rows[0][""].ToString() + "|"); //3

                dt.Dispose();

                Response.End();
                Response.End();
                return false;

            //return false;

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

        String sql = "";
        String output = "";

        try
        {

            output = param1;

            if (Session["groups"] is object)
            {
                groups = Session["groups"].ToString();

            }

            if (groups.ToString() != "1" )
            {
                if (output == "E")
                {

                    ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                    eSTP.Datas();
                    DataSet ds = new DataSet();
                    ds = eSTP.List12("[almis].[P_SRHTRM]", "X", param2, param3, param4, param5, param6, param7, userid, param9, param10, param11, param12);
                    dt = ds.Tables[0];

                    if (dt.Rows.Count == 0)
                    {

                        output = "X";
                        return output;
                    }
                }
            }

            if (output == "E" || output == "D" || output == "A" || output == "I")
            {
                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();

                eSTP.save12("[almis].[P_SRHTRM]", param1, param2, param3, userid, param5, param6, param7, userid, param9, param10, param11, "0");

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

    public void isiTeknis()
    {

        if (Session["groups"] is object)
        {
            groups = Session["groups"].ToString();

        }

        if (groups.ToString() == "1")
        {
            query = @"SELECT DISTINCT b.UserssIDents,b.UserssNamess FROM almis.SRHTRM a 
                INNER JOIN almis.USERSS b
                ON a.srhtrmUsrSrh = b.UserssIDents";
        }
        else
        {
            query = @"SELECT DISTINCT b.UserssIDents,b.UserssNamess FROM almis.SRHTRM a 
                INNER JOIN almis.USERSS b
                ON a.srhtrmUsrSrh = b.UserssIDents
                WHERE a.srhtrmUsrTrm = '" + userid + "'"; 
        
        }
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddfil.Items.Clear();
            ddfil.Items.Add(new ListItem("Lihat Semua Berkas Yang Di Terima", "0"));
            ddfil.Items.Add(new ListItem("Lihat Semua Berkas Yang Di Kirim", "1"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                //ddfil.Items.Add(new ListItem(dt.Rows[i]["UserssNamess"].ToString(), dt.Rows[i]["UserssIDents"].ToString()));
            }
        }
        dt.Dispose();
    }
        
}

  