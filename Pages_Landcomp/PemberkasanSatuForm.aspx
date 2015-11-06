<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="PemberkasanSatuForm.aspx.cs" Inherits="Pages_PemberkasanSatuForm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>

<input type="hidden" id="hidMode" value="0" />
<input type="hidden" id="eksepsi" value="0" />

<asp:HiddenField ID="namaFile" runat="server" />





<h2>Pemberkasan</h2>
    
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
            <label for="identitas" class="control-label col-md-2">No Pemberkasan</label>
            <div class="col-md-3"><asp:TextBox id="txtNoPemberkasanSatu" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
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
            <label for="identitas" class="control-label col-md-2">No Negoisasi</label>
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
            <label for="identitas" class="control-label col-md-3">Perolehan Lahan</label>
            
            <label for="identitas" class="control-label col-md-3">Keterangan</label>
           
            <label for="identitas" class="control-label col-md-3">Upload file</label>
            
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">            
            <div class="col-md-3"><asp:DropDownList ID="ddPerolehanLahan" class="form-control input-md" runat="server"></asp:DropDownList></div>
            <div class="col-md-3"><asp:TextBox id="txtPerLahKet" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" runat="server" /></div>
            <div class="col-md-3">
                
                <asp:Label runat="server" ID="Label2" Style="display: none;"><img align="absmiddle" alt="" src="../images/uploading.gif"/></asp:Label>
                
                    <asp:AjaxFileUpload ID="FilePemberkasan" runat="server"
                    onuploadcomplete="AjaxFileUploadPemberkasan_UploadComplete" 
                    ThrobberID="myThrobber" 
                    MaximumNumberOfFiles="8" 
                    AllowedFileTypes="jpg,jpeg,png,pdf,doc,docx,xls,xlxs,txt,zip,rar,7z"
                    OnClientUploadComplete="onClientUploadCompletePemberkasan"
                    ViewStateMode="Inherit"/>

    
      <%--  
                <asp:Label ID="FilePerolehanLahan" runat="server" Text=""></asp:Label>
            <%--<asp:FileUpload ID="FilePerolehanLahan" runat="server" />--%>
            
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

    <%if (groups.ToString() != "1")
    { %>        
            <%if (lanjut.ToString() != "1")
            { %> 
            <div class="hidden">
            <%}%>

    <%}%>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="LLanjut"  runat="server" for="identitas" class="control-label col-md-2" Text="Lanjut" Font-Bold="True"></asp:Label>
            <div class="col-md-3"><asp:DropDownList ID="ddLanjut" runat="server" class="form-control input-md"></asp:DropDownList></div>
        </div>
    </div>

    <%if (groups.ToString() != "1")
    { %>        
            <%if (lanjut.ToString() != "1")
            { %> 
            </div>
            <%}%>

    <%}%>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label  ID="LKeterangan"for="identitas" class="control-label col-md-2">Keterangan</label>
            <div class="col-md-3"><asp:TextBox id="txtKeterangan" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" runat="server" /></div>
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
            <asp:Label  ID="LEksepsi"  runat="server" for="identitas" class="control-label col-md-2" Text="Eksepsi" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
            <asp:CheckBox ID="cbEksepsi" runat="server" CssClass="form-control checkbox-md" Text="" onclick="validasi()" /> 
           
            </div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="LKEksepsi"   runat="server"  for="identitas" class="control-label col-md-2" Text="Keterangan Eksepsi" Font-Bold="True"></asp:Label>
            <div class="col-md-3"> <asp:TextBox id="txtKetEks" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" runat="server" /></div>
        </div>
    </div>

    <%if (groups.ToString() != "1")
    { %>        
            <%if (except.ToString() != "1")
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

    function checkEksepsi(obj) {
        if (obj.checked) {
            obj.value = 1
        } else {
            obj.value = 0
        }
    }

</script>

<script type="text/javascript">

    var localURL = "PemberkasanSatuForm.aspx";
    var newUrl = "PemberkasanSatuList.aspx";
    var txtNoPemberkasanSatu = document.getElementById("<%= txtNoPemberkasanSatu.ClientID %>");
    var txtNoRegistrasi = document.getElementById("<%= txtNoRegistrasi.ClientID %>");
    var txtPID = document.getElementById("<%= txtPID.ClientID %>");
    var txtNoNegosiasi = document.getElementById("<%= txtNoNegosiasi.ClientID %>");
    var txtNoVisum = document.getElementById("<%= txtNoVisum.ClientID %>");
    var txtPerLahKet = document.getElementById("<%= txtPerLahKet.ClientID %>");
    var ddPerolehanLahan = document.getElementById("<%= ddPerolehanLahan.ClientID %>");
    var ddLanjut = document.getElementById("<%= ddLanjut.ClientID %>");
    var txtKeterangan = document.getElementById("<%= txtKeterangan.ClientID %>");
    var cbEksepsi = document.getElementById("<%= cbEksepsi.ClientID %>");
    var txtKetEks = document.getElementById("<%= txtKetEks.ClientID %>");
    var FilePemberkasan = document.getElementById("<%= FilePemberkasan.ClientID %>"); 
    var btnDelete = document.getElementById("btnDelete");
    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");
    var ddprs = document.getElementById("<%= ddprs.ClientID %>");


    var hidMode = document.getElementById('hidMode');

    function validasi() {
        if (document.getElementById("<%= cbEksepsi.ClientID %>").checked) {
            eksepsi.value = '1';
        } else {
            eksepsi.value = '0';
        }
    }

    PerolehanLahan();
    terimaURL();


    function terimaURL() 
    {

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

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=V"
			+ "&param1=V"
			+ "&param2=" + b[3].replace("param2=", "")
			+ "";



        //alert(s);
        dhtmlxAjax.post(localURL, s, bindFormPemberkasanSatu);
        //alert(b[4]);
        ReloadDetail(b[3].replace("param3=", ""));


        var x = b[2].replace("param1=", "");
        //alert(x);

        if (x == 'V') {
            lockPemberkasanSatuView();

        }

        else if (x == 'D') {
            lockPemberkasanSatuDelete();
            btnSave.value = 'Delete';
            hidMode.value = 'D';
        }

        else if (x == 'E') {
            lockPemberkasanSatuEdit();
            btnSave.value = 'Save';
            hidMode.value = 'E';


        }
//        alert(x)
//        alert(hidMode.value);
    }

    function btnClick(objBtn) {
        switch (objBtn.value) {

            case "Save":
                if (txtNoPemberkasanSatu.value == '') { alert('No Pemberkasan Harus di Assign'); }
                else {
                    CRUD(hidMode.value)
                }
                break;

            case "Delete":
                if (txtNoPemberkasanSatu.value == '') { alert('No Pemberkasan Harus Ada'); }
                else {
                    if (objBtn.id == 'btnSave') {
                        if (confirm("Hapus Data Ini?"))
                            CRUD(hidMode.value);
                    }
                }
                break;

            case "Cancel":
           //     alert('a');
                close();
                break;

            default:
                break;
        }
    }




    function CRUD(tipe) {
        var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=" + tipe.replace("param1=", "")
                + "&param2=" + txtNoPemberkasanSatu.value
                + "&param3="
                + "&param4=" + txtNoRegistrasi.value
                + "&param5=" + txtPID.value
                + "&param6=" + txtNoNegosiasi.value
                + "&param7=" + txtNoVisum.value
                + "&param8=" + ddLanjut.value
                + "&param9=" + eksepsi.value
                + "&param10=" + txtKeterangan.value
                + "&param11=" + txtKetEks.value
                + "&param12="
                + "&param13="
                + "&param15=" + ddprs.value
                + "";
        //alert(s);
        dhtmlxAjax.post(localURL, s, outputResponse);
    }

    function bindFormPemberkasanSatu(loader) 
    {
        //alert(loader.xmlDoc.responseText);
        var a = loader.xmlDoc.responseText;
//        lockPemberkasanSatuView();
        if (a != '0') 
        {
            var b = new Array();
            b = a.split('|');
            txtNoPemberkasanSatu.value = b[0];
            txtNoRegistrasi.value = b[1];

            //alert(b[1]);

            txtPID.value = b[2];
            txtNoNegosiasi.value = b[3];
            txtNoVisum.value = b[4];

            ddLanjut.value = b[5];
            txtKeterangan.value = b[6];
            if (b[7] == 1) {
                cbEksepsi.checked = b[7];
            }
            txtKetEks.value = b[8];
            reloadphoto(b[0]);
            //txtPerLahKet.value = b[5];
            //ddPerolehanLahan.value = b[6];
            //FilePerolehanLahan.value = b[7];
  
        }
    }

    function lockPemberkasanSatuView() 
    {
        txtNoPemberkasanSatu.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtPID.disabled = true;
        txtNoNegosiasi.disabled = true;
        txtNoVisum.disabled = true;
        ddPerolehanLahan.disabled = true;
        txtPerLahKet.disabled = true;
        ddPerolehanLahan.disabled = true;
        //FilePerolehanLahan.disabled = true;
        ddLanjut.disabled = true;
        txtKeterangan.disabled = true;
        cbEksepsi.disabled = true;
        txtKetEks.disabled = true;
        document.getElementById('btnSave').style.visibility = 'hidden';
    }

    function lockPemberkasanSatuEdit () {
        txtNoPemberkasanSatu.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtPID.disabled = true;
        txtNoNegosiasi.disabled = true;
        txtNoVisum.disabled = true;
    }

    function lockPemberkasanSatuDelete() {
        txtNoPemberkasanSatu.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtPID.disabled = true;
        txtNoNegosiasi.disabled = true;
        txtNoVisum.disabled = true;
        ddPerolehanLahan.disabled = true;
        txtPerLahKet.disabled = true;
        ddPerolehanLahan.disabled = true;
//        FilePerolehanLahan.disabled = true;
        ddLanjut.disabled = true;
        txtKeterangan.disabled = true;
        cbEksepsi.disabled = true;
        txtKetEks.disabled = true;
    }
    
    function PerolehanLahan() 
    {
        PerolehanLahan = new dhtmlXGridObject('gridPerolehanLahan');
        PerolehanLahan.setImagePath("../JavaScript/codebase/imgs/");
        PerolehanLahan.setHeader("No,Perolehan Lahan,Keterangan,File,Action");
        PerolehanLahan.setInitWidths("40,280,280,280,160");
        PerolehanLahan.setColAlign("left,left,left,left,left");
        PerolehanLahan.setColTypes("ro,ro,ro,ro,link");
        PerolehanLahan.init();
        PerolehanLahan.setSkin("dhx_skyblue");
        PerolehanLahan.setPagingSkin("bricks");
        PerolehanLahan.setColSorting("str,str,str,str,str");
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
                alert("Data Pemberkasan Tidak Dapat Di Hapus Karena Sudah Dilakukan Pembayaran");
                //window.location.replace(newUrl);
                close();
                break;
            case "noedit":
                alert("Data Pemberkasan Tidak Dapat Di Edit Karena Sudah Dilakukan Pembayaran");
                //window.location.replace(newUrl);
                close();
                break;
            case "gagal":
                alert("Data Pemberkasan Gagal Disimpan");
                //window.location.replace(newUrl);
                close();
                break;
            default:
                break;
        }

    }


    function onClientUploadCompletePemberkasan(sender, e) {
        document.getElementById('<%=namaFile.ClientID %>').value = e.get_postedUrl();
        ReloadPemberkasan(document.getElementById('<%=txtNoPemberkasanSatu.ClientID %>').value, document.getElementById('<%=namaFile.ClientID %>').value, document.getElementById('<%=txtPerLahKet.ClientID %>').value);
        alert('Data Berasil diUpload');
        
    }


    function ReloadPemberkasan(id, nama, ket) {

        SavePemberkasan(id, nama, ket);

        var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=DOCpic"
			    + "&IDPemberkasan=" + txtNoPemberkasanSatu.value
			    + "&param1=L"

			    + "";
        centerLoadingImage();
        PerolehanLahan.clearAll();
        PerolehanLahan.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }

    function reloadphoto(id) {

        //SavePemberkasan(id, nama, ket);

        var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=DOCpic"
			    + "&IDPemberkasan=" + txtNoPemberkasanSatu.value
			    + "&param1=L"

			    + "";
        centerLoadingImage();
        PerolehanLahan.clearAll();
        PerolehanLahan.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }

    function SavePemberkasan(id, nama, ket) {
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
			    + "&IDPemberkasan=" + txtNoPemberkasanSatu.value
			    + "&NAMA=" + b[0]
			    + "&KETERANGAN=" + ket
			    + "&NOMOR=" + b[1]
                + "&user=" + b[2]
			    + "&wilay=" + b[3]
			    + "&param1=I"
			    + "&param5=" + ddPerolehanLahan.value
			    + "";
+"";
        centerLoadingImage();
        PerolehanLahan.clearAll();
        PerolehanLahan.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }

    function ReloadDetail(nomorBayar) {

        //        alert(nomorBayar);
        var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=DOCpic"
			    + "&IDPemberkasan=" + nomorBayar
			    + "&param1=LD"

			    + "";
        centerLoadingImage();
        PerolehanLahan.clearAll();
        PerolehanLahan.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }


</script>

</asp:Content>

