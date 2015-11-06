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
    private string _stFAsli; 

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


                var Param1 = Request.Params["param1"].ToString();
                var Param2 = Request.Params["param2"].ToString();

                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                ds = eSTP.List9("P_VERDOK", Param1, Param2, "", "", "", "", "", "", "");

                dt = ds.Tables[0];

                Response.ContentType = "text/plain";

                Response.Write(dt.Rows[0]["ClausrNmrClm"].ToString() + "|"); //0
                Response.Write(dt.Rows[0]["PredokNmrDok"].ToString() + "|"); //1
                Response.Write(dt.Rows[0]["ClausrNamass"].ToString() + "|"); //2
                Response.Write(dt.Rows[0]["ClausrLokKab"].ToString() + "|"); //3
                Response.Write(dt.Rows[0]["ClausrLokKec"].ToString() + "|"); //4
                Response.Write(dt.Rows[0]["ClausrLokDes"].ToString() + "|"); //5
                Response.Write(dt.Rows[0]["VerdokNmrVrd"].ToString() + "|"); //6
                Response.Write(dt.Rows[0]["VerdokLitiga"].ToString() + "|"); //7
            

                dt.Dispose();


                Response.End();
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
                ds = eSTP.List8("P_PREDOK", "X", param2, "", param4, "", "", "", "");
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
                eSTP.save8("P_PREDOK", param1, param2, param3, param4, userid, param6, param7, param8);

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


            _stNomor = gn.GenerateNumber("", 101, 10, _stDates, userid);

            AjaxFileUploadIdentitasLahan.SaveAs(uploadFolder + _stNomor + ext.getExtsion());
            e.PostedUrl = string.Format(e.FileName + "|" + _stNomor + "|" + userid + "|" + wilayah);

        }
    }
  
}