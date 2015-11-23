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

public partial class Pages_PemberkasanDuaList : System.Web.UI.Page
{
    DataTable dt;
    //private string user;
    //private string wilayah;
    //private String groupid;

    SqlConnection conn;
    SqlDataAdapter sda;
    //private string userid;
    //private string groups;
    //private string groupsid;
    //private string lanjut;
    string query;
    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    protected String userid = "";
    protected String groups = "";
    protected String FinalisasiView = "";
    protected String FinalisasiEdit = "";
    protected String FinalisasiDelete = "";
    protected String FinalisasiAssign = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{

        //    //if ((Session["userid"] is object) && (Session["groups"] is object))
        //    if ((Session["userid"] is object) && (Session["groups"] is object))
        //    {
        //        userid = Session["userid"].ToString();
        //        //lanjut = Session["lanjut"].ToString();
        //        //namass = Session["namass"].ToString();

        //        //Response.Write(lanjut);
        //    }
        //    else
        //    {
        //        Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
        //        Response.Write("alert('Session Sudah Habis. Silakan Login Kembali.');");
        //        Response.Write("location.href = '../login.aspx';");
        //        Response.Write("</script>");
        //    }

        //    //if (Session["groupID"] is object) groupid = (string)Session["groupID"].ToString();
        //    //if ((Session["usersWilay"] is object) && (Session["userID"] is object))
        //    //{
        //    //    wilayah = Session["usersWilay"].ToString();
        //    //    user = Session["userID"].ToString();
        //    //}
        //    //else
        //    //{
        //    //    Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
        //    //    Response.Write("alert('Session Sudah Habis. Silakan Login Kembali.');");
        //    //    Response.Write("location.href = '../login.aspx';");
        //    //    Response.Write("</script>");
        //    //}
        //}

        HakAkses();
        isiTeknis();

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
            Response.Write("location.href = '../login.aspx';");
            Response.Write("</script>");
        }

        ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
        eSTP.Datas();
        DataSet ds = new DataSet();

        ds = eSTP.List8("P_MENU", "CHA", "", groups, "Finalisasi", "", "", "", "");

        dt = ds.Tables[0];

        FinalisasiEdit = dt.Rows[0]["EDITXXX"].ToString(); //0
        FinalisasiDelete = dt.Rows[0]["DELETEX"].ToString(); //1
        FinalisasiView = dt.Rows[0]["VIEWXXX"].ToString(); //2
        FinalisasiAssign = dt.Rows[0]["ASSIGNX"].ToString(); //3

        dt.Dispose();


        if (FinalisasiView.ToString() != "1")
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
                ds_L = eSTP_L.List19("P_BERKS2", param1L, param2L, "", param4L, param5L, "", "", "", "", "", "", "", "", "", "", "", "","","");

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
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["berks2NmrBr2"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pmbyrnNmrReg"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pmbyrnNmrPid"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["berks2Assign"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["berks2Slesai"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentNamass"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["perusaNamass"].ToString()) + "</cell>");

                    if (dt.Rows[i]["berks2NmrBr2"].ToString() != "")
                    {
                        if (groups.ToString() == "1")
                        {
                            Response.Write("<cell>" + RemoveWhiteSpace("View^PemberkasanDuaForm.aspx?rand=" + r.Next() + "&param1=V" + "&param2=" + dt.Rows[i]["pmbyrnNmrByr"].ToString() + "") + "</cell>");
                            Response.Write("<cell>" + RemoveWhiteSpace("Edit^PemberkasanDuaForm.aspx?rand=" + r.Next() + "&param1=E" + "&param2=" + dt.Rows[i]["pmbyrnNmrByr"].ToString() + "") + "</cell>");
                            Response.Write("<cell>" + RemoveWhiteSpace("Delete^PemberkasanDuaForm.aspx?rand=" + r.Next() + "&param1=D" + "&param2=" + dt.Rows[i]["pmbyrnNmrByr"].ToString() + "") + "</cell>");
                        }
                        else
                        {
                            if (dt.Rows[i]["berks2Slesai"].ToString() != "Lanjut")
                            {
                                if (FinalisasiView.ToString() == "1")
                                {
                                    Response.Write("<cell>" + RemoveWhiteSpace("View^PemberkasanDuaForm.aspx?rand=" + r.Next() + "&param1=V" + "&param2=" + dt.Rows[i]["pmbyrnNmrByr"].ToString() + "") + "</cell>");
                                }
                                if (FinalisasiEdit.ToString() == "1")
                                {
                                    Response.Write("<cell>" + RemoveWhiteSpace("Edit^PemberkasanDuaForm.aspx?rand=" + r.Next() + "&param1=E" + "&param2=" + dt.Rows[i]["pmbyrnNmrByr"].ToString() + "") + "</cell>");
                                }
                                if (FinalisasiDelete.ToString() == "1")
                                {
                                    Response.Write("<cell>" + RemoveWhiteSpace("Delete^PemberkasanDuaForm.aspx?rand=" + r.Next() + "&param1=D" + "&param2=" + dt.Rows[i]["pmbyrnNmrByr"].ToString() + "") + "</cell>");

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

    public void isiTeknis()
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