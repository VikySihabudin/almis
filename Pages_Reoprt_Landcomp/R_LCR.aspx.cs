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
public partial class Pages_R_LCR : System.Web.UI.Page
{
    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    string query;
    DataTable dt;
    SqlCommand command;
    SqlDataAdapter sda;
    SqlConnection conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            bool normal = true;
            if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());

        }
        IsiBulan();
    }

    public DataTable getDataTable(string query)
    {
        dt = new DataTable();
        conn = new SqlConnection(connstring);
        conn.Open();
        sda = new SqlDataAdapter(query, conn);
        dt = new DataTable();
        sda.Fill(dt);
        return dt;
    }

    public void IsiBulan()
    {
        query = @"SELECT '01' value, 'Januari' bulan
                    union all
                    SELECT '02' value, 'Februari' bulan
                    union all
                    SELECT '03' value, 'Maret' bulan
                    union all
                    SELECT '04' value, 'April' bulan
                    union all
                    SELECT '05' value, 'Mei' bulan
                    union all
                    SELECT '06' value, 'Juni' bulan
                    union all
                    SELECT '07' value, 'Juli' bulan
                    union all
                    SELECT '08' value, 'Agustus' bulan
                    union all
                    SELECT '09' value, 'September' bulan
                    union all
                    SELECT '10' value, 'Oktober' bulan
                    union all
                    SELECT '11' value, 'November' bulan
                    union all
                    SELECT '12' value, 'Desember' bulan";
        dt = getDataTable(query);

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ddBulan.Items.Add(new ListItem(dt.Rows[i]["bulan"].ToString(), dt.Rows[i]["value"].ToString()));
        }

    }



    private bool ServiceSelect(string sm)
    {
        switch (sm)
        {


            default:
                Response.ContentType = "text/plain";
                Response.End();
                return true;
        }
    }
}