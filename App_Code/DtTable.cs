using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Collections;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;
using Waindo.Conn;

/// <summary>
/// Summary description for DataTable
/// </summary>
/// 

public class DtTable
{

    string connstring = ConfigurationManager.ConnectionStrings["ConStrLANDCOMPLocal"].ToString();
    string query;
    DataTable dt;
    SqlCommand command;
    SqlDataAdapter sda;
    SqlConnection conn;

    public DtTable()
	{
		//
		// TODO: Add constructor logic here
		//
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