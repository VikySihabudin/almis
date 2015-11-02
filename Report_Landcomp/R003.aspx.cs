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

public partial class SummaryAsset : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool normal = true;

        if (normal && (Request.Params["sm"] is object)) normal = ServiceSelect(Request.Params["sm"].ToString());

        
    }

    private bool ServiceSelect(string sm)
    {
        report();
        return true;
    }

    protected string report()
    {
        String output = "";

        var par1 = "";
        var par2 = "";
        //var par3 = "";
        var par4 = "";

        try
        {
            string namaProc = "[almis].[r_R003]";
            if (Request.Params["param1"] is object)
                par1 = Request.Params["param1"].ToString();
            if (Request.Params["param2"] is object)
                par2 = Request.Params["param2"].ToString();
            //if (Request.Params["param3"] is object)
            //    par3 = Request.Params["param3"].ToString();
            if (Request.Params["sm"] is object)
                par4 = Request.Params["sm"].ToString();

            //par1 = "2015-03-01";

            //System.Web.HttpContext.Current.Response.Write("hello");_
            ADARO.ReportLT _obCData = new ADARO.ReportLT();
            ADARO.Report _obCRept = new ADARO.Report();

            _obCData.Datas();
            System.Data.DataSet _dsDatas = _obCData.Prin(namaProc, par1, par2, "");
            string _stNmRpt;

            if (_dsDatas != null)
            {
                    _stNmRpt = @"R003.rpt";

                _obCRept.NmRpt = _stNmRpt;
                _obCRept.Datas = _dsDatas;
                try
                {
                    _obCRept.Convert();
                    _obCRept.End();
                }
                catch (System.Exception vsqExcep)
                {
                    System.Web.HttpContext.Current.Response.Write("<center>ERROR<br>" + _stNmRpt + "<br>");
                    System.Web.HttpContext.Current.Response.Write(vsqExcep.Message);
                }
                finally
                {
                    System.Web.HttpContext.Current.Response.End();
                    System.Web.HttpContext.Current.Response.Close();
                }
            }
            if (_dsDatas != null) _dsDatas = null;
            if (_obCRept != null) _obCRept = null;
            if (_obCData != null) _obCData = null;
        }
        catch (Exception e)
        {
            output = e.Message;
        }
        return output;




    }
}
