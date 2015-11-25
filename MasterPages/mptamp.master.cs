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

public partial class MasterPages_mptamp : System.Web.UI.MasterPage
{

    protected String userid = "";
    protected String namass = "";
    protected String groups = "";
    protected String lanjut = "";
    protected String excepts = "";

    protected String modul = "";

    protected String praregistrasi = ""; //0
    protected String PengecekanLapangan = ""; //1
    protected String Registrasi = ""; //2
    protected String PengukuranT0 = ""; //3
    protected String Verifikasi = ""; //4
    protected String Negosiasi = ""; //5
    protected String Pemberkasan = ""; //6
    protected String Pembayaran = ""; //7
    protected String Finalisasi = ""; //8
    protected String GroupManagement = ""; //9
    protected String UserManagement = ""; //10
    protected String MasterIdentitas = ""; //11
    protected String MasterPerusahaan = ""; //12
    protected String MasterCodes = ""; //13
    protected String MasterMenu = ""; //14
    protected String SerahTerimaBerkas = ""; //15
    protected String TopPriority = ""; //16
    protected String FiveYears = ""; //17
    protected String LOM = ""; //18
    protected String Other = ""; //19
    protected String ReportPraRegistrasi = ""; //20
    protected String ReportPengecekanLapangan = ""; //21
    protected String ReportRegistrasi = ""; //22
    protected String ReportPengukuranT0 = ""; //23
    protected String ReportNegosiasi = ""; //24
    protected String ReportVerifikasi = ""; //25
    protected String ReportFinalisasi = ""; //26
    protected String ClaimUser = ""; //27
    protected String PersiapanDokumen = ""; //28
    protected String VerifikasiDokumen = ""; //29
    protected String Legal = ""; //30
    protected String MapAI = ""; //31
    protected String MapBC = ""; //32
    protected String MapMIP = ""; //33

    protected String Persiapan = ""; //34
    protected String ProsesPengurusan = ""; //35
    protected String ProsesIzinLokasi = ""; //36
    protected String Pelaporan = ""; //37

    protected String ProsesLandManagement = ""; //38
    protected String PersiapanInternal = ""; //39
    protected String TahapanProsesBPN = ""; //40
    protected String TahapanPerolehanProduk = ""; //41

    protected String LandComplainceModul = ""; //42

    protected String KelasLahan = ""; //43

    protected String LandSecure = ""; //44
    protected String LandUse = ""; //45
    
    
            

    DataTable dt;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] is object)
        {
            userid = Session["userid"].ToString();
            groups = Session["groups"].ToString();

            if (Session["namass"] is object)
            {

                lblnm.Text = Session["namass"].ToString();
                lbljb.Text = Session["groupNm"].ToString();
            }

            

        }

        if (!(Session["userid"] is object))
        {
            Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
            Response.Write("alert('Session sudah habis. Silakan login kembali.');");
            Response.Write("location.href = '../login.aspx';");
            Response.Write("</script>");
        }

        HakAkses();

    }

    private void HakAkses()
    {

        //Response.ContentType = "text/plain";

        ALMIS.ExecuteSTP eSTP = new ALMIS.ExecuteSTP();
        eSTP.Datas();
        DataSet ds = new DataSet();

        ds = eSTP.List8("P_MENU", "CHM", "", groups, "", "", "", "", "");

        dt = ds.Tables[0];

        //Response.ContentType = "text/plain";

        for (int i = 0; i < dt.Rows.Count; i++)
        {

            // Kondisi Untuk Landcomp
            if (dt.Rows[i]["NamMod"].ToString() == "Pra Registrasi")
            {

                praregistrasi = dt.Rows[i]["VIEWXXX"].ToString();
                ReportPraRegistrasi = dt.Rows[i]["REPORTX"].ToString();
            }

            if (dt.Rows[i]["NamMod"].ToString() == "Pengecekan Lapangan")
            {

                PengecekanLapangan = dt.Rows[i]["VIEWXXX"].ToString();
                ReportPengecekanLapangan = dt.Rows[i]["REPORTX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "Registrasi")
            {

                Registrasi = dt.Rows[i]["VIEWXXX"].ToString();
                ReportRegistrasi = dt.Rows[i]["REPORTX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "Pengukuran T0")
            {

                PengukuranT0 = dt.Rows[i]["VIEWXXX"].ToString();
                ReportPengukuranT0 = dt.Rows[i]["REPORTX"].ToString();
            }

            if (dt.Rows[i]["NamMod"].ToString() == "Verifikasi")
            {

                Verifikasi = dt.Rows[i]["VIEWXXX"].ToString();
                ReportVerifikasi = dt.Rows[i]["REPORTX"].ToString();
            }

            if (dt.Rows[i]["NamMod"].ToString() == "Negosiasi")
            {

                Negosiasi = dt.Rows[i]["VIEWXXX"].ToString();
                ReportNegosiasi = dt.Rows[i]["REPORTX"].ToString();
            }

            if (dt.Rows[i]["NamMod"].ToString() == "Pemberkasan")
            {

                Pemberkasan = dt.Rows[i]["VIEWXXX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "Pembayaran")
            {

                Pembayaran = dt.Rows[i]["VIEWXXX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "Finalisasi")
            {

                Finalisasi = dt.Rows[i]["VIEWXXX"].ToString();
                ReportFinalisasi = dt.Rows[i]["REPORTX"].ToString(); 
            }

            if (dt.Rows[i]["NamMod"].ToString() == "Serah Terima Berkas")
            {

                SerahTerimaBerkas = dt.Rows[i]["VIEWXXX"].ToString();

            }

            // Kondisi Untuk Admins Tools

            if (dt.Rows[i]["NamMod"].ToString() == "Master Identitas")
            {

                MasterIdentitas = dt.Rows[i]["VIEWXXX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "User Management")
            {

                UserManagement = dt.Rows[i]["VIEWXXX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "Group Management")
            {

                GroupManagement = dt.Rows[i]["VIEWXXX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "Master Menu")
            {

                MasterMenu = dt.Rows[i]["VIEWXXX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "Master Codes")
            {

                MasterCodes = dt.Rows[i]["VIEWXXX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "Master Perusahaan")
            {

                MasterPerusahaan = dt.Rows[i]["VIEWXXX"].ToString();

            }

            // Kondisi Untuk Land Litigation

            if (dt.Rows[i]["NamMod"].ToString() == "Claim User")
            {

                ClaimUser = dt.Rows[i]["VIEWXXX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "Persiapan Dokumen")
            {

                PersiapanDokumen = dt.Rows[i]["VIEWXXX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "Verifikasi Dokumen")
            {

                VerifikasiDokumen = dt.Rows[i]["VIEWXXX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "Legal")
            {

                Legal = dt.Rows[i]["VIEWXXX"].ToString();

            }

            // Kondisi Untuk Map Landcomp

            if (dt.Rows[i]["NamMod"].ToString() == "Top Priority")
            {

                TopPriority = dt.Rows[i]["VIEWXXX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "Five Years")
            {

                FiveYears = dt.Rows[i]["VIEWXXX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "LOM")
            {

                LOM = dt.Rows[i]["VIEWXXX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "Other")
            {

                Other = dt.Rows[i]["VIEWXXX"].ToString();

            }

            // Kondisi Untuk Map

            if (dt.Rows[i]["NamMod"].ToString() == "Map AI")
            {

                MapAI = dt.Rows[i]["VIEWXXX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "Map BC")
            {

                MapBC = dt.Rows[i]["VIEWXXX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "Map MIP")
            {

                MapMIP = dt.Rows[i]["VIEWXXX"].ToString();

            }

            // Kondisi Izin Lokasi

            if (dt.Rows[i]["NamMod"].ToString() == "Persiapan")
            {

                Persiapan = dt.Rows[i]["VIEWXXX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "Proses Pengurusan")
            {

                ProsesPengurusan = dt.Rows[i]["VIEWXXX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "Proses Izin Lokasi")
            {

                ProsesIzinLokasi = dt.Rows[i]["VIEWXXX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "Pelaporan")
            {

                Pelaporan = dt.Rows[i]["VIEWXXX"].ToString();

            }

            // Kondisi Land Sertification

            if (dt.Rows[i]["NamMod"].ToString() == "Proses Land Management")
            {

                ProsesLandManagement = dt.Rows[i]["VIEWXXX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "Persiapan Internal")
            {

                PersiapanInternal = dt.Rows[i]["VIEWXXX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "Tahapan Proses BPN")
            {

                TahapanProsesBPN = dt.Rows[i]["VIEWXXX"].ToString();

            }

            if (dt.Rows[i]["NamMod"].ToString() == "Tahapan Perolehan Produk")
            {

                TahapanPerolehanProduk = dt.Rows[i]["VIEWXXX"].ToString();

            }


            // Kondisi Land Complaince
            if (dt.Rows[i]["NamMod"].ToString() == "Land Complaince Modul")
            {

                LandComplainceModul = dt.Rows[i]["VIEWXXX"].ToString();

            }

            // Kondisi Land Utilization
            if (dt.Rows[i]["NamMod"].ToString() == "Kelas Lahan")
            {

                KelasLahan = dt.Rows[i]["VIEWXXX"].ToString();

            }
   
            // Kondisi Land Land Secure
            if (dt.Rows[i]["NamMod"].ToString() == "Land Secure")
            {

                LandSecure = dt.Rows[i]["VIEWXXX"].ToString();

            }   
       
            // Kondisi Land Use
            if (dt.Rows[i]["NamMod"].ToString() == "Land Use")
            {

                LandUse = dt.Rows[i]["VIEWXXX"].ToString();

            }   
              
                
    

        }


        dt.Dispose();

        //Response.End();

    }
}
