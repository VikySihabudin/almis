using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Waindo.Conn;

public partial class Commons_Lookup : System.Web.UI.Page
{
    private Connection conn;
    String lt,lps,lts,ls;
    private string user;
    private string wilayah;

    protected void Page_Load(object sender, EventArgs e)
    {
        //GenerateGrid(new DataTable());
        String sm = ""; bool normal = true;
        lt = lps = lts = ls = "";
        if (Request.Params["lt"] is object)
        {
            lt = Request.Params["lt"].ToString();
        }
        if (Request.Params["lps"] is object)
        {
            lps = Request.Params["lps"].ToString();
        }
        if (Request.Params["lts"] is object)
        {
            lts = Request.Params["lts"].ToString();
        }
        if (Request.Params["ls"] is object)
        {
            ls = Request.Params["ls"].ToString();
        }
        if (Request.Params["sm"] is object)
        {
            sm = Request.Params["sm"].ToString();
        }
        GenerateGrid(new DataTable());
        //if (normal)
        //{
        //    if (!IsPostBack)
        //    {
        //    }
        //}

        
    }
    private bool ServiceSelect(string mode)
    {
        switch (mode)
        {
            case "":
                return false;
            case "1":
                return false;
            default:
                Response.ContentType = "text/html";
                Response.End();
                return true;
        }
    }
    private void GenerateGrid(DataTable dt)
    {
        String grid = "";
        String sql = "";
        conn = new Connection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal2"].ToString());

        if ((Session["usersWilay"] is object) && (Session["userID"] is object))
        {
            wilayah = "0" + Session["usersWilay"].ToString();
            user = Session["userID"].ToString();
        }

        try
        {
            sql = "DECLARE @LookupType varchar(10); SET @LookupType='"+lt+"'; "
                + "DECLARE @LookupParams varchar(1000); SET @LookupParams='" + lps + "'; "
                + "DECLARE @LookupSearch varchar(1000); SET @LookupSearch='" + ls + "'; "
                + "DECLARE @LookupWilayah varchar(10); SET @LookupWilayah='" + wilayah + "'; "
                + "EXEC almis.[c_lookup] "
                + "@LookupType"
                + ",@LookupParams"
                + ",@LookupSearch"
                + ",@LookupWilayah"
                + "";
            dt = conn.sqlQuery(sql);

            grid = "<rows>" + grid + GenerateHead(dt);
            grid = grid + GenerateContent(dt) + "</rows>";

            Response.ContentType = "application/xhtml+xml";
            //Response.ContentType = "text/plain"; // for debuging
            Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
            Response.Write(grid);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        Response.End();
    }
    private String GenerateHead(DataTable dt)
    {
        String grid = "";
        String[] splt;

        try
        {
            grid = grid + "<head>";
            grid = grid + "<column width=\"50\" type=\"ro\" align=\"right\" sort=\"str\">";
            grid = grid + "No";
            grid = grid + "</column>";
            for (int i = 0; i < dt.Columns.Count; i++)
            {
                splt = dt.Columns[i].ToString().Split('|');

                grid = grid + "<column width=\"" + splt[2] + "\" type=\"" + splt[1] + "\" align=\"" + splt[3] + "\" sort=\"str\">";
                grid = grid + splt[0];
                grid = grid + "</column>";
            }

            grid = grid + "<settings>";
            grid = grid + "<colwidth>px</colwidth>";
            grid = grid + "</settings>";
            grid = grid + "</head>";
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }

        return grid;
    }
    private String GenerateContent(DataTable dt)
    {
        String grid = "";

        try
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
				grid = grid + "<row id=\"" + i.ToString() + "\">";
                grid = grid + "<cell>" + (i + 1).ToString() + "</cell>";
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    grid = grid + "<cell>" + RemoveWhiteSpace(dt.Rows[i][j].ToString()) + "</cell>";
                }
                //grid = grid + "<cell>" + dt.Rows[i][1].ToString() + "</cell>";
                grid = grid + "</row>";
                /* grid = grid + "<row id=\"" + i.ToString() + "\">";
                grid = grid + "<cell>" + (i + 1).ToString() + "</cell>";
                grid = grid + "<cell>" + dt.Rows[i][0].ToString() + "</cell>";
                grid = grid + "<cell>" + dt.Rows[i][1].ToString() + "</cell>";
                grid = grid + "</row>"; */
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }

        return grid;
    }
    private string RemoveWhiteSpace(string value)
    {
        value = value.Replace("&", "&amp;");
        return value;
    }
}
