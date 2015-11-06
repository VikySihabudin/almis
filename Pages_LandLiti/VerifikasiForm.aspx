<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="VerifikasiForm.aspx.cs" Inherits="Pages_LandLiti_VerifikasiForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>
    
<input type="hidden" id="hidMode" value="0" />
<input type="hidden" id="litigasi" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />



<h1>Form Verifikasi</h1>
	
	<hr />

   <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="nama" class="control-label col-md-2">Nama Perusahaan</label>
            <div class="col-md-3"> 
                <asp:DropDownList ID="ddprs" runat="server" class="form-control">
                </asp:DropDownList>
            </div>
        </div>
    </div>


    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Verifikasi Dokumen</label>
            <div class="col-md-3"><asp:TextBox id="txtNoVerDoc" type="text" runat="server" class="form-control input-md" ></asp:TextBox></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Periapan Dokumen</label>
            <div class="col-md-3">
            <asp:TextBox id="txtPerDoc" type="text" runat="server" class="form-control input-md" ></asp:TextBox></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Claim</label>
            <div class="col-md-3">
            <asp:TextBox id="txtNoClam" type="text" runat="server" class="form-control input-md" ></asp:TextBox></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nama</label>
            <div class="col-md-3"><asp:TextBox id="txtNama" type="text" runat="server" class="form-control input-md" ></asp:TextBox></div>
        </div>
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

    <br />
    <hr />

    <div class="form-group">
     <div class="col-md-4">
     <asp:Label ID="Label2" runat="server" Text="Label">Download Alas Hak</asp:Label>
     </div>
    </div>


      <div class="form-group">
       <div class="col-lg-10">
            <div style=" width:650px; height:130px;">
                <div id="gridVer" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

    <br />
    <hr />

    <div class="form-group">
     <div class="col-md-4">
     <asp:Label ID="Label1" runat="server" Text="Label">Upload Notulensi Rapat Mediasi</asp:Label>
     </div>
    </div>


    <div role="form" class="form-horizontal" >
        <div class="form-group">
        <div class="col-md-3">
            <asp:Label runat="server" ID="myThrobber" Style="display: none;"><img align="absmiddle" alt="" src="../images/uploading.gif"/></asp:Label>
                <asp:AjaxFileUpload ID="AjaxFileUploadIdentitasLahan" runat="server"
                    onuploadcomplete="AjaxFileUploadIdentitasLahan_UploadComplete" 
                    ThrobberID="myThrobber" 
                    MaximumNumberOfFiles="8" 
                    AllowedFileTypes="jpg,jpeg,png,pdf,doc,docx,xls,xlxs,txt,zip,rar,7z"
                    OnClientUploadComplete="onClientUploadCompleteIdentitasLahan"
                    ViewStateMode="Inherit"
                    />

            </div>
        </div>
    </div>


           <div class="form-group">
            <div class="col-md-10">
            <div style=" width:650px; height:130px;">
                <div id="gridNotulen" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>	
            </div>                                     
            </div>
        </div>

    <br />
    <hr />

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="LEksepsi" runat="server"  for="identitas" class="control-label col-md-2" Text="Litigasi" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
            <asp:CheckBox ID="cbLitigasi" runat="server"  CssClass="form-control checkbox-md" onclick="validasi()" /></div>
        </div>
    </div>

    <br /><hr />

    <div class="form-group">
            <div class="col-md-10">
       
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


<script type="text/javascript">
    var localURL = "VerifikasiForm.aspx";
    var newUrl = "VerifikasiList.aspx";

    var txtNoVerDoc = document.getElementById("<%=txtNoVerDoc.ClientID%>");
    var txtNoClam = document.getElementById("<%=txtNoClam.ClientID%>");
    var txtNama = document.getElementById("<%=txtNama.ClientID%>");

    var ddKabupaten = document.getElementById("<%= ddKabupaten.ClientID %>");
    var ddKecamatan = document.getElementById("<%= ddKecamatan.ClientID %>");
    var ddDesa = document.getElementById("<%= ddDesa.ClientID %>");

    var txtPerDoc = document.getElementById("<%=txtPerDoc.ClientID%>");
    var cbLitigasi = document.getElementById("<%=cbLitigasi.ClientID%>");
    var hidMode = document.getElementById('hidMode');
    var litigasi = document.getElementById('litigasi');

    var ddprs = document.getElementById("<%=ddprs.ClientID%>");
    

    terimaURL();
    listVer();
    SearchlistVer();
    listNotulen();


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
            dhtmlxAjax.post(localURL, s, bindFormVerDok);

            var x = b[2].replace("param1=", "");

            if (x == 'V') {

                lockVerDokView();
                hidMode.value = 'I';
            }

            else if (x == 'D') {
                lockVerDokDelete();
                btnSave.value = 'Delete';
                hidMode.value = 'D';

            }
            else if (x == 'E') {

                lockVerDokEdit();
                btnSave.value = 'Save';
                hidMode.value = 'E';


            }
        }

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
    + "&param2=" + txtNoVerDoc.value
    + "&param3="
    + "&param4=" + txtPerDoc.value
    + "&param5=" +
    + "&param6=" +
    + "&param7=" +
    + "&param8=" +
    + "&param9=" +
    + "";
    
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
                //window.location.replace(newUrl);
                close();
                break;

            case "D":
                alert("Data Berhasil Di Delete");
                //window.location.replace(newUrl);
                close();
                break;

            case "nodelete":
                alert("Data Verifikasi Tidak Dapat Di Hapus Karena Sudah Dikerjakan Oleh Legal");
                //window.location.replace(newUrl);
                close();
                break;

            case "noedit":
                alert("Data Verifikasi Tidak Dapat Di Edit Karena Sudah Dikerjakan Oleh Legal");
                //window.location.replace(newUrl);
                close();
                break;

            case "gagal":
                alert("Data Verifikasi Gagal Disimpan");
                //window.location.replace(newUrl);
                close();
                break;

            default:
                break;
        }
    }

    function bindFormVerDok(loader) {
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

            txtNoVerDoc.value = b[6];
            cbLitigasi.value = b[7];

        }
    }

    function lockVerDokView() {

        txtNoVerDoc.disabled = true;
        txtNoClam.disabled = true;
        txtPerDoc.disabled = true;
        txtNama.disabled = true;

        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;
        cbLitigasi.disabled = true;


        document.getElementById('btnSave').style.visibility = 'hidden';
    }

    function lockVerDokEdit() {

        txtNoVerDoc.disabled = true;
        txtNoClam.disabled = true;
        txtPerDoc.disabled = true;
        txtNama.disabled = true;

        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;
    }

    function lockVerDokDelete() {

        txtNoVerDoc.disabled = true;
        txtNoClam.disabled = true;
        txtPerDoc.disabled = true;
        txtNama.disabled = true;

        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;
        cbLitigasi.disabled = true;
    }




    function SearchlistVer() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=L"
        + "&param1=L"
        + "&param2=4"
        + "";
        listVer.clearAll();
        listVer.loadXML("../xml/FormLegal.xml");
        //listplegal.loadXML(localURL + "?" + s);
    }

    function listVer() {
        listVer = new dhtmlXGridObject('gridVer');
        listVer.setImagePath("../JavaScript/codebase/imgs/");
        listVer.setHeader("No,PID,Nama Penjual,Alas Hak");
        listVer.setInitWidths("40,200,200,200");
        listVer.setColAlign("left,left,left,left");
        listVer.setColTypes("ro,ro,ro,link");
        listVer.init();
        listVer.setSkin("dhx_skyblue");
        listVer.setPagingSkin("bricks");
        listVer.setColSorting("str,str,str,str");
    } 

    function listNotulen() {
        listNotulen = new dhtmlXGridObject('gridNotulen');
        listNotulen.setImagePath("../JavaScript/codebase/imgs/");
        listNotulen.setHeader("No,Nama Notulen,Download");
        listNotulen.setInitWidths("40,200,200");
        listNotulen.setColAlign("left,left,left");
        listNotulen.setColTypes("ro,ro,link");
        listNotulen.init();
        listNotulen.setSkin("dhx_skyblue");
        listNotulen.setPagingSkin("bricks");
        listNotulen.setColSorting("str,str,str");
    } 

    $(function TextBox4() {
        $("[id$=TextBox4]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    function onClientUploadCompleteIdentitasLahan(sender, e) {
        document.getElementById('<%=namaFile.ClientID %>').value = e.get_postedUrl();
        ReloadIdentitasLahan(document.getElementById('<%=txtNoVerDoc.ClientID %>').value, document.getElementById('<%=namaFile.ClientID %>').value);
        alert('Data Berasil diUpload');
    }







</script>

</asp:Content>
