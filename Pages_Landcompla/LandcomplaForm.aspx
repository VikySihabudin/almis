<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="LandcomplaForm.aspx.cs" Inherits="Pages_Landcompla_LandcomplaForm" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<input type="hidden" id="txtNamaProjectHid"/>
<input type="hidden" id="txtPICHid"/>
<input type="hidden" id="txtProjectAnalystHid"/>

<asp:HiddenField ID="namaFile" runat="server" />



<h1>Land Complaince</h1>
	
	<hr />    
    
    

		<div class="form-group">

            <label for="nama" class="control-label col-md-2">Nama Perusahaan</label>
            <div class="col-md-2">
             <asp:DropDownList ID="ddprs" runat="server" class="form-control">
             </asp:DropDownList>
            </div>
        </div>

         <div class="form-group">

            <label for="nama" class="control-label col-md-2">Nomor Complaince</label>
            <div class="col-md-2">
            <asp:TextBox ID="txtNmrComplaH" class="form-control input-md" runat="server"></asp:TextBox>
            </div>

         </div>

		<div class="form-group">

            <label for="nama" class="control-label col-md-2">Jenis Project</label>
            <div class="col-md-2">
             <asp:DropDownList ID="ddJenis" runat="server" class="form-control" onclick="handleClick()">
             <asp:ListItem Text="Hauling" Value="0"></asp:ListItem>
             <asp:ListItem Text="Pit" Value="1"></asp:ListItem>
             <asp:ListItem Text="Disposa" Value="2"></asp:ListItem>
             </asp:DropDownList>
            </div>
        </div>

        <div class="form-group">

            <label for="nama" class="control-label col-md-2">Nama Project</label>
            <div class="col-md-2">
            <asp:TextBox ID="txtNamaProject" class="form-control input-md" runat="server" ></asp:TextBox>
            </div>

            <div class="col-md-1">
            <input type="button" id="btnCariNamaProject" value="Search" class="btn btn-info btn-md" onclick="CariCplm()" />
            </div>
        </div>

<%--        <div class="form-group">

            <label for="nama" class="control-label col-md-2">Company</label>
            <div class="col-md-2">
            <asp:TextBox ID="TextBox15" class="form-control input-md" runat="server" ></asp:TextBox>
            </div>

            <div class="col-md-1">
            <input type="button" id="Button5" value="Cari" class="btn btn-info btn-md" onclick="refresh()" />
            </div>
        </div>--%>

        
        <div class="form-group">

            <label for="nama" class="control-label col-md-2">PIC</label>
            <div class="col-md-2">
            <asp:TextBox ID="txtPIC" class="form-control input-md" runat="server" ></asp:TextBox>
            </div>

            <div class="col-md-1">
            <input type="button" id="btnCariPIC" value="Search" class="btn btn-info btn-md" onclick="CariCplmpic()" />
            </div>
        </div>
        
        
        <div class="form-group">

            <label for="nama" class="control-label col-md-2">Project Analyst</label>
            <div class="col-md-2">
            <asp:TextBox ID="txtProjectAnalyst" class="form-control input-md" runat="server" ></asp:TextBox>
            </div>

            <div class="col-md-1">
            <input type="button" id="btnCariProjectAnalyst" value="Search" class="btn btn-info btn-md" onclick="CariCplmpana()" />
            </div>
        </div>

       <br />
         <hr />

       <iframe src="http://localhost/peta" width="100%" height="600"></iframe>

    <br />


        <div class="form-group">

            <label for="nama" class="control-label col-md-1">Legal Note</label>
			<div class="col-md-5">
		    <asp:TextBox id="txtUlasan" TextMode="multiline" class="form-control input-md" Columns="15" Rows="5" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="btnUlasan" value="Update" class="btn btn-info btn-md" onclick="refresh()" />
            </div>
        </div>

   <br />
   <hr />

        <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label6" runat="server" Text="Label">Start Date</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtStDAte" type="text" runat="server" class="form-control input-md" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label7" runat="server" Text="Label">Interval</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtInterv" type="text" runat="server" class="form-control" onkeypress="return numbersonly(event, false)" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label8" runat="server" Text="Label">End Date</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtEndDate" type="text" runat="server" class="form-control input-md" />
			</div>

        </div>

    <hr />


            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label44" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtTanggal" type="text" runat="server" class="form-control input-md" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label57" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtKeterangan" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="btnUpload" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridCompliance" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>


           
<%--       <div class="col-md-12">
            <div style=" width:550px; height:250px;">
                <div id="gridNmPro" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pageNmPro"> </div>
            </div>
        </div>
        --%>

    <hr />
    <br />
      
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



<%--DIALOG--%>

<div id="dialogcom" title="Cari Nama Project" style="font-size:small;">

    <br />

     <div class="form-group">      
       <div class="col-md-12">
            <div style=" width:550px; height:250px;">
                <div id="gridNmPro" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pageNmPro"> </div>
            </div>
        </div>
    </div>
        

</div>

<div id="dialogcompic" title="Cari PIC" style="font-size:small;">

    <br />

     <div class="form-group">      
       <div class="col-md-12">
            <div style=" width:550px; height:250px;">
                <div id="gridPic" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pagePic"> </div>
            </div>
        </div>
    </div>
        

</div>
<div id="dialogcompana" title="Cari Project Analyst" style="font-size:small;">

    <br />

     <div class="form-group">      
       <div class="col-md-12">
            <div style=" width:550px; height:250px;">
                <div id="gridProAnal" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pageProAnal"> </div>
            </div>
        </div>
    </div>
        

</div>


<script type="text/javascript">

    var localURL = "LandcomplaForm.aspx";

    var txtNmrComplaH = document.getElementById("<%=txtNmrComplaH.ClientID%>");
    var txtNamaProject = document.getElementById("<%=txtNamaProject.ClientID%>");
    var txtPIC = document.getElementById("<%=txtPIC.ClientID%>");
    var txtUlasan = document.getElementById("<%=txtUlasan.ClientID%>");
    var txtProjectAnalyst = document.getElementById("<%=txtProjectAnalyst.ClientID%>");
    var txtUlasan = document.getElementById("<%=txtUlasan.ClientID%>");
    var txtStDAte = document.getElementById("<%=txtStDAte.ClientID%>");
    var txtInterv = document.getElementById("<%=txtInterv.ClientID%>");
    var txtEndDate = document.getElementById("<%=txtEndDate.ClientID%>");
    
    var ddprs = document.getElementById("<%=ddprs.ClientID%>");
    var ddJenis = document.getElementById("<%=ddJenis.ClientID%>");


    var btnCariNamaProject = document.getElementById("btnCariNamaProject");
    var btnCariPIC = document.getElementById("btnCariPIC");
    var btnCariProjectAnalyst = document.getElementById("btnCariProjectAnalyst");
    var btnUlasan = document.getElementById("btnUlasan");
    var btnUpload = document.getElementById("btnUpload");
    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");

    var Hidmode = document.getElementById("Hidmode");
    var txtPICHid = document.getElementById("txtPICHid");
    var txtProjectAnalystHid = document.getElementById("txtProjectAnalystHid");
    var txtNamaProjectHid = document.getElementById("txtNamaProjectHid");


    lisNamaProject();
    listCompliance();
    lisPic();
    lisProjectAnalyst();
    SearchlisPic();
    SearchlisProjectAnalyst();
    SearchlisNmPro();

    terimaURL();



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
                + "&param2=" + txtNmrComplaH.value
                + "&param3="
                + "&param4=" + ddJenis.value
                + "&param5=" + txtNamaProjectHid.value
                + "&param6=" + txtPICHid.value
                + "&param7=" + txtProjectAnalystHid.value
                + "&param8=" + txtStDAte.value
                + "&param9=" + txtInterv.value
                + "&param10=" + txtEndDate.value
                + "&param11=" 
                +"&param12=" 
                + "&param13=" + ddprs.value
                + "&param14=" 
                + "";
        //alert(s);
        dhtmlxAjax.post(localURL, s, outputResponse);
    }

    $(function txtStDAte() {
        $("[id$=txtStDAte]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtEndDate() {
        $("[id$=txtEndDate]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtTanggal() {
        $("[id$=txtTanggal]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

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
                alert("Data Complaince Tidak Dapat Dihapus Karena Sudah Dilalukan Persiapan Dokumen");
                break;
            case "noedit":
                alert("Data Complaince Tidak Dapat Di Edit Karena Sudah Dilalukan Persiapan Dokumen");
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
            lockComplaEdit();
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
            dhtmlxAjax.post(localURL, s, bindFormCompla);

            var x = b[2].replace("param1=", "");

            if (x == 'V') {

                lockComplaView();
                hidMode.value = 'I';
            }

            else if (x == 'D') {
                lockComplaDelete();
                btnSave.value = 'Delete';
                hidMode.value = 'D';

            }
            else if (x == 'E') {

                lockComplaEdit();
                btnSave.value = 'Save';
                hidMode.value = 'E';


            }
        }

    }

    function bindFormCompla(loader) {
        //alert(loader.xmlDoc.responseText);
        var a = loader.xmlDoc.responseText;
        //        lockKlaimUser();
        if (a != '0') {
            var b = new Array();
            b = a.split('|');

            ddprs.value = b[0];
            txtNmrComplaH.value = b[0];
            txtNamaProject.value = b[2];
            txtPICHid.value = b[4];
            txtProjectAnalystHid.value = b[5];
            txtPIC.value = b[10];
            txtProjectAnalyst.value = b[11];
            txtStDAte.value = b[6];
            txtInterv.value = b[7];
            txtEndDate.value = b[8];
            ddJenis.value = b[3];
//            txtNamaProjectHid.value=b[];
           
        }
    }

    function lockComplaView() {

        txtNamaProject.disabled = true;
        txtPIC.disabled = true;
        txtProjectAnalyst.disabled = true;
        txtUlasan.disabled = true;
        txtNmrComplaH.disabled = true;
        txtEndDate.disabled = true;
        txtInterv.disabled = true;
        txtStDAte.disabled = true;

        ddJenis.disabled = true;
        ddprs.disabled = true;

        document.getElementById('btnSave').style.visibility = 'hidden';
        document.getElementById('btnCariNamaProject').style.visibility = 'hidden';
        document.getElementById('btnCariPIC').style.visibility = 'hidden';
        document.getElementById('btnCariProjectAnalyst').style.visibility = 'hidden';
        document.getElementById('btnUpload').style.visibility = 'hidden';
        document.getElementById('btnUlasan').style.visibility = 'hidden';
        


    }

    function lockComplaEdit() {
        txtNamaProject.disabled = true;
        txtPIC.disabled = true;
        txtProjectAnalyst.disabled = true;
        txtNmrComplaH.disabled = true;
    }

    function lockComplaDelete() {
        txtNamaProject.disabled = true;
        txtPIC.disabled = true;
        txtProjectAnalyst.disabled = true;
        txtNmrComplaH.disabled = true;
        txtUlasan.disabled = true;
        txtStDAte.disabled = true;
        txtInterv.disabled = true;
        txtEndDate.disabled = true;
        ddprs.disabled = true;
        ddJenis.disabled = true;
        document.getElementById('btnCariNamaProject').style.visibility = 'hidden';
        document.getElementById('btnCariPIC').style.visibility = 'hidden';
        document.getElementById('btnCariProjectAnalyst').style.visibility = 'hidden';
        document.getElementById('btnUpload').style.visibility = 'hidden';
        document.getElementById('btnUlasan').style.visibility = 'hidden';

    }







    function SearchlisNmPro() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=L"
        + "&param1="
        + "&param2="
        + "";
        lisNamaProject.clearAll();
        //lisNamaProject.loadXML(localURL + "?" + s);
    }

    function onRowSelectedNmPro(rowId, cellIndex) {

        txtNamaProjectHid.value = lisNamaProject.cells(rowId, 1).getValue();
        txtNamaProject.value = lisNamaProject.cells(rowId, 2).getValue();
        $("#dialogcom").dialog("close");

    }


    function SearchlisPic() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=L"
        + "&param1=LP"
        + "&param2=4"
        + "";
        lisPic.clearAll();
        lisPic.loadXML(localURL + "?" + s);
    }

    function onRowSelectedPIC(rowId, cellIndex) {

        txtPICHid.value = lisPic.cells(rowId, 1).getValue();
        txtPIC.value = lisPic.cells(rowId, 2).getValue();
        $("#dialogcompic").dialog("close");

    }

    function onRowSelectedProAnal(rowId, cellIndex) {

        txtProjectAnalystHid.value = lisProjectAnalyst.cells(rowId, 1).getValue();
        txtProjectAnalyst.value = lisProjectAnalyst.cells(rowId, 2).getValue();
        $("#dialogcompana").dialog("close");

    }
    function SearchlisProjectAnalyst() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=L"
        + "&param1=LP"
        + "&param2=4"
        + "";
        lisProjectAnalyst.clearAll();
        lisProjectAnalyst.loadXML(localURL + "?" + s);
    }

    function CariCplm() {

        $("#dialogcom").dialog("open");

    }

    $(function () {
        $("#dialogcom").dialog
        ({
            autoOpen: false,
            width: 610,
            height: 330,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogcom").dialog("close");
        });
    });

    function CariCplmpic() {

        $("#dialogcompic").dialog("open");

    }

    $(function () {
        $("#dialogcompic").dialog
        ({
            autoOpen: false,
            width: 610,
            height: 330,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogcompic").dialog("close");
        });
    });

    function CariCplmpana() {

        $("#dialogcompana").dialog("open");

    }

    $(function () {
        $("#dialogcompana").dialog
        ({
            autoOpen: false,
            width: 610,
            height: 330,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogcompana").dialog("close");
        });
    });

    

    $(function txtTgl() {
        $("[id$=txtTgl]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

  

    function SearchlistRequest() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=L"
        + "&param1=L"
        + "&param2=4"
        + "";
        listRequest.clearAll();
        listRequest.loadXML("../xml/Compliance.xml");
    }

    function lisNamaProject() {
        lisNamaProject = new dhtmlXGridObject('gridNmPro');
        lisNamaProject.setImagePath("../JavaScript/codebase/imgs/");
        lisNamaProject.setHeader("No.,Kode Project,Nama Project");
        lisNamaProject.setInitWidths("50,250,250");
        lisNamaProject.setColAlign("left,left,left");
        lisNamaProject.setColTypes("ro,ro,ro");
        lisNamaProject.init();
        lisNamaProject.setSkin("dhx_skyblue");

        lisNamaProject.attachEvent("onRowSelect", onRowSelectedNmPro);

        lisNamaProject.setColSorting("str,str,str");
        lisNamaProject.attachHeader("#text_filter,#text_filter,#text_filter");
        lisNamaProject.enablePaging(true, 15, 5, "pageNmPro", true);
        lisNamaProject.setPagingSkin("bricks");
    }

    function lisPic() {
        lisPic = new dhtmlXGridObject('gridPic');
        lisPic.setImagePath("../JavaScript/codebase/imgs/");
        lisPic.setHeader("No.,Kode PIC,Nama PIC");
        lisPic.setInitWidths("50,250,250");
        lisPic.setColAlign("left,left,left");
        lisPic.setColTypes("ro,ro,ro");
        lisPic.init();
        lisPic.setSkin("dhx_skyblue");

        lisPic.attachEvent("onRowSelect", onRowSelectedPIC);

        lisPic.setColSorting("str,str,str");
        lisPic.attachHeader("#text_filter,#text_filter,#text_filter");
        lisPic.enablePaging(true, 15, 5, "pagePic", true);
        lisPic.setPagingSkin("bricks");
    }

    function lisProjectAnalyst() {
        lisProjectAnalyst = new dhtmlXGridObject('gridProAnal');
        lisProjectAnalyst.setImagePath("../JavaScript/codebase/imgs/");
        lisProjectAnalyst.setHeader("No.,Kode Project Analyst,Name Project Analyst");
        lisProjectAnalyst.setInitWidths("50,250,250");
        lisProjectAnalyst.setColAlign("left,left,left");
        lisProjectAnalyst.setColTypes("ro,ro,ro");
        lisProjectAnalyst.init();
        lisProjectAnalyst.setSkin("dhx_skyblue");

        lisProjectAnalyst.attachEvent("onRowSelect", onRowSelectedProAnal);

        lisProjectAnalyst.setColSorting("str,str,str");
        lisProjectAnalyst.attachHeader("#text_filter,#text_filter,#text_filter");
        lisProjectAnalyst.enablePaging(true, 15, 5, "pageProAnal", true);
        lisProjectAnalyst.setPagingSkin("bricks");
    }

    function listCompliance() {
        listRequest = new dhtmlXGridObject('gridCompliance');
        listRequest.setImagePath("../JavaScript/codebase/imgs/");
        listRequest.setHeader("No.,Jenis Dokumen,Tanggal,Keterangan,File,Aksi");
        listRequest.setInitWidths("40,200,200,200,200,200");
        listRequest.setColAlign("left,left,left,left,left,left");
        listRequest.setColTypes("ro,ro,ro,ro,ro,link");
        listRequest.init();
        listRequest.setSkin("dhx_skyblue");
        listRequest.setPagingSkin("bricks");
        listRequest.setColSorting("str,str,str,str,str,str");

    }




</script>


</asp:Content>
