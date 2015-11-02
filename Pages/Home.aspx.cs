using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using Waindo.Conn;


public partial class Pages_Home : System.Web.UI.Page
{
    Connection conn;
    //private LDAP ldap = new LDAP();
    DataTable dt;
    protected String groups = "";

    protected void Page_Load(object sender, EventArgs e)
    {

        bool normal = true;

        if (Session["groups"] is object)
        {
            groups = Session["groups"].ToString();

        }

        if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());

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
                ALMIS.ExecuteSTP eSTP_L = new ALMIS.ExecuteSTP();
                eSTP_L.Datas();
                DataSet ds_L = new DataSet();
                ds_L = eSTP_L.List2("P_HOME", param1L, param2L);

                dt = ds_L.Tables[0];

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["MidentNamass"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["registNmrReg"].ToString()) + "</cell>");
                    //Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["registNmrReg"].ToString()) + "</cell>"); ///////////
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pengtoNmrPid"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["negosiSepakt"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["visumsVerLnj"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["berks1Lanjut"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["pmbyrnLnjuts"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["berks2Slesai"].ToString()) + "</cell>");
                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();

                Response.End();
                Response.End();

                return false;

            case "graph":
                Response.ContentType = "application/xhtml+xml";
                Response.Write(graphic());
                Response.End();
                return false;
                break;

            default:
                Response.ContentType = "text/plain";
                Response.End();
                return true;
        }
    }

    public string graphic()
    {
        String output = "";
        var param1 = Request.Params["param1"].ToString();
        var param2 = Request.Params["param2"].ToString();
        //var param3 = Request.Params["param3"].ToString();
        //var param4 = Request.Params["param4"].ToString();
        //var param5 = Request.Params["param5"].ToString();
        //var param6 = Request.Params["param6"].ToString();

        try
        {
            ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
            eSTP.Datas();
            DataSet ds = new DataSet();
            ds = eSTP.List2("ALMIS.D_REPORT", param1, param2);

            DataTable dt = new DataTable();
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                output += (dt.Rows[i]["t_xmlxx"].ToString());
            }
        }
        catch (Exception e)
        {
            output = e.Message;
        }
        return output;

    }


}