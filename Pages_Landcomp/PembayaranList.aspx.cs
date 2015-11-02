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


public partial class Pages_PembayaranList : System.Web.UI.Page
{

    DataTable dt;
    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    SqlDataAdapter sda;
    SqlConnection conn;
    string query;
    //private string groupsid;
    protected String userid = "";
    protected String groups = "";
    protected String PembayaranView = "";
    protected String PembayaranEdit = "";
    protected String PembayaranDelete = "";
    protected String PembayaranAssign = "";

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

        PembayaranEdit = dt.Rows[7]["PembayaranEdit"].ToString(); //0
        PembayaranDelete = dt.Rows[7]["PembayaranDelete"].ToString(); //1
        PembayaranView = dt.Rows[7]["Pembayaran"].ToString(); //2
        PembayaranAssign = dt.Rows[7]["PembayaranAssign"].ToString(); //3

        dt.Dispose();


        if (PembayaranView.ToString() != "1")
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
                ds_L = eSTP_L.List25("P_PMBYRN", param1L, param2L, "", param4L, param5L, "","","", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");

                dt = ds_L.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");

                //groupsid = Session["groups"].ToString();

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pmbyrnNmrByr"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["berks1NmrReg"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pengtoNmrPid"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pmbyrnAssign"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pmbyrnLnjuts"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentNamass"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pmbyrnkodePer"].ToString()) + "</cell>");
                    if (dt.Rows[i]["pmbyrnNmrByr"].ToString() != "")
                    {
                        if (groups.ToString() == "1")
                        {
                            Response.Write("<cell>" + RemoveWhiteSpace("View^PembayaranForm.aspx?rand=" + r.Next() + "&param1=V" + "&param2=" + dt.Rows[i]["berks1NmrBr1"].ToString() + "") + "</cell>");
                            Response.Write("<cell>" + RemoveWhiteSpace("Edit^PembayaranForm.aspx?rand=" + r.Next() + "&param1=E" + "&param2=" + dt.Rows[i]["berks1NmrBr1"].ToString() + "") + "</cell>");
                            Response.Write("<cell>" + RemoveWhiteSpace("Delete^PembayaranForm.aspx?rand=" + r.Next() + "&param1=D" + "&param2=" + dt.Rows[i]["berks1NmrBr1"].ToString() + "") + "</cell>");
                        }
                        else
                        {
                            if (dt.Rows[i]["pmbyrnLnjuts"].ToString() != "Sepakat")
                            {
                                if (PembayaranView.ToString() == "1")
                                {
                                    Response.Write("<cell>" + RemoveWhiteSpace("View^PembayaranForm.aspx?rand=" + r.Next() + "&param1=V" + "&param2=" + dt.Rows[i]["berks1NmrBr1"].ToString() + "") + "</cell>");
                                }
                                if (PembayaranEdit.ToString() == "1")
                                {
                                    Response.Write("<cell>" + RemoveWhiteSpace("Edit^PembayaranForm.aspx?rand=" + r.Next() + "&param1=E" + "&param2=" + dt.Rows[i]["berks1NmrBr1"].ToString() + "") + "</cell>");
                                }
                                if (PembayaranDelete.ToString() == "1")
                                {
                                    Response.Write("<cell>" + RemoveWhiteSpace("Delete^PembayaranForm.aspx?rand=" + r.Next() + "&param1=D" + "&param2=" + dt.Rows[i]["berks1NmrBr1"].ToString() + "") + "</cell>");

                                }
                            }
                        }

                    }

                    Response.Write("</row>");
                }
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
}