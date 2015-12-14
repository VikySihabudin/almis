<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="ServicesProjectForm.aspx.cs" Inherits="Pages_Dokumen_ServicesProjectForm" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<input type="hidden" id="txtCompanyHid" value="0" />
<input type="hidden" id="txtRequestByHid" value="0" />
<input type="hidden" id="txtDepartmentHid" value="0" />
<input type="hidden" id="txtRequestByPICHid" value="0" />
<input type="hidden" id="txtAcknowledgedHid" value="0" />
<input type="hidden" id="txtRecordedPAHid" value="0" />
<input type="hidden" id="txtRecordedPMHid" value="0" />
<input type="hidden" id="txtCheckedHid" value="0" />
<input type="hidden" id="txtApprovedHid" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />



<h1>Request</h1>
	
	<hr />    
    
	<div role="form" class="form-horizontal" action="#">
          <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nama Perusahaan</label>
            <div class="col-md-3">
                <asp:DropDownList ID="ddprs" runat="server" class="form-control">
                </asp:DropDownList>
            </div>			           
        </div>

         <div class="form-group">
            <label for="nama" class="control-label col-md-2">No Request</label>
            <div class="col-md-3"><asp:TextBox ID="txtIDRequest" class="form-control input-md" runat="server" value= ""></asp:TextBox></div>          
        </div>

         <div class="form-group">
            <label for="nama" class="control-label col-md-2">No Persiapan</label>
            <div class="col-md-3"><asp:TextBox ID="txtIDPersiapan" class="form-control input-md" runat="server" value= ""></asp:TextBox></div>          
        </div>

        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Date</label>
            <div class="col-md-3"><asp:TextBox ID="txtDate" class="form-control input-md" runat="server" value="" ></asp:TextBox></div>			           
        </div>

        
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Company</label>
            <div class="col-md-3"><asp:TextBox ID="txtCompany" class="form-control input-md" runat="server" value= "" ReadOnly="true"></asp:TextBox></div>
          <div class="col-md-3"><input type="button" id="BtnCompany" value="Search"  class="btn btn-info btn-md" onclick="CariCompany()" /></div>
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Matter</label>
			<div class="col-md-3">
				<asp:TextBox id="txtMatter" TextMode="multiline" class="form-control input-md" value ="" Columns="15" Rows="3" runat="server" />
			</div>
        </div>
		
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Request By</label>
            <div class="col-md-3"><asp:TextBox ID="txtRequestBy" class="form-control input-md" runat="server" value="" ReadOnly="true" ></asp:TextBox></div>
            <div class="col-md-3"><input type="button" id="BtnRequestBy" value="Search"  class="btn btn-info btn-md" onclick="CariReqBy()" /></div>
        </div>
		
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Department</label>
            <div class="col-md-3"><asp:TextBox ID="txtDepartment" class="form-control input-md" runat="server" value="" ReadOnly="true"></asp:TextBox></div>
            <div class="col-md-3"><input type="button" id="BtnDepartment" value="Search"  class="btn btn-info btn-md" onclick="CariDepartement()" /></div>
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
            <div class="col-md-3"><asp:TextBox ID="txtRequestByPIC" class="form-control input-md" runat="server" value="" ReadOnly="true" ></asp:TextBox></div>
             <div class="col-md-3"><input type="button" id="btnRequestByPIC" value="Search"  class="btn btn-info btn-md" onclick="CariPicApp()" /></div>     
        
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Acknowledged By (DGM/GM/Director)</label>
            <div class="col-md-3"><asp:TextBox ID="txtAcknowledged" class="form-control input-md" runat="server" value="" ReadOnly="true"></asp:TextBox></div>
             <div class="col-md-3"><input type="button" id="btnAcknowledged" value="Search"  class="btn btn-info btn-md" onclick="CariAcknowledged()" /></div>     
        </div>

            <hr />

        <h3>APM Review</h3>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Recorded By (LMS Project Analyst)</label>
            <div class="col-md-3"><asp:TextBox ID="txtRecordedPA" class="form-control input-md" runat="server" value="" ReadOnly="true"></asp:TextBox></div>
             <div class="col-md-3"><input type="button" id="BtnRecordedPA" value="Search"  class="btn btn-info btn-md" onclick="CariPA()" /></div>     
        
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Recorded By (LMS Project Manager)</label>
            <div class="col-md-3"><asp:TextBox ID="txtRecordedPM" class="form-control input-md" runat="server" value="" ReadOnly="true"></asp:TextBox></div>
             <div class="col-md-3"><input type="button" id="BtnRecordedPM" value="Search"  class="btn btn-info btn-md" onclick="CariPM()" /></div>     
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Checked By (LMS Division Head)</label>
            <div class="col-md-3"><asp:TextBox ID="txtChecked" class="form-control input-md" runat="server" value="" ReadOnly="true"></asp:TextBox></div>
             <div class="col-md-3"><input type="button" id="BtnChecked" value="Search"  class="btn btn-info btn-md" onclick="CariDH()" /></div>     
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Approve By (Operation Director)</label>
            <div class="col-md-3"><asp:TextBox ID="txtApproved" class="form-control input-md" runat="server" value="" ReadOnly="true"></asp:TextBox></div>
             <div class="col-md-3"><input type="button" id="btnApproved" value="Search"  class="btn btn-info btn-md" onclick="CariOD()" /></div>     
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

<div id="dialogcompany" title="Search Name Company" style="font-size:small;">

    <br />

     <div class="form-group">      
       <div class="col-md-12">
            <div style=" width:550px; height:250px;">
                <div id="gridNmCompnay" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pageNmCompany"> </div>
            </div>
        </div>
    </div>
        

</div> 

<div id="dialogReqBy" title="Search Name Request By" style="font-size:small;">

    <br />

     <div class="form-group">      
       <div class="col-md-12">
            <div style=" width:550px; height:250px;">
                <div id="gridReqBy" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pageReqBy"> </div>
            </div>
        </div>
    </div>
        

</div>

<div id="dialogDepartment" title="Search Name Depeartement" style="font-size:small;">

    <br />

     <div class="form-group">      
       <div class="col-md-12">
            <div style=" width:550px; height:250px;">
                <div id="gridDepartment" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pageDepartment"> </div>
            </div>
        </div>
    </div>
        

</div>

<div id="dialogPicApp" title="Search Requested By (PIC Applicant)" style="font-size:small;">

    <br />

     <div class="form-group">      
       <div class="col-md-12">
            <div style=" width:550px; height:250px;">
                <div id="gridPicApp" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pagePicApp"> </div>
            </div>
        </div>
    </div>
        

</div>

<div id="dialogAcknowledged" title="Search Acknowledged By (DGM/GM/Director)" style="font-size:small;">

    <br />

     <div class="form-group">      
       <div class="col-md-12">
            <div style=" width:550px; height:250px;">
                <div id="gridAcknowledged" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pageAcknowledged"> </div>
            </div>
        </div>
    </div>
        

</div>

<div id="dialogPA" title="Search Recorded By (LMS Project Analyst)" style="font-size:small;">

    <br />

     <div class="form-group">      
       <div class="col-md-12">
            <div style=" width:550px; height:250px;">
                <div id="gridPA" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pagePA"> </div>
            </div>
        </div>
    </div>
        

</div>

<div id="dialogPM" title="Search Recorded By (LMS Project Manager)" style="font-size:small;">

    <br />

     <div class="form-group">      
       <div class="col-md-12">
            <div style=" width:550px; height:250px;">
                <div id="gridPM" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pagePM"> </div>
            </div>
        </div>
    </div>
        

</div>

<div id="dialogDH" title="Search Checked By (LMS Division Head)" style="font-size:small;">

    <br />

     <div class="form-group">      
       <div class="col-md-12">
            <div style=" width:550px; height:250px;">
                <div id="gridDH" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pageDH"> </div>
            </div>
        </div>
    </div>
        

</div>

<div id="dialogOD" title="Search Approve By (Operation Director)" style="font-size:small;">

    <br />

     <div class="form-group">      
       <div class="col-md-12">
            <div style=" width:550px; height:250px;">
                <div id="gridOD" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pageOD"> </div>
            </div>
        </div>
    </div>
        

</div>

<script type="text/jscript">

    var localURL = "ServicesProjectForm.aspx";

    var ddprs = document.getElementById("<%=ddprs.ClientID%>");
    var txtIDRequest = document.getElementById("<%= txtIDRequest.ClientID %>");
    var txtIDPersiapan = document.getElementById("<%= txtIDPersiapan.ClientID %>");
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
    var hidMode = document.getElementById("hidMode");

    var BtnCompany = document.getElementById("BtnCompany");
    var BtnRequestBy = document.getElementById("BtnRequestBy");
    var BtnDepartment = document.getElementById("BtnDepartment");
    var btnRequestByPIC = document.getElementById("btnRequestByPIC");
    var btnAcknowledged = document.getElementById("btnAcknowledged");
    var BtnRecordedPA = document.getElementById("BtnRecordedPA");
    var BtnRecordedPM = document.getElementById("BtnRecordedPM");
    var BtnChecked = document.getElementById("BtnChecked");
    var btnApproved = document.getElementById("btnApproved");

    var txtCompanyHid = document.getElementById("txtCompanyHid");
    var txtRequestByHid = document.getElementById("txtRequestByHid");
    var txtDepartmentHid = document.getElementById("txtDepartmentHid");
    var txtRequestByPICHid = document.getElementById("txtRequestByPICHid");
    var txtRecordedPAHid = document.getElementById("txtRecordedPAHid");
    var txtRecordedPMHid = document.getElementById("txtRecordedPMHid");
    var txtCheckedHid = document.getElementById("txtCheckedHid");
    var txtApprovedHid = document.getElementById("txtApprovedHid");


    lisNamaCompany();
    lisNamaRequestBy();
    lisNamaDepartment();
    lisNamaPicApp();
    lisNamaAcknowledged();
    lisNamaPA();
    lisNamaPM();
    lisNamaDH();
    lisNamaOD();

    SearchlisRequestBy();
    SearchlisNamaCompany();
    SearchlisDepartment();
    SearchlisPicApp();
    SearchlisAcknowledged();
    SearchlisPA();
    SearchlisPM();
    SearchlisDH();
    SearchlisOD();

    terimaURL();

    //Menampilkan Tanggal Jquery
    $(function txtDate() {
        $("[id$=txtDate]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    // Rumus CRUD
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
            lockRequestEdit();
        }

    }
    //Pemisahan Paramaeter dengan split
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
            dhtmlxAjax.post(localURL, s, bindFormRequest);

            var x = b[2].replace("param1=", "");

            if (x == 'V') {

                lockRequestView();
                hidMode.value = 'I';
            }

            else if (x == 'D') {
                lockRequestDelete();
                btnSave.value = 'Delete';
                hidMode.value = 'D';

            }
            else if (x == 'E') {

                lockRequestEdit();
                btnSave.value = 'Save';
                hidMode.value = 'E';


            }
        }

    }
    //fungsi text tidak aktif untuk melihat data saja
    function lockRequestView() {

        txtIDRequest.disabled = true;
        txtIDPersiapan.disabled = true;
        txtDate.disabled = true;
        txtMatter.disabled = true;
        txtPosition.disabled = true;
        CBBudgeted.disabled = true;
        txtKey.disabled = true;
        txtBackground.disabled = true;
        txtDataOfLocation.disabled = true;
        txtDataOfCurrent.disabled = true;
        CBTraining.disabled = true;
        CBResearch.disabled = true;
        CBDocumentation.disabled = true;
        CBCommunication.disabled = true;
        CBOthers.disabled = true;

        ddprs.disabled = true;
        ddLanjut.disabled = true;
        

        //button
        document.getElementById('btnSave').style.visibility = 'hidden';       

        document.getElementById('BtnCompany').style.visibility = 'hidden';
        document.getElementById('BtnRequestBy').style.visibility = 'hidden';
        document.getElementById('BtnDepartment').style.visibility = 'hidden';
        document.getElementById('btnRequestByPIC').style.visibility = 'hidden';
        document.getElementById('btnAcknowledged').style.visibility = 'hidden';
        document.getElementById('BtnRecordedPA').style.visibility = 'hidden';
        document.getElementById('BtnChecked').style.visibility = 'hidden';
        document.getElementById('btnApproved').style.visibility = 'hidden';     


    }
    //fungsi text tidak aktif untuk melihat data saja
    function lockRequestEdit() {
        txtIDRequest.disabled = true;
        txtIDPersiapan.disabled = true;

    }
    //fungsi text tidak aktif untuk di delete
    function lockRequestDelete() {
        txtIDRequest.disabled = true;
        txtIDPersiapan.disabled = true;
        txtDate.disabled = true;
        txtMatter.disabled = true;
        txtPosition.disabled = true;
        CBBudgeted.disabled = true;
        txtKey.disabled = true;
        txtBackground.disabled = true;
        txtDataOfLocation.disabled = true;
        txtDataOfCurrent.disabled = true;
        CBTraining.disabled = true;
        CBResearch.disabled = true;
        CBDocumentation.disabled = true;
        CBCommunication.disabled = true;
        CBOthers.disabled = true;

        ddprs.disabled = true;
        ddLanjut.disabled = true;

        //button
        document.getElementById('btnSave').style.visibility = 'hidden';
        document.getElementById('BtnCompany').style.visibility = 'hidden';
        document.getElementById('BtnRequestBy').style.visibility = 'hidden';
        document.getElementById('BtnDepartment').style.visibility = 'hidden';
        document.getElementById('btnRequestByPIC').style.visibility = 'hidden';
        document.getElementById('btnAcknowledged').style.visibility = 'hidden';
        document.getElementById('BtnRecordedPA').style.visibility = 'hidden';
        document.getElementById('BtnChecked').style.visibility = 'hidden';
        document.getElementById('btnApproved').style.visibility = 'hidden';

    }
    function bindFormRequest(loader) {
        //alert(loader.xmlDoc.responseText);
        var a = loader.xmlDoc.responseText;
        //        lockKlaimUser();
        if (a != '0') {
            var b = new Array();
            b = a.split('|');

            //alert(b[12]);

            ddprs.value = b[0];
            txtIDRequest.value = b[1];
            txtIDPersiapan.value = b[2];
            txtDate.value = b[3];
            txtCompany.value = b[4];
            txtMatter.value = b[5];
            txtRequestBy.value = b[6];
            txtDepartment.value = b[7];
            txtPosition.value = b[8];
            CBBudgeted.value = b[9];
            txtKey.value = b[10];
            txtBackground.value = b[11];
            txtDataOfLocation.value = b[12];
            txtDataOfCurrent.value = b[13];
            CBTraining.value = b[14];
            CBResearch.value = b[15];
            CBDocumentation.value = b[16];
            CBCommunication.value = b[17];
            CBOthers.value = b[18];
            txtOtherInformation.value = b[19];
            txtRequestByPIC.value = b[20];
            txtAcknowledged.value = b[21];
            txtRecordedPA.value = b[22];
            txtRecordedPM.value = b[23];
            txtChecked.value = b[24];
            txtApproved.value = b[25];
            ddLanjut.value = b[26];

        }

        SearchlisRequestBy();
        SearchlisNamaCompany();
        SearchlisDepartment();
        SearchlisPicApp();
        SearchlisAcknowledged();
        SearchlisPA();
        SearchlisPM();
        SearchlisDH();
        SearchlisOD();
    }
    //  event button
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

    // untuk fungsi CRUD
    function CRUD(tipe) {

        var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=" + hidMode.value
                + "&param2=" + txtIDRequest.value
                + "&param3="
                + "&param4=" + txtIDPersiapan.value
                + "&param5=" + txtDate.value
                + "&param6=" + txtCompany.value
                + "&param7=" + txtMatter.value
                + "&param8=" + txtRequestBy.value
                + "&param9=" + txtDepartment.value
                + "&param10=" + txtPosition.value
                + "&param11=" //+ CBBudgeted.value
                + "&param12=" + txtKey.value
                + "&param13=" + txtBackground.value
                + "&param14=" + txtDataOfLocation.value
                + "&param15=" + txtDataOfCurrent.value
                + "&param16=" //+ CBTraining.value
                + "&param17=" //+ //CBResearch.value
                + "&param18=" //+ //CBDocumentation.value
                + "&param19=" //+ //CBCommunication.value
                + "&param20=" //+ //CBOthers.value
                + "&param21=" + txtOtherInformation.value
                + "&param22=" + txtRequestByPIC.value
                + "&param23=" + txtAcknowledged.value
                + "&param24=" + txtRecordedPA.value
                + "&param25=" + txtRecordedPM.value
                + "&param26=" + txtChecked.value
                + "&param27=" + txtApproved.value
                + "&param28=" //+ //ddLanjut.value
                + "&param31=" + ddprs.value
                + "";       
        alert(hidMode.value);
       dhtmlxAjax.post(localURL, s, outputResponse);
    }
    //-------------------------------------------------------------------
    // Search Company
    function onRowSelectedNmCompany(rowId, cellIndex) {
        txtCompanyHid.value = lisNamaCompany.cells(rowId, 1).getValue();
        txtCompany.value = lisNamaCompany.cells(rowId, 2).getValue();
        $("#dialogcompany").dialog("close");
        
    }

    function CariCompany() {
        $("#dialogcompany").dialog("open");
    }

    function SearchlisNamaCompany() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=LC"
        + "&param1=LC"
        + "";

        lisNamaCompany.clearAll();
        lisNamaCompany.loadXML(localURL + "?" + s);
    }

    $(function () {
        $("#dialogcompany").dialog
        ({
            autoOpen: false,
            width: 610,
            height: 330,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogcompany").dialog("close");
        });
    });

    function lisNamaCompany() {
        lisNamaCompany = new dhtmlXGridObject('gridNmCompnay');
        lisNamaCompany.setImagePath("../JavaScript/codebase/imgs/");
        lisNamaCompany.setHeader("No.,Kode Perusahaan,Nama Perusahaan");
        lisNamaCompany.setInitWidths("50,250,250");
        lisNamaCompany.setColAlign("left,left,left");
        lisNamaCompany.setColTypes("ro,ro,ro");
        lisNamaCompany.init();
        lisNamaCompany.setSkin("dhx_skyblue");

        lisNamaCompany.attachEvent("onRowSelect", onRowSelectedNmCompany);

        lisNamaCompany.setColSorting("str,str,str");
        lisNamaCompany.attachHeader("#text_filter,#text_filter,#text_filter");
        lisNamaCompany.enablePaging(true, 15, 5, "pageNmCompany", true);
        lisNamaCompany.setPagingSkin("bricks");
    }    
    //------------------------------------------------------------------
    // Search Request By
    function onRowSelectedReqBy(rowId, cellIndex) {
        txtRequestByHid.value = lisNamaRequestBy.cells(rowId, 1).getValue();
        txtRequestBy.value    = lisNamaRequestBy.cells(rowId, 2).getValue();
        $("#dialogReqBy").dialog("close");        
    }

    function CariReqBy() {
        $("#dialogReqBy").dialog("open");
    }

    function SearchlisRequestBy() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=LB"
        + "&param1=LB"
        + "";

        lisNamaRequestBy.clearAll();
        lisNamaRequestBy.loadXML(localURL + "?" + s);
    }

    $(function () {
        $("#dialogReqBy").dialog
        ({
            autoOpen: false,
            width: 610,
            height: 330,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogReqBy").dialog("close");
        });
    });

    function lisNamaRequestBy() {
        lisNamaRequestBy = new dhtmlXGridObject('gridReqBy');
        lisNamaRequestBy.setImagePath("../JavaScript/codebase/imgs/");
        lisNamaRequestBy.setHeader("No.,Kode User,Nama User");
        lisNamaRequestBy.setInitWidths("50,250,250");
        lisNamaRequestBy.setColAlign("left,left,left");
        lisNamaRequestBy.setColTypes("ro,ro,ro");
        lisNamaRequestBy.init();
        lisNamaRequestBy.setSkin("dhx_skyblue");

        lisNamaRequestBy.attachEvent("onRowSelect", onRowSelectedReqBy);

        lisNamaRequestBy.setColSorting("str,str,str");
        lisNamaRequestBy.attachHeader("#text_filter,#text_filter,#text_filter");
        lisNamaRequestBy.enablePaging(true, 15, 5, "pageReqBy", true);
        lisNamaRequestBy.setPagingSkin("bricks");
    }
    //------------------------------------------------------------------
    // Search Department
    function onRowSelectedDepartment(rowId, cellIndex) {
        txtDepartmentHid.value = lisNamaDepartment.cells(rowId, 1).getValue();
        txtDepartment.value = lisNamaDepartment.cells(rowId, 2).getValue();
        $("#dialogDepartment").dialog("close");
    }

    function CariDepartement() {
        $("#dialogDepartment").dialog("open");
    }

    function SearchlisDepartment() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=LD"
        + "&param1=LD"
        + "";

        lisNamaDepartment.clearAll();
        lisNamaDepartment.loadXML(localURL + "?" + s);
    }

    $(function () {
        $("#dialogDepartment").dialog
        ({
            autoOpen: false,
            width: 610,
            height: 330,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogDepartment").dialog("close");
        });
    });

    function lisNamaDepartment() {
        lisNamaDepartment = new dhtmlXGridObject('gridDepartment');
        lisNamaDepartment.setImagePath("../JavaScript/codebase/imgs/");
        lisNamaDepartment.setHeader("No.,Kode Departement,Nama Departement");
        lisNamaDepartment.setInitWidths("50,250,250");
        lisNamaDepartment.setColAlign("left,left,left");
        lisNamaDepartment.setColTypes("ro,ro,ro");
        lisNamaDepartment.init();
        lisNamaDepartment.setSkin("dhx_skyblue");

        lisNamaDepartment.attachEvent("onRowSelect", onRowSelectedDepartment);

        lisNamaDepartment.setColSorting("str,str,str");
        lisNamaDepartment.attachHeader("#text_filter,#text_filter,#text_filter");
        lisNamaDepartment.enablePaging(true, 15, 5, "pageDepartment", true);
        lisNamaDepartment.setPagingSkin("bricks");
    }
    //------------------------------------------------------------------
    // Search Requested By (PIC Applicant)
    function onRowSelectedPicApp(rowId, cellIndex) {
        txtRequestByPICHid.value = lisNamaPicApp.cells(rowId, 1).getValue();
        txtRequestByPIC.value = lisNamaPicApp.cells(rowId, 2).getValue();
        $("#dialogPicApp").dialog("close");
    }

    function CariPicApp() {
        $("#dialogPicApp").dialog("open");
    }

    function SearchlisPicApp() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=LP"
        + "&param1=LP"
        + "";

        lisNamaPicApp.clearAll();
        lisNamaPicApp.loadXML(localURL + "?" + s);
    }

    $(function () {
        $("#dialogPicApp").dialog
        ({
            autoOpen: false,
            width: 610,
            height: 330,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogPicApp").dialog("close");
        });
    });

    function lisNamaPicApp() {
        lisNamaPicApp = new dhtmlXGridObject('gridPicApp');
        lisNamaPicApp.setImagePath("../JavaScript/codebase/imgs/");
        lisNamaPicApp.setHeader("No.,Kode User,Nama User");
        lisNamaPicApp.setInitWidths("50,250,250");
        lisNamaPicApp.setColAlign("left,left,left");
        lisNamaPicApp.setColTypes("ro,ro,ro");
        lisNamaPicApp.init();
        lisNamaPicApp.setSkin("dhx_skyblue");

        lisNamaPicApp.attachEvent("onRowSelect", onRowSelectedPicApp);

        lisNamaPicApp.setColSorting("str,str,str");
        lisNamaPicApp.attachHeader("#text_filter,#text_filter,#text_filter");
        lisNamaPicApp.enablePaging(true, 15, 5, "pagePicApp", true);
        lisNamaPicApp.setPagingSkin("bricks");
    }

    //------------------------------------------------------------------
    // Search Acknowledged By (DGM/GM/Director)
    function onRowSelectedAcknowledged(rowId, cellIndex) {
        txtAcknowledgedHid.value = lisNamaAcknowledged.cells(rowId, 1).getValue();
        txtAcknowledged.value = lisNamaAcknowledged.cells(rowId, 2).getValue();
        $("#dialogAcknowledged").dialog("close");
    }

    function CariAcknowledged() {
        $("#dialogAcknowledged").dialog("open");
    }

    function SearchlisAcknowledged() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=LA"
        + "&param1=LA"
        + "";

        lisNamaAcknowledged.clearAll();
        lisNamaAcknowledged.loadXML(localURL + "?" + s);
    }

    $(function () {
        $("#dialogAcknowledged").dialog
        ({
            autoOpen: false,
            width: 610,
            height: 330,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogAcknowledged").dialog("close");
        });
    });

    function lisNamaAcknowledged() {
        lisNamaAcknowledged = new dhtmlXGridObject('gridAcknowledged');
        lisNamaAcknowledged.setImagePath("../JavaScript/codebase/imgs/");
        lisNamaAcknowledged.setHeader("No.,Kode User,Nama User");
        lisNamaAcknowledged.setInitWidths("50,250,250");
        lisNamaAcknowledged.setColAlign("left,left,left");
        lisNamaAcknowledged.setColTypes("ro,ro,ro");
        lisNamaAcknowledged.init();
        lisNamaAcknowledged.setSkin("dhx_skyblue");

        lisNamaAcknowledged.attachEvent("onRowSelect", onRowSelectedAcknowledged);

        lisNamaAcknowledged.setColSorting("str,str,str");
        lisNamaAcknowledged.attachHeader("#text_filter,#text_filter,#text_filter");
        lisNamaAcknowledged.enablePaging(true, 15, 5, "pageAcknowledged", true);
        lisNamaAcknowledged.setPagingSkin("bricks");
    }
    //------------------------------------------------------------------
    // Search Recorded By (LMS Project Analyst)
    function onRowSelectedPA(rowId, cellIndex) {
        txtRecordedPAHid.value = lisNamaPA.cells(rowId, 1).getValue();
        txtRecordedPA.value = lisNamaPA.cells(rowId, 2).getValue();
        $("#dialogPA").dialog("close");
    }

    function CariPA() {
        $("#dialogPA").dialog("open");
    }

    function SearchlisPA() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=LPA"
        + "&param1=LPA"
        + "";

        lisNamaPA.clearAll();
        lisNamaPA.loadXML(localURL + "?" + s);
    }

    $(function () {
        $("#dialogPA").dialog
        ({
            autoOpen: false,
            width: 610,
            height: 330,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogPA").dialog("close");
        });
    });

    function lisNamaPA() {
        lisNamaPA = new dhtmlXGridObject('gridPA');
        lisNamaPA.setImagePath("../JavaScript/codebase/imgs/");
        lisNamaPA.setHeader("No.,Kode User,Nama User");
        lisNamaPA.setInitWidths("50,250,250");
        lisNamaPA.setColAlign("left,left,left");
        lisNamaPA.setColTypes("ro,ro,ro");
        lisNamaPA.init();
        lisNamaPA.setSkin("dhx_skyblue");

        lisNamaPA.attachEvent("onRowSelect", onRowSelectedPA);

        lisNamaPA.setColSorting("str,str,str");
        lisNamaPA.attachHeader("#text_filter,#text_filter,#text_filter");
        lisNamaPA.enablePaging(true, 15, 5, "pagePA", true);
        lisNamaPA.setPagingSkin("bricks");
    }
    //------------------------------------------------------------------
    // Search Recorded By (LMS Project Manager)
    function onRowSelectedPM(rowId, cellIndex) {
        txtRecordedPMHid.value = lisNamaPM.cells(rowId, 1).getValue();
        txtRecordedPM.value = lisNamaPM.cells(rowId, 2).getValue();
        $("#dialogPM").dialog("close");
    }

    function CariPM() {
        $("#dialogPM").dialog("open");
    }

    function SearchlisPM() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=LPM"
        + "&param1=LPM"
        + "";

        lisNamaPM.clearAll();
        lisNamaPM.loadXML(localURL + "?" + s);
    }

    $(function () {
        $("#dialogPM").dialog
        ({
            autoOpen: false,
            width: 610,
            height: 330,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogPM").dialog("close");
        });
    });

    function lisNamaPM() {
        lisNamaPM = new dhtmlXGridObject('gridPM');
        lisNamaPM.setImagePath("../JavaScript/codebase/imgs/");
        lisNamaPM.setHeader("No.,Kode User,Nama User");
        lisNamaPM.setInitWidths("50,250,250");
        lisNamaPM.setColAlign("left,left,left");
        lisNamaPM.setColTypes("ro,ro,ro");
        lisNamaPM.init();
        lisNamaPM.setSkin("dhx_skyblue");

        lisNamaPM.attachEvent("onRowSelect", onRowSelectedPM);

        lisNamaPM.setColSorting("str,str,str");
        lisNamaPM.attachHeader("#text_filter,#text_filter,#text_filter");
        lisNamaPM.enablePaging(true, 15, 5, "pagePM", true);
        lisNamaPM.setPagingSkin("bricks");
    }
    //------------------------------------------------------------------
    // Search Checked By (LMS Division Head)
    function onRowSelectedDH(rowId, cellIndex) {
        txtCheckedHid.value = lisNamaDH.cells(rowId, 1).getValue();
        txtChecked.value = lisNamaDH.cells(rowId, 2).getValue();
        $("#dialogDH").dialog("close");
    }

    function CariDH() {
        $("#dialogDH").dialog("open");
    }

    function SearchlisDH() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=LDH"
        + "&param1=LDH"
        + "";

        lisNamaDH.clearAll();
        lisNamaDH.loadXML(localURL + "?" + s);
    }

    $(function () {
        $("#dialogDH").dialog
        ({
            autoOpen: false,
            width: 610,
            height: 330,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogDH").dialog("close");
        });
    });

    function lisNamaDH() {
        lisNamaDH = new dhtmlXGridObject('gridDH');
        lisNamaDH.setImagePath("../JavaScript/codebase/imgs/");
        lisNamaDH.setHeader("No.,Kode User,Nama User");
        lisNamaDH.setInitWidths("50,250,250");
        lisNamaDH.setColAlign("left,left,left");
        lisNamaDH.setColTypes("ro,ro,ro");
        lisNamaDH.init();
        lisNamaDH.setSkin("dhx_skyblue");

        lisNamaDH.attachEvent("onRowSelect", onRowSelectedDH);

        lisNamaDH.setColSorting("str,str,str");
        lisNamaDH.attachHeader("#text_filter,#text_filter,#text_filter");
        lisNamaDH.enablePaging(true, 15, 5, "pageDH", true);
        lisNamaDH.setPagingSkin("bricks");
    }
    //------------------------------------------------------------------
    // Search Approve By (Operation Director)
    function onRowSelectedOD(rowId, cellIndex) {
        txtApprovedHid.value = lisNamaOD.cells(rowId, 1).getValue();
        txtApproved.value = lisNamaOD.cells(rowId, 2).getValue();
        $("#dialogOD").dialog("close");
    }

    function CariOD() {
        $("#dialogOD").dialog("open");
    }

    function SearchlisOD() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=LOD"
        + "&param1=LOD"
        + "";

        lisNamaOD.clearAll();
        lisNamaOD.loadXML(localURL + "?" + s);
    }

    $(function () {
        $("#dialogOD").dialog
        ({
            autoOpen: false,
            width: 610,
            height: 330,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogOD").dialog("close");
        });
    });

    function lisNamaOD() {
        lisNamaOD = new dhtmlXGridObject('gridOD');
        lisNamaOD.setImagePath("../JavaScript/codebase/imgs/");
        lisNamaOD.setHeader("No.,Kode User,Nama User");
        lisNamaOD.setInitWidths("50,250,250");
        lisNamaOD.setColAlign("left,left,left");
        lisNamaOD.setColTypes("ro,ro,ro");
        lisNamaOD.init();
        lisNamaOD.setSkin("dhx_skyblue");

        lisNamaOD.attachEvent("onRowSelect", onRowSelectedOD);

        lisNamaOD.setColSorting("str,str,str");
        lisNamaOD.attachHeader("#text_filter,#text_filter,#text_filter");
        lisNamaOD.enablePaging(true, 15, 5, "pageOD", true);
        lisNamaOD.setPagingSkin("bricks");
    }
</script>


</asp:Content>
