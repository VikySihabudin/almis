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

public partial class Pages_NegosiasiList : System.Web.UI.Page
{

    DataTable dt;
    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    SqlDataAdapter sda;
    SqlConnection conn;
    string query;
    //private string groupsid;
    protected String userid = "";
    protected String groups = "";
    protected String NegosiasiView = "";
    protected String NegosiasiEdit = "";
    protected String NegosiasiDelete = "";
    protected String NegosiasiAssign = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();
        }
        isiPerusa();
        HakAkses();
        isiTeknis();

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

        ds = eSTP.List8("P_MENU", "CHA", "", groups, "Negosiasi", "", "", "", "");

        dt = ds.Tables[0];

        NegosiasiEdit = dt.Rows[0]["EDITXXX"].ToString(); //0
        NegosiasiDelete = dt.Rows[0]["DELETEX"].ToString(); //1
        NegosiasiView = dt.Rows[0]["VIEWXXX"].ToString(); //2
        NegosiasiAssign = dt.Rows[0]["ASSIGNX"].ToString(); //3

        dt.Dispose();


        if (NegosiasiView.ToString() != "1")
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
                var param14L = Request.Params["param14"].ToString();
                ALMIS.ExecuteSTP eSTP_L = new ALMIS.ExecuteSTP();
                eSTP_L.Datas();
                DataSet ds_L = new DataSet();
                ds_L = eSTP_L.List15("P_NEGOSI", param1L, param2L, "", param4L, param5L, "", "", "", "", "", "", userid, "", param14L, "");

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
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["negosiNmrNeg"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["registNmrReg"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pengtoNmrPid"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["negosiAssign"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["negosiSepakt"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentNamass"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pengtoNamPLK"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pengtoNamPLK"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["perusaNamass"].ToString()) + "</cell>");
                    if (groups.ToString() == "1")
                    {
                        if (dt.Rows[i]["negosiNmrNeg"].ToString() != "")
                        {
                            Response.Write("<cell>" + RemoveWhiteSpace("View^NegosiasiForm.aspx?rand=" + r.Next() + "&param1=V" + "&param2=" + dt.Rows[i]["registNmrReg"].ToString() + "") + "</cell>");
                            Response.Write("<cell>" + RemoveWhiteSpace("Edit^NegosiasiForm.aspx?rand=" + r.Next() + "&param1=E" + "&param2=" + dt.Rows[i]["registNmrReg"].ToString() + "") + "</cell>");
                            Response.Write("<cell>" + RemoveWhiteSpace("Delete^NegosiasiForm.aspx?rand=" + r.Next() + "&param1=D" + "&param2=" + dt.Rows[i]["registNmrReg"].ToString() + "") + "</cell>");

                        }
                    }
                    else
                    {

                        if (dt.Rows[i]["negosiSepakt"].ToString() != "Sepakat" && dt.Rows[i]["negosiNmrNeg"].ToString() != "")
                        {
                            if (NegosiasiView.ToString() == "1")
                            {
                                Response.Write("<cell>" + RemoveWhiteSpace("View^NegosiasiForm.aspx?rand=" + r.Next() + "&param1=V" + "&param2=" + dt.Rows[i]["registNmrReg"].ToString() + "") + "</cell>");
                            }
                            if (NegosiasiEdit.ToString() == "1")
                            {
                                Response.Write("<cell>" + RemoveWhiteSpace("Edit^NegosiasiForm.aspx?rand=" + r.Next() + "&param1=E" + "&param2=" + dt.Rows[i]["registNmrReg"].ToString() + "") + "</cell>");
                            }
                            if (NegosiasiDelete.ToString() == "1")
                            {
                                Response.Write("<cell>" + RemoveWhiteSpace("Delete^NegosiasiForm.aspx?rand=" + r.Next() + "&param1=D" + "&param2=" + dt.Rows[i]["registNmrReg"].ToString() + "") + "</cell>");

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