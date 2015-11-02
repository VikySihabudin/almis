<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="PelaporanForm.aspx.cs" Inherits="Pages_Reminder_PelaporanForm" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />



<h1>Form Tahap Pelaporan Dan Perpanjangan</h1>
	
	<hr />    
    
        
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">No Pelaporan</label>
            <div class="col-md-2"><asp:TextBox ID="txtIzinLok" class="form-control input-md" runat="server" value= ""></asp:TextBox></div>
        </div>

    <hr />  
    <br />

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label5" runat="server" Text="Label">PIC IL Berkoordinasi Dengan Tim Legal Untuk Membuat Dan Menyampaikan Laporan Rutin (Setiap 3 Bulan) Kepada BPN Setempat</asp:Label>
            </div>

        </div>

        <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label6" runat="server" Text="Label">Date Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox4" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label7" runat="server" Text="Label">Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox5" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label8" runat="server" Text="Label">Stop Date</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox6" type="text" runat="server" class="form-control" />
			</div>

        </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label44" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox28" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label57" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox39" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button12" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
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

            <div class="col-md-2">
            <asp:Label ID="Label45" runat="server" Text="Label">Pelaporan Rutin</asp:Label>
            </div>

            <div class="col-md-4">
            <asp:CheckBox ID="CheckBox4" runat="server" class="control-label"/>
            </div>

        </div>


    <hr />  
    <br />

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label1" runat="server" Text="Label">PIC IL Berkoordinasi Dengan Tim Legal, PIC, LC, PIC GR Dan PIC Adm Paling Lambat 1 Bulan Sebelum Masa Berlaku Izin Lokasi Berakhir, Mempersiapkan Dokumen Permohonan Perpanjangan Izin Lokasi : Surat Permohonan Perpanjangan Izin Lokasi, Legalitas Perusahaan Dan Fotocopi Izin Lokasi.</asp:Label>
            </div>

        </div>

        <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label2" runat="server" Text="Label">Date Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox1" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label3" runat="server" Text="Label">Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox2" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label4" runat="server" Text="Label">Stop Date</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox3" type="text" runat="server" class="form-control" />
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
            <asp:Label ID="Label12" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox9" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button1" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
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
    <br />

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label9" runat="server" Text="Label">Input Dan Upload Izin Lokasi</asp:Label>
            </div>

        </div>

       <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label10" runat="server" Text="Label">No Izin Lokasi</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox7" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label14" runat="server" Text="Label">Tanggal Izin Lokasi</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox10" type="text" runat="server" class="form-control" />
			</div>



            <div class="col-md-1">
            <input type="button" id="Button13" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

        </div>

  

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label13" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox11" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label15" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox12" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button2" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
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

            <div class="col-md-1">
            <asp:Label ID="Label27" runat="server" Text="Label">Lanjut :</asp:Label>
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



    var txtIzinLok = document.getElementById("<%= txtIzinLok.ClientID %>");



    listRequest();
    listfirst();
    //SearchlistRequest();
    //listPLM();
    //listPA();
    listPIL();


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
        listRequest.setInitWidths("40,200,200,200,200,200");
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
</script>


</asp:Content>
