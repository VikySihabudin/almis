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
using System.Text;


public partial class Pages_Landcompla_LandcomplaForm : System.Web.UI.Page
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
    String output = "";
    string _stFAsli;

    StringBuilder htmlTable = new StringBuilder();

    StringBuilder htmlTable2 = new StringBuilder();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();
        }
        isiPerusa();

        //cekRepeat();
        //cekRepeatHGU();
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


                var Param1 = Request.Params["param1"].ToString();
                var Param2 = Request.Params["param2"].ToString();

                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List14("P_COMPLA", Param1, Param2, "", "", "", "", "", "", "", "", "", "", "", "");

                dt = ds.Tables[0];

                Response.ContentType = "text/plain";

                Response.Write(dt.Rows[0]["complaNmrCom"].ToString() + "|"); //0
                Response.Write(dt.Rows[0]["complaDatess"].ToString() + "|"); //1
                Response.Write(dt.Rows[0]["complaJnsPrj"].ToString() + "|"); //2
                Response.Write(dt.Rows[0]["complaIdProj"].ToString() + "|"); //3
                Response.Write(dt.Rows[0]["complaIdPicx"].ToString() + "|"); //4
                Response.Write(dt.Rows[0]["complaIdAnal"].ToString() + "|"); //5
                Response.Write(dt.Rows[0]["complaStDate"].ToString() + "|"); //6
                Response.Write(dt.Rows[0]["complaInterv"].ToString() + "|"); //7
                Response.Write(dt.Rows[0]["complaEnDate"].ToString() + "|"); //8
                Response.Write(dt.Rows[0]["complakodper"].ToString() + "|"); //9
                Response.Write(dt.Rows[0]["complaNamaPicx"].ToString() + "|"); //10
                Response.Write(dt.Rows[0]["complaNamaAnal"].ToString() + "|"); //11
                


                dt.Dispose();


                Response.End();
                Response.End();
                return false;

            case "LNP":

                var param1Ln = Request.Params["param1"].ToString();
                var param2Ln = Request.Params["param2"].ToString();

                ALMIS.ExecuteSTP eSTP_Ln = new ALMIS.ExecuteSTP();
                eSTP_Ln.Datas();
                DataSet ds_Ln = new DataSet();
                ds_Ln = eSTP_Ln.List14("P_COMPLA", param1Ln, param2Ln, "", "", "", "", "", "", "", "", "", "", "", "");

                dt = ds_Ln.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");



                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["namexx"].ToString()) + "</cell>");

                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                Response.End();

                return false;

            case "L":

                var param1L = Request.Params["param1"].ToString();

                ALMIS.ExecuteSTP eSTP_L = new ALMIS.ExecuteSTP();
                eSTP_L.Datas();
                DataSet ds_L = new DataSet();
                ds_L = eSTP_L.List14("P_COMPLA", param1L, "", "", "", "", "", "", "", "", "", "", "", "", "");

                dt = ds_L.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");



                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UserssIDents"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["UserssNamess"].ToString()) + "</cell>");

                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                Response.End();

                return false;

            case "CRUD":
                Response.ContentType = "text/plain";
                Response.Write(CRUD());
                Response.End();
                return false;


            case "cekRepeat":


                var Param1r = Request.Params["param1"].ToString();
                var Param2r = Request.Params["param2"].ToString();

                ALMIS.ExecuteSTP eSTPr = new ALMIS.ExecuteSTP();
                eSTPr.Datas();
                DataSet dsr = new DataSet();
                dsr = eSTPr.List14("P_COMPLA", Param1r, Param2r, "", "", "", "", "", "", "", "", "", "", "", "");

                dt = dsr.Tables[0];

                Response.ContentType = "text/plain";

                Response.Write(dt.Rows[0]["jenkeg"].ToString() + "|"); //0
                Response.Write(dt.Rows[0]["dskrps"].ToString() + "|"); //1
                Response.Write(dt.Rows[0]["kntktr"].ToString() + "|"); //2

                Response.Write(dt.Rows[0]["wiladm"].ToString() + "|"); //3
                Response.Write(dt.Rows[0]["luasha"].ToString() + "|"); //4
                Response.Write(dt.Rows[0]["PIDxxx"].ToString() + "|"); //5

                Response.Write(dt.Rows[0]["pkp2bx"].ToString() + "|"); //6
                Response.Write(dt.Rows[0]["mouxxx"].ToString() + "|"); //7
                Response.Write(dt.Rows[0]["reklam"].ToString() + "|"); //8

                Response.Write(dt.Rows[0]["htnlnd"].ToString() + "|"); //9
                Response.Write(dt.Rows[0]["htnptb"].ToString() + "|"); //10
                Response.Write(dt.Rows[0]["htnptp"].ToString() + "|"); //11
                Response.Write(dt.Rows[0]["htnpdd"].ToString() + "|"); //12
                Response.Write(dt.Rows[0]["htndlr"].ToString() + "|"); //13

                Response.Write(dt.Rows[0]["ippkh1"].ToString() + "|"); //14
                Response.Write(dt.Rows[0]["ippkh2"].ToString() + "|"); //15
                Response.Write(dt.Rows[0]["ippkh3"].ToString() + "|"); //16
                Response.Write(dt.Rows[0]["ippkh4"].ToString() + "|"); //17
                Response.Write(dt.Rows[0]["ippkhl"].ToString() + "|"); //18

                Response.Write(dt.Rows[0]["izinl1"].ToString() + "|"); //19
                Response.Write(dt.Rows[0]["izinl2"].ToString() + "|"); //20
                Response.Write(dt.Rows[0]["izinl3"].ToString() + "|"); //21
                Response.Write(dt.Rows[0]["izinl4"].ToString() + "|"); //22
                Response.Write(dt.Rows[0]["izinl5"].ToString() + "|"); //23

                Response.Write(dt.Rows[0]["dumpi"].ToString() + "|"); //24
                Response.Write(dt.Rows[0]["irekla"].ToString() + "|"); //25
                Response.Write(dt.Rows[0]["pentaa"].ToString() + "|"); //26
                Response.Write(dt.Rows[0]["manfaa"].ToString() + "|"); //27
                Response.Write(dt.Rows[0]["imbxxx"].ToString() + "|"); //28

                Response.Write(dt.Rows[0]["hgu1xx"].ToString() + "|"); //29
                Response.Write(dt.Rows[0]["hgu2xx"].ToString() + "|"); //30
                Response.Write(dt.Rows[0]["hgu3xx"].ToString() + "|"); //31
                Response.Write(dt.Rows[0]["hgu4xx"].ToString() + "|"); //32
                Response.Write(dt.Rows[0]["hgu5xx"].ToString() + "|"); //33
                Response.Write(dt.Rows[0]["hgulua"].ToString() + "|"); //34
                Response.Write(dt.Rows[0]["iup1xx"].ToString() + "|"); //35

                Response.Write(dt.Rows[0]["jenase"].ToString() + "|"); //36
                Response.Write(dt.Rows[0]["staase"].ToString() + "|"); //37
                Response.Write(dt.Rows[0]["pemanf"].ToString() + "|"); //38


                Response.Write(dt.Rows[0]["btbara"].ToString() + "|"); //39
                Response.Write(dt.Rows[0]["hptxxx"].ToString() + "|"); //40
                Response.Write(dt.Rows[0]["pemuki"].ToString() + "|"); //41
                Response.Write(dt.Rows[0]["indust"].ToString() + "|"); //42

                dt.Dispose();


                Response.End();
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
                ////ds = eSTP.List14("P_COMPLA", "X", param2, "", "", "", "", "", "", "", "", "", "", "", "");
                ////dt = ds.Tables[0];

                ////if (dt.Rows.Count > 0)
                ////{
                ////    if (output == "E")
                ////        output = "noedit";

                ////    if (output == "D")
                ////        output = "nodelete";

                ////    if (output == "A")
                ////        output = "noadd";

                ////    return output;
                ////}

                eSTP.Datas();
                eSTP.save14("P_COMPLA", param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, userid, param12, param13, param14);

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
    
    // membuat label / textbox berulang Izin Lokasi
    private void cekRepeat()
    {
        String param1 = ""; if (Request.Params["param1"] is object) param1 = Request.Params["param1"].ToString();
        String param2 = ""; if (Request.Params["param2"] is object) param2 = Request.Params["param2"].ToString();

        //String output="Kholid";

        try
        {

            if (param1 is object && param2 is object)
            {
                //query = @"SELECT SKxxxx, namexx, luasSK, luasha, REPLACE(CONVERT(VARCHAR(10),tnggal,111),'/','-')tnggal,REPLACE(CONVERT(VARCHAR(10),brlaku,111),'/','-')brlaku, '70%' as Persentase FROM almisgis.sde.FCKHXIZLOKARXXX";
                query = @"select * from almisgis.sde.FCPRODISPOSARXX_evw where namexx='Disposal C1'";
                Random r = new Random();

                dt = getDataTable(query);

                txtjenis.Text = dt.Rows[0]["jenkeg"].ToString();
                txtdeskripsi.Text = dt.Rows[0]["dskrps"].ToString();
                txtkontraktor.Text = dt.Rows[0]["kntktr"].ToString();

                txtwiladmin.Text = dt.Rows[0]["wiladm"].ToString();
                txtluasarea.Text = dt.Rows[0]["luasha"].ToString();
                txtdatapersil.Text = dt.Rows[0]["PIDxxx"].ToString();

                txtpkp2b.Text = dt.Rows[0]["pkp2bx"].ToString();
                txtmou.Text = dt.Rows[0]["mouxxx"].ToString();
                txtreklamasi.Text = dt.Rows[0]["reklam"].ToString();

                txthlindung.Text = dt.Rows[0]["htnlnd"].ToString();
                txthproduksiterbatas.Text = dt.Rows[0]["htnptb"].ToString();
                txthproduksitetap.Text = dt.Rows[0]["htnptp"].ToString();
                txthkonversi.Text = dt.Rows[0]["htnpdd"].ToString();
                txtapl.Text = dt.Rows[0]["htndlr"].ToString();

                txtipkh1.Text = dt.Rows[0]["ippkh1"].ToString();
                txtipkh2.Text = dt.Rows[0]["ippkh2"].ToString();
                txtipkh3.Text = dt.Rows[0]["ippkh3"].ToString();
                txtipkh4.Text = dt.Rows[0]["ippkh4"].ToString();
                txtluaripkh.Text = dt.Rows[0]["ippkhl"].ToString();

                txtizin1.Text = dt.Rows[0]["izinl1"].ToString();
                txtizin2.Text = dt.Rows[0]["izinl2"].ToString();
                txtizin3.Text = dt.Rows[0]["izinl3"].ToString();
                txtizin4.Text = dt.Rows[0]["izinl4"].ToString();
                txtizin5.Text = dt.Rows[0]["izinl5"].ToString();

                txtizindumping.Text = dt.Rows[0]["dumpi"].ToString();
                txtizinreklamasi.Text = dt.Rows[0]["irekla"].ToString();
                txtizinpenataan.Text = dt.Rows[0]["pentaa"].ToString();
                txtizinpemanfaatan.Text = dt.Rows[0]["manfaa"].ToString();
                txtizinimb.Text = dt.Rows[0]["imbxxx"].ToString();

                txthgu1.Text = dt.Rows[0]["hgu1xx"].ToString();
                txthgu2.Text = dt.Rows[0]["hgu2xx"].ToString();
                txthgu3.Text = dt.Rows[0]["hgu3xx"].ToString();
                txthgu4.Text = dt.Rows[0]["hgu4xx"].ToString();
                txthgu5.Text = dt.Rows[0]["hgu5xx"].ToString();
                txthguluar.Text = dt.Rows[0]["hgu5xx"].ToString();
                txtiup1.Text = dt.Rows[0]["iup1xx"].ToString();

                txtjenisaset.Text = dt.Rows[0]["jenase"].ToString();
                txtstatusaset.Text = dt.Rows[0]["staase"].ToString();
                txtpemanfPhkLain.Text = dt.Rows[0]["pemanf"].ToString();

                txtBatubara.Text = dt.Rows[0]["btbara"].ToString();
                txthutanproduksi.Text = dt.Rows[0]["hptxxx"].ToString();
                txtpemukiman.Text = dt.Rows[0]["pemuki"].ToString();
                txtindustri.Text = dt.Rows[0]["indust"].ToString();

                dt.Dispose();

            }

            
        }

        catch (Exception ex)
        {
            Response.Write(ex.Message);
            Response.End();
            //return ex.Message;
        }
        //return output;

    }


    // membuat label / textbox berulang HGU
    public void cekRepeatHGU()
    {
        String param1 = ""; if (Request.Params["param1"] is object) param1 = Request.Params["param1"].ToString();
        String param2 = ""; if (Request.Params["param2"] is object) param2 = Request.Params["param2"].ToString();

        if (param1 is object && param2 is object)
        {
            query = @"SELECT NOHGUx, namexx, luasha, REPLACE(CONVERT(VARCHAR(10),tnggal,111),'/','-')tnggal,REPLACE(CONVERT(VARCHAR(10),brlaku,111),'/','-')brlaku, '70%' as Persentase FROM almisgis.sde.FCKHXHGUARXXXXX";

            Random r = new Random();
            dt = getDataTable(query);

            int nomor = 1;

            for (int i = 0; i < dt.Rows.Count; i++)
            {


                htmlTable2.Append("<div class='form-group'>");
                htmlTable2.Append("<label for='nama' class='control-label col-md-1'></label>");

                if (nomor == 1)
                {
                    htmlTable2.Append("<label for='nama' class='control-label col-md-1'>HGU</label>");
                }

                else
                {

                    htmlTable2.Append("<label for='nama' class='control-label col-md-1'></label>");

                }

                htmlTable2.Append("<label for='nama' class='control-label col-md-10'> Nama HGU " + nomor + ": Di dalam " + dt.Rows[i]["luasha"] + " ha," + dt.Rows[i]["Persentase"] + "; SK No. : " + dt.Rows[i]["NOHGUx"] + "; Periode " + dt.Rows[i]["tnggal"] + " s/d " + dt.Rows[i]["brlaku"] + "</label>");
                htmlTable2.Append("</div>");

                nomor = nomor + 1;
            }


            //PlaceHolder2.Controls.Add(new Literal { Text = htmlTable2.ToString() });

            dt.Dispose();
        }
    }
 
}