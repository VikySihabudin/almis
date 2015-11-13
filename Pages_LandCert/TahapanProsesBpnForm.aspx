<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master"  CodeFile="TahapanProsesBpnForm.aspx.cs" Inherits="Pages_LandCert_TahapanProsesBpnForm" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />

<h1>Form Tahapan Proses BPN</h1>
	
	<hr />

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">No. Tahapan Proses BPN</label>
            <div class="col-md-2"><asp:TextBox ID="txtIzinLok" class="form-control input-md" runat="server" value= ""></asp:TextBox></div>
        </div>

	<hr />  
    <br />

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label9" runat="server" Text="Label">Penyampaian Surat Dan Dokumen Yang Dipersyaratkan Kepada BPN.</asp:Label>
            </div>

        </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label13" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtTanggal" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label15" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtKeterangan" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="BtnUpload" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridPSDD" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>



    <hr />  
    <br />

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label5" runat="server" Text="Label">Melakukan Pembayaran SPS Pemeriksaan Tanah Panitia A dan SPS Pemetaan Tematik Bidang Sertipikat Serta Menerima Tanda Bukti Setor Dari BPN</asp:Label>
            </div>

        </div>

        <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label6" runat="server" Text="Label">Date Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtDateDay" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label7" runat="server" Text="Label">Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtDay" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label8" runat="server" Text="Label">Stop Date</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtStopDate" type="text" runat="server" class="form-control" />
			</div>

        </div>

    	<hr />  

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label44" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtTanggal2" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label57" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtKeterangan2" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="BtnUpload2" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridSSMT" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

        <div class="form-group">

            <div class="col-md-2">
            <asp:Label ID="Label45" runat="server" Text="Label">Sudah Bayar</asp:Label>
            </div>

            <div class="col-md-4">
            <asp:CheckBox ID="CmbSudahBayar2" runat="server" class="control-label"/>
            </div>

        </div>

    <hr />  
    <br />

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label1" runat="server" Text="Label">BPN Melakukan Pengukuran Dan Menandatangani Berita Acara Hasil Pengukuran Dan Gambar Ukur Peta Bidang Tanah</asp:Label>
            </div>

        </div>

        <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label2" runat="server" Text="Label">Date Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtDateDay3" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label3" runat="server" Text="Label">Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtDay3" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label4" runat="server" Text="Label">Stop Date</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtStopDate3" type="text" runat="server" class="form-control" />
			</div>

        </div>

    	<hr />  

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label10" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtTanggal4" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label11" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtKeterangan4" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="BtnUpload4" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridBMPD" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

        <div class="form-group">

            <div class="col-md-2">
            <asp:Label ID="Label12" runat="server" Text="Label">Dokumen Peta Bidang Sebelum Terbit</asp:Label>
            </div>

            <div class="col-md-4">
            <asp:CheckBox ID="CmbDokumenPetaBidangSebelumTerbit4" runat="server" class="control-label"/>
            </div>

        </div>


    <hr />  
    <br />

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label14" runat="server" Text="Label">BPN Menerbitkan Peta Bidang Berdasarkan Berita Acara Pengukuran</asp:Label>
            </div>

        </div>

        <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label16" runat="server" Text="Label">Date Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtDateDay5" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label17" runat="server" Text="Label">Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtDay5" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label18" runat="server" Text="Label">Stop Date</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtStopDate5" type="text" runat="server" class="form-control" />
			</div>

        </div>

    	<hr />  

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label19" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtTanggal6" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label20" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="Keterangan6" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="BtnUpload6" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridBMPP" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

        <div class="form-group">

            <div class="col-md-2">
            <asp:Label ID="Label21" runat="server" Text="Label">Dokumen Peta Bidang Sebelum Terbit</asp:Label>
            </div>

            <div class="col-md-4">
            <asp:CheckBox ID="CmbDokumenPetaBidangSebelumTerbit6" runat="server" class="control-label"/>
            </div>

        </div>

    <hr />  
    <br />

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label22" runat="server" Text="Label">Pendaftaran Peta Bidang Tanah Untuk Proses Pemeriksaan Data Yuridis</asp:Label>
            </div>

        </div>

        <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label43" runat="server" Text="Label">Date Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtDateDay7" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label46" runat="server" Text="Label">Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtDay7" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label47" runat="server" Text="Label">Stop Date</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtStopDate7" type="text" runat="server" class="form-control" />
			</div>

        </div>

    	<hr />  


            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label26" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtTanggal8" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label27" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtKeterangan8" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="BtnUpload8" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridPPBT" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

    <hr />  
    <br />

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label23" runat="server" Text="Label">Proses Pemeriksaan Data Yuridis</asp:Label>
            </div>

        </div>


            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label24" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox16" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label25" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox17" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button5" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridPPDY" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

    <hr />  
    <br />

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label28" runat="server" Text="Label">BPN Menerbitkan Risalah Pemeriksaan Tanah, Risalah Pengolahan Data Dan BA Pemeriksaan Lapang</asp:Label>
            </div>

        </div>

        <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label29" runat="server" Text="Label">Date Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox18" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label30" runat="server" Text="Label">Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox21" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label31" runat="server" Text="Label">Stop Date</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox22" type="text" runat="server" class="form-control" />
			</div>

        </div>

    	<hr />  

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label32" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox23" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label33" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox24" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button6" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridBNRP" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

        <div class="form-group">

            <div class="col-md-2">
            <asp:Label ID="Label34" runat="server" Text="Label">Draf Risalah Pemeriksaan Tanah</asp:Label>
            </div>

            <div class="col-md-4">
            <asp:CheckBox ID="CheckBox3" runat="server" class="control-label"/>
            </div>

        </div>

    <hr />  
    <br />

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label35" runat="server" Text="Label">BPN Menerbitkan Pengumuman Risalah Data Yuridis Dan Risalah Data Fisik</asp:Label>
            </div>

        </div>

        <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label36" runat="server" Text="Label">Date Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox25" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label37" runat="server" Text="Label">Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox26" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label38" runat="server" Text="Label">Stop Date</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox27" type="text" runat="server" class="form-control" />
			</div>

        </div>

    	<hr />  

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label39" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox29" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label40" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox30" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button7" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridBNPR" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

        <div class="form-group">

            <div class="col-md-2">
            <asp:Label ID="Label41" runat="server" Text="Label">Draf SK Pemberian Hak</asp:Label>
            </div>

            <div class="col-md-4">
            <asp:CheckBox ID="CheckBox5" runat="server" class="control-label"/>
            </div>

        </div>

<hr />
<br />

        <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label42" runat="server" Text="Label">Lanjut :</asp:Label>
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

<script type="text/jscript">

    listPSDD();
    listSSMT();
    listBMPD();
    listBMPP();
    listPPBT();
    listPPDY();
    lisBNPR();
    lisBNRP();

    function listPSDD() {
        listPSDD = new dhtmlXGridObject('gridPSDD');
        listPSDD.setImagePath("../JavaScript/codebase/imgs/");
        listPSDD.setHeader("No.,Keterangan,File,Aksi");
        listPSDD.setInitWidths("40,200,200,200");
        listPSDD.setColAlign("left,left,left,left"); 
        listPSDD.setColTypes("ro,ro,ro,link");
        listPSDD.init();
        listPSDD.setSkin("dhx_skyblue");
        listPSDD.setPagingSkin("bricks");
        listPSDD.setColSorting("str,str,str,str");
    }
    
    function listSSMT() {
        listSSMT = new dhtmlXGridObject('gridSSMT');
        listSSMT.setImagePath("../JavaScript/codebase/imgs/");
        listSSMT.setHeader("No.,Keterangan,File,Aksi");
        listSSMT.setInitWidths("40,200,200,200");
        listSSMT.setColAlign("left,left,left,left");
        listSSMT.setColTypes("ro,ro,ro,link");
        listSSMT.init();
        listSSMT.setSkin("dhx_skyblue");
        listSSMT.setPagingSkin("bricks");
        listSSMT.setColSorting("str,str,str,str");
    }
    
    function listBMPD() {
        listBMPD = new dhtmlXGridObject('gridBMPD');
        listBMPD.setImagePath("../JavaScript/codebase/imgs/");
        listBMPD.setHeader("No.,Keterangan,File,Aksi");
        listBMPD.setInitWidths("40,200,200,200");
        listBMPD.setColAlign("left,left,left,left");
        listBMPD.setColTypes("ro,ro,ro,link");
        listBMPD.init();
        listBMPD.setSkin("dhx_skyblue");
        listBMPD.setPagingSkin("bricks");
        listBMPD.setColSorting("str,str,str,str");
    }

    function listBMPP() {
        listBMPP = new dhtmlXGridObject('gridBMPP');
        listBMPP.setImagePath("../JavaScript/codebase/imgs/");
        listBMPP.setHeader("No.,Keterangan,File,Aksi");
        listBMPP.setInitWidths("40,200,200,200");
        listBMPP.setColAlign("left,left,left,left");
        listBMPP.setColTypes("ro,ro,ro,link");
        listBMPP.init();
        listBMPP.setSkin("dhx_skyblue");
        listBMPP.setPagingSkin("bricks");
        listBMPP.setColSorting("str,str,str,str");
    }
    
    function listPPBT() {
        listPPBT = new dhtmlXGridObject('gridPPBT');
        listPPBT.setImagePath("../JavaScript/codebase/imgs/");
        listPPBT.setHeader("No.,Keterangan,File,Aksi");
        listPPBT.setInitWidths("40,200,200,200");
        listPPBT.setColAlign("left,left,left,left");
        listPPBT.setColTypes("ro,ro,ro,link");
        listPPBT.init();
        listPPBT.setSkin("dhx_skyblue");
        listPPBT.setPagingSkin("bricks");
        listPPBT.setColSorting("str,str,str,str");
    }
    
    function listPPDY() {
        listPPDY = new dhtmlXGridObject('gridPPDY');
        listPPDY.setImagePath("../JavaScript/codebase/imgs/");
        listPPDY.setHeader("No.,Keterangan,File,Aksi");
        listPPDY.setInitWidths("40,200,200,200");
        listPPDY.setColAlign("left,left,left,left");
        listPPDY.setColTypes("ro,ro,ro,link");
        listPPDY.init();
        listPPDY.setSkin("dhx_skyblue");
        listPPDY.setPagingSkin("bricks");
        listPPDY.setColSorting("str,str,str,str");
    }
    
    
    function lisBNPR() {
        lisBNPR = new dhtmlXGridObject('gridBNPR');
        lisBNPR.setImagePath("../JavaScript/codebase/imgs/");
        lisBNPR.setHeader("No.,Keterangan,File,Aksi");
        lisBNPR.setInitWidths("40,200,200,200");
        lisBNPR.setColAlign("left,left,left,left");
        lisBNPR.setColTypes("ro,ro,ro,link");
        lisBNPR.init();
        lisBNPR.setSkin("dhx_skyblue");
        lisBNPR.setPagingSkin("bricks");
        lisBNPR.setColSorting("str,str,str,str");
    }

    function lisBNRP() {
        lisBNRP = new dhtmlXGridObject('gridBNRP');
        lisBNRP.setImagePath("../JavaScript/codebase/imgs/");
        lisBNRP.setHeader("No.,Keterangan,File,Aksi");
        lisBNRP.setInitWidths("40,200,200,200");
        lisBNRP.setColAlign("left,left,left,left");
        lisBNRP.setColTypes("ro,ro,ro,link");
        lisBNRP.init();
        lisBNRP.setSkin("dhx_skyblue");
        lisBNRP.setPagingSkin("bricks");
        lisBNRP.setColSorting("str,str,str,str");
    }

</script>
</asp:Content>