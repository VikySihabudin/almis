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
/// Summary description for ClassAlmis
/// </summary>
namespace ALMIS
{
    public class landcompHelper
    {
        #region "properties"

        private String ConString = System.Configuration.ConfigurationManager.AppSettings["dBconnection"].ToString();

        #endregion
    }

    public class paramz
    {
        string extension = "";

        public string getExtsion()
        {
            return extension;
        }

        public void setExtension(string exten)
        {
            extension = exten;
        }
    }

    public class generateNUm
    {
        private string _stConSt;
        public string _stNumbr;
        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];

        }
        #endregion

        #region generateNum
        public String GenerateNumber(string _byCompa, int _stSysc1, byte _stSysc2, string _stDates, string _stUsrid)
        {
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = "[almis].[p_NUMBER]";
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_compa", System.Data.SqlDbType.VarChar)).Value = _byCompa;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_clas1", System.Data.SqlDbType.SmallInt)).Value = _stSysc1;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_clas2", System.Data.SqlDbType.SmallInt)).Value = _stSysc2;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_dates", System.Data.SqlDbType.VarChar)).Value = _stDates;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@in_UsrID", System.Data.SqlDbType.VarChar)).Value = _stUsrid;

                SqlParameter vobParam = new System.Data.SqlClient.SqlParameter("@ot_nomor", System.Data.SqlDbType.VarChar, 20);
                //SqlParameter vobParam = new System.Data.SqlClient.SqlParameter("@ot_group", System.Data.SqlDbType.VarChar, 20);
                vobParam.Direction = System.Data.ParameterDirection.Output;
                vobCommd.Parameters.Add(vobParam);



                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    _stNumbr = vobParam.Value.ToString();

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


            return _stNumbr;
        }

        #endregion

    }

    public class UploadFile
    {
        private string _stConSt;
        public bool stSave = false;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];

        }
        #endregion

        #region List Upload
        public DataSet getListFileTemp(String id)
        {
            string vstExcep;
            SqlConnection vobConne = new SqlConnection(this._stConSt);
            SqlCommand vobCommd = new SqlCommand();
            SqlDataAdapter vobAdapt = new SqlDataAdapter(vobCommd);
            DataSet vdsDatas = new DataSet();
            try
            {
                vobCommd.CommandText = @" 
                    SELECT   hdocumLParams, 
							 hdocumLIdents, 
							 hdocumLSequen, 
							 hdocumLDatess, 
							 hdocumLSource,
						     hdocumLJeniss, 
						     hdocumLUrlsss, 
						     hdocumLIdSour, 
						     hdocumLIdLink, 
						     hdocumLFiless, 
						     hdocumLKeterg
                    FROM almis.HDOCUM_LOG
                    WHERE hdocumLIdLink='" + id + @"'
                    ";
                vobCommd.CommandType = CommandType.Text;
                vobCommd.CommandTimeout = 600;
                if (vobConne.State == ConnectionState.Closed)
                    vobConne.Open();
                vobCommd.Connection = vobConne;
                vobAdapt.MissingSchemaAction = MissingSchemaAction.AddWithKey;
                vobAdapt.Fill(vdsDatas, "HDOCUM_LOG");
            }
            catch (SqlException ex)
            {
                vstExcep = ex.Message; vobConne.Close(); vdsDatas = null;
            }
            finally
            {
                if (vobConne.State == System.Data.ConnectionState.Open) { vobConne.Close(); };
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return vdsDatas;
        }
        #endregion

        #region Hapus Upload
        public bool HapusListUploadTemp(String id)
        {
            string vstExcep = "";
            SqlConnection vobConne = new SqlConnection(this._stConSt);
            SqlCommand vobCommd = new SqlCommand();
            SqlDataAdapter vobAdapt = new SqlDataAdapter(vobCommd);
            try
            {
                vobCommd.CommandText = @"DELETE FROM almis.HDOCUM_LOG WHERE[hdocumLIdLink]='" + id + @"' ";
                vobCommd.CommandTimeout = 600;
                vobCommd.CommandType = CommandType.Text;
                if (vobConne.State == ConnectionState.Closed)
                    vobConne.Open();
                vobCommd.Connection = vobConne;
                vobCommd.ExecuteNonQuery();
                stSave = true;
            }
            catch (SqlException ex)
            {
                vstExcep = ex.Message; stSave = false;
            }
            finally
            {
                if (vobConne.State == ConnectionState.Open)
                    vobConne.Close();
                vobAdapt.Dispose(); vobCommd.Dispose(); vobConne.Dispose();
            }
            return stSave;
        }
        public bool HapusFileUploadTemp(String id)
        {
            string vstExcep;
            DataSet vdsDatas = new DataSet();
            try
            {
                vdsDatas = this.getListFileTemp(id);
                string path = System.AppDomain.CurrentDomain.BaseDirectory + "uploadDocument";
                string source = "";
                DataTable dt = vdsDatas.Tables[0];

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    source = "" + dt.Rows[i]["hdocumLIdSour"].ToString();
                    System.IO.File.Delete(path + "\\Temp\\" + source);
                }
                stSave = true;
            }
            catch (Exception ex)
            {
                vstExcep = ex.Message; vdsDatas = null;
                stSave = false;
            }
            finally
            {
                vdsDatas.Dispose();
            }
            return stSave;
        }
        #endregion

        #region Upload
        //public bool SaveMapCC(String _stparam, string _stCclid, byte _stSubGr, string _stUsReq, byte _stCases, string _stRemrk, byte _stDelet,byte _stseqnc, string _stdetlJ, string _stzoReq, byte _stMTyId, string _stMapID)
        public bool UploadFiles(string param,
                                string CreationUser,
                                string DateCreated,
                                string DateModified,
                                string LastUser,
                                string TglInput,
                                string SourceLayerTabel,
                                string JenisDocument,
                                string URL,
                                string IDSource,
                                string IDHLink,
                                string FileLama)
        {
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = "[pgn].[p_HyperLinkDocu]";
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param", System.Data.SqlDbType.VarChar)).Value = param;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@CreationUser", System.Data.SqlDbType.VarChar)).Value = CreationUser;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DateCreated", System.Data.SqlDbType.VarChar)).Value = DateCreated;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DateModified", System.Data.SqlDbType.VarChar)).Value = DateModified;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@LastUser", System.Data.SqlDbType.VarChar)).Value = LastUser;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@TglInput", System.Data.SqlDbType.VarChar)).Value = TglInput;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@SourceLayerTabel", System.Data.SqlDbType.VarChar)).Value = SourceLayerTabel;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@JenisDocument", System.Data.SqlDbType.VarChar)).Value = JenisDocument;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@URL", System.Data.SqlDbType.VarChar)).Value = URL;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@IDSource", System.Data.SqlDbType.VarChar)).Value = IDSource;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@IDHLink", System.Data.SqlDbType.VarChar)).Value = IDHLink;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FileLama", System.Data.SqlDbType.VarChar)).Value = FileLama;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        //UPLOAD FROM WEB BEGIN

        public bool UploadFilesWeb(string param,
                                string CreationUser,
                                string DateCreated,
                                string SourceLayerTabel,
                                string JenisDocument,
                                string URL,
                                string IDSource,
                                string IDHLink,
                                string FileLama,
                                string keterangan,
                                string hdocumkodper,
                                string hdocumflaggg
            )
        {
            string vstExcep;
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = "[almis].[P_HDOCUM]";
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param1", System.Data.SqlDbType.VarChar)).Value = param;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param2", System.Data.SqlDbType.VarChar)).Value = DateCreated;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param3", System.Data.SqlDbType.VarChar)).Value = SourceLayerTabel;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param4", System.Data.SqlDbType.VarChar)).Value = JenisDocument;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param5", System.Data.SqlDbType.VarChar)).Value = URL;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param6", System.Data.SqlDbType.VarChar)).Value = IDSource;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = IDHLink;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = FileLama;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = keterangan;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = CreationUser;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = hdocumkodper;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = hdocumflaggg;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }



        // END OF UPLOAD FROM WEB



        public bool UploadFilesTemp(string param,
                                string CreationUser,
                                string DateCreated,
                                string DateModified,
                                string LastUser,
                                string TglInput,
                                string SourceLayerTabel,
                                string JenisDocument,
                                string URL,
                                string IDSource,
                                string IDHLink,
                                string FileLama)
        {
            string vstExcep = "";
            System.Data.SqlClient.SqlConnection vobConne = new System.Data.SqlClient.SqlConnection(this._stConSt);
            System.Data.SqlClient.SqlCommand vobCommd = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlDataAdapter vobAdapt = new System.Data.SqlClient.SqlDataAdapter(vobCommd);
            System.Data.DataSet vdsDatas = new System.Data.DataSet();
            try
            {
                vobCommd.CommandText = "[pgn].[p_HyperLinkDocu_Temp]";
                vobCommd.CommandType = System.Data.CommandType.StoredProcedure;
                vobCommd.CommandTimeout = 600;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param", System.Data.SqlDbType.VarChar)).Value = param;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@CreationUser", System.Data.SqlDbType.VarChar)).Value = CreationUser;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DateCreated", System.Data.SqlDbType.VarChar)).Value = DateCreated;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DateModified", System.Data.SqlDbType.VarChar)).Value = DateModified;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@LastUser", System.Data.SqlDbType.VarChar)).Value = LastUser;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@TglInput", System.Data.SqlDbType.VarChar)).Value = TglInput;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@SourceLayerTabel", System.Data.SqlDbType.VarChar)).Value = SourceLayerTabel;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@JenisDocument", System.Data.SqlDbType.VarChar)).Value = JenisDocument;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@URL", System.Data.SqlDbType.VarChar)).Value = URL;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@IDSource", System.Data.SqlDbType.VarChar)).Value = IDSource;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@IDHLink", System.Data.SqlDbType.VarChar)).Value = IDHLink;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FileLama", System.Data.SqlDbType.VarChar)).Value = FileLama;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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

            return stSave;
        }
        #endregion
    }


    public class ExecuteSTP
    {
        private string _stConSt;
        public bool stSave = false;

        #region Constructor
        public void Datas()
        {
            this._stConSt = System.Configuration.ConfigurationManager.AppSettings["dBconnection"];

        }
        #endregion

        #region param

        public System.Data.DataSet param2(string _stProcs, string _stParam1, string _stParam2)
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
                    vobAdapt.Fill(vdsDatas, "param2");
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

        public System.Data.DataSet param3(string _stProcs, string _stParam1, string _stParam2, string _stParam3)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param2", System.Data.SqlDbType.VarChar)).Value = _stParam3;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param3");
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

        public System.Data.DataSet param6(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6)
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
                    vobAdapt.Fill(vdsDatas, "param7");
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
        public System.Data.DataSet param7(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param7");
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
        public System.Data.DataSet param8(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param8");
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

        public System.Data.DataSet param26(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20, string _stParam21, string _stParam22, string _stParam23, string _stParam24, string _stParam25, string _stParam26)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param23", System.Data.SqlDbType.VarChar)).Value = _stParam23;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param24", System.Data.SqlDbType.VarChar)).Value = _stParam24;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param25", System.Data.SqlDbType.VarChar)).Value = _stParam25;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param26", System.Data.SqlDbType.VarChar)).Value = _stParam26;


                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param26");
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

        #region save

        public bool save4(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4)
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

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save5(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5)
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
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save6(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6)
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
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }
        public bool save7(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save8(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save9(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save10(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save11(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save12(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11, string _stParam12)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save13(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11, string _stParam12, string _stParam13)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save14(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11, string _stParam12, string _stParam13, string _stParam14)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save15(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save16(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save17(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save19(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }
        public bool save20(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save22(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20, string _stParam21, string _stParam22)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save23(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20, string _stParam21, string _stParam22, string _stParam23)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param23", System.Data.SqlDbType.VarChar)).Value = _stParam23;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save24(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, 
            string _stParam9, string _stParam10, string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17,
            string _stParam18, string _stParam19, string _stParam20, string _stParam21, string _stParam22, string _stParam23, string _stParam24)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param23", System.Data.SqlDbType.VarChar)).Value = _stParam23;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param24", System.Data.SqlDbType.VarChar)).Value = _stParam24;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save25(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, 
                           string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20, 
                           string _stParam21, string _stParam22, string _stParam23, string _stParam24, string _stParam25)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param23", System.Data.SqlDbType.VarChar)).Value = _stParam23;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param24", System.Data.SqlDbType.VarChar)).Value = _stParam24;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param25", System.Data.SqlDbType.VarChar)).Value = _stParam25;
                


                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save26(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20, string _stParam21, string _stParam22, string _stParam23, string _stParam24, string _stParam25, string _stParam26)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param23", System.Data.SqlDbType.VarChar)).Value = _stParam23;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param24", System.Data.SqlDbType.VarChar)).Value = _stParam24;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param25", System.Data.SqlDbType.VarChar)).Value = _stParam25;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param26", System.Data.SqlDbType.VarChar)).Value = _stParam26;


                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save28(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20, string _stParam21, string _stParam22, string _stParam23, string _stParam24, string _stParam25, string _stParam26, string _stParam27, string _stParam28)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param23", System.Data.SqlDbType.VarChar)).Value = _stParam23;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param24", System.Data.SqlDbType.VarChar)).Value = _stParam24;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param25", System.Data.SqlDbType.VarChar)).Value = _stParam25;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param26", System.Data.SqlDbType.VarChar)).Value = _stParam26;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param27", System.Data.SqlDbType.VarChar)).Value = _stParam27;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param28", System.Data.SqlDbType.VarChar)).Value = _stParam28;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save29(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20, string _stParam21, string _stParam22, string _stParam23, string _stParam24, string _stParam25, string _stParam26, string _stParam27, string _stParam28, string _stParam29)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param23", System.Data.SqlDbType.VarChar)).Value = _stParam23;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param24", System.Data.SqlDbType.VarChar)).Value = _stParam24;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param25", System.Data.SqlDbType.VarChar)).Value = _stParam25;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param26", System.Data.SqlDbType.VarChar)).Value = _stParam26;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param27", System.Data.SqlDbType.VarChar)).Value = _stParam27;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param28", System.Data.SqlDbType.VarChar)).Value = _stParam28;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param29", System.Data.SqlDbType.VarChar)).Value = _stParam29;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save32(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, 
                           string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11, string _stParam12, string _stParam13, 
                           string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20, 
                           string _stParam21, string _stParam22, string _stParam23, string _stParam24, string _stParam25, string _stParam26, string _stParam27, 
                           string _stParam28, string _stParam29, string _stParam30, string _stParam31, string _stParam32)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param23", System.Data.SqlDbType.VarChar)).Value = _stParam23;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param24", System.Data.SqlDbType.VarChar)).Value = _stParam24;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param25", System.Data.SqlDbType.VarChar)).Value = _stParam25;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param26", System.Data.SqlDbType.VarChar)).Value = _stParam26;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param27", System.Data.SqlDbType.VarChar)).Value = _stParam27;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param28", System.Data.SqlDbType.VarChar)).Value = _stParam28;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param29", System.Data.SqlDbType.VarChar)).Value = _stParam29;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param30", System.Data.SqlDbType.VarChar)).Value = _stParam30;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param31", System.Data.SqlDbType.VarChar)).Value = _stParam31;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param32", System.Data.SqlDbType.VarChar)).Value = _stParam32;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save34(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20, string _stParam21, string _stParam22, string _stParam23, string _stParam24, string _stParam25, string _stParam26, string _stParam27, string _stParam28, string _stParam29, string _stParam30, string _stParam31, string _stParam32, string _stParam33, string _stParam34)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param23", System.Data.SqlDbType.VarChar)).Value = _stParam23;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param24", System.Data.SqlDbType.VarChar)).Value = _stParam24;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param25", System.Data.SqlDbType.VarChar)).Value = _stParam25;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param26", System.Data.SqlDbType.VarChar)).Value = _stParam26;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param27", System.Data.SqlDbType.VarChar)).Value = _stParam27;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param28", System.Data.SqlDbType.VarChar)).Value = _stParam28;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param29", System.Data.SqlDbType.VarChar)).Value = _stParam29;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param30", System.Data.SqlDbType.VarChar)).Value = _stParam30;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param31", System.Data.SqlDbType.VarChar)).Value = _stParam31;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param32", System.Data.SqlDbType.VarChar)).Value = _stParam32;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param33", System.Data.SqlDbType.VarChar)).Value = _stParam33;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param34", System.Data.SqlDbType.VarChar)).Value = _stParam34;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }

        public bool save36(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, 
                            string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20, 
                            string _stParam21, string _stParam22, string _stParam23, string _stParam24, string _stParam25, string _stParam26, string _stParam27, string _stParam28, string _stParam29, string _stParam30,
                            string _stParam31, string _stParam32, string _stParam33, string _stParam34, string _stParam35, string _stParam36)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param23", System.Data.SqlDbType.VarChar)).Value = _stParam23;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param24", System.Data.SqlDbType.VarChar)).Value = _stParam24;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param25", System.Data.SqlDbType.VarChar)).Value = _stParam25;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param26", System.Data.SqlDbType.VarChar)).Value = _stParam26;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param27", System.Data.SqlDbType.VarChar)).Value = _stParam27;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param28", System.Data.SqlDbType.VarChar)).Value = _stParam28;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param29", System.Data.SqlDbType.VarChar)).Value = _stParam29;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param30", System.Data.SqlDbType.VarChar)).Value = _stParam30;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param31", System.Data.SqlDbType.VarChar)).Value = _stParam31;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param32", System.Data.SqlDbType.VarChar)).Value = _stParam32;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param33", System.Data.SqlDbType.VarChar)).Value = _stParam33;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param34", System.Data.SqlDbType.VarChar)).Value = _stParam34;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param35", System.Data.SqlDbType.VarChar)).Value = _stParam35;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param36", System.Data.SqlDbType.VarChar)).Value = _stParam36;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed)
                    {
                        vobConne.Open();

                    }
                    vobCommd.Connection = vobConne;
                    vobCommd.ExecuteNonQuery();
                    stSave = true;

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


            return stSave;
        }


        #endregion

        #region select

        public System.Data.DataSet select9(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param9");
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

        public System.Data.DataSet select28(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20, string _stParam21, string _stParam22, string _stParam23, string _stParam24, string _stParam25, string _stParam26, string _stParam27, string _stParam28)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param23", System.Data.SqlDbType.VarChar)).Value = _stParam23;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param24", System.Data.SqlDbType.VarChar)).Value = _stParam24;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param25", System.Data.SqlDbType.VarChar)).Value = _stParam25;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param26", System.Data.SqlDbType.VarChar)).Value = _stParam26;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param27", System.Data.SqlDbType.VarChar)).Value = _stParam27;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param28", System.Data.SqlDbType.VarChar)).Value = _stParam28;


                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param28");
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


        #region List

        public System.Data.DataSet List2(string _stProcs, string _stParam1, string _stParam2)
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
                    vobAdapt.Fill(vdsDatas, "param5");
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

        public System.Data.DataSet List5(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5)
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
                    vobAdapt.Fill(vdsDatas, "param5");
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
        public System.Data.DataSet List6(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6)
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
                    vobAdapt.Fill(vdsDatas, "param5");
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

        public System.Data.DataSet List8(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param8");
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
        public System.Data.DataSet List9(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param9");
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




        public System.Data.DataSet List14(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10
                                        , string _stParam11, string _stParam12, string _stParam13, string _stParam14)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param14");
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

        public System.Data.DataSet List15(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10
                                , string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param15");
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

        public System.Data.DataSet List16(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10
                                , string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
               
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param16");
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


        public System.Data.DataSet List17(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10
                                        , string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param17");
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

        public System.Data.DataSet List7(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param7");
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

        public System.Data.DataSet List10(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10
                                        )
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;


                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param10");
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

        public System.Data.DataSet List12(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10
                                        , string _stParam11, string _stParam12)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;


                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param12");
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

        public System.Data.DataSet List13(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11, string _stParam12, string _stParam13)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param10");
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

        public System.Data.DataSet List18(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;



                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param8");
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

        public System.Data.DataSet List23(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10
                                , string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20, string _stParam21, string _stParam22, string _stParam23)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param23", System.Data.SqlDbType.VarChar)).Value = _stParam23;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param23");
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

        public System.Data.DataSet List24(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10
                        , string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20
                        , string _stParam21, string _stParam22, string _stParam23, string _stParam24)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param23", System.Data.SqlDbType.VarChar)).Value = _stParam23;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param24", System.Data.SqlDbType.VarChar)).Value = _stParam24;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param24");
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

        public System.Data.DataSet List25(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10
                , string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20
                , string _stParam21, string _stParam22, string _stParam23, string _stParam24, string _stParam25)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param23", System.Data.SqlDbType.VarChar)).Value = _stParam23;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param24", System.Data.SqlDbType.VarChar)).Value = _stParam24;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param25", System.Data.SqlDbType.VarChar)).Value = _stParam25;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param25");
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

        public System.Data.DataSet List28(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10
                , string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20
                , string _stParam21, string _stParam22, string _stParam23, string _stParam24, string _stParam25, string _stParam26, string _stParam27, string _stParam28)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param23", System.Data.SqlDbType.VarChar)).Value = _stParam23;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param24", System.Data.SqlDbType.VarChar)).Value = _stParam24;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param25", System.Data.SqlDbType.VarChar)).Value = _stParam25;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param26", System.Data.SqlDbType.VarChar)).Value = _stParam26;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param27", System.Data.SqlDbType.VarChar)).Value = _stParam27;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param28", System.Data.SqlDbType.VarChar)).Value = _stParam28;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param28");
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

        public System.Data.DataSet List29(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10
                , string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20
                , string _stParam21, string _stParam22, string _stParam23, string _stParam24, string _stParam25, string _stParam26, string _stParam27, string _stParam28, string _stParam29)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param23", System.Data.SqlDbType.VarChar)).Value = _stParam23;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param24", System.Data.SqlDbType.VarChar)).Value = _stParam24;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param25", System.Data.SqlDbType.VarChar)).Value = _stParam25;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param26", System.Data.SqlDbType.VarChar)).Value = _stParam26;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param27", System.Data.SqlDbType.VarChar)).Value = _stParam27;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param28", System.Data.SqlDbType.VarChar)).Value = _stParam28;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param29", System.Data.SqlDbType.VarChar)).Value = _stParam29;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param29");
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

        public System.Data.DataSet List32(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10
                                         , string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20
                                         , string _stParam21, string _stParam22, string _stParam23, string _stParam24, string _stParam25, string _stParam26, string _stParam27, string _stParam28, string _stParam29, string _stParam30
                                         , string _stParam31, string _stParam32)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param23", System.Data.SqlDbType.VarChar)).Value = _stParam23;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param24", System.Data.SqlDbType.VarChar)).Value = _stParam24;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param25", System.Data.SqlDbType.VarChar)).Value = _stParam25;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param26", System.Data.SqlDbType.VarChar)).Value = _stParam26;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param27", System.Data.SqlDbType.VarChar)).Value = _stParam27;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param28", System.Data.SqlDbType.VarChar)).Value = _stParam28;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param29", System.Data.SqlDbType.VarChar)).Value = _stParam29;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param30", System.Data.SqlDbType.VarChar)).Value = _stParam30;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param31", System.Data.SqlDbType.VarChar)).Value = _stParam31;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param32", System.Data.SqlDbType.VarChar)).Value = _stParam32;


                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param32");
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


        public System.Data.DataSet List34(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10
                                        , string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20
                                        , string _stParam21, string _stParam22, string _stParam23, string _stParam24, string _stParam25, string _stParam26, string _stParam27, string _stParam28, string _stParam29, string _stParam30
                                        , string _stParam31, string _stParam32, string _stParam33, string _stParam34)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param23", System.Data.SqlDbType.VarChar)).Value = _stParam23;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param24", System.Data.SqlDbType.VarChar)).Value = _stParam24;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param25", System.Data.SqlDbType.VarChar)).Value = _stParam25;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param26", System.Data.SqlDbType.VarChar)).Value = _stParam26;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param27", System.Data.SqlDbType.VarChar)).Value = _stParam27;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param28", System.Data.SqlDbType.VarChar)).Value = _stParam28;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param29", System.Data.SqlDbType.VarChar)).Value = _stParam29;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param30", System.Data.SqlDbType.VarChar)).Value = _stParam30;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param31", System.Data.SqlDbType.VarChar)).Value = _stParam31;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param32", System.Data.SqlDbType.VarChar)).Value = _stParam32;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param33", System.Data.SqlDbType.VarChar)).Value = _stParam33;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param34", System.Data.SqlDbType.VarChar)).Value = _stParam34;


                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param35");
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

        public System.Data.DataSet List36(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10
                                , string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20
                                , string _stParam21, string _stParam22, string _stParam23, string _stParam24, string _stParam25, string _stParam26, string _stParam27, string _stParam28, string _stParam29, string _stParam30
                                , string _stParam31, string _stParam32, string _stParam33, string _stParam34, string _stParam35, string _stParam36)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param23", System.Data.SqlDbType.VarChar)).Value = _stParam23;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param24", System.Data.SqlDbType.VarChar)).Value = _stParam24;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param25", System.Data.SqlDbType.VarChar)).Value = _stParam25;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param26", System.Data.SqlDbType.VarChar)).Value = _stParam26;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param27", System.Data.SqlDbType.VarChar)).Value = _stParam27;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param28", System.Data.SqlDbType.VarChar)).Value = _stParam28;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param29", System.Data.SqlDbType.VarChar)).Value = _stParam29;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param30", System.Data.SqlDbType.VarChar)).Value = _stParam30;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param31", System.Data.SqlDbType.VarChar)).Value = _stParam31;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param32", System.Data.SqlDbType.VarChar)).Value = _stParam32;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param33", System.Data.SqlDbType.VarChar)).Value = _stParam33;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param34", System.Data.SqlDbType.VarChar)).Value = _stParam34;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param35", System.Data.SqlDbType.VarChar)).Value = _stParam35;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param36", System.Data.SqlDbType.VarChar)).Value = _stParam36;

                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param36");
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

        public System.Data.DataSet LMID(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10
                                        , string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20, string _stParam21
                                           , string _stParam22, string _stParam23, string _stParam24, string _stParam25, string _stParam26, string _stParam27, string _stParam28)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param23", System.Data.SqlDbType.VarChar)).Value = _stParam23;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param24", System.Data.SqlDbType.VarChar)).Value = _stParam24;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param25", System.Data.SqlDbType.VarChar)).Value = _stParam25;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param26", System.Data.SqlDbType.VarChar)).Value = _stParam26;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param27", System.Data.SqlDbType.VarChar)).Value = _stParam25;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param28", System.Data.SqlDbType.VarChar)).Value = _stParam26;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param28");
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
        public System.Data.DataSet List19(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param19");
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
        public System.Data.DataSet List20(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param19");
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

        public System.Data.DataSet List22(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11, string _stParam12, string _stParam13, string _stParam14, string _stParam15, string _stParam16, string _stParam17, string _stParam18, string _stParam19, string _stParam20, string _stParam21, string _stParam22)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param12", System.Data.SqlDbType.VarChar)).Value = _stParam12;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param13", System.Data.SqlDbType.VarChar)).Value = _stParam13;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param14", System.Data.SqlDbType.VarChar)).Value = _stParam14;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param15", System.Data.SqlDbType.VarChar)).Value = _stParam15;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param16", System.Data.SqlDbType.VarChar)).Value = _stParam16;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param17", System.Data.SqlDbType.VarChar)).Value = _stParam17;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param18", System.Data.SqlDbType.VarChar)).Value = _stParam18;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param19", System.Data.SqlDbType.VarChar)).Value = _stParam19;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param20", System.Data.SqlDbType.VarChar)).Value = _stParam20;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param21", System.Data.SqlDbType.VarChar)).Value = _stParam21;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param22", System.Data.SqlDbType.VarChar)).Value = _stParam22;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param22");
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

        public System.Data.DataSet List11(string _stProcs, string _stParam1, string _stParam2, string _stParam3, string _stParam4, string _stParam5, string _stParam6, string _stParam7, string _stParam8, string _stParam9, string _stParam10, string _stParam11)
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
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param7", System.Data.SqlDbType.VarChar)).Value = _stParam7;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param8", System.Data.SqlDbType.VarChar)).Value = _stParam8;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param9", System.Data.SqlDbType.VarChar)).Value = _stParam9;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param10", System.Data.SqlDbType.VarChar)).Value = _stParam10;
                vobCommd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@param11", System.Data.SqlDbType.VarChar)).Value = _stParam11;
                try
                {
                    if (vobConne.State == System.Data.ConnectionState.Closed) { vobConne.Open(); }
                    vobCommd.Connection = vobConne;
                    vobAdapt.MissingSchemaAction = System.Data.MissingSchemaAction.AddWithKey;
                    vobAdapt.Fill(vdsDatas, "param11");
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