<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="PersiapanForm.aspx.cs" Inherits="Pages_Reminder_PersiapanForm" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />



<h1>Form Tahap Persiapan</h1>
	
	<hr />    
    
        
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">No Persiapan</label>
            <div class="col-md-2"><asp:TextBox ID="txtIzinLok" class="form-control input-md" runat="server" value= ""></asp:TextBox></div>
        </div>

	<hr />  
    <h3>Request Form</h3>
    <br />

         <div class="form-group">

            <div class="col-md-3">
            <asp:Label ID="Label2" runat="server" Text="Label">No Request Form</asp:Label>
            </div>


            <div class="col-md-2">
            <asp:Label ID="Label3" runat="server" Text="Label">No Poligon</asp:Label>
            </div>

        </div>

        <div class="form-group">

            <div class="col-md-2">
            <asp:TextBox id="TextBox1" type="text" runat="server" class="form-control" />
            </div>

            <div class="col-md-1">
            <input type="button" id="Button1" value="Form" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            <div class="col-md-2">
            <asp:TextBox id="TextBox2" type="text" runat="server" class="form-control" />
            </div>

            <div class="col-md-2">
            <input type="button" id="Button6" value="Map" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

        </div>

    <br />

            <div class="form-group">

            <div class="col-sm-2">
            <asp:Label ID="Label1" runat="server" Text="Label">Dokumen</asp:Label>
            </div>


            <div class="col-md-1">
            <asp:Label ID="Label9" runat="server" Text="Label">Tanggal</asp:Label>
            </div>
               
			<div class="col-md-2">
			<asp:Label ID="Label10" runat="server" Text="Label">Keterangan</asp:Label>
			</div>



        </div>

        <div class="form-group">
            <div class="col-sm-2">
            <asp:DropDownList ID="ddprg" runat="server" class="form-control">
                <asp:ListItem Text="Yuridis" Value="0"></asp:ListItem>
                <asp:ListItem Text="Teknis" Value="1"></asp:ListItem>
                <asp:ListItem Text="Sosial Teritorial" Value="2"></asp:ListItem>
                <asp:ListItem Text="Rencana Peruntukan" Value="3"></asp:ListItem>
            </asp:DropDownList>
            </div>

                <div class="col-md-1">
                <asp:TextBox id="txtTgl" type="text" runat="server" class="form-control" />
                </div>
               
			<div class="col-md-2">
				<asp:TextBox id="txtAlamat" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-2">
            <input type="button" id="btnRefresh" value="Submit" class="btn btn-info btn-md" onclick="refresh()" />
            </div>



        </div>

	

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridLMS" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>


            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label21" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox15" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label20" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox11" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button2" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridyur" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>



	<hr />  
    <h3>First Coordination Meeting</h3>
    <br />

         <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label4" runat="server" Text="Label">No First Coordination Meeting</asp:Label>
            </div>

            <div class="col-md-2">
            <asp:TextBox id="TextBox3" type="text" runat="server" class="form-control" />
            </div>

            <div class="col-md-1">
            <input type="button" id="Button7" value="Form" class="btn btn-info btn-md" onclick="refresh()" />
            </div>





        </div>


            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label5" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox4" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label22" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox16" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button3" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridfirst" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>
	<hr />  
    <h3>Proposal Land Management</h3>
    <br />

         <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label6" runat="server" Text="Label">No Proposal Land Management</asp:Label>
            </div>

            <div class="col-md-2">
            <asp:TextBox id="TextBox5" type="text" runat="server" class="form-control" />
            </div>

            <div class="col-md-1">
            <input type="button" id="Button4" value="Form" class="btn btn-info btn-md" onclick="refresh()" />
            </div>





        </div>


            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label7" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox6" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label23" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox17" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button9" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridPLM" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

	<hr />  
    <h3>Project Approval</h3>
    <br />

         <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label8" runat="server" Text="Label">No Project Approval</asp:Label>
            </div>

            <div class="col-md-2">
            <asp:TextBox id="TextBox7" type="text" runat="server" class="form-control" />
            </div>

            <div class="col-md-1">
            <input type="button" id="Button10" value="Form" class="btn btn-info btn-md" onclick="refresh()" />
            </div>





        </div>


            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label11" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox8" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label24" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox18" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button12" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridPA" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>


    <hr />  
    <br />

        
    <div class="form-group">
        <div class="col-md-5">
        <asp:Label ID="Label12" runat="server" Text="Label">PIC IL berkordinasi dengan PIC LC, PIC Adm, PIC GR dan PEMDA setempat terkait permohonan izin lokasi </asp:Label>
        </div>
    </div>




            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label14" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox10" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label25" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox19" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button13" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridPIL" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>


    <hr />  
    <br />

    
    <div class="form-group">
        <div class="col-md-5">
        <asp:Label ID="Label27" runat="server" Text="Label">PIC GR Menyampaikan Surat Permohonan Dan Dokumen Pendukung Kepada Pemerintah Daerah</asp:Label>
        </div>
    </div>


    <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label19" runat="server" Text="Label">Date Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox14" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label36" runat="server" Text="Label">Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox26" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label37" runat="server" Text="Label">Stop Date</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox27" type="text" runat="server" class="form-control" />
			</div>

        </div>
    


            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label30" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox21" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label31" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox22" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button14" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridsp" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>


    <hr />  
    <br />

        
    <div class="form-group">
        <div class="col-md-5">
        <asp:Label ID="Label28" runat="server" Text="Label">PIC GR Menyampaikan Surat Dan Lampiran Dokumen Permohonan Izin Prinsip Kepada PEMDA Setempat (Dinas Terkait Yang Telah Ditunjuk)</asp:Label>
        </div>
    </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label29" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox20" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label32" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox23" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button15" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridps" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>


    <hr />  
    <br />




      <div class="form-group">
        <div class="col-md-5">
        <asp:Label ID="Label13" runat="server" Text="Label">Expose ke PEMDA Mengenai Materi Izin Lokasi</asp:Label>
        </div>
    </div>


        <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label45" runat="server" Text="Label">Date Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox35" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label46" runat="server" Text="Label">Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox36" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label47" runat="server" Text="Label">Stop Date</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox37" type="text" runat="server" class="form-control" />
			</div>

        </div>
    


            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label26" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox9" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label44" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox34" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button5" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridExpose" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>


    <hr />  
    <br />

        
    <div class="form-group">
        <div class="col-md-5">
        <asp:Label ID="Label33" runat="server" Text="Label">PEMDA Setempat Melalui Satuan Kerja Melaksanakan Pemerikasaan Dokumen Permohonan Izin Prinsip</asp:Label>
        </div>
    </div>


    <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label41" runat="server" Text="Label">Date Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox31" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label42" runat="server" Text="Label">Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox32" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label43" runat="server" Text="Label">Stop Date</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox33" type="text" runat="server" class="form-control" />
			</div>

        </div>


            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label34" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox24" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label35" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox25" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button16" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridpip" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>



    <hr />  
    <br />

        <div class="form-group">

            <div class="col-md-5">
            <asp:Label ID="Label15" runat="server" Text="Label">PEMDA Setempat Mempersiapkan Draft Izin Prinsip. Selanjutnya Bupati / Walikota Menerbitkan SK Izin Prinsip </asp:Label>
            </div>

        </div>


        <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label38" runat="server" Text="Label">Date Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox28" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label39" runat="server" Text="Label">Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox29" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label40" runat="server" Text="Label">Stop Date</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox30" type="text" runat="server" class="form-control" />
			</div>

        </div>



           <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label17" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox12" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label18" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox13" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button17" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="griddip" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

    <hr />  
    <br />

        <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label16" runat="server" Text="Label">Lanjut :</asp:Label>
            </div>

            <div class="col-sm-2">
            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control">
                <asp:ListItem Text="Tidak Lanjut" Value="0"></asp:ListItem>
                <asp:ListItem Text="Lanjut" Value="1"></asp:ListItem>
            </asp:DropDownList>
            </div>

       </div>

        <hr />
      
    <div class="form-group">
            <div class="col-md-10">
       
                     <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default"  onclick="btnClick(this)" PostBackUrl="~/Pages/PraRegistrasiForm.aspx"/> 
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

    var localURL = "LMSAddFileForm.aspx";

    var ddprg = document.getElementById("<%= ddprg.ClientID %>");

    var txtIzinLok = document.getElementById("<%= txtIzinLok.ClientID %>");
    var txtTgl = document.getElementById("<%= txtTgl.ClientID %>");


    listRequest();
    listfirst();
    SearchlistRequest();
    listPLM();
    listPA();
    listPIL();
    listyus();
    listsp();
    listps();
    listpip();
    listExpose();
    listdip();


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
        listRequest.loadXML("../xml/lms.xml");
        //listplegal.loadXML(localURL + "?" + s);
    }

    function listRequest() {
        listRequest = new dhtmlXGridObject('gridLMS');
        listRequest.setImagePath("../JavaScript/codebase/imgs/");
        listRequest.setHeader("No.,Jenis Dokumen,Tanggal,Keterangan,File,Aksi");
        listRequest.setInitWidths("40,200,200,200,0,200");
        listRequest.setColAlign("left,left,left,left,left,left");
        listRequest.setColTypes("ro,ro,ro,ro,ro,link");
        listRequest.init();
        listRequest.setSkin("dhx_skyblue");
        listRequest.setPagingSkin("bricks");
        listRequest.setColSorting("str,str,str,str,str,str");
    }

    function listfirst() {
        listfirst = new dhtmlXGridObject('gridfirst');
        listfirst.setImagePath("../JavaScript/codebase/imgs/");
        listfirst.setHeader("No.,Keterangan,File,Aksi");
        listfirst.setInitWidths("40,200,200,200");
        listfirst.setColAlign("left,left,left,left");
        listfirst.setColTypes("ro,ro,ro,link");
        listfirst.init();
        listfirst.setSkin("dhx_skyblue");
        listfirst.setPagingSkin("bricks");
        listfirst.setColSorting("str,str,str,str");
    }
    

    function listPLM() {
        listPLM = new dhtmlXGridObject('gridPLM');
        listPLM.setImagePath("../JavaScript/codebase/imgs/");
        listPLM.setHeader("No.,Keterangan,File,Aksi");
        listPLM.setInitWidths("40,200,200,200");
        listPLM.setColAlign("left,left,left,left");
        listPLM.setColTypes("ro,ro,ro,link");
        listPLM.init();
        listPLM.setSkin("dhx_skyblue");
        listPLM.setPagingSkin("bricks");
        listPLM.setColSorting("str,str,str,str");
    }

    

    function listPA() {
        listPA = new dhtmlXGridObject('gridPA');
        listPA.setImagePath("../JavaScript/codebase/imgs/");
        listPA.setHeader("No.,Keterangan,File,Aksi");
        listPA.setInitWidths("40,200,200,200");
        listPA.setColAlign("left,left,left,left");
        listPA.setColTypes("ro,ro,ro,link");
        listPA.init();
        listPA.setSkin("dhx_skyblue");
        listPA.setPagingSkin("bricks");
        listPA.setColSorting("str,str,str,str");
    }

    function listPIL() {
        listPIL = new dhtmlXGridObject('gridPIL');
        listPIL.setImagePath("../JavaScript/codebase/imgs/");
        listPIL.setHeader("No.,Keterangan,File,Aksi");
        listPIL.setInitWidths("40,200,200,200");
        listPIL.setColAlign("left,left,left,left");
        listPIL.setColTypes("ro,ro,ro,link");
        listPIL.init();
        listPIL.setSkin("dhx_skyblue");
        listPIL.setPagingSkin("bricks");
        listPIL.setColSorting("str,str,str,str");
    }

    
    function listyus() {
        listyus = new dhtmlXGridObject('gridyur');
        listyus.setImagePath("../JavaScript/codebase/imgs/");
        listyus.setHeader("No.,Keterangan,File,Aksi");
        listyus.setInitWidths("40,200,200,200");
        listyus.setColAlign("left,left,left,left");
        listyus.setColTypes("ro,ro,ro,link");
        listyus.init();
        listyus.setSkin("dhx_skyblue");
        listyus.setPagingSkin("bricks");
        listyus.setColSorting("str,str,str,str");
    }

    

    function listsp() {
        listsp = new dhtmlXGridObject('gridsp');
        listsp.setImagePath("../JavaScript/codebase/imgs/");
        listsp.setHeader("No.,Keterangan,File,Aksi");
        listsp.setInitWidths("40,200,200,200");
        listsp.setColAlign("left,left,left,left");
        listsp.setColTypes("ro,ro,ro,link");
        listsp.init();
        listsp.setSkin("dhx_skyblue");
        listsp.setPagingSkin("bricks");
        listsp.setColSorting("str,str,str,str");
    }
    

    function listps() {
        listps = new dhtmlXGridObject('gridps');
        listps.setImagePath("../JavaScript/codebase/imgs/");
        listps.setHeader("No.,Keterangan,File,Aksi");
        listps.setInitWidths("40,200,200,200");
        listps.setColAlign("left,left,left,left");
        listps.setColTypes("ro,ro,ro,link");
        listps.init();
        listps.setSkin("dhx_skyblue");
        listps.setPagingSkin("bricks");
        listps.setColSorting("str,str,str,str");
    }
    

    function listpip() {
        listpip = new dhtmlXGridObject('gridpip');
        listpip.setImagePath("../JavaScript/codebase/imgs/");
        listpip.setHeader("No.,Keterangan,File,Aksi");
        listpip.setInitWidths("40,200,200,200");
        listpip.setColAlign("left,left,left,left");
        listpip.setColTypes("ro,ro,ro,link");
        listpip.init();
        listpip.setSkin("dhx_skyblue");
        listpip.setPagingSkin("bricks");
        listpip.setColSorting("str,str,str,str");
    }
    
    function listdip() {
        listdip = new dhtmlXGridObject('griddip');
        listdip.setImagePath("../JavaScript/codebase/imgs/");
        listdip.setHeader("No.,Keterangan,File,Aksi");
        listdip.setInitWidths("40,200,200,200");
        listdip.setColAlign("left,left,left,left");
        listdip.setColTypes("ro,ro,ro,link");
        listdip.init();
        listdip.setSkin("dhx_skyblue");
        listdip.setPagingSkin("bricks");
        listdip.setColSorting("str,str,str,str");
    }

    function listExpose() {
        listdip = new dhtmlXGridObject('gridExpose');
        listdip.setImagePath("../JavaScript/codebase/imgs/");
        listdip.setHeader("No.,Keterangan,File,Aksi");
        listdip.setInitWidths("40,200,200,200");
        listdip.setColAlign("left,left,left,left");
        listdip.setColTypes("ro,ro,ro,link");
        listdip.init();
        listdip.setSkin("dhx_skyblue");
        listdip.setPagingSkin("bricks");
        listdip.setColSorting("str,str,str,str");
    }

    
</script>
</asp:Content>
