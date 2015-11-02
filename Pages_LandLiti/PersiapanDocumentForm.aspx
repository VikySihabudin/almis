<%@ Page Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="PersiapanDocumentForm.aspx.cs" Inherits="Pages_LandLiti_PersiapanDocumentForm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />



<h1>Form Persiapan Document</h1>
	
	<hr class="style-four">    
    
	<form role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Persiapan Document</label>
            <div class="col-md-3"><asp:TextBox ID="txtPerDoc" class="form-control input-md" runat="server" onkeypress="return numbersonly(event, false)"></asp:TextBox></div>			
            
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
            <div class="col-md-3">
                <input type="button" onclick="PopupTbhAnk()" id="btnTambah" value="Tambah" class="btn btn-info btn-md" />
                
            </div>
        </div>
       

       <div class="form-group">
            <div class="col-md-10">
            <div style=" width:50%; height:130px;">
                <div id="gridPID" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>	
            </div>                                     
            </div>
        </div>

            <br /><hr />

    <div class="form-group">
            <div class="col-md-10">
       
                     <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default"  onclick="btnClick(this)" PostBackUrl="~/Pages/PraRegistrasiForm.aspx"/> 
                     <input type="button" id="btnSave" value="Save"  class="btn btn-lg btn-success" onclick="btnClick(this)" />  
              
            </div>
    </div>
</form>

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

    var localURL = "PersiapanDocumentForm.aspx";
    var newUrl = "PersiapanDocumentList.aspx";

    var txtNoClam = document.getElementById("<%= txtNoClam.ClientID %>");
    var txtPerDoc = document.getElementById("<%= txtPerDoc.ClientID %>");
    var txtNama = document.getElementById("<%= txtNama.ClientID %>");

    var ddKabupaten = document.getElementById("<%= ddKabupaten.ClientID %>");
    var ddKecamatan = document.getElementById("<%= ddKecamatan.ClientID %>");
    var ddDesa = document.getElementById("<%= ddDesa.ClientID %>");
    
    var hidMode = document.getElementById("hidMode");

    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");


    listPID();
    terimaURL();


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

        }
    }


    function listPID() {
        listPID = new dhtmlXGridObject('gridPID');
        listPID.setImagePath("../JavaScript/codebase/imgs/");
        listPID.setHeader("No,PID");
        listPID.setInitWidths("40,100");
        listPID.setColAlign("left,left");
        listPID.setColTypes("ro,ro");
        listPID.init();
        listPID.setSkin("dhx_skyblue");
        listPID.setPagingSkin("bricks");
        listPID.setColSorting("str,str");
    }



    function lockPerDokView() {

        txtNoClam.disabled = true;
        txtPerDoc.disabled = true;
        txtNama.disabled = true;

        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;


        document.getElementById('btnSave').style.visibility = 'hidden';
    }

    function lockPerDokEdit() {
        txtNoClam.disabled = true;
        txtPerDoc.disabled = true;
        txtNama.disabled = true;

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
                alert("Data Persiapan Dokumen Tidak Dapat Dihapus Karena Sudah Dilalukan Verifikasi Dokumen");
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
