<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="ServicesProjectForm.aspx.cs" Inherits="Pages_Dokumen_ServicesProjectForm" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />



<h1>Form Request</h1>
	
	<hr class="style-four">    
    
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
				<asp:TextBox id="txtMatter" TextMode="multiline" class="form-control input-md" value ="" Columns="15" Rows="3" runat="server" />
			</div>
        </div>
		
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Request By</label>
            <div class="col-md-3"><asp:TextBox ID="txtRequestBy" class="form-control input-md" runat="server" value="" ></asp:TextBox></div>
            <div class="col-md-3"><input type="button" id="BtnRequestBy" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>
        </div>
		
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Department</label>
            <div class="col-md-3"><asp:TextBox ID="txtDepartment" class="form-control input-md" runat="server" value="" ></asp:TextBox></div>
            <div class="col-md-3"><input type="button" id="BtnDepartment" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>
        </div>
    
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Position</label>
            <div class="col-md-3"><asp:TextBox ID="txtPosition" class="form-control input-md" runat="server" value="" ></asp:TextBox></div>
        </div>
		

        <div class="form-group">
            <label for="nama" class="control-label col-md-2">Budgeted</label>
            <asp:CheckBox ID="CBBudgeted" runat="server" class="control-label col-md-2" Text="  Yes"/>
        </div>
        <%--<div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="LEksepsi" runat="server"  for="identitas" class="control-label col-md-2" Text="Budgeted" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
            <asp:CheckBox ID="cbEksepsi" runat="server" text="Yes"  onclick="validasi()" /></div>
        </div>
        </div>--%>
		
            <hr />

        <h3>Detail Information :</h3>

        <div class="form-group">
            <label for="nama" class="control-label col-md-2">Key Objectives</label>
            <div class="col-md-3">
            <asp:TextBox id="txtKey" type="text" runat="server" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" />    
            </div>
        </div>

        <div class="form-group">
            <label for="nama" class="control-label col-md-2">Background & Historical Information</label>
            <div class="col-md-3">
            <asp:TextBox id="txtBackground" type="text" runat="server" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" />    
            </div>
        </div>

        <div class="form-group">
            <label for="nama" class="control-label col-md-2">Data Of Land Location, Size And Challanges:</label>
            <div class="col-md-3">
            <asp:TextBox id="txtDataOfLocation" type="text" runat="server" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" />    
            </div>
        </div>

        <div class="form-group">
            <label for="nama" class="control-label col-md-2">Data Of Current Resources And PIC:</label>
            <div class="col-md-3">
            <asp:TextBox id="txtDataOfCurrent" type="text" runat="server" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" />    
            </div>
        </div>

            <hr />

        <h3>Type Of Support</h3>

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="Label1" runat="server"  for="identitas" class="control-label col-md-2" Text="Training" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
            <asp:CheckBox ID="CBTraining" runat="server" />
            <%--<asp:CheckBox ID="CheckBox1" runat="server"   onclick="validasi()" /></div>--%>
        </div>
        </div>

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="Label2" runat="server"  for="identitas" class="control-label col-md-2" Text="Research And Consultation Visit" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
            <asp:CheckBox ID="CBResearch" runat="server"  onclick="validasi()" /></div>
        </div>
        </div>

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="Label3" runat="server"  for="identitas" class="control-label col-md-2" Text="Documentation Review" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
            <asp:CheckBox ID="CBDocumentation" runat="server"   onclick="validasi()" /></div>
        </div>
        </div>

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="Label4" runat="server"  for="identitas" class="control-label col-md-2" Text="Communication And Liase Support" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
            <asp:CheckBox ID="CBCommunication" runat="server"   onclick="validasi()" /></div>
        </div>
        </div>

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="Label5" runat="server"  for="identitas" class="control-label col-md-2" Text="Others" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
            <asp:CheckBox ID="CBOthers" runat="server"   onclick="validasi()" /></div>
        </div>
        </div>

        <div class="form-group">
            <label for="nama" class="control-label col-md-2">Other Information</label>
            <div class="col-md-3">
            <asp:TextBox id="txtOtherInformation" type="text" runat="server" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3"  />    
            </div>
        </div>

            <hr />

        <h3>Requester Approval</h3>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Requested By (PIC Applicant)</label>
            <div class="col-md-3"><asp:TextBox ID="txtRequestByPIC" class="form-control input-md" runat="server" value="" ></asp:TextBox></div>
             <div class="col-md-3"><input type="button" id="btnRequestByPIC" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>     
        
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Acknowledged By (DGM/GM/Director)</label>
            <div class="col-md-3"><asp:TextBox ID="txtAcknowledged" class="form-control input-md" runat="server" value="" ></asp:TextBox></div>
             <div class="col-md-3"><input type="button" id="btnAcknowledged" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>     
        </div>

            <hr />

        <h3>APM Review</h3>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Recorded By (LMS Project Analyst)</label>
            <div class="col-md-3"><asp:TextBox ID="txtRecordedPA" class="form-control input-md" runat="server" value="" ></asp:TextBox></div>
             <div class="col-md-3"><input type="button" id="BtnRecordedPA" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>     
        
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Recorded By (LMS Project Manager)</label>
            <div class="col-md-3"><asp:TextBox ID="txtRecordedPM" class="form-control input-md" runat="server" value="" ></asp:TextBox></div>
             <div class="col-md-3"><input type="button" id="BtnRecordedPM" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>     
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Checked By (LMS Division Head)</label>
            <div class="col-md-3"><asp:TextBox ID="txtChecked" class="form-control input-md" runat="server" value="" ></asp:TextBox></div>
             <div class="col-md-3"><input type="button" id="BtnChecked" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>     
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Approve By (Operation Director)</label>
            <div class="col-md-3"><asp:TextBox ID="txtApproved" class="form-control input-md" runat="server" value="" ></asp:TextBox></div>
             <div class="col-md-3"><input type="button" id="btnApproved" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>     
        </div>

        <hr />

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label ID="LLanjut" for="identitas"  class="control-label col-md-2" runat="server" Text="Lanjut" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
             <asp:DropDownList ID="ddLanjut" runat="server" class="form-control" onclick="handleClick()">
             <asp:ListItem Text="Tidak" Value="0"></asp:ListItem>
             <asp:ListItem Text="Lanjut" Value="1"></asp:ListItem>
                 
             
             </asp:DropDownList>
                <%--<asp:DropDownList ID="ddLanjut" runat="server" class="form-control input-md" ></asp:DropDownList>--%>
                            
            </div>
        </div>
        </div>



    <br /><hr />

    <div class="form-group">
            <div class="col-md-10">
       
                     <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default"  onclick="btnClick(this)" PostBackUrl="~/Pages/PraRegistrasiForm.aspx"/> 
                     <input type="button" id="btnSave" value="Save"  class="btn btn-lg btn-success" onclick="btnClick(this)" />  
                     <input type="button" id="Button9" value="Print"  class="btn btn-info btn-lg" onclick="btnAdd(this)" />  
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

<script type="text/jscript">


    var txtDate = document.getElementById("<%= txtDate.ClientID %>");
    var txtCompany = document.getElementById("<%= txtCompany.ClientID %>");
    var txtMatter = document.getElementById("<%= txtMatter.ClientID %>");
    var txtRequestBy = document.getElementById("<%= txtRequestBy.ClientID %>");
    var txtDepartment = document.getElementById("<%= txtDepartment.ClientID %>");
    var txtPosition = document.getElementById("<%= txtPosition.ClientID %>");
    var CBBudgeted = document.getElementById("<%= CBBudgeted.ClientID %>");
    var txtKey = document.getElementById("<%= txtKey.ClientID %>");
    var txtBackground = document.getElementById("<%= txtBackground.ClientID %>");
    var txtDataOfLocation = document.getElementById("<%= txtDataOfLocation.ClientID %>");
    var txtDataOfCurrent = document.getElementById("<%= txtDataOfCurrent.ClientID %>");
    var CBTraining = document.getElementById("<%= CBTraining.ClientID %>");
    var CBResearch = document.getElementById("<%= CBResearch.ClientID %>");
    var CBDocumentation = document.getElementById("<%= CBDocumentation.ClientID %>");
    var CBCommunication = document.getElementById("<%= CBCommunication.ClientID %>");
    var CBOthers = document.getElementById("<%= CBOthers.ClientID %>");
    var txtOtherInformation = document.getElementById("<%= txtOtherInformation.ClientID %>");
    var txtRequestByPIC = document.getElementById("<%= txtRequestByPIC.ClientID %>");
    var txtAcknowledged = document.getElementById("<%= txtAcknowledged.ClientID %>");
    var txtRecordedPA = document.getElementById("<%= txtRecordedPA.ClientID %>");
    var txtRecordedPM = document.getElementById("<%= txtRecordedPM.ClientID %>");
    var txtChecked = document.getElementById("<%= txtChecked.ClientID %>");
    var txtApproved = document.getElementById("<%= txtApproved.ClientID %>");
    var ddLanjut = document.getElementById("<%= ddLanjut.ClientID %>");

    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");
    var Hidmode = document.getElementById("Hidmode");

    var BtnCompany = document.getElementById("BtnCompany");
    var BtnRequestBy = document.getElementById("BtnRequestBy");
    var BtnDepartment = document.getElementById("BtnDepartment");
    var btnRequestByPIC = document.getElementById("btnRequestByPIC");
    var btnAcknowledged = document.getElementById("btnAcknowledged");
    var BtnRecordedPA = document.getElementById("BtnRecordedPA");
    var BtnRecordedPM = document.getElementById("BtnRecordedPM");
    var BtnChecked = document.getElementById("BtnChecked");
    var btnApproved = document.getElementById("btnApproved");


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
