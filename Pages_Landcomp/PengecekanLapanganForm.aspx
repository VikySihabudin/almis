<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="PengecekanLapanganForm.aspx.cs" Inherits="Pages_PengecekanLapanganForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<asp:HiddenField ID="namaFile" runat="server" />


<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>

<input type="hidden" id="hidMode" value="0" />
<input type="hidden" id="eksepsi" value="0" />




<h1>Pengecekan Lapangan</h1>
	
	<hr />    

    
	<div role="form" class="form-horizontal" action="#">



		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Nama Perusahaan</label>
            <div class="col-md-3"> 
                <asp:DropDownList ID="ddprs" runat="server" class="form-control">
                </asp:DropDownList>
            </div>
        </div>


        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor PL</label>
            <div class="col-md-3"><asp:TextBox id="txtNoPL" type="text" runat="server" class="form-control input-md" /></div>			
            <label for="nama" class="control-label col-md-3">Tanggal Jadwal Pengecekan Lapangan</label>
            <div class="col-md-3">
            <asp:TextBox id="txtTgljadwalPengukuran" type="text" runat="server" class="form-control input-md" />
            </div>
        </div>

        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Tanggal Pengecekan Lapangan</label>
            <div class="col-md-3"><asp:TextBox id="txtTglPengukuran" class="form-control input-md" type="text" runat="server" /></div>			
        </div>

        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor PR</label>
            <div class="col-md-3"><asp:TextBox id="txtNoPR" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>			
        </div>

        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nama Penjual</label>
            <div class="col-md-3"><asp:TextBox id="txtNamaPenjual" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>			
        </div>

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Lokasi Tanah</label>
            <div class="col-md-3">
               <%--<asp:TextBox id="ddKabupaten" type="text" runat="server" class="form-control input-md" />--%>
               <asp:DropDownList ID="ddKabupaten" type="text" runat="server" class="form-control input-md"></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddKecamatan" runat="server" class="form-control input-md"></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddDesa" runat="server" class="form-control input-md"></asp:DropDownList>
            </div>
        </div>
        </div>

        <hr />

    <div role="form" class="form-horizontal">
        <div id="shp" class="form-group">            
            <div class="col-md-4"><asp:DropDownList ID="ddJenis" class="form-control input-md" runat="server"></asp:DropDownList></div>
            <asp:Label ID="LLketerangan" for="identitas"  class="control-label col-md-2" runat="server" Text="Keterangan" Font-Bold="True"></asp:Label>
            <%--<label for="identitas" class="control-label col-md-1" id="lblketerangan">Keterangan</label>--%>
            <div class="col-md-3"><asp:TextBox id="txtKeteranganJenis" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" runat="server" /></div>
                    <div class="col-md-3">
            <asp:Label runat="server" ID="Label1" Style="display: none;"><img align="absmiddle" alt="" src="../images/uploading.gif"/></asp:Label>
                <asp:AjaxFileUpload ID="FilePengecekan" runat="server"
                    onuploadcomplete="AjaxFileUploadPengecekan_UploadComplete" 
                    ThrobberID="myThrobber" 
                    MaximumNumberOfFiles="8" 
                    AllowedFileTypes="jpg,jpeg,png,pdf,doc,docx,xls,xlxs,txt,zip,rar,7z"
                    OnClientUploadComplete="onClientUploadCompletePengecekan"
                    ViewStateMode="Inherit"/>
            </div>
        </div>
          
        </div>
    </div>

        <br />

        <div role="form" class="form-horizontal">
        <div class="form-group">            
            <div class="col-md-12">
                
            </div>
            
        </div>
        </div>

       <div class="form-group">
            <div class="col-md-11">
            <div style=" width:100%; height:130px;">
                <div id="gridUpload" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div> 
            </div>
            </div>
        </div>
        
        <div class="form-group">            
            <div class="col-md-8">

                <div id="map" >
                <div id="addshp">
              <div enctype="multipart/form-data" method="post" id="uploadForm">
              <div class="field">
                  <label class="file-upload">
                      <span><strong>Add SHP To Map</strong></span>
                      <!--input type="file" name="file" id="inFile" /-->
                      <input type="file" name="file" id="inFile" />
                  </label>
              </div>
              </div>
             
              <span class="file-upload-status" style="opacity:1;" id="upload-status"></span>
              <div id="fileInfo"> </div>
        </div></div> 
            </div>

            <div class="col-md-4">
                <div id="cari"> 
                    Parcel ID: <input type="text" id="pid" value=" " />      
                    <button id="search" data-dojo-type="dijit.form.Button" type="button" data-dojo-attach-point="button" class="btn btn-sm btn-success">Cari       
                    </button>
                </div>
                <div id="gris">
                    <table height="22em" width="100%" data-dojo-type="dojox/grid/DataGrid" data-dojo-id="grid"  id="grid" data-dojo-props="rowsPerPage:'5', rowSelector:'20px'">
                    <thead>
                    <tr>
                        <th field="PID">Parcel ID</th>
                        <th field="Status_Lhn" >Status</th>
                        <th field="Nama">Nama</th>
                        <th field="Desa">Desa</th>
                        <th field="Registrasi" >Registrasi</th>
                    </tr>
                    </thead>
                    </table>
                </div>
                 
            </div>
        </div>

    <%if (groups.ToString() != "1")
    { %>        
            <%if (lanjut.ToString() != "1")
            { %> 
            <div class="hidden">
            <%}%>

    <%}%>
        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label ID="LLanjut" for="identitas"  class="control-label col-md-2" runat="server" Text="Lanjut" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
                <asp:DropDownList ID="ddLanjut" runat="server" class="form-control input-md"></asp:DropDownList>
            </div>
        </div>
        </div>

    <%if (groups.ToString() != "1")
    { %>        
            <%if (lanjut.ToString() != "1")
            { %> 
                </div>
            <%}%>

    <%}%>


    <%if (groups.ToString() != "1")
    { %>        
            <%if (except.ToString() != "1")
            { %> 
            <div class="hidden">
            <%}%>

    <%}%>


        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label ID="LEksepsi" for="identitas"  class="control-label col-md-2" runat="server" Text="Ekspesi" Font-Bold="True"></asp:Label>
            <div class="col-md-3"><asp:CheckBox ID="cbEksepsi" CssClass="form-control checkbox-md" runat="server" onclick="validasi()" /> </div>
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
            <%if (except.ToString() != "1")
            { %> 
            <div class="hidden">
            <%}%>

    <%}%>

        <div role="form" class="form-horizontal">
        <div class="form-group">
        <asp:Label ID="LKEksepsi" for="identitas"  class="control-label col-md-2" runat="server" Text="Keterangan Ekspesi" Font-Bold="True"></asp:Label>
            <div class="col-md-3"><asp:TextBox id="txtKetEksepsi" TextMode="multiline" Columns="15" Rows="3" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
        </div>

    <%if (groups.ToString() != "1")
    { %>        
            <%if (except.ToString() != "1")
            { %> 
            </div>
            <%}%>

    <%}%>

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Keterangan</label>
            <div class="col-md-3"><asp:TextBox id="txtKeterangan" TextMode="multiline" Columns="15" Rows="3" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
        </div>

         <br /><hr />
         
    <div class="form-group">
            <div class="col-md-10">

                <%--<center><asp:CheckBox id="cbTest" CssClass="form-control checkbox-md" runat="server" />           --%>  
                     <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default"  onclick="btnClick(this)" /> 
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



           <%--ESRI JS--%>
    <link href="../JavaScript/webgis/js/313/dijit/themes/claro/claro.css" rel="stylesheet" type="text/css" />
    <link href="../JavaScript/webgis/js/313/dojox/grid/resources/Grid.css" rel="stylesheet" type="text/css" />
    <link href="../JavaScript/webgis/js/313/dojox/grid/resources/claroGrid.css" rel="stylesheet" type="text/css" />
    <link href="../JavaScript/webgis/js/313/esri/css/esri.css" rel="stylesheet" type="text/css" />
    <link href="../JavaScript/webgis/css/layout.css" rel="stylesheet" type="text/css" />
    
    <script src="../JavaScript/webgis/js/313/init.js" type="text/javascript" ></script>
    <script src="../JavaScript/webgis/adaro.js" type="text/javascript" ></script>
    <script src="../JavaScript/webgis/js/313/upclick-min.js" type="text/javascript" ></script>

<script type="text/javascript">

    $(function txtTglPengukuran() {
        $("[id$=txtTglPengukuran]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

//    $(function txtTgljadwalPengukuran() {
//        $("[id$=txtTgljadwalPengukuran]").datepicker({
//            dateFormat: "yy-mm-dd",
//            showOn: 'button',
//            buttonImageOnly: true,
//            buttonImage: "../img/calender.png"
//        });
//    });

</script>

<script type="text/javascript">

    var localURL = "PengecekanLapanganForm.aspx";
    var newUrl = "PengecekanLapanganList.aspx";
    var txtNoPL = document.getElementById("<%= txtNoPL.ClientID %>");
    var txtTgljadwalPengukuran = document.getElementById("<%= txtTgljadwalPengukuran.ClientID %>");
    var txtTglPengukuran = document.getElementById("<%= txtTglPengukuran.ClientID %>");
    var txtNoPR = document.getElementById("<%= txtNoPR.ClientID %>");
    var txtNamaPenjual = document.getElementById("<%= txtNamaPenjual.ClientID %>");
    var ddKabupaten = document.getElementById("<%= ddKabupaten.ClientID %>");
    var ddKecamatan = document.getElementById("<%= ddKecamatan.ClientID %>");
    var ddDesa = document.getElementById("<%= ddDesa.ClientID %>");

    var ddLanjut = document.getElementById("<%= ddLanjut.ClientID %>");
    //    var cbEksepsi = document.getElementById("<%= cbEksepsi.ClientID %>").checked;
    var cbEksepsi = document.getElementById("<%= cbEksepsi.ClientID %>");
    var txtKetEksepsi = document.getElementById("<%= txtKetEksepsi.ClientID %>");
    var txtKeterangan = document.getElementById("<%= txtKeterangan.ClientID %>");
    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");

    var hidMode = document.getElementById('hidMode');

    var ddJenis = document.getElementById("<%= ddJenis.ClientID %>");
    var txtKeteranganJenis = document.getElementById("<%= txtKeteranganJenis.ClientID %>");
    var FilePengecekan = document.getElementById("<%= FilePengecekan.ClientID %>");
    var LLketerangan = document.getElementById("<%= LLketerangan.ClientID %>");
    
    var ddprs = document.getElementById("<%= ddprs.ClientID %>");

    //lockPengecekanLapangan();
    listUpload();
    terimaURL();
    // alert(terimaURL);
    

    function validasi() {
        if (document.getElementById("<%= cbEksepsi.ClientID %>").checked) {
            eksepsi.value = '1';
        } else {
            eksepsi.value = '0';
        }
    }

    function terimaURL() {

        var url = window.location.toString();
        //ambil bagian parameternya
        url.match(/\?(.+)$/);
        var params = RegExp.$1;
        // pisahkan parameter URL ke associative array
        var params = '&' + params;


        splitparam(params);


        //alert(params);
    }

    function splitparam(loader) {
        var a = loader;
        if (a != '0') {
            var b = new Array();
            b = a.split('&');
            //alert(b);
        }

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=V"
			+ "&param1=V"
			+ "&param2=" + b[3].replace("param2=", "")
			+ "";

//        alert(b[3].replace("param2=", ""));
//       reload detail
        //ReloadDetail(b[3].replace("param2=", ""));



        dhtmlxAjax.post(localURL, s, bindFormPengecekanLapangan);

        var x = b[2].replace("param1=", "");

        if (x == 'V') {
            lockPengecekanLapanganView();
        }

        else if (x == 'D') {
            lockPengecekanLapanganDelete();
            btnSave.value = 'Delete';
            hidMode.value = 'D';
        }
        else if (x == 'E') {
            lockPengecekanLapanganEdit();
            btnSave.value = 'Save';
            hidMode.value = 'E';
        }
    }

    function Delete() {
        
        if (txtNoPL.value == '')
            alert("data tidak bisa di hapus karena nomor ID kosong");
        else {

            var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=D"
                + "&param2=" + txtNoPL.value
                + "&param3="

            //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }
        //BACKUP
//        var s = ""
//                + "rnd=" + Math.random() * 4
//			    + "&sm=CRUD"
//                + "&param1=D"
//                + "&param2=" + txtNoPL.value
//                + "&param3="

//        //alert(s);
//        dhtmlxAjax.post(localURL, s, outputResponse);
    }

    //alert(hidMode.value);

    function btnClick(objBtn) {
        switch (objBtn.value) {
            case "Save":
//                alert(hidMode.value);
//                alert(objBtn.value);
                Edit(hidMode.value)
                break;
            //alert(hidMode.value);
            case "Delete":
                if (txtNoPL.value == '')
                    alert("data tidak bisa di hapus karena nomor ID kosong");
                else {
                    if (objBtn.id == 'btnSave') {
                        if (confirm("Hapus Data Ini?"))
                            Delete(hidMode.value);
                    }
                }
                break;

                //BACKUP
//                if (objBtn.id == 'btnSave') {
//                    if (confirm("Hapus Data Ini?"))
//                        Delete(hidMode.value);
//                }
//                break;


            case "Cancel":
                close();
                //window.location.replace(newUrl);
                break;

            default:
                break;
        }
    }

    function Edit(tipe) {
        //alert(tipe);

        if (txtNoPL.value == '')
            alert("data tidak bisa di edit karena nomor ID kosong. Silahkan assignment terlebih dahulu");
        else {

            var s = ""
                        + "rnd=" + Math.random() * 4
			            + "&sm=CRUD"
                        + "&param1=" + tipe.replace("param1=", "")
                        + "&param2=" + txtNoPL.value
                        + "&param3="
                        + "&param4=" + txtTglPengukuran.value
                        + "&param5=" + txtTgljadwalPengukuran.value
                        + "&param6=" + txtNoPR.value
                        + "&param7=" + txtKeterangan.value
                        + "&param8=" + ddLanjut.value
                        + "&param9=" + eksepsi.value
                        + "&param10=" + txtKetEksepsi.value
                        + "&param11="
                        + "&param12="
                        + "&param13="
                        + "&param14=" + ddprs.value
                        + "";

            //  alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }
    }

    function outputResponse(loader) {

        var a = loader.xmlDoc.responseText;
        if (a != '') {
            var b = new Array();
            b = a.split('|');
        }
        switch (b[0]) {
            case "E":
                alert("Data Berhasil Di Edit");
                //window.location.replace(newUrl);
                close();
                break;
            case "D":
                alert("Data Berhasil Di Delete");
                //window.location.replace(newUrl);
                close();
                break;
            case "nodelete":
                alert("Data Pengukuran Lapangan Tidak Dapat Di Hapus Karena Sudah Dilakukan Registrasi");
                //window.location.replace(newUrl);
                close();
                break;
            case "noedit":
                alert("Data Pengukuran Lapangan Tidak Dapat Di Edit Karena Sudah Dilakukan Registrasi");
                //window.location.replace(newUrl);
                close();
                break;
            case "noadd":
                alert("Data Pengukuran Lapangan Tidak Dapat Di Assign Karena Sudah Dilakukan Registrasi");
                //window.location.replace(newUrl);
                close();
                break;
            case "gagal":
                alert("Data Pengukuran Lapangan Gagal Disimpan");
                //window.location.replace(newUrl);
                close();
                break;
            default:
                break;
        }
    }

    function lockPengecekanLapanganDelete() {
        txtNoPL.disabled = true;
        txtNoPR.disabled = true;
        txtNamaPenjual.disabled = true;
        txtTglPengukuran.disabled = true;
        txtTgljadwalPengukuran.disabled = true;
        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;
        ddLanjut.disabled = true;
        txtKetEksepsi.disabled = true;
        txtKeterangan.disabled = true;
        ddJenis.disabled = true;
        txtKeteranganJenis.disabled = true;
        FilePengecekan.disabled = true;
        ddprs.disabled = true;

    }

    function lockPengecekanLapanganView() {
        txtNoPL.disabled = true;
        txtNoPR.disabled = true;
        txtNamaPenjual.disabled = true;
        txtTglPengukuran.disabled = true;
        txtTgljadwalPengukuran.disabled = true;
        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;
        ddLanjut.disabled = true;
        cbEksepsi.disabled = true;
        txtKetEksepsi.disabled = true;
        txtKeterangan.disabled = true;
        document.getElementById('btnSave').style.visibility = 'hidden';
        ddJenis.disabled = true;
        txtKeteranganJenis.disabled = true;
        FilePengecekan.disabled = true;
        ddprs.disabled = true;

    }
    function lockPengecekanLapanganEdit() {

        txtNoPL.disabled = true;
        txtNoPR.disabled = true;
        txtNamaPenjual.disabled = true;
        txtTgljadwalPengukuran.disabled = true;
        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;

        txtKetEksepsi.disabled = false;
        txtKeterangan.disabled = false;
    }

    function bindFormPengecekanLapangan(loader) {
        //alert(loader.xmlDoc.responseText);
        var a = loader.xmlDoc.responseText;
        //lockPengecekanLapangan();
        if (a != '0') {
            var b = new Array();
            b = a.split('|');
            txtNoPL.value = b[0];
            txtTglPengukuran.value = b[2];
            txtTgljadwalPengukuran.value = b[3];
            txtNoPR.value = b[4];
            txtKeterangan.value = b[5];
            ddLanjut.value = b[6];
            if (b[7] == '1') {
                document.getElementById("<%= cbEksepsi.ClientID %>").checked = true;
                eksepsi.value = b[7];
            }
            txtKetEksepsi.value = b[8];
            ddKabupaten.value = b[13];
            ddKecamatan.value = b[14];
//            ddDesa.value = b[15];
            txtNamaPenjual.value = b[16];
            document.getElementById("<%= ddDesa.ClientID %>").value = b[15];
            ddprs.value = b[17];
            ReloadDetail(b[0]);
        }
    }

    function listUpload() {
        listUpload = new dhtmlXGridObject('gridUpload');
        listUpload.setImagePath("../JavaScript/codebase/imgs/");
        listUpload.setHeader("No,Jenis File,Keterangan, Nama File, Action");
        listUpload.setInitWidths("50,350,150,150,150");
        listUpload.setColAlign("left,left,left,left,left");
        listUpload.setColTypes("ro,ro,ro,ro,link");
        listUpload.init();
        listUpload.setSkin("dhx_skyblue");
        listUpload.setPagingSkin("bricks");
        listUpload.setColSorting("str,str,str,str,str");
    }

    function onClientUploadCompletePengecekan(sender, e) {
        document.getElementById('<%=namaFile.ClientID %>').value = e.get_postedUrl();
        ReloadPengecekan(document.getElementById('<%=txtNoPL.ClientID %>').value, document.getElementById('<%=namaFile.ClientID %>').value, document.getElementById('<%=txtKeteranganJenis.ClientID %>').value);
        alert('Data Berasil diUpload');
    }


    function ReloadPengecekan(id, nama, ket) {

        SavePengecekan(id, nama, ket);

        var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=DOCpic"
			    + "&IDPengecekan=" + txtNoPL.value
			    + "&param1=L"

			    + "";
        centerLoadingImage();
        listUpload.clearAll();
        listUpload.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }

    function SavePengecekan(id, nama, ket) {
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
			    + "&IDPengecekan=" + txtNoPL.value
			    + "&NAMA=" + b[0]
			    + "&KETERANGAN=" + ket
			    + "&NOMOR=" + b[1]
                + "&user=" + b[2]
			    + "&wilay=" + b[3]
			    + "&param1=I"
			    + "&param5=" + ddJenis.value
			    + "";
+"";
        centerLoadingImage();
        listUpload.clearAll();
        listUpload.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }

    function ReloadDetail(nomorBayar) {

//        alert(nomorBayar);
        var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=DOCpic"
			    + "&IDPengecekan=" + nomorBayar
			    + "&param1=LD"

			    + "";
        centerLoadingImage();
        listUpload.clearAll();
        listUpload.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }
</script>

</asp:Content>

