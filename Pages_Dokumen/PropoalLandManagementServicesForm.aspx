<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="PropoalLandManagementServicesForm.aspx.cs" Inherits="Pages_Dokumen_ServicesProjectForm" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />



<h1>Form Proposal Land Management Services</h1>
	
	<hr />    
    
	<form role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Date</label>
            <div class="col-md-3"><asp:TextBox ID="txtNoIdentitas" class="form-control input-md" runat="server" value="" ></asp:TextBox></div>			           
        </div>

        
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Company</label>
            <div class="col-md-3"><asp:TextBox ID="txtNama" class="form-control input-md" runat="server" value= "VIRAMA KARYA"></asp:TextBox></div>
          <div class="col-md-3"><input type="button" id="Button2" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Project</label>
            <div class="col-md-3"><asp:TextBox ID="TextBox13" class="form-control input-md" runat="server" value="PENENTUAN JARAK JAUH " ></asp:TextBox></div>
        </div>
		
        <div class="form-group">
            <label for="nama" class="control-label col-md-2">Objectives</label>
            <div class="col-md-3"><asp:TextBox ID="TextBox5" class="form-control input-md" runat="server" value="LAYER" ></asp:TextBox></div>
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Process</label>
            <div class="col-md-3"><asp:TextBox ID="txtNoHandphone" class="form-control input-md" runat="server" value="DALAM PROSES" ></asp:TextBox></div>
        </div>
		
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Waktu</label>
            <div class="col-md-3"><asp:TextBox ID="TextBox1" class="form-control input-md" runat="server" value="12:13" ></asp:TextBox></div>
        </div>
		
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Biaya</label>
            <div class="col-md-3"><asp:TextBox ID="TextBox2" class="form-control input-md" runat="server" value="RP : 300000000" ></asp:TextBox></div>
        </div>
		
            <hr />

        <h3>Diajukan Oleh :</h3>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Nama Perusahaan</label>
            <div class="col-md-3"><asp:TextBox ID="TextBox14" class="form-control input-md" runat="server" value= "ATMA JAYA"></asp:TextBox></div>
          <div class="col-md-3"><input type="button" id="Button3" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Nama</label>
            <div class="col-md-3"><asp:TextBox ID="TextBox15" class="form-control input-md" runat="server" value= "SAEPULLAH"></asp:TextBox></div>
          <div class="col-md-3"><input type="button" id="Button10" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>
        </div>

        <hr />

        <h3>Disetujui Oleh :</h3>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Nama Perusahaan</label>
            <div class="col-md-3"><asp:TextBox ID="TextBox3" class="form-control input-md" runat="server" value= "PT ENERJI INDONESIA"></asp:TextBox></div>
          <div class="col-md-3"><input type="button" id="Button1" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>
        </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Nama</label>
            <div class="col-md-3"><asp:TextBox ID="TextBox4" class="form-control input-md" runat="server" value= "PUJIANTA"></asp:TextBox></div>
          <div class="col-md-3"><input type="button" id="Button4" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>
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
