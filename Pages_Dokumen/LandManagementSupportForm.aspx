﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="LandManagementSupportForm.aspx.cs" Inherits="Pages_Dokumen_ServicesProjectForm" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />



<h1>Project Approval</h1>
	
	<hr />    

    
	<div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Date</label>
            <div class="col-md-3"><asp:TextBox ID="txtDate" class="form-control input-md" runat="server" value=""></asp:TextBox></div>			           
        </div>

        
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Company</label>
            <div class="col-md-3"><asp:TextBox ID="txtCompany" class="form-control input-md" runat="server" value= ""></asp:TextBox></div>
          <div class="col-md-3"><input type="button" id="BtnCompany" value="Search"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Project</label>
            <div class="col-md-3"><asp:TextBox ID="txtProject" class="form-control input-md" runat="server" value=""></asp:TextBox></div>
        </div>
		
        <div class="form-group">
            <label for="nama" class="control-label col-md-2">Objectives</label>
            <div class="col-md-3"><asp:TextBox ID="txtObjectives" class="form-control input-md" runat="server" value=""></asp:TextBox></div>
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Other Information</label>
			<div class="col-md-3">
				<asp:TextBox id="txtOtherInformation" TextMode="multiline" class="form-control input-md" value ="" Columns="15" Rows="3" runat="server" placeholder= ""/>
			</div>
        </div>

		
            <hr />

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Requested By :</label>
            <div class="col-md-3"><asp:TextBox ID="txtRequestBy" class="form-control input-md" runat="server" value= ""></asp:TextBox></div>
          <div class="col-md-3"><input type="button" id="BtnRequestBy" value="Search"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Acknowledged By :</label>
            <div class="col-md-3"><asp:TextBox ID="txtAcknowledgedBy" class="form-control input-md" runat="server" value= ""></asp:TextBox></div>
          <div class="col-md-3"><input type="button" id="BtnAcknowledgedBy" value="Search"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>
        </div>


		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Approved By :</label>
            <div class="col-md-3"><asp:TextBox ID="txtApprovedBy" class="form-control input-md" runat="server" value= ""></asp:TextBox></div>
          <div class="col-md-3"><input type="button" id="BtnApprovedBy" value="Search"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>
        </div>

        <hr />

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label ID="LLanjut" for="identitas"  class="control-label col-md-2" runat="server" Text="Lanjut" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
                <asp:DropDownList ID="ddLanjut" runat="server" class="form-control input-md">
                <asp:ListItem Text="Lanjut" Value="0"></asp:ListItem>
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

<script type="text/jscript">

    var txtDate = document.getElementById("<%= txtDate.ClientID %>");
    var txtCompany = document.getElementById("<%= txtCompany.ClientID %>");
    var txtProject = document.getElementById("<%= txtProject.ClientID %>");
    var txtObjectives = document.getElementById("<%= txtObjectives.ClientID %>");
    var txtOtherInformation = document.getElementById("<%= txtOtherInformation.ClientID %>");
    var txtRequestBy = document.getElementById("<%= txtRequestBy.ClientID %>");
    var txtAcknowledgedBy = document.getElementById("<%= txtAcknowledgedBy.ClientID %>");
    var txtApprovedBy = document.getElementById("<%= txtApprovedBy.ClientID %>");
    var ddLanjut = document.getElementById("<%= ddLanjut.ClientID %>");

    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");
    var btnPrint = document.getElementById("btnPrint");
    var Hidmode = document.getElementById("Hidmode");

    var BtnCompany = document.getElementById("BtnCompany");
    var BtnRequestBy = document.getElementById("BtnRequestBy");
    var BtnApprovedBy = document.getElementById("BtnApprovedBy");
   

            $(function txtDate() {
                $("[id$=txtDate]").datepicker({
                    dateFormat: "yy-mm-dd",
                    buttonImageOnly: true,
                    changeYear: true,
                    changeMonth: true,
                    yearRange: "1900:2100"
                });
            });
    
</script>



</asp:Content>
