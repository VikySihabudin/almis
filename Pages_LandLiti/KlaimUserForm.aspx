<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="KlaimUserForm.aspx.cs" Inherits="Pages_LandLiti_KlaimUserForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />



<h1>Claim User</h1>
	
	<hr />  

    <br />
    
	<div role="form" class="form-horizontal">

        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nama Perusahaan</label>
            <div class="col-md-3">
                <asp:DropDownList ID="ddprs" runat="server" class="form-control">
                </asp:DropDownList>
            </div>			           
        </div>


        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Claim</label>
            <div class="col-md-3"><asp:TextBox ID="txtnoclain" class="form-control input-md" runat="server" ></asp:TextBox></div>			           
        </div>

        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Identitas</label>
            <div class="col-md-3"><asp:TextBox ID="txtNmrIdn" class="form-control input-md" runat="server" ></asp:TextBox></div>
			<div class="col-md-1">
                     <input type="button" id="btnCari" value="Search"  class="btn btn-md btn-success" onclick="OpenDialog()" />  
            </div>            
            			           
        </div>        

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Nama</label>
            <div class="col-md-3"><asp:TextBox ID="txtNama" class="form-control input-md" runat="server"></asp:TextBox></div>
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Alamat</label>
			<div class="col-md-3">
				<asp:TextBox id="txtAlamat" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>
        </div>
		
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Nomor Handphone</label>
            <div class="col-md-3"><asp:TextBox ID="txtNoHandphone" class="form-control input-md" runat="server" ></asp:TextBox></div>
        </div>
		
    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Lokasi Tanah</label>
            <div class="col-md-3">
                <asp:DropDownList ID="ddKabupaten" type="text" runat="server" class="form-control input-md" onchange="changeKabupaten(this.value)"></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddKecamatan" runat="server" class="form-control input-md" onchange="changeKecamatan(this.value)"></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddDesa" runat="server" class="form-control input-md"></asp:DropDownList>
            </div>
        </div>
    </div>

		
            <hr />

   <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-3">Alas Hak</label>
            
            <label for="identitas" class="control-label col-md-3">Keterangan</label>
           
            <label for="identitas" class="control-label col-md-3">Upload file</label>
            
        </div>
    </div>



     <div role="form" class="form-horizontal">
        <div class="form-group">            
            <div class="col-md-3"><asp:DropDownList ID="ddshm" class="form-control input-md" runat="server"></asp:DropDownList></div>
            <div class="col-md-3"><asp:TextBox id="txtketshm" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" runat="server" /></div>


 <%if (Upload.ToString().Equals("I") )
 { %>
        <div class="hidden" >
<%}%>  
            <div class="col-md-3">
                
                <asp:Label runat="server" ID="Label2" Style="display: none;"><img align="absmiddle" alt="" src="../images/uploading.gif"/></asp:Label>
                
                    <asp:AjaxFileUpload ID="FileKlaimUser" runat="server"
                    onuploadcomplete="AjaxFileUploadKlaimUser_UploadComplete" 
                    ThrobberID="myThrobber" 
                    MaximumNumberOfFiles="8" 
                    AllowedFileTypes="jpg,jpeg,png,pdf,doc,docx,xls,xlxs,txt,zip,rar,7z"
                    OnClientUploadComplete="onClientUploadCompleteKlaimUser"
                    ViewStateMode="Inherit"/>

            
            </div>    
 <%if (Upload.ToString().Equals("I") )
 { %>
</div>
<%}%>  

                    
        </div>
    </div>



       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:100%; height:130px;">
                <div id="gridalas" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

<hr />
<br />

        <div class="form-group">

            <div class="col-md-2">
            <asp:Label ID="Label27" runat="server" Text="Label">Lanjut</asp:Label>
            </div>

            <div class="col-md-3">
                <asp:DropDownList ID="ddLanjut" runat="server" class="form-control input-md">
                </asp:DropDownList>
            </div>

       </div>


    <br /><hr />

    <div class="form-group">
            <div class="col-md-10">
       
                     <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default"  onclick="btnClick(this)"/> 
                     <input type="button" id="btnSave" value="Save"  class="btn btn-lg btn-success" onclick="btnClick(this)" />   
              
            </div>
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


<%--DIALOG--%>

<div id="dialogKlaim" title="Cari Identitas" style="font-size:small;">
    <div role="form" class="form-horizontal" >

    <div class="form-group">
            <div class="col-md-5">
       
                     <input type="button" id="btnTmbhBru" value="Tambah Baru"  class="btn btn-md btn-success" onclick="tambah()" />  
              
            </div>
    </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:560px; height:250px;">
                <div id="GridIdentitas" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="PageIdentitas"> </div>
            </div>
        </div>
        </div>


    </div>
</div>



<script type="text/javascript">
    var localURL = "KlaimUserForm.aspx";
    var newUrl = "KlaimUserList.aspx";
    var newURLIdn = "../Pages_Admintools/MasterIdentitasForm.aspx";
    var txtnoclain = document.getElementById("<%=txtnoclain.ClientID%>");
    var txtNama = document.getElementById("<%=txtNama.ClientID%>");
    var txtAlamat = document.getElementById("<%=txtAlamat.ClientID%>");
    var txtNoHandphone = document.getElementById("<%=txtNoHandphone.ClientID%>")

    var ddKabupaten = document.getElementById("<%= ddKabupaten.ClientID %>");
    var ddKecamatan = document.getElementById("<%= ddKecamatan.ClientID %>");
    var ddDesa = document.getElementById("<%= ddDesa.ClientID %>");

    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");
    var btnCari = document.getElementById("btnCari");
    var btnUpKtp = document.getElementById('btnUpKtp');
    var hidMode = document.getElementById('hidMode');
    var btnCari = document.getElementById('btnCari');
    

    var ddshm = document.getElementById("<%= ddshm.ClientID %>");
    var txtketshm = document.getElementById("<%= txtketshm.ClientID %>");
    var FileKlaimUser = document.getElementById("<%= FileKlaimUser.ClientID %>");

    var ddprs = document.getElementById("<%=ddprs.ClientID%>");
    var txtNmrIdn = document.getElementById("<%=txtNmrIdn.ClientID%>");

    var ddLanjut = document.getElementById("<%=ddLanjut.ClientID%>"); 
    
    
    txtnoclain.disabled = true;

   
  
    ListAlas();
    listIdentitas();
    terimaURL();
    SearchlistIdentitas();




    function tambah() {
        var url = window.location.toString();
        url = url.replace(localURL, newURLIdn);
        window.open(url);

    }

    $(function () {
        $("#dialogKlaim").dialog
        ({
            autoOpen: false,
            width: 620,
            height: 420,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogKlaim").dialog("close");
        });
    });

    function OpenDialog() {

        $("#dialogKlaim").dialog("open");

    }

    function onRowSelected(rowId, cellIndex) {

        txtNmrIdn.value = listIdentitas.cells(rowId, 1).getValue();
        txtNama.value = listIdentitas.cells(rowId, 2).getValue();
        txtAlamat.value = listIdentitas.cells(rowId, 3).getValue();
        txtNoHandphone.value = listIdentitas.cells(rowId, 4).getValue();

        $("#dialogKlaim").dialog("close");

    }


    function SearchlistIdentitas(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=LI"
			+ "";
        listIdentitas.clearAll();
        listIdentitas.loadXML(localURL + "?" + s);
    }

    function DeletePic(sm, param1, NamDok, KdDok, Sqdok) {
        var r = confirm("Hapus Data Dokumen Ini ?");
        if (r == true) {
            var s = ""
            + "rnd=" + Math.random() * 4
            + "&sm=" + sm
            + "&param1=" + param1
            + "&NamDok=" + NamDok
            + "&KdDok=" + KdDok
            + "&Sqdok=" + Sqdok
            + "";
            //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }
    

    }
    
    
    function terimaURL() {


        var url = window.location.toString();
        //ambil bagian parameternya
        url.match(/\?(.+)$/);
        var params = RegExp.$1;


        //alert(params);

        if (params != 'param1=I') {
            // pisahkan parameter URL ke associative array
            var params = '&' + params;
            //            alert(params);
            splitparam(params);
        } else {
            hidMode.value = 'I';
            lockKlaimUserEdit();
        }

    }


    function splitparam(loader) {

        var a = loader;
        if (a != '&div') {
            //alert(a);
            var b = new Array();
            b = a.split('&');
            //alert(b[3]);
            var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=V"
			    + "&param1=V"
                + "&param2=" + b[3].replace("param2=", "")
			    + "";
            //alert(s);
            dhtmlxAjax.post(localURL, s, bindFormKlaimUser);

            var x = b[2].replace("param1=", "");

            if (x == 'V') {

                lockKlaimUserView();
                hidMode.value = 'I';
            }

            else if (x == 'D') {
                lockKlaimUserDelete();
                btnSave.value = 'Delete';
                hidMode.value = 'D';

            }
            else if (x == 'E') {

                lockKlaimUserEdit();
                btnSave.value = 'Save';
                hidMode.value = 'E';


            }
        }

    }

    function bindFormKlaimUser(loader) {
        //alert(loader.xmlDoc.responseText);
        var a = loader.xmlDoc.responseText;
        //        lockKlaimUser();
        if (a != '0') {
            var b = new Array();
            b = a.split('|');

            //            alert(b[12]);


            txtnoclain.value = b[0];

            txtNama.value = b[1];
            txtAlamat.value = b[2];
            txtNoHandphone.value = b[3];
            ddKabupaten.value = b[4];
            ddKecamatan.value = b[5];
            ddDesa.value = b[6];
            txtNmrIdn.value = b[7];
            ddLanjut.value = b[8];
        }
        SearchlistAlas();
    }





    function lockKlaimUserView() {

        txtnoclain.disabled = true;
        txtNama.disabled = true;
        txtAlamat.disabled = true;
        txtNoHandphone.disabled = true;

        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;
        txtNmrIdn.disabled = true;

        ddprs.disabled = true;
        ddLanjut.disabled = true;

        document.getElementById('btnSave').style.visibility = 'hidden';
        document.getElementById('btnCari').style.visibility = 'hidden';


    }

    function lockKlaimUserEdit() {
        txtnoclain.disabled = true;
        txtNama.disabled = true;
        txtAlamat.disabled = true;
        txtNoHandphone.disabled = true;
        txtNmrIdn.disabled = true;

    }

    function lockKlaimUserDelete() {
        txtnoclain.disabled = true;
        txtNama.disabled = true;
        txtAlamat.disabled = true;
        txtNoHandphone.disabled = true;
        txtNmrIdn.disabled = true;
        ddprs.disabled = true;
        ddLanjut.disabled = true;
        document.getElementById('btnCari').style.visibility = 'hidden';

    }


    function SearchlistAlas() {
        var s = ""

        + "rnd=" + Math.random() * 4
		+ "&sm=DOCpic"
		+ "&IDKlaimUser=" + txtnoclain.value
		+ "&param1=L"
        + "";
        ListAlas.clearAll();
        ListAlas.loadXML(localURL + "?" + s);
        
    }

    function btnClick(objBtn) {
        switch (objBtn.value) {
            case "Save":
                CRUD(hidMode.value);
                break;

            case "Delete":
                if (objBtn.id == 'btnSave') {
                    if (confirm("Hapus Data Ini?"))
                        CRUD(hidMode.value);
                }
                break;

            case "Cancel":
                close();
                window.location.replace(newUrl);
                break;

            default:
                break;
        }
    }

    function CRUD(tipe) {

        var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=" + hidMode.value
                + "&param2=" + txtnoclain.value
                + "&param3="
                + "&param4=" + txtNmrIdn.value
                + "&param5=" + txtNama.value
                + "&param6=" + txtAlamat.value
                + "&param7=" + txtNoHandphone.value
                + "&param8=" + ddKabupaten.value
                + "&param9=" + ddKecamatan.value
                + "&param10=" + ddDesa.value
                + "&param13=" + ddprs.value
                + "&param15=" + ddLanjut.value
                + "";

        dhtmlxAjax.post(localURL, s, outputResponse);
    }

    function outputResponse(loader) {

        var a = loader.xmlDoc.responseText;
        if (a != '') {
            var b = new Array();
            b = a.split('|');
        }
        switch (b[0]) {
            case "E":
                alert("Data Berhasil di Edit");
                //window.location.replace(newUrl);
                close();
                break; 
            case "I":
                alert("Data Berhasil di Input");
                //window.location.replace(newUrl);
                close();
                break;
            case "D":
                alert("Data Berhasil di Delete");
                //window.location.replace(newUrl);
                close();
                break;
            case "nodelete":
                alert("Data Claim User Tidak Dapat Dihapus Karena Sudah Dilalukan Persiapan Dokumen");
                break;
            case "DP":
                alert("Data Dokumen Berhasil Di Delete");
                SearchlistAlas();
                break;
            case "noedit":
                alert("Data Claim User Tidak Dapat Di Edit Karena Sudah Dilalukan Persiapan Dokumen");
                break;
            case "gagal":
                alert("Data Gagal Disimpan");
                break; 
            case "DP":
                alert("Folder Di Delete");
                break;
            default:
                break;
        }

    }
 
    function listAlas() {
        listAlas = new dhtmlXGridObject('gridalas');
        listAlas.setImagePath("../JavaScript/codebase/imgs/");
        listAlas.setHeader("No,Alas Hak,Aksi");
        listAlas.setInitWidths("40,200,200");
        listAlas.setColAlign("left,left,left");
        listAlas.setColTypes("ro,ro,link");
        listAlas.init();
        listAlas.setSkin("dhx_skyblue");
        listAlas.setPagingSkin("bricks");
        listAlas.setColSorting("str,str,str");
    }

    function listIdentitas() {
        listIdentitas = new dhtmlXGridObject('GridIdentitas');
        listIdentitas.setImagePath("../JavaScript/codebase/imgs/");
        listIdentitas.setHeader("No,No Identitas,Nama,Alamat,No Handphone");
        listIdentitas.setInitWidths("40,150,150,150,150");
        listIdentitas.setColAlign("left,left,left,left,left");
        listIdentitas.setColTypes("ro,ro,ro,ro,ro");
        listIdentitas.init();
        listIdentitas.setSkin("dhx_skyblue");

        listIdentitas.attachEvent("onRowSelect", onRowSelected);

        listIdentitas.setColSorting("str,str,str,str,str");
        listIdentitas.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
        listIdentitas.enablePaging(true, 15, 5, "PageIdentitas", true);
        listIdentitas.setPagingSkin("bricks");

    }



    function changeKabupaten(obj) {
        var ji = 0;
        for (var j = document.getElementById("<%= ddKecamatan.ClientID %>").length; j >= 0; j--) {   // alert(j);
            document.getElementById("<%= ddKecamatan.ClientID %>").remove(j);
            ji++;
        }


        var ji = 0;
        for (var j = document.getElementById("<%= ddDesa.ClientID %>").length; j >= 0; j--) {    //alert(j);
            document.getElementById("<%= ddDesa.ClientID %>").remove(j);
            ji++;
        }

        var s = ""
			        + "rnd=" + Math.random() * 4
			        + "&sm=dd"
			        + "&param1=2"
			        + "&param2=" + obj
			        + "";
        //	alert(localURL+"?"+s);
        dhtmlxAjax.post(localURL, s, outputResponseKabupaten);
    }

    function outputResponseKabupaten(loader) {
        var a = loader.xmlDoc.responseText;
        if (a != '0') {
            var b = new Array();
            var len;
            b = a.split('*');

            for (var i = 0; i < b.length - 1; i++) {
                //                alert(b[i]);
                len = b[i].indexOf('|');
                //                alert(len);
                //                alert(b[i].substring(0, len));
                //                alert(b[i].substring(len + 1, len + 4));

                var opt = document.createElement("option");
                document.getElementById("<%= ddKecamatan.ClientID %>").options.add(opt);
                opt.text = b[i].substring(0, len);
                opt.value = b[i].substring(len + 1, len + 4);

            }

        }
    }

    function changeKecamatan(obj) {
        var ji = 0;
        for (var j = document.getElementById("<%= ddDesa.ClientID %>").length; j >= 0; j--) {   // alert(j);
            document.getElementById("<%= ddDesa.ClientID %>").remove(j);
            ji++;
        }

        var s = ""
			        + "rnd=" + Math.random() * 4
			        + "&sm=dd"
			        + "&param1=3"
			        + "&param2=" + obj
			        + "";
        //	alert(localURL+"?"+s);
        dhtmlxAjax.post(localURL, s, outputResponseKecamatan);
    }

    function outputResponseKecamatan(loader) {
        var a = loader.xmlDoc.responseText;
        if (a != '0') {
            var b = new Array();
            var len;
            b = a.split('*');

            for (var i = 0; i < b.length - 1; i++) {
                //                alert(b[i]);
                len = b[i].indexOf('|');
                //                alert(len);
                //                alert(b[i].substring(0, len));
                //                alert(b[i].substring(len + 1, len + 4));

                var opt = document.createElement("option");
                document.getElementById("<%= ddDesa.ClientID %>").options.add(opt);
                opt.text = b[i].substring(0, len);
                opt.value = b[i].substring(len + 1, len + 4);

            }

        }
    }

    function onClientUploadCompleteKlaimUser(sender, e) {
        document.getElementById('<%=namaFile.ClientID %>').value = e.get_postedUrl();
            ReloadKlaimUser(document.getElementById('<%=txtnoclain.ClientID %>').value, document.getElementById('<%=namaFile.ClientID %>').value, document.getElementById('<%=txtketshm.ClientID %>').value);
            alert('Data Berasil diUpload');

    }



    function ReloadKlaimUser(id, nama, ket) {

        SaveKlaimUser(id, nama, ket);

        var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=DOCpic"
			    + "&IDKlaimUser=" + txtnoclain.value
			    + "&param1=L"

			    + "";
        centerLoadingImage();
        ListAlas.clearAll();
        ListAlas.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }

    function reloadphoto(id) {

        //SaveKlaimUser(id, nama, ket);

        var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=DOCpic"
			    + "&IDKlaimUser=" + txtnoclain.value
			    + "&param1=L"

			    + "";
        centerLoadingImage();
        ListAlas.clearAll();
        ListAlas.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }

    function SaveKlaimUser(id, nama, ket) {
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
			    + "&IDKlaimUser=" + txtnoclain.value
			    + "&NAMA=" + b[0]
			    + "&KETERANGAN=" + ket
			    + "&NOMOR=" + b[1]
                + "&user=" + b[2]
			    + "&wilay=" + b[3]
			    + "&param1=I"
			    + "&param5=" + ddshm.value
                + "&param11=" + ddprs.value
			    + "";
        +"";
        centerLoadingImage();
        ListAlas.clearAll();
        ListAlas.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }

    function ReloadDetail(nomorBayar) {

        //        alert(nomorBayar);
        var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=DOCpic"
			    + "&IDKlaimUser=" + nomorBayar
			    + "&param1=LD"

			    + "";
        centerLoadingImage();
        ListAlas.clearAll();
        ListAlas.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }







    function ListAlas() {
        ListAlas = new dhtmlXGridObject('gridalas');
        ListAlas.setImagePath("../JavaScript/codebase/imgs/");
        ListAlas.setHeader("No,Alas Hak,Keterangan,File,Action,Delete");
        ListAlas.setInitWidths("40,280,280,280,160,160");
        ListAlas.setColAlign("left,left,left,left,left,left");
        ListAlas.setColTypes("ro,ro,ro,ro,link,link");
        ListAlas.init();
        ListAlas.setSkin("dhx_skyblue");
        ListAlas.setPagingSkin("bricks");
        ListAlas.setColSorting("str,str,str,str,str,str");
    }

    function SaveIdentitasLahan(id, nama) {
        var a = nama;
        //alert(a);
        if (a != '') {
            var b = new Array();
            b = a.split('|');
        }
        //        alert(b[0]);

        if (hidMode.value == "I") {
            //Insert(hidMode.value);

            var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=SaveUploadRegistrasi"
			    + "&IDREGISTRASI=" + txtnoclain.value
			    + "&NAMA=" + b[0]
			    + "&KETERANGAN="// + ket
			    + "&NOMOR=" + b[1]
                + "&user=" + b[2]
			    + "&wilay=" + b[3]
			    + "&param1=I"
			    + "&param5=" //+ ddJenis.value
			    + "";
            +"";

        }
        else {
            var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=SaveUploadRegistrasi"
			    + "&IDREGISTRASI=" + txtnoclain.value
			    + "&NAMA=" + b[0]
			    + "&KETERANGAN="// + ket
			    + "&NOMOR=" + b[1]
                + "&user=" + b[2]
			    + "&wilay=" + b[3]
			    + "&param1=I"
			    + "&param5=" //+ ddJenis.value
			    + "";
            +"";
        }
        //alert(s);
        centerLoadingImage();
        listktp.clearAll();
        listktp.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }

    function ReloadDetail(nomorRegister) {
        //        alert(nomorBayar);
        if (hidMode.value == "I") {
            var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=ListUploadIdentitasLahan"
			    + "&IDRegistrasi=" + txtnoclain.value
			    + "&param1=UI"

			    + "";
        }
        else {
            var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=ListUploadIdentitasLahan"
			    + "&IDRegistrasi=" + txtnoclain.value
			    + "&param1=UI"

			    + "";


        }
        centerLoadingImage();
        listktp.clearAll();
        listktp.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

        //alert(s);

    }

    function onClientUploadCompleteIdentitasLahan(sender, e) {
        document.getElementById('<%=namaFile.ClientID %>').value = e.get_postedUrl();
            ReloadIdentitasLahan(document.getElementById('<%=txtnoclain.ClientID %>').value, document.getElementById('<%=namaFile.ClientID %>').value);
            alert('Data Berasil diUpload');
        }


        //ReloadIdentitasLahan();
        function ReloadIdentitasLahan(id, nama) {

            SaveIdentitasLahan(id, nama);

            var s = ""
                    + "rnd=" + Math.random() * 4
                    + "&sm=ListUploadIdentitasLahan"
                    + "&IDRegistrasi=" + txtnoclain.value
                    + "&param1=UI"
                    + "";
            centerLoadingImage();
            listktp.clearAll();
            listktp.loadXML(localURL + "?" + s, function () {
                hideLoadingImage();
            });
            //  alert(s);

        }

 


</script>


</asp:Content>
