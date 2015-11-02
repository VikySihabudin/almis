<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="ServicesProjectForm.aspx.cs" Inherits="Pages_Dokumen_ServicesProjectForm" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />



<h1>Form Land Management Service Project</h1>
	
	<hr class="style-four">    
    
	<form role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Date</label>
            <div class="col-md-3"><asp:TextBox ID="txtNoIdentitas" class="form-control input-md" runat="server" value="2015-10-07" ></asp:TextBox></div>			           
        </div>

        
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Company</label>
            <div class="col-md-3"><asp:TextBox ID="txtNama" class="form-control input-md" runat="server" value= "ADARO PERSADA MANDIRI"></asp:TextBox></div>
          <div class="col-md-3"><input type="button" id="Button2" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Matter</label>
			<div class="col-md-3">
				<asp:TextBox id="txtAlamat" TextMode="multiline" class="form-control input-md" value ="Jalan Bogor Raya" Columns="15" Rows="3" runat="server" />
			</div>
        </div>
		
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Request By</label>
            <div class="col-md-3"><asp:TextBox ID="txtNoHandphone" class="form-control input-md" runat="server" value="Akhmad Saepullah" ></asp:TextBox></div>
            <div class="col-md-3"><input type="button" id="Button10" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>
        </div>
		
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Department</label>
            <div class="col-md-3"><asp:TextBox ID="TextBox1" class="form-control input-md" runat="server" value="Kehutanan" ></asp:TextBox></div>
            <div class="col-md-3"><input type="button" id="Button3" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>
        </div>
    
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Position</label>
            <div class="col-md-3"><asp:TextBox ID="TextBox2" class="form-control input-md" runat="server" value="Manager" ></asp:TextBox></div>
        </div>
		

        <div class="form-group">
            <label for="nama" class="control-label col-md-2">Budgeted</label>
            <asp:CheckBox ID="CheckBox6" runat="server" class="control-label col-md-2" Text="  Yes"/>
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
            <asp:TextBox id="txtKeterangan" type="text" runat="server" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" placeholder= "DATA DALAM PROSES PENGINPUTAN" />    
            </div>
        </div>

        <div class="form-group">
            <label for="nama" class="control-label col-md-2">Background & Historical Information</label>
            <div class="col-md-3">
            <asp:TextBox id="TextBox3" type="text" runat="server" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" placeholder= "DESKIPSI" />    
            </div>
        </div>

        <div class="form-group">
            <label for="nama" class="control-label col-md-2">Data Of Land Location, Size And Challanges:</label>
            <div class="col-md-3">
            <asp:TextBox id="TextBox4" type="text" runat="server" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" placeholder= "KETERANGAN" />    
            </div>
        </div>

        <div class="form-group">
            <label for="nama" class="control-label col-md-2">Data Of Current Resources And PIC:</label>
            <div class="col-md-3">
            <asp:TextBox id="TextBox5" type="text" runat="server" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" placeholder= "PENJELASAN" />    
            </div>
        </div>

            <hr />

        <h3>Type Of Support</h3>

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="Label1" runat="server"  for="identitas" class="control-label col-md-2" Text="Training" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
            <asp:CheckBox ID="CheckBox1" runat="server" />
            <%--<asp:CheckBox ID="CheckBox1" runat="server"   onclick="validasi()" /></div>--%>
        </div>
        </div>

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="Label2" runat="server"  for="identitas" class="control-label col-md-2" Text="Research And Consultation Visit" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
            <asp:CheckBox ID="CheckBox2" runat="server"  onclick="validasi()" /></div>
        </div>
        </div>

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="Label3" runat="server"  for="identitas" class="control-label col-md-2" Text="Documentation Review" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
            <asp:CheckBox ID="CheckBox3" runat="server"   onclick="validasi()" /></div>
        </div>
        </div>

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="Label4" runat="server"  for="identitas" class="control-label col-md-2" Text="Communication And Liase Support" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
            <asp:CheckBox ID="CheckBox4" runat="server"   onclick="validasi()" /></div>
        </div>
        </div>

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="Label5" runat="server"  for="identitas" class="control-label col-md-2" Text="Others" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
            <asp:CheckBox ID="CheckBox5" runat="server"   onclick="validasi()" /></div>
        </div>
        </div>

        <div class="form-group">
            <label for="nama" class="control-label col-md-2">Other Information</label>
            <div class="col-md-3">
            <asp:TextBox id="TextBox6" type="text" runat="server" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" placeholder= "LAIN LAIN" />    
            </div>
        </div>

            <hr />

        <h3>Requester Approval</h3>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Requested By (PIC Applicant)</label>
            <div class="col-md-3"><asp:TextBox ID="TextBox7" class="form-control input-md" runat="server" value="08212291828" ></asp:TextBox></div>
             <div class="col-md-3"><input type="button" id="Button1" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>     
        
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Acknowledged By (DGM/GM/Director)</label>
            <div class="col-md-3"><asp:TextBox ID="TextBox8" class="form-control input-md" runat="server" value="08212291828" ></asp:TextBox></div>
             <div class="col-md-3"><input type="button" id="Button4" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>     
        </div>

            <hr />

        <h3>APM Review</h3>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Recorded By (LMS Project Analyst)</label>
            <div class="col-md-3"><asp:TextBox ID="TextBox9" class="form-control input-md" runat="server" value="Endarsih" ></asp:TextBox></div>
             <div class="col-md-3"><input type="button" id="Button5" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>     
        
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Recorded By (LMS Project Manager)</label>
            <div class="col-md-3"><asp:TextBox ID="TextBox10" class="form-control input-md" runat="server" value="Wahyuda" ></asp:TextBox></div>
             <div class="col-md-3"><input type="button" id="Button6" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>     
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Checked By (LMS Division Head)</label>
            <div class="col-md-3"><asp:TextBox ID="TextBox11" class="form-control input-md" runat="server" value="Sahrul Gunawan" ></asp:TextBox></div>
             <div class="col-md-3"><input type="button" id="Button7" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>     
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Approve By (Operation Director)</label>
            <div class="col-md-3"><asp:TextBox ID="TextBox12" class="form-control input-md" runat="server" value="Wawan diyanto" ></asp:TextBox></div>
             <div class="col-md-3"><input type="button" id="Button8" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>     
        </div>

        <hr />

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label ID="LLanjut" for="identitas"  class="control-label col-md-2" runat="server" Text="Lanjut" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
             <asp:DropDownList ID="ddprg" runat="server" class="form-control" onclick="handleClick()">
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

    $(function txtNoIdentitas() {
        $("[id$=txtNoIdentitas]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

</script>


</asp:Content>
