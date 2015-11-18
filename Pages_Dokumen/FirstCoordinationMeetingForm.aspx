<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="FirstCoordinationMeetingForm.aspx.cs" Inherits="Pages_Dokumen_LandManagementSupportForm" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />



<h1>Form First Coordination Meeting</h1>
	
	<hr />    
    
	<form role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Date</label>
            <div class="col-md-3"><asp:TextBox ID="txtDate" class="form-control input-md" runat="server" value="" ></asp:TextBox></div>			           
        </div>

        
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Company</label>
            <div class="col-md-3"><asp:TextBox ID="txtCompany" class="form-control input-md" runat="server" value= ""></asp:TextBox></div>
            <div class="col-md-3"><input type="button" id="BtnCompany" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Matter</label>
			<div class="col-md-3">
				<asp:TextBox id="txtMatter" TextMode="multiline" class="form-control input-md" value ="" Columns="15" Rows="3" runat="server"/>
			</div>
        </div>

        <hr />
		
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Request by Position</label>
            <div class="col-md-3"><asp:TextBox ID="txtRequestBy" class="form-control input-md" runat="server" value="" ></asp:TextBox></div>
            <div class="col-md-3"><input type="button" id="BtnRequstBy" value="Add Person"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>        
        </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="gridFCMF" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>



        <hr />

		
    <H3>In The First Coordination Meeting The Attendees Have :</H3>

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="LEksepsi" runat="server"  for="identitas" class="control-label col-md-2" Text="Identified Key Objectives And Their Relevant Issues" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
            <asp:CheckBox ID="cbIdentified" runat="server" text="Yes" onclick="validasi()" /></div>
        </div>
        </div>

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="Label1" runat="server"  for="identitas" class="control-label col-md-2" Text="Collect The Data And Information" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
            <asp:CheckBox ID="cbCollect" runat="server" text="Yes" onclick="validasi()" /></div>
        </div>
        </div>

        <hr />

        <h3>Signed By All Attendees :</h3>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">LMS Project Analyst</label>
            <div class="col-md-3"><asp:TextBox ID="txtLMSPA" class="form-control input-md" runat="server" value="" ></asp:TextBox></div>
            <div class="col-md-3"><input type="button" id="btnLMSPA" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>        
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">PIC Applicant Company</label>
            <div class="col-md-3"><asp:TextBox ID="txtPIC" class="form-control input-md" runat="server" value="" ></asp:TextBox></div>
            <div class="col-md-3"><input type="button" id="btnPIC" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>        
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">LMS Project Manager</label>
            <div class="col-md-3"><asp:TextBox ID="txtLMSPM" class="form-control input-md" runat="server" value="" ></asp:TextBox></div>
            <div class="col-md-3"><input type="button" id="btnLMSPM" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>        
        </div>

        <hr />

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label ID="LLanjut" for="identitas"  class="control-label col-md-2" runat="server" Text="Lanjut" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
                <asp:DropDownList ID="ddLanjut" runat="server" class="form-control input-md">
                <asp:ListItem Text="Tidak" Value="0"></asp:ListItem>
                <asp:ListItem Text="Tidak Lanjut" Value="1"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        </div>

    <br /><hr />

    <div class="form-group">
            <div class="col-md-10">
       
                     <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default"  onclick="btnClick(this)" PostBackUrl="~/Pages/PraRegistrasiForm.aspx"/> 
                     <input type="button" id="btnSave" value="Save"  class="btn btn-lg btn-success" onclick="btnClick(this)" />  
                     <input type="button" id="btnPrint" value="Print"  class="btn btn-info btn-lg" onclick="btnAdd(this)" />
              
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

    var txtDate = document.getElementById("<%= txtDate.ClientID %>");
    var txtCompany = document.getElementById("<%= txtCompany.ClientID %>");
    var txtMatter = document.getElementById("<%= txtMatter.ClientID %>");
    var txtRequestBy = document.getElementById("<%= txtRequestBy.ClientID %>");
    var cbIdentified = document.getElementById("<%= cbIdentified.ClientID %>");
    var cbCollect = document.getElementById("<%= cbCollect.ClientID %>");
    var txtLMSPA = document.getElementById("<%= txtLMSPA.ClientID %>");
    var txtPIC = document.getElementById("<%= txtPIC.ClientID %>");
    var txtLMSPM = document.getElementById("<%= txtLMSPM.ClientID %>");
    var ddLanjut = document.getElementById("<%= ddLanjut.ClientID %>");

    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");
    var btnPrint = document.getElementById("btnPrint");
    var Hidmode = document.getElementById("Hidmode");

    var BtnCompany = document.getElementById("BtnCompany");
    var BtnRequestBy = document.getElementById("BtnRequestBy");
    var btnLMSPA = document.getElementById("btnLMSPA");
    var btnPIC = document.getElementById("btnPIC");
    var btnLMSPM = document.getElementById("btnLMSPM");
    

    listFCMF();
    SearchlistFCMF();


    $(function txtDate() {
        $("[id$=txtDate]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    function SearchlistFCMF() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=L"
        + "&param1=L"
        + "&param2=4"
        + "";
        listFCMF.clearAll();
        listFCMF.loadXML("../xml/listFCMF.xml");
        //listplegal.loadXML(localURL + "?" + s);
    }


    function listFCMF() {
        listFCMF = new dhtmlXGridObject('gridFCMF');
        listFCMF.setImagePath("../JavaScript/codebase/imgs/");
        listFCMF.setHeader("No,Nama,Aksi");
        listFCMF.setInitWidths("40,200,200");
        listFCMF.setColAlign("left,left,left");
        listFCMF.setColTypes("ro,ro,link");
        listFCMF.init();
        listFCMF.setSkin("dhx_skyblue");
        listFCMF.setPagingSkin("bricks");
        listFCMF.setColSorting("str,str,str");
    }



</script>


</asp:Content>
