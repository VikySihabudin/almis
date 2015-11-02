<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/MasterPages/mptamp.master" CodeFile="ProsesLmsForm.aspx.cs" Inherits="Pages_LandCert_ProsesLMS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />



<h1>Form Proses Land Management Support</h1>


<hr />

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">No. Proses Land Management Support</label>
            <div class="col-md-2"><asp:TextBox ID="txtIzinLok" class="form-control input-md" runat="server" value= ""></asp:TextBox></div>
        </div>

	<hr />  
    <br />
   

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label1" runat="server" Text="Label">PIC PerusahaanPemohon Sertipikasi Mengajukan Permohonan LMS Support Kepada APM</asp:Label>
            </div>

        </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label2" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox1" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label3" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox2" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button2" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>


    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridProsLMS1" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>






	<hr />  
    <br />
   

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label4" runat="server" Text="Label">Manajemen APM Menunjuk PIC LMS Untuk Land Management Support</asp:Label>
            </div>

        </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label5" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox3" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label6" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox4" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button1" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridProsLMS2" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>

	<hr />  
    <br />
   

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label7" runat="server" Text="Label">PIC LMS Mengadakan Koordinasi Awal dengan PIC Perusahaan Pemohon Sertipikasi</asp:Label>
            </div>

        </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label8" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox5" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label9" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox6" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button3" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridProsLMS3" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label10" runat="server" Text="Label">PIC LMS Menyusun Proposal LMS</asp:Label>
            </div>

        </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label11" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox7" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label12" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox8" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button4" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridProsLMS4" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>


	<hr />  
    <br />

           <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label13" runat="server" Text="Label">PICLMS Meminta Persetujuan Proposal Kepada Manajemen Pemohon Dan Manajemen APM</asp:Label>
            </div>

        </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label14" runat="server" Text="Label">Tanggal</asp:Label>
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
            <input type="button" id="Button5" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>  

    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridProsLMS5" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>

	<hr />  
    <br />    
    
          <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label16" runat="server" Text="Label">PIC LMS Menyusun LMS Approval Dan Meminta Persetujuan Dari Chief Legal Officer (CLO) PT. Adaro Energy, Tbk</asp:Label>
            </div>

        </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label17" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox9" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label18" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox10" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button6" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridProsLMS6" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>

  
	<hr />  
    <br />    
    
          <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label19" runat="server" Text="Label">PIC LMS Mengadakan Koordinasi Lanjutan Dengan PIC Perusahaan Pemohon Sertipikasi</asp:Label>
            </div>

        </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label20" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox13" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label21" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox14" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button7" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridProsLMS7" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div> 

  
	<hr />  
    <br />    
    
          <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label22" runat="server" Text="Label">PIC LMS Membuat Opening File LMS</asp:Label>
            </div>

        </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label23" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox15" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label24" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox16" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button8" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridProsLMS8" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div> 

  
	<hr />  
    <br />    
    
          <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label25" runat="server" Text="Label">PIC Perusahaan Pemohon Mengajukan Opening File</asp:Label>
            </div>

        </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label26" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox17" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label27" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox18" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button9" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridProsLMS9" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>

	<hr />  
    <br />    
    

        <div class="form-group">
            <asp:Label ID="LLanjut" for="identitas"  class="control-label col-md-2" runat="server" Text="Lanjut" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
             <asp:DropDownList ID="ddprg" runat="server" class="form-control" onclick="handleClick()">
             <asp:ListItem Text="Tidak" Value="0"></asp:ListItem>
             <asp:ListItem Text="Lanjut" Value="1"></asp:ListItem>     
            </asp:DropDownList>
            </div>
        </div>

	<hr />  

    <div class="form-group">
            <div class="col-md-10">
       
                     <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default"  onclick="btnClick(this)" PostBackUrl="~/Pages/PraRegistrasiForm.aspx"/> 
                     <input type="button" id="btnSave" value="Save"  class="btn btn-lg btn-success" onclick="btnClick(this)" />  
                     <%--<input type="button" id="Button9" value="Print"  class="btn btn-info btn-lg" onclick="btnAdd(this)" /> --%> 
            </div>
    </div>



<script type="text/jscript">

    listgridProsLMS1();
    listgridProsLMS2();
    listgridProsLMS3();
    listgridProsLMS4();
    listgridProsLMS5();
    listgridProsLMS6();
    listgridProsLMS7();
    listgridProsLMS8();
    listgridProsLMS9();


    function listgridProsLMS1() {
        listPLM = new dhtmlXGridObject('gridProsLMS1');
        listPLM.setImagePath("../JavaScript/codebase/imgs/");
        listPLM.setHeader("No.,Keterangan,Tanggal,Dokumen,Aksi");
        listPLM.setInitWidths("40,200,200,200");
        listPLM.setColAlign("left,left,left,left");
        listPLM.setColTypes("ro,ro,ro,link");
        listPLM.init();
        listPLM.setSkin("dhx_skyblue");
        listPLM.setPagingSkin("bricks");
        listPLM.setColSorting("str,str,str,str");
    }


    function listgridProsLMS2() {
        listPLM = new dhtmlXGridObject('gridProsLMS2');
        listPLM.setImagePath("../JavaScript/codebase/imgs/");
        listPLM.setHeader("No.,Keterangan,Tanggal,Dokumen,Aksi");
        listPLM.setInitWidths("40,200,200,200");
        listPLM.setColAlign("left,left,left,left");
        listPLM.setColTypes("ro,ro,ro,link");
        listPLM.init();
        listPLM.setSkin("dhx_skyblue");
        listPLM.setPagingSkin("bricks");
        listPLM.setColSorting("str,str,str,str");
    }

    function listgridProsLMS3() {
        listPLM = new dhtmlXGridObject('gridProsLMS3');
        listPLM.setImagePath("../JavaScript/codebase/imgs/");
        listPLM.setHeader("No.,Keterangan,Tanggal,Dokumen,Aksi");
        listPLM.setInitWidths("40,200,200,200");
        listPLM.setColAlign("left,left,left,left");
        listPLM.setColTypes("ro,ro,ro,link");
        listPLM.init();
        listPLM.setSkin("dhx_skyblue");
        listPLM.setPagingSkin("bricks");
        listPLM.setColSorting("str,str,str,str");
    }

    function listgridProsLMS4() {
        listPLM = new dhtmlXGridObject('gridProsLMS4');
        listPLM.setImagePath("../JavaScript/codebase/imgs/");
        listPLM.setHeader("No.,Keterangan,Tanggal,Dokumen,Aksi");
        listPLM.setInitWidths("40,200,200,200");
        listPLM.setColAlign("left,left,left,left");
        listPLM.setColTypes("ro,ro,ro,link");
        listPLM.init();
        listPLM.setSkin("dhx_skyblue");
        listPLM.setPagingSkin("bricks");
        listPLM.setColSorting("str,str,str,str");
    }

    function listgridProsLMS5() {
        listPLM = new dhtmlXGridObject('gridProsLMS5');
        listPLM.setImagePath("../JavaScript/codebase/imgs/");
        listPLM.setHeader("No.,Keterangan,Tanggal,Dokumen,Aksi");
        listPLM.setInitWidths("40,200,200,200");
        listPLM.setColAlign("left,left,left,left");
        listPLM.setColTypes("ro,ro,ro,link");
        listPLM.init();
        listPLM.setSkin("dhx_skyblue");
        listPLM.setPagingSkin("bricks");
        listPLM.setColSorting("str,str,str,str");
    }

    function listgridProsLMS6() {
        listPLM = new dhtmlXGridObject('gridProsLMS6');
        listPLM.setImagePath("../JavaScript/codebase/imgs/");
        listPLM.setHeader("No.,Keterangan,Tanggal,Dokumen,Aksi");
        listPLM.setInitWidths("40,200,200,200");
        listPLM.setColAlign("left,left,left,left");
        listPLM.setColTypes("ro,ro,ro,link");
        listPLM.init();
        listPLM.setSkin("dhx_skyblue");
        listPLM.setPagingSkin("bricks");
        listPLM.setColSorting("str,str,str,str");
    }

    function listgridProsLMS7() {
        listPLM = new dhtmlXGridObject('gridProsLMS7');
        listPLM.setImagePath("../JavaScript/codebase/imgs/");
        listPLM.setHeader("No.,Keterangan,Tanggal,Dokumen,Aksi");
        listPLM.setInitWidths("40,200,200,200");
        listPLM.setColAlign("left,left,left,left");
        listPLM.setColTypes("ro,ro,ro,link");
        listPLM.init();
        listPLM.setSkin("dhx_skyblue");
        listPLM.setPagingSkin("bricks");
        listPLM.setColSorting("str,str,str,str");
    }

    function listgridProsLMS8() {
        listPLM = new dhtmlXGridObject('gridProsLMS8');
        listPLM.setImagePath("../JavaScript/codebase/imgs/");
        listPLM.setHeader("No.,Keterangan,Tanggal,Dokumen,Aksi");
        listPLM.setInitWidths("40,200,200,200");
        listPLM.setColAlign("left,left,left,left");
        listPLM.setColTypes("ro,ro,ro,link");
        listPLM.init();
        listPLM.setSkin("dhx_skyblue");
        listPLM.setPagingSkin("bricks");
        listPLM.setColSorting("str,str,str,str");
    }
    function listgridProsLMS9() {
        listPLM = new dhtmlXGridObject('gridProsLMS9');
        listPLM.setImagePath("../JavaScript/codebase/imgs/");
        listPLM.setHeader("No.,Keterangan,Tanggal,Dokumen,Aksi");
        listPLM.setInitWidths("40,200,200,200");
        listPLM.setColAlign("left,left,left,left");
        listPLM.setColTypes("ro,ro,ro,link");
        listPLM.init();
        listPLM.setSkin("dhx_skyblue");
        listPLM.setPagingSkin("bricks");
        listPLM.setColSorting("str,str,str,str");
    }

</script>

</asp:Content>



