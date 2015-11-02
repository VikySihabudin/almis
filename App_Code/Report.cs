using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.Sql;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Report
/// </summary>
/// 
namespace ADARO
{
    public class Report
    {
        
        private string _stNmRpt = string.Empty;
        private string _stConSt;
        private System.Data.DataSet _dsDatas = null;

        #region Constructor
        public Report()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"].ToString();

            //conn = new Connection(System.Configuration.ConfigurationManager.AppSettings["dBconnection"].ToString());

        }
        public Report(string stConnection) { this._stConSt = stConnection; }
        public string NmRpt { get { return this._stNmRpt; } set { this._stNmRpt = value; } }
        public System.Data.DataSet Datas { get { return this._dsDatas; } set { this._dsDatas = value; } }
        #endregion Constructor

        #region Convert
        public void Convert()
        {
        		//System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            this._stNmRpt = this._stNmRpt.Replace(".rpt", "");
            this._stNmRpt = this._stNmRpt.Replace(".RPT", "");
            try
            {
            		//System.Web.HttpContext.Current.Response.Write(_stNmRpt);
                System.IO.MemoryStream vioMemor = new System.IO.MemoryStream();
                CrystalDecisions.CrystalReports.Engine.ReportDocument vrpRepor = new CrystalDecisions.CrystalReports.Engine.ReportDocument();

                string vstRepor = System.Web.HttpContext.Current.Request.ServerVariables["APPL_PHYSICAL_PATH"].ToString() + "report\\"+this._stNmRpt + ".rpt";
								//System.Web.HttpContext.Current.Response.Write(vstRepor);
                vrpRepor.Load(vstRepor);
                if (_dsDatas == null) { return; }
                vrpRepor.Database.Tables[0].SetDataSource(this._dsDatas.Tables[0]);
                vrpRepor.Refresh();
                //vioMemor = (System.IO.MemoryStream)vrpRepor.ExportToStream(CrystalDecisions.Shared.ExportFormatType.Excel);
                vioMemor = (System.IO.MemoryStream)vrpRepor.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                vrpRepor.Close();
                try
                {
                    System.Web.HttpContext.Current.Response.Buffer = false;
                    System.Web.HttpContext.Current.Response.ClearContent();
                    System.Web.HttpContext.Current.Response.ClearHeaders();
                    System.Web.HttpContext.Current.Response.ContentType = "application/pdf";
                    System.Web.HttpContext.Current.Response.AddHeader("Content-Disposition", "inline; filename=" + this._stNmRpt.Replace("\\", "") + ".pdf");
                    System.Web.HttpContext.Current.Response.BinaryWrite(vioMemor.ToArray());
                    System.Web.HttpContext.Current.Response.Buffer = true;
                }
                catch (System.Exception vsqExcep) { vstExcep = vsqExcep.Message; }
                finally
                {
                    if (vioMemor != null) { vioMemor.Flush(); vioMemor = null; }
                    else { vioMemor = null; }
                    if (vrpRepor != null) vrpRepor = null;
                }
            }
            catch (System.Exception vsqExcep) { vstExcep = vsqExcep.Message; }
        }
        public void Convert(string reptNmRpt, System.Data.DataSet reptDatas)
        {
            this._stNmRpt = reptNmRpt;
            this._dsDatas = reptDatas;
            this.Convert();
        }
        #endregion Convert

        #region Desctructor
        public void End()
        {
            if (this._dsDatas != null)
            {
                this._dsDatas.Clear();
                this._dsDatas = null;
            }
        }

        public void Dispose()
        {
            this.End();
            this.Dispose();
        }
        #endregion Desctructor


    }

    public class CR1
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];

        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2)
        {
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "CR1");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }



        #endregion
    }

    public class PemeliharaanAset
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_date1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_date2", System.Data.SqlDbType.VarChar)).Value = _stParam2;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }

    public class ReportLT
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2, string _stParam3)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param3", System.Data.SqlDbType.VarChar)).Value = _stParam3;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "ReportLT");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }
        #endregion

            public System.Data.DataSet DashboardMRS(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6)
        {
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param3", System.Data.SqlDbType.VarChar)).Value = _stParam3;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param4", System.Data.SqlDbType.VarChar)).Value = _stParam4;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param5", System.Data.SqlDbType.VarChar)).Value = _stParam5;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param6", System.Data.SqlDbType.VarChar)).Value = _stParam6;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "Dashboard");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }
            public System.Data.DataSet Detail(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5)
            {
                string vstExcep;
                System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
                System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
                System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
                System.Data.DataSet vdsDatas = new System.Data.DataSet();
                try
                {
                    vobCommd.CommandText = _stProcs;
                    vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                    vobCommd.CommandTimeout = 600;
                    vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                    vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                    vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param3", System.Data.SqlDbType.VarChar)).Value = _stParam3;
                    vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param4", System.Data.SqlDbType.VarChar)).Value = _stParam4;
                    vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param5", System.Data.SqlDbType.VarChar)).Value = _stParam5;

                    try
                    {
                        if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                        vobCommd.Connection = vobConne;
                        vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                        vobAdapt.Fill(vdsDatas, "Detail");
                    }
                    catch (System.Data.SqlClient.SqlException vsqExcep)
                    { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
                }
                catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
                finally
                {
                    if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                    vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
                }
                return vdsDatas;
            }

            public System.Data.DataSet Detail2(string _stProcs, string _stParam1, string _stParam2)
            {
                string vstExcep;
                System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
                System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
                System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
                System.Data.DataSet vdsDatas = new System.Data.DataSet();
                try
                {
                    vobCommd.CommandText = _stProcs;
                    vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                    vobCommd.CommandTimeout = 600;
                    vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                    vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;


                    try
                    {
                        if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                        vobCommd.Connection = vobConne;
                        vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                        vobAdapt.Fill(vdsDatas, "Detail");
                    }
                    catch (System.Data.SqlClient.SqlException vsqExcep)
                    { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
                }
                catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
                finally
                {
                    if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                    vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
                }
                return vdsDatas;
            }

    }


    public class Offtake
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "Offtake");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }

    public class MRSPelanggan
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_date1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_date2", System.Data.SqlDbType.VarChar)).Value = _stParam2;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "MRSPelanggan");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }

    public class InspeksiSistemProteksiKatodik
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    } //Class awal InspeksiSistemProteksiKatodik

    public class InspeksiValveDanBakValve
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    } // Class awal InspeksiValveDanBakValve

    public class grafikkatodikproteksi
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2, string _stParam3)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@subwil", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@rtkatodik", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@bulan", System.Data.SqlDbType.VarChar)).Value = _stParam3;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "grafikkatodikproteksi");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }

    public class TeknisNonPelanggan
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }

    public class DataPemasanganBaruMrsMsRs
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2, string _stParam3)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param3", System.Data.SqlDbType.VarChar)).Value = _stParam3;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }

    public class DataPenambahanPencabutanPenggantianMeter
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2, string _stParam3)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param3", System.Data.SqlDbType.VarChar)).Value = _stParam3;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "DataPenambahanPencabutanPenggantianMeter");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }

    public class DataPencabutanMrsMsDanRs
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2, string _stParam3)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param3", System.Data.SqlDbType.VarChar)).Value = _stParam3;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }

    public class DataSurveyKebocoranJaringanPipa
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2, string _stParam3)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param3", System.Data.SqlDbType.VarChar)).Value = _stParam3;


                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }

    public class KegiatanPatroliJaringanPipa
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2, string _stParam3)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param3", System.Data.SqlDbType.VarChar)).Value = _stParam3;


                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }

    //public class DataInspeksiPemeriksaanMrsMsdanRs
    //{
    //    private string _stConSt;

    //    #region Constructor
    //    public void Datas()
    //    {
    //        this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
    //        //System.Web.HttpContext.Current.Response.Write("hello");
    //    }
    //    #endregion

    //    #region Prin
    //    public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2)
    //    {
    //        //System.Web.HttpContext.Current.Response.Write("hello");
    //        string vstExcep;
    //        System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
    //        System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
    //        System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
    //        System.Data.DataSet vdsDatas = new System.Data.DataSet();
    //        try
    //        {
    //            vobCommd.CommandText = _stProcs;
    //            vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
    //            vobCommd.CommandTimeout = 600;
    //            vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
    //            vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;

    //            try
    //            {
    //                if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
    //                vobCommd.Connection = vobConne;
    //                vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
    //                vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
    //            }
    //            catch (System.Data.SqlClient.SqlException vsqExcep)
    //            { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
    //        }
    //        catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
    //        finally
    //        {
    //            if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
    //            vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
    //        }
    //        return vdsDatas;
    //    }

    //    #endregion
    //}

    public class DataTeknisMSPelanggan
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param3", System.Data.SqlDbType.VarChar)).Value = _stParam3;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param4", System.Data.SqlDbType.VarChar)).Value = _stParam4;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }

    public class DataTeknisMRSPelanggan
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2, string _stParam3)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param3", System.Data.SqlDbType.VarChar)).Value = _stParam3;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }
    public class DaftarStasiunOfftake
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }

    //public class PenambahanPenguranganPipaBajaYangDilindungiSistemProteksiKatodik
    //{
    //    private string _stConSt;

    //    #region Constructor
    //    public void Datas()
    //    {
    //        this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
    //        //System.Web.HttpContext.Current.Response.Write("hello");
    //    }
    //    #endregion

    //    #region Prin
    //    public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2)
    //    {
    //        //System.Web.HttpContext.Current.Response.Write("hello");
    //        string vstExcep;
    //        System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
    //        System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
    //        System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
    //        System.Data.DataSet vdsDatas = new System.Data.DataSet();
    //        try
    //        {
    //            vobCommd.CommandText = _stProcs;
    //            vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
    //            vobCommd.CommandTimeout = 600;
    //            vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
    //            vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;

    //            try
    //            {
    //                if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
    //                vobCommd.Connection = vobConne;
    //                vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
    //                vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
    //            }
    //            catch (System.Data.SqlClient.SqlException vsqExcep)
    //            { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
    //        }
    //        catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
    //        finally
    //        {
    //            if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
    //            vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
    //        }
    //        return vdsDatas;
    //    }

    //    #endregion
    //}

    public class DataPenambahanPenguranganPipa
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2, string _stParam3)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param3", System.Data.SqlDbType.VarChar)).Value = _stParam3;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }

    public class DataTeknisMRSMSdanRSnonPelanggan
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2, string _stParam3)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param3", System.Data.SqlDbType.VarChar)).Value = _stParam3;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }

    public class DataInspeksiPemeriksaanMrsMsdanRs
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2, string _stParam3)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param3", System.Data.SqlDbType.VarChar)).Value = _stParam3;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }

    public class InspeksiPemeriksaanValvedanBakValve
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2, string _stParam3)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param3", System.Data.SqlDbType.VarChar)).Value = _stParam3;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }


    public class DataTeknisPipa
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2, string _stParam3)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param3", System.Data.SqlDbType.VarChar)).Value = _stParam3;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }

    public class InspeksiPemeriksaanSistemProteksiKatodik
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2, string _stParam3)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param3", System.Data.SqlDbType.VarChar)).Value = _stParam3;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }

    public class PenambahanPenguranganPipaBajaYangDilindungiSistemProteksiKatodik
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2, string _stParam3)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param3", System.Data.SqlDbType.VarChar)).Value = _stParam3;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }



    public class grafikproteksikatodik
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2, string _stParam3)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param3", System.Data.SqlDbType.VarChar)).Value = _stParam3;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }


    public class LaporanInspeksiJembatan
    {
        private string _stConSt;
        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2, string _stParam3)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param3", System.Data.SqlDbType.VarChar)).Value = _stParam3;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }


    public class DataMeterSummary
    {
        private string _stConSt;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];
            //System.Web.HttpContext.Current.Response.Write("hello");
        }
        #endregion

        #region Prin
        public System.Data.DataSet Prin(string _stProcs, string _stParam1, string _stParam2, string _stParam3)
        {
            //System.Web.HttpContext.Current.Response.Write("hello");
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = _stProcs;
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param1", System.Data.SqlDbType.VarChar)).Value = _stParam1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param2", System.Data.SqlDbType.VarChar)).Value = _stParam2;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_param3", System.Data.SqlDbType.VarChar)).Value = _stParam3;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "PemeliharaanAset");
                }
                catch (System.Data.SqlClient.SqlException vsqExcep)
                { vstExcep = vsqExcep.Message; vobConne.Close(); vdsDatas = null; }
            }
            catch (System.Data.SqlClient.SqlException vsqExcep) { vstExcep = vsqExcep.Message; vdsDatas = null; }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }

        #endregion
    }


}