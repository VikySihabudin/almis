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


public partial class Pages_LandLiti_VerifikasiList : System.Web.UI.Page

{

    DataTable dt;
    private string groupsid;

    string Constring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    SqlDataAdapter Sda;
    SqlConnection Conn;
    string Query;

    protected void Page_Load(object sender, EventArgs e)
    {
        bool normal = true;
        if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());
        isiPeriode();
    }

     private bool ServiceSelect(string sm)
    {
        switch (sm)
        {
            case "L":

                var param1L = Request.Params["param1"].ToString();
                var param2L = Request.Params["param2"].ToString();
                //var param3L = Request.Params["param3"].ToString();
                var param4L = Request.Params["param4"].ToString();
                var param5L = Request.Params["param5"].ToString();
                //var param6L = Request.Params["param6"].ToString();
                ALMIS.ExecuteSTP eSTP_L = new ALMIS.ExecuteSTP();

                eSTP_L.Datas();
                DataSet ds_L = new DataSet();
                ds_L = eSTP_L.List8("P_VERDOK", param1L, param2L, "", param4L, param5L, "","","");

                dt = ds_L.Tables[0];
                
                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");


                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random r = new Random();
                    Response.Write("<row id=\"" + (i + 1).ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>"); // Untuk Membuat Angka
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["VerdokNmrVrd"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["PredokNmrDok"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["ClausrNmrClm"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["ClausrNamass"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["ClausrLokKab"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["ClausrLokKec"].ToString()) + "</cell>");

                    if (dt.Rows[i]["VerdokNmrVrd"].ToString() != "")
                    {


                        Response.Write("<cell>" + RemoveWhiteSpace("View^VerifikasiForm.aspx?rand=" + r.Next() + "&param1=V" + "&param2=" + dt.Rows[i]["PredokNmrDok"].ToString() + "") + "</cell>");
                        Response.Write("<cell>" + RemoveWhiteSpace("Edit^VerifikasiForm.aspx?rand=" + r.Next() + "&param1=E" + "&param2=" + dt.Rows[i]["PredokNmrDok"].ToString() + "") + "</cell>");
                        Response.Write("<cell>" + RemoveWhiteSpace("Delete^VerifikasiForm.aspx?rand=" + r.Next() + "&param1=D" + "&param2=" + dt.Rows[i]["PredokNmrDok"].ToString() + "") + "</cell>");

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

     public void isiPeriode()
     {
         Query = @"SELECT codessDescs1, codessCodess FROM CODESS WHERE codessHeadss = '9'";
         dt = getDataTable(Query);
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
     public DataTable getDataTable(string Query)
     {
         dt = new DataTable();
         Conn = new SqlConnection(Constring);
         Conn.Open();
         Sda = new SqlDataAdapter(Query, Conn);
         dt = new DataTable();
         Sda.Fill(dt);
         Conn.Close();
         return dt;
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