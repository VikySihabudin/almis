<%@ Page Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="PersiapanDocumentForm.aspx.cs" Inherits="Pages_LandLiti_PersiapanDocumentForm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />



<h1>Persiapan Dokumen</h1>
	
	<hr />    
    <br />
    
	<div role="form" class="form-horizontal" >

        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nama Perusahaan</label>
            <div class="col-md-3">
                <asp:DropDownList ID="ddprs" runat="server" class="form-control">
                </asp:DropDownList>
            </div>			           
        </div>


        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Persiapan Document</label>
            <div class="col-md-3"><asp:TextBox ID="txtPerDoc" class="form-control input-md" runat="server" onkeypress="return numbersonly(event, false)"></asp:TextBox></div>			
            

        </div>
        
        <div class="form-group">

            <label for="nama" class="control-label col-md-2">Nomor Claim</label>
            <div class="col-md-3"><asp:TextBox ID="txtNoClam" class="form-control input-md" runat="server"></asp:TextBox></div>

        </div>

        
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Nama</label>
            <div class="col-md-3"><asp:TextBox ID="txtNama" class="form-control input-md"  runat="server"></asp:TextBox></div>
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
		


        <hr>
		<h4>Data PID :</h4>
		<br />

        <div class="form-group">
            <div class="col-md-2">
                <input type="button" onclick="OpenDialog()" id="btnTambah" value="Tambah PID" class="btn btn-info btn-md" />
                
            </div>
        </div>
       

       <div class="form-group">
            <div class="col-md-10">
            <div style=" width:50%; height:130px;">
                <div id="gridPID" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>	
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
       
                     <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default"  onclick="btnClick(this)" PostBackUrl="~/Pages/PraRegistrasiForm.aspx"/> 
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



<div id="dialogPersiapan" title="Cari PID" style="font-size:small;">
    <div role="form" class="form-horizontal" >

    <div class="form-group">

    </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:560px; height:250px;">
                <div id="GridPidCari" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="PagePidCari"> </div>
            </div>
        </div>
        </div>


    </div>
</div>

<script type="text/javascript">

    var localURL = "PersiapanDocumentForm.aspx";
    var newUrl = "PersiapanDocumentList.aspx";

    var txtNoClam = document.getElementById("<%= txtNoClam.ClientID %>");
    var txtPerDoc = document.getElementById("<%= txtPerDoc.ClientID %>");
    var txtNama = document.getElementById("<%= txtNama.ClientID %>");

    var ddKabupaten = document.getElementById("<%= ddKabupaten.ClientID %>");
    var ddKecamatan = document.getElementById("<%= ddKecamatan.ClientID %>");
    var ddDesa = document.getElementById("<%= ddDesa.ClientID %>");

    var ddprs = document.getElementById("<%= ddprs.ClientID %>");
    var ddLanjut = document.getElementById("<%= ddLanjut.ClientID %>"); 
    
    var hidMode = document.getElementById("hidMode");

    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");
    var btnTambah = document.getElementById("btnTambah");
    

    listPID();
    listPidCari();
    terimaURL();


    $(function () {
        $("#dialogPersiapan").dialog
        ({
            autoOpen: false,
            width: 620,
            height: 420,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogPersiapan").dialog("close");
        });
    });

    function OpenDialog() {

        $("#dialogPersiapan").dialog("open");

    }

    function onRowSelected(rowId, cellIndex) {

        var r = confirm("Apakah Anda Ingin Menambahkan Pid " + listPidCari.cells(rowId, 1).getValue() );
        if (r == true) {

            var s = ""
                    + "rnd=" + Math.random() * 4
                    + "&sm=CRUD_D"
                    + "&param1=I"
                    + "&param2=" + txtPerDoc.value
                    + "&param3="
                    + "&param4="
                    + "&param5=" + listPidCari.cells(rowId, 1).getValue()
                    + "&param6="
                    + "&param7="
                    + "&param8=" + ddprs.value
                    + "&param9="
                    + "";

            dhtmlxAjax.post(localURL, s, outputResponse);
            SearchlistPID();

            $("#dialogPersiapan").dialog("close");
        }
    }


    function Hapus(sm, param1, param5) {
        var r = confirm("Delete?");
        if (r == true) {
            var s = ""
                    + "rnd=" + Math.random() * 4
			        + "&sm=CRUD_D"
                    + "&param1=" + param1
                    + "&param2=" + txtPerDoc.value
                    + "&param3="
                    + "&param4="
                    + "&param5=" + param5
                    + "&param6="
                    + "&param7="
                    + "&param8=" + ddprs.value
                    + "&param9="
                    + "";
            dhtmlxAjax.post(localURL, s, outputResponse);
            SearchlistPID();
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
            dhtmlxAjax.post(localURL, s, bindFormPreDok);

            var x = b[2].replace("param1=", "");

            if (x == 'V') {

                lockPerDokView();
                hidMode.value = 'I';
            }

            else if (x == 'D') {
                lockPerDokDelete();
                btnSave.value = 'Delete';
                hidMode.value = 'D';

            }
            else if (x == 'E') {

                lockPerDokEdit();
                btnSave.value = 'Save';
                hidMode.value = 'E';


            }
        }

    }

    function bindFormPreDok(loader) {
        //alert(loader.xmlDoc.responseText);
        var a = loader.xmlDoc.responseText;
        //        lockKlaimUser();
        if (a != '0') {
            var b = new Array();
            b = a.split('|');

            txtNoClam.value = b[0];
            txtPerDoc.value = b[1];
            txtNama.value = b[2];

            ddKabupaten.value = b[3];
            ddKecamatan.value = b[4];
            ddDesa.value = b[5];
            ddprs.value = b[6];
            ddLanjut.value = b[7];
        }
        SearchlistPID();
        SearchlistPIDCari();
    }



    function SearchlistPID(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=" + txtPerDoc.value
			+ "";
        listPID.clearAll();
        listPID.loadXML(localURL + "?" + s);
    }

    function SearchlistPIDCari(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=LP"
            + "&param1=LP"
            + "&param2="
			+ "";
        listPidCari.clearAll();
        listPidCari.loadXML(localURL + "?" + s);
    }



    function listPidCari() {
        listPidCari = new dhtmlXGridObject('GridPidCari');
        listPidCari.setImagePath("../JavaScript/codebase/imgs/");
        listPidCari.setHeader("No,No PID,Nama Penjual");
        listPidCari.setInitWidths("60,200,300");
        listPidCari.setColAlign("left,left,left");
        listPidCari.setColTypes("ro,ro,ro");
        listPidCari.init();
        listPidCari.setSkin("dhx_skyblue");

        listPidCari.attachEvent("onRowSelect", onRowSelected);

        listPidCari.setColSorting("str,str,str");
        listPidCari.attachHeader("#text_filter,#text_filter,#text_filter");
        listPidCari.enablePaging(true, 15, 5, "PagePidCari", true);
        listPidCari.setPagingSkin("bricks");
    }



    function listPID() {
        listPID = new dhtmlXGridObject('gridPID');
        listPID.setImagePath("../JavaScript/codebase/imgs/");
        listPID.setHeader("No,No PID,Aksi");
        listPID.setInitWidths("40,200,150");
        listPID.setColAlign("left,left,left");
        listPID.setColTypes("ro,ro,link");
        listPID.init();
        listPID.setSkin("dhx_skyblue");
        listPID.setPagingSkin("bricks");
        listPID.setColSorting("str,str,str");
    }



    function lockPerDokView() {

        txtNoClam.disabled = true;
        txtPerDoc.disabled = true;
        txtNama.disabled = true;

        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;
        
        ddprs.disabled = true;
        ddLanjut.disabled = true;
        document.getElementById('btnSave').style.visibility = 'hidden';
        document.getElementById('btnTambah').style.visibility = 'hidden';
    }

    function lockPerDokEdit() {
        txtNoClam.disabled = true;
        txtPerDoc.disabled = true;
        txtNama.disabled = true;

        ddprs.disabled = true;
        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;


    }

    function lockPerDokDelete() {
        txtNoClam.disabled = true;
        txtPerDoc.disabled = true;
        txtNama.disabled = true;

        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;
        
        ddprs.disabled = true;
        ddLanjut.disabled = true;
        document.getElementById('btnTambah').style.visibility = 'hidden';

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
                + "&param2=" + txtPerDoc.value
                + "&param3=" 
                + "&param4=" + txtNoClam.value
                + "&param5="
                + "&param6="
                + "&param7=" + ddprs.value
                + "&param8="
                + "&param9="
                + "&param10=" + ddLanjut.value
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
            case "ID":
                
                alert("Data Berhasil di Input");
                //window.location.replace(newUrl);
                //close();
                break;
            case "DD":
                
                alert("Data Berhasil di Delete");
                //window.location.replace(newUrl);
                //close();
                break;
            case "nodelete":
                alert("Data Persiapan Dokumen Tidak Dapat Dihapus Karena Sudah Dilalukan Verifikasi Dokumen");
                break;
            case "noadd":
                alert("Data PID Sudah Ada");
                break;
                
            case "nodeleted":
                alert("Data Gagal Di Hapus");
                break;
            case "noedit":
                alert("Data Persiapan Dokumen Tidak Dapat Di Edit Karena Sudah Dilalukan  Verifikasi Dokumen");
                break;
            case "gagal":
                alert("Data Gagal Disimpan");
                break;
            default:
                break;
        }

    }


</script>




</asp:Content>
