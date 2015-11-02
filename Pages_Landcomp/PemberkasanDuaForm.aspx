<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="PemberkasanDuaForm.aspx.cs" Inherits="Pages_PemberkasanDuaForm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:HiddenField ID="namaFile" runat="server" />


<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>

<input type="hidden" id="hidMode" value="0" />
<input type="hidden" id="eksepsi" value="0" />


<h2>Finalisasi</h2>
    
    <hr class="style-four">

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">No Finalisasi</label>
            <div class="col-md-3"><asp:TextBox id="txtNoPemberkasanDua" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
            <label for="identitas" class="control-label col-md-2">No Penyimpanan</label>
            <div class="col-md-3"><asp:TextBox id="txtNoPenyimpanan" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">No Registrasi</label>
            <div class="col-md-3"><asp:TextBox id="txtNoRegistrasi" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">No PID</label>
            <div class="col-md-3"><asp:TextBox id="txtPID" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">No Negosiasi</label>
            <div class="col-md-3"><asp:TextBox id="txtNoNegosiasi" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">No Visum</label>
            <div class="col-md-3"><asp:TextBox id="txtNoVisum" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">No Pemberkasan</label>
            <div class="col-md-3"><asp:TextBox id="txtNoPemberkasanSatu" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">No Pembayaran</label>
            <div class="col-md-3"><asp:TextBox id="txtNoPembayaran" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <br /><hr />

    <h4>Proses Pembayaran</h4><br />

    <div role="form" class="form-horizontal">
        <div class="form-group">            
            <div class="col-md-3"><asp:DropDownList ID="ddProsesPembayaran" class="form-control input-md" runat="server"></asp:DropDownList></div>
            <label for="identitas" class="control-label col-md-1">Keterangan</label>
            <div class="col-md-3"><asp:TextBox id="txtKeteranganPembayaran" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" runat="server" /></div>
                    <div class="col-md-3">
            <asp:Label runat="server" ID="Label1" Style="display: none;"><img align="absmiddle" alt="" src="../images/uploading.gif"/></asp:Label>
                <asp:AjaxFileUpload ID="FilePembayaran" runat="server"
                    onuploadcomplete="AjaxFileUploadFinal_UploadComplete" 
                    ThrobberID="myThrobber" 
                    MaximumNumberOfFiles="8" 
                    AllowedFileTypes="jpg,jpeg,png,pdf,doc,docx,xls,xlxs,txt,zip,rar,7z"
                    OnClientUploadComplete="onClientUploadCompleteFinal"
                    ViewStateMode="Inherit"/>
            </div>
        </div>
          
        </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:100%; height:130px;">
                <div id="gridPerolehanLahan" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Keterangan</label>
            <div class="col-md-3"><asp:TextBox id="txtKeterangan" type="text" runat="server" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" placeholder= "..." /></div>
        </div>
    </div>

    <%if (groups.ToString() != "1")
    { %>        
            <%if (except.ToString() != "1")
            { %> 
            <div class="hidden">
            <%}%>

    <%}%> 

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="LEksepsi" runat="server"  for="identitas" class="control-label col-md-2"  Text="Eksepsi" Font-Bold="True"></asp:Label>
            <div class="col-md-3"><asp:CheckBox ID="chkEksepsi" runat="server" CssClass="form-control checkbox-md" Text="Ya"  onclick="validasi()" /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="LKEksepsi" runat="server"  for="identitas" class="control-label col-md-2"  Text="Keterangan eksepsi" Font-Bold="True"></asp:Label>
            <div class="col-md-3"> <asp:TextBox id="txtKetEksepsi" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" runat="server" /></div>
        </div>
    </div>

    <%if (groups.ToString() != "1")
    { %>        
            <%if (except.ToString() != "1")
            { %> 
            </div>
            <%}%>

    <%}%> 

    <%if (groups.ToString() != "1")
    { %>        
            <%if (lanjut.ToString() != "1")
            { %> 
            <div class="hidden">
            <%}%>

    <%}%>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="LSelesai" runat="server"  for="identitas" class="control-label col-md-2"  Text="Selesai" Font-Bold="True"></asp:Label>
            <div class="col-md-3"><asp:DropDownList ID="ddLSelesai" runat="server" class="form-control input-md">
                </asp:DropDownList></div>
        </div>
    </div>

    <%if (groups.ToString() != "1")
    { %>        
            <%if (lanjut.ToString() != "1")
            { %> 
            </div>
            <%}%>

    <%}%>

    <br /><hr />

    <div class="form-group">
            <div class="col-md-10">
                <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default" onclick="btnClick(this)" />
                <input type="button" id="btnSave" value="Save"  class="btn btn-lg btn-success" onclick="btnClick(this)" />
            </div>
    </div>


    <%--Footer Awal--%>
     <footer class="site-footer">
          <div class="text-center">
              2015 - Aplikasi Almis
              <a href="#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
    <%--Footer Akhir--%>

<script type="text/javascript">

    var localURL = "PemberkasanDuaForm.aspx";
    var newUrl = "PemberkasanDuaList.aspx";
    var txtNoPemberkasanDua = document.getElementById("<%= txtNoPemberkasanDua.ClientID %>");
    var txtNoPenyimpanan = document.getElementById("<%= txtNoPenyimpanan.ClientID %>");
    var txtNoRegistrasi = document.getElementById("<%= txtNoRegistrasi.ClientID %>");
    var txtPID = document.getElementById("<%= txtPID.ClientID %>");
    var txtNoNegosiasi = document.getElementById("<%= txtNoNegosiasi.ClientID %>");
    var txtNoVisum = document.getElementById("<%= txtNoVisum.ClientID %>");
    var txtNoPemberkasanSatu = document.getElementById("<%= txtNoPemberkasanSatu.ClientID %>");
    var txtNoPembayaran = document.getElementById("<%= txtNoPembayaran.ClientID %>");

    var ddProsesPembayaran = document.getElementById("<%= ddProsesPembayaran.ClientID %>");
    var txtKeteranganPembayaran = document.getElementById("<%= txtKeteranganPembayaran.ClientID %>");
    var FilePembayaran = document.getElementById("<%= FilePembayaran.ClientID %>");

    var txtKeterangan = document.getElementById("<%= txtKeterangan.ClientID %>");
    var ddLSelesai = document.getElementById("<%= ddLSelesai.ClientID %>");
    var chkEksepsi = document.getElementById("<%= chkEksepsi.ClientID %>");
    var txtKetEksepsi = document.getElementById("<%= txtKetEksepsi.ClientID %>");
    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");
    var btnDelete = document.getElementById("btnDelete");
    var hidMode = document.getElementById('hidMode');

   

    function validasi() {
        if (document.getElementById("<%= chkEksepsi.ClientID %>").checked) {
            eksepsi.value = '1';
        } else {
            eksepsi.value = '0';
        }
    }
 
    listPerolehanLahan();

    terimaURL();

    function terimaURL() {

        var url = window.location.toString();
        //ambil bagian parameternya
        url.match(/\?(.+)$/);
        var params = RegExp.$1;
        // pisahkan parameter URL ke associative array
        var params = '&' + params;
        splitparam(params);
    }

    function splitparam(loader) {

        var a = loader;
        //lockPengukuran();
        if (a != '0') {
            var b = new Array();
            b = a.split('&');

        }
        //alert(b[2].replace("param1=", ""));

        ReloadDetail(b[3].replace("param2=", ""));

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=V"
			+ "&param1=V"
			+ "&param2=" + b[3].replace("param2=", "")
			+ "";

        // alert(s);
        dhtmlxAjax.post(localURL, s, bindFormPemberkasanDua);

        var x = b[2].replace("param1=", "");
        //alert(x);

        if (x == 'V') {
            lockPemberkasanDuaView();

        }

        else if (x == 'D') {
            lockPemberkasanDuaDelete();
            btnSave.value = 'Delete';
            hidMode.value = 'D';
        }
        else if (x == 'E') {
            lockPemberkasanDuaEdit();
            btnSave.value = 'Save';
            hidMode.value = 'E';


        }

    }
    function btnClick(objBtn) {
        switch (objBtn.value) {
            case "Save":
                //alert(hidMode.value);

                Edit(hidMode.value)
                break;

            case "Delete":
//                alert(hidMode.value);
                if (confirm("Hapus Data Ini?"))
                    Delete(hidMode.value);
                break;

            case "Cancel":
                close();
                break;

            default:
                break;
        }
    }

    function Delete() {

        var url = window.location.toString();
        //ambil bagian parameternya
        url.match(/\?(.+)$/);
        var params = RegExp.$1;
        // pisahkan parameter URL ke associative array
        var params = '&' + params;

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=D"
			+ params
			+ "";

        // alert(s);
        dhtmlxAjax.post(localURL, s, outputResponse);

    }

    function outputResponse(loader) {
        //alert(loader.xmlDoc.responseText);
        //document.getElementById('debug').value = loader.xmlDoc.responseText;
        var a = loader.xmlDoc.responseText;
        if (a != '') {
            var b = new Array();
            b = a.split('|');
        }
        switch (b[0]) {
            case "E":
                alert("Data Berhasil Di Edit");
                //                window.location.replace(newUrl);
                close();
                break;
            case "D":
                alert("Data Berhasil Di Delete");
                //                window.location.replace(newUrl);
                close();
                break;
            case "nodelete":
                alert("Data Finalisasi Tidak Dapat Di Hapus Karena Status Sudah Selesai ");
                //                window.location.replace(newUrl);
                close();
                break;
            case "noedit":
                alert("Data Finalisasi Tidak Dapat Di Edit Karena Status Sudah Selesai");
                //                window.location.replace(newUrl);
                close();
                break;
            case "gagal":
                alert("Data Finalisasi Gagal Disimpan");
                //                window.location.replace(newUrl);
                close();
                break;
            default:
                break;
        }
        //        fillGrid();
        //        fillGrid2();
        //        lock();
        //        clear();
        //        lockTeknik();
        //        clearTeknik();
    }

    function Edit(tipe) {
        var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=" + tipe.replace("param1=", "")
                + "&param2=" + txtNoPemberkasanDua.value
                + "&param3="
                + "&param4=" + txtNoRegistrasi.value
                + "&param5=" + txtPID.value
                + "&param6=" + txtNoNegosiasi.value
                + "&param7=" + txtNoVisum.value
                + "&param8=" + txtNoPemberkasanSatu.value
                
                + "&param9=" + txtNoPembayaran.value
                + "&param10=" + txtNoPembayaran.value
                + "&param11=" + txtKeterangan.value
                + "&param12=" + ddLSelesai.value
                + "&param13=" + eksepsi.value
                + "&param14=" + txtKetEksepsi.value
                + "&param15=" 

                + "&param16=" 
                + "&param17="
     



        dhtmlxAjax.post(localURL, s, outputResponse);
        //        if (autorisasi.value.indexOf("A") == -1)
        //            btnAdd.disabled = true;
        //        else if (autorisasi.value.indexOf("A") != -1)
        //            btnAdd.disabled = false;
    }

    function Delete(tipe) {
        var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=" + tipe.replace("param1=", "")
                + "&param2=" + txtNoPemberkasanDua.value
                + "&param3="
                + "&param4=" + txtNoRegistrasi.value
                + "&param5=" + txtPID.value
                + "&param6=" + txtNoNegosiasi.value
                + "&param7=" + txtNoVisum.value
                + "&param8=" + txtNoPemberkasanSatu.value

                + "&param9=" + txtNoPembayaran.value
                + "&param10=" + txtNoPembayaran.value
                + "&param11=" + txtKeterangan.value
                + "&param12=" + ddLSelesai.value
                + "&param13=" + eksepsi.value
                + "&param14=" + txtKetEksepsi.value
                + "&param15="

                + "&param16="
                + "&param17="




        dhtmlxAjax.post(localURL, s, outputResponse);
        //        if (autorisasi.value.indexOf("A") == -1)
        //            btnAdd.disabled = true;
        //        else if (autorisasi.value.indexOf("A") != -1)
        //            btnAdd.disabled = false;
    }

    // bind
    function bindFormPemberkasanDua(loader) {
        //alert(loader.xmlDoc.responseText);
        var a = loader.xmlDoc.responseText;
        //lockPemberkasanDuaView();
        if (a != '0') {
            var b = new Array();
            b = a.split('|');
            txtNoPemberkasanDua.value = b[0];
            txtNoPenyimpanan.value = b[1];
            txtNoRegistrasi.value = b[2];
            txtPID.value = b[3];
            txtNoNegosiasi.value = b[4];
            txtNoVisum.value = b[5];
            txtNoPemberkasanSatu.value = b[6];
            txtNoPembayaran.value = b[7];

//            ddProsesPembayaran.value = b[8];
//            txtKeteranganPembayaran.value = b[9];
//            FilePembayaran.value = b[10];

            txtKeterangan.value = b[8];
            ddLSelesai.value = b[9];
            if (b[10] == 1) {
                chkEksepsi.checked = b[10];
            }
            txtKetEksepsi.value = b[11];
        }
    }


   

    function lockPemberkasanDuaView() {
        txtNoPemberkasanDua.disabled = true;
        txtNoPenyimpanan.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtPID.disabled = true;
        txtNoNegosiasi.disabled = true;
        txtNoVisum.disabled = true;
        txtNoPemberkasanSatu.disabled = true;
        txtNoPembayaran.disabled = true;
        txtKeterangan.disabled = true;
        chkEksepsi.disabled = true;
        txtKetEksepsi.disabled = true
        ddProsesPembayaran.disabled = true
        txtKeterangan.disabled = true
        FilePembayaran.disabled = true
        chkEksepsi.disabled = true
        ddLSelesai.disabled = true
        document.getElementById('btnSave').style.visibility = 'hidden';
      
    }

    function lockPemberkasanDuaEdit() {
        txtNoPemberkasanDua.disabled = true;
        txtNoPenyimpanan.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtPID.disabled = true;
        txtNoNegosiasi.disabled = true;
        txtNoVisum.disabled = true;
        txtNoPemberkasanSatu.disabled = true;
        txtNoPembayaran.disabled = true;
    }

    function lockPemberkasanDuaDelete() {
        txtNoPemberkasanDua.disabled = true;
        txtNoPenyimpanan.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtPID.disabled = true;
        txtNoNegosiasi.disabled = true;
        txtNoVisum.disabled = true;
        txtNoPemberkasanSatu.disabled = true;
        txtNoPembayaran.disabled = true;
        txtKeterangan.disabled = true;
        chkEksepsi.disabled = true;
        txtKetEksepsi.disabled = true
        ddProsesPembayaran.disabled = true
        txtKeterangan.disabled = true
        FilePembayaran.disabled = true
        chkEksepsi.disabled = true
        ddLSelesai.disabled = true
    }

    function listPerolehanLahan() {
        listPerolehanLahan = new dhtmlXGridObject('gridPerolehanLahan');
        listPerolehanLahan.setImagePath("../JavaScript/codebase/imgs/");
        listPerolehanLahan.setHeader("No, PerolehanLahan,Keterangan,File,Action");
        listPerolehanLahan.setInitWidths("40,282,282,282,155");
        listPerolehanLahan.setColAlign("left,left,left,left,left");
        listPerolehanLahan.setColTypes("ro,ro,ro,ro,link");
        listPerolehanLahan.init();
        listPerolehanLahan.setSkin("dhx_skyblue");
        listPerolehanLahan.setPagingSkin("bricks");
        listPerolehanLahan.setColSorting("str,str,str,str,str");
    }

    function onClientUploadCompleteFinal(sender, e) {
        document.getElementById('<%=namaFile.ClientID %>').value = e.get_postedUrl();
        ReloadFinal(document.getElementById('<%=txtNoPemberkasanDua.ClientID %>').value, document.getElementById('<%=namaFile.ClientID %>').value, document.getElementById('<%=txtKeteranganPembayaran.ClientID %>').value);
        alert('Data Berasil diUpload');
    }


    function ReloadFinal(id, nama, ket) {

        SaveFinal(id, nama, ket);

        var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=DOCpic"
			    + "&IDFinal=" + txtNoPemberkasanDua.value
			    + "&param1=L"

			    + "";
        centerLoadingImage();
        listPerolehanLahan.clearAll();
        listPerolehanLahan.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }

    function SaveFinal(id, nama, ket) {
        var a = nama;
        //alert(a);
        if (a != '') {
            var b = new Array();
            b = a.split('|');
        }
        //        alert(b[0]);
        var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=SavePic"
			    + "&IDFinal=" + txtNoPemberkasanDua.value
			    + "&NAMA=" + b[0]
			    + "&KETERANGAN=" + ket
			    + "&NOMOR=" + b[1]
                + "&user=" + b[2]
			    + "&wilay=" + b[3]
			    + "&param1=I"
			    + "&param5=" + ddProsesPembayaran.value
			    + "";
+"";
        centerLoadingImage();
        listPerolehanLahan.clearAll();
        listPerolehanLahan.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }

    function ReloadDetail(nomorBayar) {


        var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=DOCpic"
			    + "&IDFinal=" + nomorBayar
			    + "&param1=LD"

			    + "";
        centerLoadingImage();
        listPerolehanLahan.clearAll();
        listPerolehanLahan.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }


</script>



</asp:Content>

