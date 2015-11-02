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


public partial class Pages_PengecekanLapanganList : System.Web.UI.Page
{

    DataTable dt;
    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    SqlDataAdapter sda;
    SqlConnection conn;
    string query;
    protected String userid = "";
    protected String groups = "";
    protected String PengecekanLapanganEdit = ""; //0
    protected String PengecekanLapanganDelete = ""; //1
    protected String PengecekanLapanganView = ""; //2
    protected String PengecekanLapanganAssign = ""; //3

    //private string groupsid;

   
    protected void Page_Load(object sender, EventArgs e)
    {

        HakAkses();
        isiPeriode();
        bool normal = true;

        if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());
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
            Response.Write("location.href = '../Pages/login.aspx';");
            Response.Write("</script>");
        }

        ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
        eSTP.Datas();
        DataSet ds = new DataSet();

        ds = eSTP.List8("P_MENU", "CHA", "", groups, "", "", "", "", "");

        dt = ds.Tables[0];

        PengecekanLapanganEdit = dt.Rows[1]["PengecekanLapanganEdit"].ToString(); //0
        PengecekanLapanganDelete = dt.Rows[1]["PengecekanLapanganDelete"].ToString(); //1
        PengecekanLapanganView = dt.Rows[1]["PengecekanLapangan"].ToString(); //2
        PengecekanLapanganAssign = dt.Rows[1]["PengecekanLapanganAssign"].ToString(); //3


        dt.Dispose();

        if (PengecekanLapanganView.ToString() != "1")
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

    public void isiPeriode()
    {
        query = @"SELECT codessDescs1, codessCodess FROM CODESS WHERE codessHeadss = '9'";
        dt = getDataTable(query);
        if (dt.Rows.Count > 0)
        {
            ddprg.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddprg.Items.Add(new ListItem(dt.Rows[i]["codessDescs1"].ToString(), dt.Rows[i]["codessCodess"].ToString()));
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

                HakAkses();
                var param1L = Request.Params["param1"].ToString();
                var param2L = Request.Params["param2"].ToString();
                var param4L = Request.Params["param4"].ToString();
                var param5L = Request.Params["param5"].ToString();
                ALMIS.ExecuteSTP eSTP_L = new ALMIS.ExecuteSTP();
                eSTP_L.Datas();
                DataSet ds_L = new DataSet();
                ds_L = eSTP_L.List15("P_PENLAP", param1L, param2L, "", param4L, param5L, "", "", "", "", "", groups, "", "", "", "");

                dt = ds_L.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");

                //groupsid = Session["groups"].ToString();

                for (int i = 0; i < dt.Rows.Count; i++)
                { //0
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");

                    if (groups.ToString() == "1")
                    { //1
                        
                        Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                        Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["penlapNmrPen"].ToString()) + "</cell>");
                        Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["praregNmrPra"].ToString()) + "</cell>");
                        Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentNamass"].ToString()) + "</cell>");
                        Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["praregLokdes"].ToString()) + "</cell>");
                        Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["penlapLanjut"].ToString()) + "</cell>");
                        Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["perusaNamass"].ToString()) + "</cell>");
                        if (dt.Rows[i]["penlapNmrPen"].ToString() != "")
                        { //2
                            Response.Write("<cell>" + RemoveWhiteSpace("View^PengecekanLapanganForm.aspx?rand=" + r.Next() + "&param1=V" + "&param2=" + dt.Rows[i]["praregNmrPra"].ToString() + "") + "</cell>");
                            Response.Write("<cell>" + RemoveWhiteSpace("Edit^PengecekanLapanganForm.aspx?rand=" + r.Next() + "&param1=E" + "&param2=" + dt.Rows[i]["praregNmrPra"].ToString() + "") + "</cell>");
                            Response.Write("<cell>" + RemoveWhiteSpace("Delete^PengecekanLapanganForm.aspx?rand=" + r.Next() + "&param1=D" + "&param2=" + dt.Rows[i]["praregNmrPra"].ToString() + "") + "</cell>");
                        } //2
                        Response.Write("</row>");
                    } //1

                    else
                    { //3

                        if (dt.Rows[i]["penlapLanjut"].ToString() != "Lanjut")
                        { //4

                            Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                            Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["penlapNmrPen"].ToString()) + "</cell>");
                            Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["praregNmrPra"].ToString()) + "</cell>");
                            Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentNamass"].ToString()) + "</cell>");
                            Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["praregLokdes"].ToString()) + "</cell>");
                            Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["penlapLanjut"].ToString()) + "</cell>");

                            if (dt.Rows[i]["penlapNmrPen"].ToString() != "")
                            { //5
                                if (PengecekanLapanganView.ToString() == "1" || groups.ToString() == "1")
                                {
                                    Response.Write("<cell>" + RemoveWhiteSpace("View^PengecekanLapanganForm.aspx?rand=" + r.Next() + "&param1=V" + "&param2=" + dt.Rows[i]["praregNmrPra"].ToString() + "") + "</cell>");
                                }

                                if (PengecekanLapanganEdit.ToString() == "1" || groups.ToString() == "1")
                                {
                                    Response.Write("<cell>" + RemoveWhiteSpace("Edit^PengecekanLapanganForm.aspx?rand=" + r.Next() + "&param1=E" + "&param2=" + dt.Rows[i]["praregNmrPra"].ToString() + "") + "</cell>");
                                }

                                if (PengecekanLapanganDelete.ToString() == "1" || groups.ToString() == "1")
                                {
                                    Response.Write("<cell>" + RemoveWhiteSpace("Delete^PengecekanLapanganForm.aspx?rand=" + r.Next() + "&param1=D" + "&param2=" + dt.Rows[i]["praregNmrPra"].ToString() + "") + "</cell>");
                                }
                            } //5

                            
                        }//4
                        Response.Write("</row>");
                    }//3


                } //0

                Response.Write("</rows>");
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

}