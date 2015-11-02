using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using Waindo.Conn;

public partial class Pages_CodesModul : System.Web.UI.Page
{
    Connection conn;
    //private LDAP ldap = new LDAP();
    protected String userid = "";
    protected String groups = "";
    protected String MasterCodesView = "";
    protected String MasterCodesEdit = "";
    protected String MasterCodesDelete = "";
    protected String MasterCodesAssign = "";
    DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        HakAkses();
        bool normal = true;
        if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());
        if (normal)
        {
            if (!IsPostBack)
            {

            }
        }
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

        MasterCodesEdit = dt.Rows[13]["MasterCodesEdit"].ToString(); //0
        MasterCodesDelete = dt.Rows[13]["MasterCodesDelete"].ToString(); //1
        MasterCodesView = dt.Rows[13]["MasterCodes"].ToString(); //2
        MasterCodesAssign = dt.Rows[13]["MasterCodesAssign"].ToString(); //3

        dt.Dispose();


        if (MasterCodesView.ToString() != "1")
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
        value = value.Replace(@"\", "&quot;");
        return value;
    }

    private bool ServiceSelect(string sm)
    {
        String sql = "";
        conn = new Connection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal2"].ToString());
        DataTable dt = new DataTable();
        switch (sm)
        {
            case "l":
                sql = "SELECT codessHeadss, codessCodess, codessDescs1, codessDescs2, codessStatss "
                     +" from almis.CODESS where codessCodess=0"
                     + "";
                dt = conn.sqlQuery(sql);

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Response.Write("<row id=\"" + RemoveWhiteSpace(dt.Rows[i]["codessHeadss"].ToString()) + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["codessHeadss"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["codessDescs1"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["codessDescs2"].ToString()) + "</cell>");
                    Response.Write("<cell>" + RemoveWhiteSpace(dt.Rows[i]["codessStatss"].ToString()) + "</cell>");
                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();
                conn.myConnectionClose();
                Response.End();
                return false;


            case "li":
                idcodehead.Value = Request.Params["id"].ToString();
                String idrow = Request.Params["id"].ToString();
                sql = "SELECT codessHeadss,codessCodess,ISNULL(codessDescs1,'') codessDescs1,ISNULL(codessDescs2,'') codessDescs2,codessStatss FROM almis.CODESS  where codessStatss!=0 and codessHeadss=" + idrow
                    + "ORDER BY codessCodess";
                dt = conn.sqlQuery(sql);

                Response.ContentType = "application/xhtml+xml";
                Response.Write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                Response.Write("<rows>");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Response.Write("<row id=\"" + dt.Rows[i]["codessCodess"].ToString() + "\">");
                    Response.Write("<cell>" + (i + 1).ToString() + "</cell>");
                    Response.Write("<cell>" + dt.Rows[i]["codessCodess"].ToString() + "</cell>");
                    Response.Write("<cell>" + dt.Rows[i]["codessDescs1"].ToString() + "</cell>");
                    Response.Write("<cell>" + dt.Rows[i]["codessDescs2"].ToString() + "</cell>");
                    Response.Write("<cell>" + dt.Rows[i]["codessStatss"].ToString() + "</cell>");
                    Response.Write("<cell>" + dt.Rows[i]["codessHeadss"].ToString() + "</cell>");
                    Response.Write("</row>");
                }
                Response.Write("</rows>");
                dt.Dispose();
                conn.myConnectionClose();
                Response.End();
                return false;

            case "s":
                String id = Request.Params["id"].ToString();
                sql = "SELECT codessHeadss,codessCodess,codessDescs1,codessDescs2,codessStatss FROM almis.CODESS where codessHeadss=" + Request.Params["codeid"].ToString()
                    + "  and codessCodess= " + id
                    + "";
                dt = conn.sqlQuery(sql);

                Response.ContentType = "text/plain";

                Response.Write(dt.Rows[0]["codessHeadss"].ToString() + "|");
                Response.Write((dt.Rows[0]["codessCodess"].ToString()) + "|");
                Response.Write((dt.Rows[0]["codessDescs1"].ToString()) + "|");
                Response.Write(dt.Rows[0]["codessDescs2"].ToString() + "|");
                Response.Write(dt.Rows[0]["codessStatss"].ToString());

                dt.Dispose();
                conn.myConnectionClose();
                Response.End();
                return false;

            case "i":
                String tipe = Request.Params["tipe"].ToString();
                String codehead = Request.Params["id"].ToString();
                String idcodes = Request.Params["idcodes"].ToString();
                String codessDescs1 = Request.Params["codessDescs1"].ToString();
                String codessDescs2 = Request.Params["codessDescs2"].ToString();
                string user = (string)Session["userID"].ToString();
                String output = "";
                String idCLS = Request.Params["id"].ToString();
                Response.ContentType = "text/plain";
                if (tipe == "1")
                {
                    sql = @"select codessCodess from almis.CODESS where codessHeadss='" + codehead + @"'
                            and codessDescs1='" + codessDescs1 + "' ";

                    DataTable dt0 = new DataTable();
                    dt0 = conn.sqlQuery(sql);
                    output = dt0.Rows.Count.ToString();
                    if (output != "0")
                        Response.Write("Nama Item tidak boleh sama");
                }
                if (output == "0" || tipe != "1")
                {
                    sql = "exec almis.updateCodesCodes "
                            + "'" + tipe + "' "
                            + ",'" + codehead + "' "
                            + ",'" + idcodes + "' "
                            + ",'" + codessDescs1 + "' "
                            + ",'" + codessDescs2 + "' "
                            + "";
                    dt = conn.sqlQuery(sql);

                }


                dt.Dispose();
                conn.myConnectionClose();
                Response.End();
                return false;

            default:
                Response.ContentType = "text/plain";
                Response.End();
                return true;
        }
    }

}