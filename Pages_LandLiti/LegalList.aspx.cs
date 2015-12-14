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


public partial class Pages_LandLiti_LegalList : System.Web.UI.Page
{

    DataTable dt;
    private string groupsid;

    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    SqlDataAdapter sda;
    SqlConnection conn;
    string query;
    protected String lanjut = "";
    protected String except = "";
    protected String userid = "";
    protected String groups = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();
        }

        isiPerusa();

        bool normal = true;
        if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());

        isiPeriode();

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

    private bool ServiceSelect(string sm)
    {
        switch (sm)
        {
            case "L":

                var param1L = Request.Params["param1"].ToString();
                var param2L = Request.Params["param2"].ToString();
                var param4L = Request.Params["param4"].ToString();
                var param5L = Request.Params["param5"].ToString();
                var param9L = Request.Params["param9"].ToString();
                ALMIS.ExecuteSTP eSTP_L = new ALMIS.ExecuteSTP();
                eSTP_L.Datas();
                DataSet ds_L = new DataSet();
                ds_L = eSTP_L.List14("P_LEGALL", param1L, param2L, "", param4L, param5L, "", userid, "", param9L, "", "", "", "", "");

                dt = ds_L.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");


                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["LegallNmrLeg"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["VerdokNmrVrd"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["ClausrNmrClm"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["ClausrNmrIdn"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["ClausrNamass"].ToString()) + "</cell>");
                    Response.Write("<cell>" + "Selesai" + "</cell>");
                    Response.Write("<cell>" + "Ketearngan" + (i + 1).ToString() + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["perusaNamass"].ToString()) + "</cell>");

                    if (dt.Rows[i]["LegallNmrLeg"].ToString() != "")
                    {
                        Response.Write("<cell>" + RemoveWhiteSpace("View^LegalForm.aspx?rand=" + r.Next() + "&param1=V" + "&param2=" + dt.Rows[i]["LegallNmrLeg"].ToString() + "") + "</cell>");
                        Response.Write("<cell>" + RemoveWhiteSpace("Edit^LegalForm.aspx?rand=" + r.Next() + "&param1=E" + "&param2=" + dt.Rows[i]["LegallNmrLeg"].ToString() + "") + "</cell>");
                        Response.Write("<cell>" + RemoveWhiteSpace("Delete^LegalForm.aspx?rand=" + r.Next() + "&param1=D" + "&param2=" + dt.Rows[i]["LegallNmrLeg"].ToString() + "") + "</cell>");
                    }

                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();

                Response.End();

                return false;

            default:
                Response.ContentType = "text/plain";
                Response.End();
                return true;
        }
    }

    private String RemoveWhiteSpace(String Values)
    {
        Values = Values.Replace("&", "&amp;");
        Values = Values.Replace("<", "&lt;");
        Values = Values.Replace(">", "&lt;");
        Values = Values.Replace("'", "&apos;");
        Values = Values.Replace(@"\", "&quot;");

        return Values;

    }

}