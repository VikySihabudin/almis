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

using System.Web.Services;
using System.IO;

public partial class Pages_PembayaranForm : System.Web.UI.Page
{
    DataTable dt;
    protected String lanjut = "";
    protected String except = "";
    protected String userid = "";
    protected String groups = "";
    protected String PembayaranEdit = ""; //0
    protected String PembayaranDelete = ""; //1
    protected String PembayaranView = ""; //2
    protected String PembayaranAssign = "";//3

    string query;
    SqlCommand command;
    SqlDataAdapter sda;
    SqlConnection conn;
    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            isiBerkas();
            isiLanjut();
            bool normal = true;
            if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());
            
            HakAkses();
        }


        //WEBCAM

        if (!this.IsPostBack)
        {
            if (Request.InputStream.Length > 0)
            {
                using (StreamReader reader = new StreamReader(Request.InputStream))
                {
                    string hexString = Server.UrlEncode(reader.ReadToEnd());
                    //string imageName = txtNoIdentitas.Text;
                    //string imagePath = string.Format("asdf.png", imageName);
                    string imageName = DateTime.Now.ToString("dd-MM-yy hh-mm-ss");
                    string imagePath = string.Format("Captures/{0}.png", imageName);
                    File.WriteAllBytes(Server.MapPath(imagePath), ConvertHexToBytes(hexString));
                    Session["CapturedImage"] = ResolveUrl(imagePath);
                }
            }
        }


    }


    private static byte[] ConvertHexToBytes(string hex)
    {
        byte[] bytes = new byte[hex.Length / 2];
        for (int i = 0; i < hex.Length; i += 2)
        {
            bytes[i / 2] = Convert.ToByte(hex.Substring(i, 2), 16);
        }
        return bytes;
    }

    [WebMethod(EnableSession = true)]

    public static string GetCapturedImage()
    {
        string url = HttpContext.Current.Session["CapturedImage"].ToString();
        HttpContext.Current.Session["CapturedImage"] = null;
        return url;
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

        PembayaranView = dt.Rows[7]["Pembayaran"].ToString(); //0
        PembayaranEdit = dt.Rows[7]["PembayaranEdit"].ToString(); //1
        PembayaranDelete = dt.Rows[7]["PembayaranDelete"].ToString(); //2
        PembayaranAssign = dt.Rows[7]["PembayaranAssign"].ToString(); //3

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
            if (PembayaranView.ToString() != "1")
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
            if (PembayaranEdit.ToString() != "1")
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
            if (PembayaranDelete.ToString() != "1")
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

    public void isiBerkas()
    {
        query = @"SELECT codessCodess, codessDescs1 FROM almis.CODESS WHERE codessHeadss=6 AND codessStatss = 1";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddBerkas.Items.Clear();
            //ddLanjut.Items.Add(new ListItem("Pilih Kabupaten", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddBerkas.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
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
                ds = eSTP.List25("P_PMBYRN", Param1, Param2, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

                dt = ds.Tables[0];

                Response.ContentType = "text/plain";
                Response.Write(dt.Rows[0]["pmbyrnNmrByr"].ToString() + "|"); //0
                Response.Write(dt.Rows[0]["registNmrReg"].ToString() + "|");//1
                Response.Write(dt.Rows[0]["pmbyrnNmrPid"].ToString() + "|");//2
                Response.Write(dt.Rows[0]["pmbyrnNmrNeg"].ToString() + "|");//3
                Response.Write(dt.Rows[0]["pmbyrnNovism"].ToString() + "|");//4
                Response.Write(dt.Rows[0]["berks1NmrBr1"].ToString() + "|");//5
                Response.Write(dt.Rows[0]["pmbyrnTglASH"].ToString() + "|");//6
                Response.Write(dt.Rows[0]["pmbyrnTglAMn"].ToString() + "|");//7
                Response.Write(dt.Rows[0]["pmbyrnTglSrv"].ToString() + "|");//8
                Response.Write(dt.Rows[0]["pmbyrnTglAGm"].ToString() + "|");//9
                Response.Write(dt.Rows[0]["pmbyrnTgABod"].ToString() + "|");//10
                Response.Write(dt.Rows[0]["pmbyrnTglAcc"].ToString() + "|");//11
                Response.Write(dt.Rows[0]["pmbyrnPengBer"].ToString() + "|");//12
                Response.Write(dt.Rows[0]["pmbyrnKetrgn"].ToString() + "|");//13
                Response.Write(dt.Rows[0]["pmbyrnLnjuts"].ToString() + "|");//14
                Response.Write(dt.Rows[0]["pmbyrnEkseps"].ToString() + "|");//15
                Response.Write(dt.Rows[0]["pmbyrnKeteks"].ToString() + "|");//16
                Response.Write(dt.Rows[0]["pmbyrnNamPer"].ToString() + "|");//17
                Response.Write(dt.Rows[0]["tawar"].ToString() + "|");//18
                

                //Response.Write(dt.Rows[0]["pmbyrnKeteks"].ToString() + "|");

                

                dt.Dispose();

                Response.End();
                Response.End();
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
                ds = eSTP.List25("P_PMBYRN", "X", param2, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
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

                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                eSTP.save25("P_PMBYRN", param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14, param15, param16, param17, param18, param19, param20, param21, userid, param23, param24, param25);

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