﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;


public partial class Pages_LandLiti_VerifikasiAssign : System.Web.UI.Page

{

    DataTable dt;
    private string groupsid;

    string Constring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    SqlDataAdapter Sda;
    SqlConnection Conn;
    string query;
    protected String userid = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();
        }

        isiPerusa();
        isiPeriode();

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
                var param7L = Request.Params["param7"].ToString();
                ALMIS.ExecuteSTP eSTP_L = new ALMIS.ExecuteSTP();

                eSTP_L.Datas();
                DataSet ds_L = new DataSet();
                ds_L = eSTP_L.List11("P_VERDOK", param1L, param2L, "", param4L, param5L, "", param7L, "", "", userid,"");

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
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["ClausrNmrClm"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["ClausrNamass"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["ClausrLokKab"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["VerdokLitiga"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["VerdokAssign"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["VerdokKeteks"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["perusaNamass"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["Assign"].ToString()) + "</cell>");
                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();

                Response.End();

                return false;

            case "A":


                var param1 = Request.Params["param1"].ToString();
                var param2 = Request.Params["param2"].ToString();
                var param4 = Request.Params["param4"].ToString();
                var param7 = Request.Params["param7"].ToString();
                var param10 = Request.Params["param10"].ToString();


                ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
                eSTP.Datas();
                DataSet ds = new DataSet();
                eSTP.save11("P_VERDOK", param1, param2, "", param4, userid, "", param7, "", "", param10,"");
                Response.End();
                return false;


            case "UA":
                Response.ContentType = "text/plain";
                Response.Write(UA());
                Response.End();
                return false; 

            default:
                Response.ContentType = "text/plain";
                Response.End();
                return true;
        }
        
    }

     private String UA()
     {
         var Param1 = Request.Params["param1"].ToString();
         var Param2 = Request.Params["param2"].ToString();
         string output = "";

         try
         {
             ALMIS.ExecuteSTP eSTP_p = new ALMIS.ExecuteSTP();
             eSTP_p.Datas();
             DataSet ds_p = new DataSet();
             ds_p = eSTP_p.List2("C_ADMINS", Param1, Param2);

             dt = ds_p.Tables[0];

             Response.ContentType = "text/plain";
             for (int i = 0; i < dt.Rows.Count; i++)
             {
                 output += dt.Rows[i]["UserssNamess"].ToString() + "|";
                 output += dt.Rows[i]["UserssIdents"].ToString() + "*";
             }
             dt.Dispose();
         }
         catch (Exception ex)
         {
             Response.Write(ex.Message);
         }

         return output;
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