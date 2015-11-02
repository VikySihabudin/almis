<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="PengukuranForm.aspx.cs" Inherits="Pages_Pengukuran" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:HiddenField ID="namaFile" runat="server" />
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>

<input type="hidden" id="hidMode" value="0" />
<input type="hidden" id="eksepsi" value="0" />
<input type="hidden" id="overlap" value="0" />
<input type="hidden" id="seq" value="0" />
<asp:Label ID="LIdent" runat="server" for="identitas" class="control-label col-md-2"  Font-Bold="True"></asp:Label>


<h2>Pengukuran</h2><br />
    
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
            <label for="identitas" class="control-label col-md-2">Nomor PID</label>
            <div class="col-md-3"><asp:TextBox id="txtPID" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
			<label for="identitas" class="control-label col-md-3">Tanggal Penjadwalan Pengukuran</label>
            <div class="col-md-3"><asp:TextBox id="txtTglPenPen" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Registrasi</label>
            <div class="col-md-3"><asp:TextBox id="txtNoRegistrasi" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nama Penjual</label>
            <div class="col-md-3"><asp:TextBox id="txtNmPen" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Identitas</label>
            <div class="col-md-3"><asp:TextBox id="txtNoIdentitas" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Handphone</label>
            <div class="col-md-3"><asp:TextBox id="txtNoHp" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Alamat</label>
            <div class="col-md-3"><asp:TextBox id="txtAlamat" TextMode="multiline" Columns="15" Rows="3" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Tanggal Registrasi</label>
            <div class="col-md-3"><asp:TextBox id="txtTglReg" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Lokasi Tanah</label>
            <div class="col-md-3">
                <asp:DropDownList ID="ddKabupaten" runat="server" class="form-control input-md"></asp:DropDownList>
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
        <div class="form-group">
        <label for="identitas" class="control-label col-sm-2">Overlap</label>
            <div class="col-md-5">    
                <div class="col-md-3"><asp:CheckBox ID="cbOverLap" runat="server" CssClass="form-control checkbox-md"  Text="" onclick="validasiOverlap()" /> </div>
            </div>
        </div>
    </div>

    <br />


    <div role="form" class="form-horizontal">
        <div class="form-group">            
                    <div class="col-md-3">
            <asp:Label runat="server" ID="myThrobber" Style="display: none;"><img align="absmiddle" alt="" src="../images/uploading.gif"/></asp:Label>
                <asp:AjaxFileUpload ID="FileGIFDUMP" runat="server"
                    onuploadcomplete="AjaxFileUploadGIFDUMP_UploadComplete" 
                    ThrobberID="myThrobber" 
                    MaximumNumberOfFiles="8" 
                    AllowedFileTypes="jpg,jpeg,png,pdf,doc,docx,xls,xlxs,txt,zip,rar,7z"
                    OnClientUploadComplete="onClientUploadCompletePengukuran"
                    ViewStateMode="Inherit"/>
            </div>
        </div>
          
    </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:100%; height:130px;">
                <div id="gridGIFD1" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>  
            </div>
        </div>
        </div>


        <div class="form-group">
            <div class="col-md-5">
                <input type="button" onclick="PopupGrid()" id="Button1" value="Tambah" class="btn btn-info btn-md" />
                
            </div>
        </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:100%; height:130px;">
                <div id="gridGIFD2" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>  
            </div>
        </div>
        </div>
    

    <hr />

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Tanggal Pengukuran</label>
            <div class="col-md-3"><asp:TextBox id="txtTglPeng" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nama PLK</label>
            <div class="col-md-3"><asp:TextBox id="txtNmPLK" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Luas PLK</label>
            <div class="col-md-3"><asp:TextBox id="txtLsPLK" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <hr />

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Tanggal GIFDUMP submit to LM</label>
            <div class="col-md-3"><asp:TextBox id="txtTglGIFDUMPtoLM" type="text" runat="server"  class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Tanggal GIFDUMP submit to Survey</label>
            <div class="col-md-3"><asp:TextBox id="txtTglGIFDUMPtoSurvey" type="text" runat="server"   class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Tanggal PLK Approval Survey</label>
            <div class="col-md-3"><asp:TextBox id="txtTglPLKApproveSurvey" type="text" runat="server"   class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Tanggal PLK Approval TS/HSE/RM</label>
            <div class="col-md-3"><asp:TextBox id="txtTglPLKApproveTS" type="text" runat="server"  class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Tanggal PLK Diterima LM</label>
            <div class="col-md-3"><asp:TextBox id="txtTglPLKditerimaLM" type="text" runat="server"   class="form-control input-md" placeholder= "..." /></div>
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
            <asp:Label  ID="LLanjut" runat="server"  for="identitas" class="control-label col-md-2"  Text="Lanjut" Font-Bold="True"></asp:Label>
            <div class="col-md-3"><asp:DropDownList ID="ddLanjut" runat="server"  class="form-control input-md"></asp:DropDownList></div>
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
            <asp:Label  ID="Label1" runat="server"  for="identitas" class="control-label col-md-2" Text="Keterangan" Font-Bold="True"></asp:Label>
            <div class="col-md-3"> <asp:TextBox id="txtKeterangan" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" runat="server" /></div>
        </div>
    </div>

    <%if (except.ToString() != "1")
    { %>        
            <%if (except.ToString() != "1")
            { %> 
            <div class="hidden">
            <%}%>

    <%}%>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="LEksepsi" runat="server"  for="identitas" class="control-label col-md-2" Text="Eksepsi" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
            <asp:CheckBox ID="cbEksepsi" runat="server"  CssClass="form-control checkbox-md" onclick="validasi()" /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label ID="LKEksepsi" runat="server" for="identitas" class="control-label col-md-2" Text="Keterangan Eksepsi" Font-Bold="True"></asp:Label>
            <div class="col-md-3"><asp:TextBox id="txtKetEksepsi" TextMode="multiline" Columns="15" Rows="3" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <%if (except.ToString() != "1")
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
 

    <div id="dialog" title="PLK Overlap" style="font-size:small;">
    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-3">Nama PLK</label>
            <div class="col-md-4">
                <asp:TextBox ID="txtNamaPLK" class="form-control input-md" runat="server"></asp:TextBox>
            </div>

            </div>
        <div class="form-group">
            <label for="identitas" class="control-label col-md-3">Luas PLK Overlap</label>
            <div class="col-md-4">
                <asp:TextBox ID="txtLuasOverlap" class="form-control input-md" runat="server" onkeypress="return numbersonly(event, false)"></asp:TextBox>
            </div>
            </div>
        <div class="form-group">
            <label for="identitas" class="control-label col-md-3">Status</label>
            <div class="col-md-4">
                <asp:TextBox ID="txtStatus" class="form-control input-md" runat="server"></asp:TextBox>
            </div>
        </div>
    
    <div role="form" class="form-horizontal">
        <div class="form-group">
            <div class="col-md-11" align="right">
                <input type="button" id="PopupbtnSaveKondisiLahan" value="Save" runat="server" class="btn btn-md btn-success" onclick="SaveOverlap()" />
            </div>
        </div>
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


   


<script type="text/javascript">

    $(function txtTglPeng() {
        $("[id$=txtTglPeng]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtTglReg() {
        $("[id$=txtTglReg]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });


    $(function txtTglPenPen() {
        $("[id$=txtTglPenPen]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });



    $(function TglPengukuran() {
        $("[id$=txtTglPengukuran]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function TglGIFDUMPtoLM() {
        $("[id$=txtTglGIFDUMPtoLM]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function TglGIFDUMPtoSurvey() {
        $("[id$=txtTglGIFDUMPtoSurvey]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function TglPLKApproveSurvey() {
        $("[id$=txtTglPLKApproveSurvey]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function TglPLKApproveTS() {
        $("[id$=txtTglPLKApproveTS]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function TglPLKditerimaLM() {
        $("[id$=txtTglPLKditerimaLM]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

</script>




<script type="text/javascript">

    var localURL = "PengukuranForm.aspx";
    var newUrl = "PengukuranList.aspx";
    var txtPID = document.getElementById("<%= txtPID.ClientID %>");
    var txtNoRegistrasi = document.getElementById("<%= txtNoRegistrasi.ClientID %>");
    var txtTglPenPen = document.getElementById("<%= txtTglPenPen.ClientID %>");    //penjadwalanpengukuran
    var txtNmPen = document.getElementById("<%= txtNmPen.ClientID %>");
    var txtNoIdentitas = document.getElementById("<%= txtNoIdentitas.ClientID %>");
    var txtNoHp = document.getElementById("<%= txtNoHp.ClientID %>");
    var txtAlamat = document.getElementById("<%= txtAlamat.ClientID %>");
    var txtTglReg = document.getElementById("<%= txtTglReg.ClientID %>");
    var ddKabupaten = document.getElementById("<%= ddKabupaten.ClientID %>");
    var ddKecamatan = document.getElementById("<%= ddKecamatan.ClientID %>");
    var ddDesa = document.getElementById("<%= ddDesa.ClientID %>");
    var txtTglPenPen = document.getElementById("<%= txtTglPenPen.ClientID %>");
    var cbOverLap = document.getElementById("<%= cbOverLap.ClientID %>").checked;
    var txtTglPeng = document.getElementById("<%= txtTglPeng.ClientID %>");
    var txtNmPLK = document.getElementById("<%= txtNmPLK.ClientID %>");
    var txtLsPLK = document.getElementById("<%= txtLsPLK.ClientID %>");
    var txtTglGIFDUMPtoLM = document.getElementById("<%= txtTglGIFDUMPtoLM.ClientID %>");
    var txtTglGIFDUMPtoSurvey = document.getElementById("<%= txtTglGIFDUMPtoSurvey.ClientID %>");
    var txtTglPLKApproveSurvey = document.getElementById("<%= txtTglPLKApproveSurvey.ClientID %>");
    var txtTglPLKApproveTS = document.getElementById("<%= txtTglPLKApproveTS.ClientID %>");
    var txtTglPLKditerimaLM = document.getElementById("<%= txtTglPLKditerimaLM.ClientID %>");
    var ddLanjut = document.getElementById("<%= ddLanjut.ClientID %>");
    var txtKeterangan = document.getElementById("<%= txtKeterangan.ClientID %>");
    var cbEksepsi = document.getElementById("<%= cbEksepsi.ClientID %>").checked;
    var txtKetEksepsi = document.getElementById("<%= txtKetEksepsi.ClientID %>");

    var txtNamaPLK = document.getElementById("<%= txtNamaPLK.ClientID %>");
    var txtLuasOverlap = document.getElementById("<%= txtLuasOverlap.ClientID %>");
    var txtStatus = document.getElementById("<%= txtStatus.ClientID %>");

    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");
    var btnDelete = document.getElementById("btnDelete");
    var hidMode = document.getElementById('hidMode');
    var seq = document.getElementById('seq');
    var LIdent = document.getElementById("<%= LIdent.ClientID %>");
    var ddprs = document.getElementById("<%= ddprs.ClientID %>"); 


    function validasi() {
        if (document.getElementById("<%= cbEksepsi.ClientID %>").checked) {
            eksepsi.value = '1';
        } else {
            eksepsi.value = '0';
        }
    }

    function validasiOverlap() {
        if (document.getElementById("<%= cbOverLap.ClientID %>").checked) {
            overlap.value = '1';
        } else {
            overlap.value = '0';
        }
    }




    listGIFD1();
    listGIFD2();
    terimaURL();


    function terimaURL() {

        var url = window.location.toString();
        //ambil bagian parameternya
        url.match(/\?(.+)$/);
        var params = RegExp.$1;
        // pisahkan parameter URL ke associative array
        var params = '&' + params;

        splitparam(params);

       // alert(params);
    }

    function splitparam(loader) {

        var a = loader;
        if (a != '0') {
            var b = new Array();
            b = a.split('&');
        }
        //alert(b[2].replace("param1=", ""));
        ReloadOverlap(b[3].replace("param2=", ""));

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=V"
			+ "&param1=V"
			+ "&param2=" + b[3].replace("param2=", "")
			+ "";

        // alert(s);
        dhtmlxAjax.post(localURL, s, bindFormPengukuran);

        ReloadDetail(b[3].replace("param2=", ""));

        var x = b[2].replace("param1=", "");
        //alert(x);

        //alert(b[2]);

        if (x == 'V') {
            lockPengukuranView();
            //alert('cccc');

        }

        else if (x == 'D') {
            lockPengukuranDelete();
            btnSave.value = 'Delete';
            hidMode.value = 'D';

            
        }
        else if (x == 'E') {
            lockPengukuranEdit();
            btnSave.value = 'Save';
            hidMode.value = 'E';       

        }
       // alert(hidMode.value);
    }


    //alert(hidMode.value);

    function btnClick(objBtn) {
        switch (objBtn.value) {
            case "Save":
                //alert(hidMode.value);
                crud(hidMode.value)
               
                break;
                //alert(hidMode.value);


            case "Delete":
                if (objBtn.id == 'btnSave') {
                    if (confirm("Hapus Data Ini?"))
                 crud(hidMode.value);
                }
                break;

            case "Cancel":
                close();
                break;

            default:
                break;
        }
    }


    function crud(tipe) {
        if (ddLanjut.value == 1) {
            if (txtTglPeng.value == '' && hidMode.value == !'D') {
                alert("Tanggal Pengukuran Tidak Boleh Kosong");
                txtTglPeng.focus();
            } 
            else if (txtNmPLK.value == '' && hidMode.value==!'D') {
                alert("Nama Plk Tidak Boleh Kosong");
                txtNmPLK.focus();
            }
            else if (txtLsPLK.value == '' && hidMode.value==!'D') {
                alert("Luas Plk Tidak Boleh Kosong");
                txtLsPLK.focus();
            }
            else {
                var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=" + tipe.replace("param1=", "")
                + "&param2=" + LIdent.value
                + "&param3=" + txtPID.value
                + "&param4="
                + "&param5=" + txtNoRegistrasi.value
                + "&param6=" + txtTglPenPen.value
                + "&param7=" + overlap.value
                + "&param8=" + txtTglPeng.value
                + "&param9=" + txtTglGIFDUMPtoLM.value
                + "&param10=" + txtTglGIFDUMPtoSurvey.value
                + "&param11=" + txtTglPLKApproveSurvey.value
                + "&param12=" + txtTglPLKApproveTS.value
                + "&param13=" + txtTglPLKditerimaLM.value
                + "&param14=" + ddLanjut.value
                + "&param15=" + txtKeterangan.value
                + "&param16=" + eksepsi.value
                + "&param17=" + txtKetEksepsi.value
                + "&param18="
                + "&param19="
                + "&param20=" +
                + "&param21=" + txtNmPLK.value
                + "&param22=" + txtLsPLK.value
                + "&param23=" + ddprs.value
                + "";
               //   alert(s);

                dhtmlxAjax.post(localURL, s, outputResponse);
                //        if (autorisasi.value.indexOf("A") == -1)
                //            btnAdd.disabled = true;
                //        else if (autorisasi.value.indexOf("A") != -1)}
            }
        }
        else {
            var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=" + tipe.replace("param1=", "")
                + "&param2=" + txtPID.value
                + "&param3="
                + "&param4=" + txtNoRegistrasi.value
                + "&param5=" + txtTglPenPen.value
                + "&param6=" + overlap.value
                + "&param7=" + txtTglPeng.value
                + "&param8=" + txtTglGIFDUMPtoLM.value
                + "&param9=" + txtTglGIFDUMPtoSurvey.value
                + "&param10=" + txtTglPLKApproveSurvey.value
                + "&param11=" + txtTglPLKApproveTS.value
                + "&param12=" + txtTglPLKditerimaLM.value
                + "&param13=" + ddLanjut.value
                + "&param14=" + txtKeterangan.value
                + "&param15=" + eksepsi.value
                + "&param16=" + txtKetEksepsi.value
                + "&param17="
                + "&param18="
                + "&param19="
                + "&param20=" + LIdent.value
                + "&param21=" + txtNmPLK.value
                + "&param22=" + txtLsPLK.value
              //alert(s);

            dhtmlxAjax.post(localURL, s, outputResponse);
            //        if (autorisasi.value.indexOf("A") == -1)
            //            btnAdd.disabled = true;
            //        else if (autorisasi.value.indexOf("A") != -1)}}
        }
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
            case "Z":
                alert("Nmr PID Sudah Ada");
                txtPID.focus();
                //window.location.replace(newUrl);
                //close();
                break;
            case "nodelete":
                alert("Data Pengukuran T0 Tidak Dapat Di Hapus Karena Sudah Dilakukan Pemberkasan");
                //window.location.replace(newUrl);
                close();
                break;
            case "noedit":
                alert("Data Pengukuran T0 Tidak Dapat Di Edit Karena Sudah Dilakukan Pemberkasan");
                //window.location.replace(newUrl);
                close();
                break;
            case "noadd":
                alert("Data Pengukuran T0 Tidak Dapat Di Assign Karena Sudah Dilakukan Pemberkasan");
                //window.location.replace(newUrl);
                close();
                break;
            case "gagal":
                alert("Data Pengukuran T0 Gagal Disimpan");
                //window.location.replace(newUrl);
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

    




    function bindFormPengukuran(loader) {
        //alert(loader.xmlDoc.responseText);
        
        var a = loader.xmlDoc.responseText;
        //lockPengukuran();
        if (a != '0') {
            var b = new Array();
            b = a.split('|');
            txtPID.value = b[0];
            txtNoRegistrasi.value = b[2];
            txtTglPenPen.value = b[3];
            txtNmPen.value = b[4]; //namapenjual
            txtNoIdentitas.value = b[5];
            txtNoHp.value = b[6];
            txtAlamat.value = b[7];
            txtTglReg.value = b[8];
            txtKetEksepsi.value = b[9];
            //alert(b[8]);
            //cbEksepsi.value = b[8];
            if (b[10] == '1') {
                //cbEksepsi.checked = true;
                document.getElementById("<%= cbEksepsi.ClientID %>").checked = true;
                eksepsi.value = b[10];
                //alert('x');
            }            
            txtTglPeng.value = b[11];
            txtTglGIFDUMPtoLM.value = b[12];
            txtTglGIFDUMPtoSurvey.value = b[13];
            txtTglPLKApproveSurvey.value = b[14];
            txtTglPLKApproveTS.value = b[15];
            txtTglPLKditerimaLM.value = b[16];
            txtKeterangan.value = b[17];

            //alert(b[16]);
            ddLanjut.value = b[18];
            
            if (b[19] == '1') {
                //cbEksepsi.checked = true;
                document.getElementById("<%= cbOverLap.ClientID %>").checked = true;   
       
                overlap.value = b[19];
                //alert('x');
            }
            LIdent.value = b[20];
            txtNmPLK.value = b[21];
            txtLsPLK.value = b[22];    
       }
    }

    function lockPengukuranView() {
            
        txtPID.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtTglPenPen.disabled = true;
        txtNmPen.disabled = true;
        txtNoIdentitas.disabled = true;
        txtNoHp.disabled = true;
        txtAlamat.disabled = true;
        txtTglReg.disabled = true;
        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;
        cbOverLap.disabled = true;
        txtTglPeng.disabled = true;
        txtNmPLK.disabled = true;
        txtLsPLK.disabled = true;
        txtTglGIFDUMPtoLM.disable = true;
        txtTglGIFDUMPtoSurvey.disable = true;
        txtTglPLKApproveSurvey.disable = true;
        txtTglPLKApproveTS.disable = true;
        txtTglPLKditerimaLM.disable = true;
        txtKeterangan.disable = true;
       // document.getElementById("document").setAttribute('disabled', 'disabled');
       // document.getElementById("cbOverLap").disabled = true;

//        fuGIFDUMP.disabled = true;
//        txtTglPenPen.disabled = true;
//        txtNmPLK.disabled = true;
//        txtLsPLK.disabled = true;
        
        cbEksepsi.disable = true;
        txtKetEksepsi.disable = true;

        document.getElementById('btnSave').style.visibility = 'hidden';



    }

    function lockPengukuranEdit() {
       // txtPID.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtTglPenPen.disabled = true;
        ddLanjut.disabled = false;
        txtNmPen.disabled = true;
        txtNoIdentitas.disabled = true;
        txtNoHp.disabled = true;
        txtAlamat.disabled = true;
        txtTglReg.disabled = true;
        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;
        cbOverLap.disabled = false;
        
        
    }

    function lockPengukuranDelete() {
        txtPID.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtTglPenPen.disabled = true;
        txtNmPen.disabled = true;
        txtNoIdentitas.disabled = true;
        txtNoHp.disabled = true;
        txtAlamat.disabled = true;
        txtTglReg.disabled = true;
        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;
        txtTglPenPen.disabled = true;
        txtNmPLK.disabled = true;
        txtLsPLK.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtNmPen.disabled = true;
        txtNoIdentitas.disabled = true;
        txtNoHp.disabled = true;
        txtTglReg.disabled = true;
        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;
 
    }

    



    function listGIFD1() {
        listGIFD1 = new dhtmlXGridObject('gridGIFD1');
        listGIFD1.setImagePath("../JavaScript/codebase/imgs/");
        listGIFD1.setHeader("No,File,Aksi,#cspan");
        listGIFD1.setInitWidths("50,200,200");
        listGIFD1.setColAlign("left,link,link");
        listGIFD1.setColTypes("ro,ro,link");
        listGIFD1.init();
        listGIFD1.setSkin("dhx_skyblue");
        listGIFD1.setPagingSkin("bricks");
        listGIFD1.setColSorting("str,str,str");
    }

    function listGIFD2() {
        listGIFD2 = new dhtmlXGridObject('gridGIFD2');
        listGIFD2.setImagePath("../JavaScript/codebase/imgs/");
        listGIFD2.setHeader("No,Nama PLK Overlap,Luas Overlap(m2),Status lahan,id,seq");
        listGIFD2.setInitWidths("40,200,200,200,0,0");
        listGIFD2.setColAlign("left,left,left,left,left,left");
        listGIFD2.setColTypes("ro,ro,ro,ro,ro,ro");
        listGIFD2.init();
        listGIFD2.setSkin("dhx_skyblue");
        listGIFD2.attachEvent("onRowSelect", onRowSelected);
        listGIFD2.setPagingSkin("bricks");
        listGIFD2.setColSorting("str,str,str,str,str,str");
    }


    function onClientUploadCompletePengukuran(sender, e) {
        document.getElementById('<%=namaFile.ClientID %>').value = e.get_postedUrl();
        ReloadPengukuran(document.getElementById('<%=txtNoRegistrasi.ClientID %>').value, document.getElementById('<%=namaFile.ClientID %>').value);
        alert('Data Berasil diUpload');
    }


    function ReloadPengukuran(id, nama) {
        SavePengukuran(id, nama);
//        alert('cc');

        var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=DOCpic"
			    + "&IDREGISTRASI=" + txtNoRegistrasi.value
			    + "&param1=LG"

			    + "";
        centerLoadingImage();
        listGIFD1.clearAll();
        listGIFD1.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }

    function SavePengukuran(id, nama) {
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
			    + "&IDREGISTRASI=" + txtNoRegistrasi.value
			    + "&NAMA=" + b[0]
			    + "&KETERANGAN=" //+ ket
			    + "&NOMOR=" + b[1]
                + "&user=" + b[2]
			    + "&wilay=" + b[3]
			    + "&param1=I"
			    + "";
+"";
        centerLoadingImage();
        listGIFD1.clearAll();
        listGIFD1.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }

    function ReloadDetail(nomorRegistrasi) {

        //        alert(nomorBayar);
        var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=DOCpic"
			    + "&IDREGISTRASI=" + nomorRegistrasi
			    + "&param1=LG"

			    + "";
        centerLoadingImage();
        listGIFD1.clearAll();
        listGIFD1.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }

    $(function () {
        $("#dialog").dialog
        ({
            autoOpen: false,
            width: 600,
            height: 400,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialog").dialog("close");
        });
    });


    function PopupGrid() {
            $("#dialog").dialog("open");
    }

    function SaveOverlap() {
        var s = ""
                  + "rnd=" + Math.random() * 4
                  + "&sm=ID"
                  + "&param1=I"
                  + "&param2=" + LIdent.value
                  + "&param3=" + txtPID.value
                  + "&param4=" + txtNamaPLK.value
                  + "&param5=" + txtLuasOverlap.value
                  + "&param6=" + txtStatus.value
                  + "&param7=" + seq.value
                  + "";
        dhtmlxAjax.post(localURL, s);
        alert("Data PLK Berhasil Ditambah")
        SearchlistOverlap(LIdent.value);
        $("#dialog").dialog("close");
    }


    function SearchlistOverlap(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=SD"
                  + "&param1=L"
                  + "&param2=" + id
			+ "";
        listGIFD2.clearAll();
        listGIFD2.loadXML(localURL + "?" + s);
    }

    function ReloadOverlap(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=SD"
                  + "&param1=LS"
                  + "&param2=" + id
			+ "";
        listGIFD2.clearAll();
        listGIFD2.loadXML(localURL + "?" + s);
    }

    function onRowSelected(rowId, cellIndex) {
        txtNamaPLK.value = listGIFD2.cells(rowId, 1).getValue();
        txtLuasOverlap.value = listGIFD2.cells(rowId, 2).getValue();
        txtStatus.value = listGIFD2.cells(rowId, 3).getValue();
        seq.value = listGIFD2.cells(rowId, 5).getValue();
        //alert('a');
        $("#dialog").dialog("open");

    }

</script>

</asp:Content>

