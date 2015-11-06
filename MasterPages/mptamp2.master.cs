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

public partial class MasterPages_mptamp2 : System.Web.UI.MasterPage
{
    protected String userid = "";


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();


        }

        //if (!(Session["userid"] is object))
        //{
        //    Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
        //    Response.Write("alert('Session sudah habis. Silakan login kembali.');");
        //    Response.Write("location.href = '../Pages/login.aspx';");
        //    Response.Write("</script>");
        //}

    }
}
