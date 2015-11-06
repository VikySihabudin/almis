<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="ProsesPengurusanForm.aspx.cs" Inherits="Pages_Reminder_ProsesPengurusanForm" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />



<h1>Form Tahap Proses Pengurusan Di Pemerintah Daerah</h1>
	
	<hr />    
    
        
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">No Proses Pengurusan</label>
            <div class="col-md-2"><asp:TextBox ID="txtIzinLok" class="form-control input-md" runat="server" value= ""></asp:TextBox></div>
        </div>

	<hr />  
    <br />
         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label2" runat="server" Text="Label">PIC GR Menyiapkan Permohonan Pertimbangan Teknis Dengan Dilengkapi Izin Prinsip Kepada Kantor Pertanahan</asp:Label>
            </div>

        </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label1" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtTanggal" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label3" runat="server" Text="Label">Keterangan</asp:Label>
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
                <div id="gridmpp" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>


    <hr />  
    <br />

        <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label12" runat="server" Text="Label">Kepala Kantor Pertanahan Menerbitkan SPS Biaya Permohonan Perimbangan Teknis Izin Lokasi</asp:Label>
            </div>

        </div>

        <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label6" runat="server" Text="Label">Date Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtDateDay2" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label7" runat="server" Text="Label">Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtDay2" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label8" runat="server" Text="Label">Stop Date</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtStopDate2" type="text" runat="server" class="form-control" />
			</div>

        </div>

    	<hr />   

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label14" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtTanggal3" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label48" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtKeterangan3" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="BtnUpload3" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
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

            <div class="form-group">

            <div class="col-md-2">
            <asp:Label ID="Label4" runat="server" Text="Label">Sudah Di Bayar</asp:Label>
            </div>

            <div class="col-md-2">
            <asp:CheckBox ID="CmbSudahDiBayar" runat="server" class="control-label"/>
            </div>

        </div>


    <hr />  
    <br />

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label5" runat="server" Text="Label">PIC GR Melakukan Pembayaran Dan Berkordinasi Untuk Tinjauan Lapangan</asp:Label>
            </div>

        </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label28" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtTanggal4" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label29" runat="server" Text="Label">Keterangan</asp:Label>
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
                <div id="gridmpd" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>


    <hr />  
    <br />

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label30" runat="server" Text="Label">PIC GR Dan LandComp Mendampingi Tinjauan Lapangan Dengan Kantor Pertanahan</asp:Label>
            </div>

        </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label31" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtTanggal5" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label32" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtKeterangan5" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="BtnUpload5" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="griddlm" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

    <hr />  
    <br />

        <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label9" runat="server" Text="Label">Kepala Kantor Pertanahan Menerbitkan Perimbangan Teknis</asp:Label>
            </div>

        </div>

         <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label33" runat="server" Text="Label">Date Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtDateDay6" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label34" runat="server" Text="Label">Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtDay6" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="txtStopDate6" runat="server" Text="Label">Stop Date</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="TextBox24" type="text" runat="server" class="form-control" />
			</div>

        </div>

	<hr />   

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label10" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtTanggal7" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label49" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtKeterangan7" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="BtnUpload7" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
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

            <div class="col-md-8">
            <asp:Label ID="Label11" runat="server" Text="Label">PIC GR Melengkapi Surat Permohonan Izin Lokasi Dengan Dilengkapi SK Izin Prinsip Dan Pertimbangan Teknis Kantor Pertanahan</asp:Label>
            </div>

        </div>

         <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label59" runat="server" Text="Label">Date Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtDateDay8" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label60" runat="server" Text="Label">Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtDay8" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label61" runat="server" Text="Label">Stop Date</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtStopDate8" type="text" runat="server" class="form-control" />
			</div>

        </div>

	<hr />   

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label13" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtTanggal9" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label50" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtKeterangan9" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="BtnUpload9" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridgms" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

        <div class="form-group">

            <div class="col-md-2">
            <asp:Label ID="Label62" runat="server" Text="Label">Cek Surat / Dokumen</asp:Label>
            </div>

            <div class="col-md-4">
            <asp:CheckBox ID="CmbCekSurat" runat="server" class="control-label"/>
            </div>

        </div>


    <hr />  
    <br />

        <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label15" runat="server" Text="Label">Pemerintah Daerah Setempat Melalui Satuan Kerja Yang Ditunjuk Melakukan Pemerikasaan Dokumen Permohonan Izin Lokasi</asp:Label>
            </div>

        </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label16" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtTanggal10" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label51" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtKeterangan10" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="BtnUpload10" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridpsm" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>


    <hr />  
    <br />

        <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label17" runat="server" Text="Label">Berdasarkan Hasil Pemerikasaan Dokumen Permohonan Izin Lokasi Bupati / Walikota Memberikan Disposisi</asp:Label>
            </div>

        </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label18" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtTanggal11" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label52" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtKeterangan11" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="BtnUpload11" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
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
    <br />

        <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label36" runat="server" Text="Label">PIC GR Menindak Lanjuti Disposisi Bupati / Walikota Ke Kantor Pertanahan Dan Dinas Terkait lainnya</asp:Label>
            </div>

        </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label37" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtTanggal12" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label53" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtKeterangan12" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="BtnUpload12" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridmld" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>


    <hr />  
    <br />

        <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label38" runat="server" Text="Label">PIC GR Berkordinasi Dengan Dinas Terkait Lainnya Dalam Rangka Rencana Tinjauan Lokasi</asp:Label>
            </div>

        </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label39" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtTanggal13" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label54" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtKeterangan13" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="BtnUpload13" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridbdd" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

    <hr />  
    <br />

        <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label40" runat="server" Text="Label">PIC GR, Dan Dinas Terkait Melakukan Tinjauan Lokasi</asp:Label>
            </div>

        </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label41" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtTanggal14" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label55" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtKeterangan14" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="btnUpload14" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="griddtt" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

    <hr />  
    <br />

        <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label42" runat="server" Text="Label">Dinas Terkait Mengadakan Rapat Koordinasi Dengan Bupati / Walikota</asp:Label>
            </div>

        </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label43" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtTanggal15" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label56" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtKeterangan15" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="BtnUpload15" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="griddtm" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>


    <hr />  
    <br />

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label19" runat="server" Text="Label">Penerbitan Peta Lampiran Izin Lokasi Oleh BPN</asp:Label>
            </div>

        </div>

        <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label20" runat="server" Text="Label">Date Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtDateDay16" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label21" runat="server" Text="Label">Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtDay16" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label22" runat="server" Text="Label">Stop Date</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtStopDate16" type="text" runat="server" class="form-control" />
			</div>
            
        </div>

    	<hr />   

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label44" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtTanggal17" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label57" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtKeterangan17" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="BtnUpload18" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridppl" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

        <div class="form-group">

            <div class="col-md-2">
            <asp:Label ID="Label45" runat="server" Text="Label">Peta Lampiran</asp:Label>
            </div>

            <div class="col-md-4">
            <asp:CheckBox ID="CmbPetaLampiran" runat="server" class="control-label"/>
            </div>

        </div>

    <hr />  
    <br />

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label23" runat="server" Text="Label">Surat Keputusan Bupati / Walikota Tentang Pemberian Izin Lokasi</asp:Label>
            </div>

        </div>

        <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label24" runat="server" Text="Label">Date Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtDateDay19" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label25" runat="server" Text="Label">Day</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtDay19" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label26" runat="server" Text="Label">Stop Date</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtStopDate19" type="text" runat="server" class="form-control" />
			</div>

        </div>

    	<hr />   

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label46" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtTanggal20" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label58" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtKeterangan20" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="BtnUpload20" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridskb" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

        <div class="form-group">
            
            <div class="col-md-2">
            <asp:Label ID="Label47" runat="server" Text="Label">Draf Izin Lokasi</asp:Label>
            </div>

            <div class="col-md-4">
            <asp:CheckBox ID="CmbDrafIzinLokasi" runat="server" class="control-label" />
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



    //listRequest();
    //listfirst();
    //SearchlistRequest();
    listmpp();
    listmpd();
    listdlm();
    listgms();
    listpsm();
    listmld();
    listbdd();
    listbdtt();
    listdtm();
    listppl();
    listskb();


    listPLM();
    listPA();
    listPIL();


    $(function txtTanggal() {
        $("[id$=txtTanggal]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    ///---2

    $(function txtDateDay2() {
        $("[id$=txtDateDay2]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtDay2() {
        $("[id$=txtDay2]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });


    $(function txtStopDate2() {
        $("[id$=txtStopDate2]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    //-------3

    $(function txtDateDay3() {
        $("[id$=txtDateDay3]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtDay3() {
        $("[id$=txtDay3]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtStopDate3() {
        $("[id$=txtStopDate3]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    //----4

    $(function txtDateDay4() {
        $("[id$=txtDateDay4]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtDay4() {
        $("[id$=txtDay4]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtStopDate4() {
        $("[id$=txtStopDate4]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    //----5

    $(function txtDateDay5() {
        $("[id$=txtDateDay5]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtDay5() {
        $("[id$=txtDay5]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtStopDate5() {
        $("[id$=txtStopDate5]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    //----6

    $(function txtDateDay6() {
        $("[id$=txtDateDay6]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtDay6() {
        $("[id$=txtDay6]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

//    $(function txtStopDate6() {
//        $("[id$=txtStopDate6]").datepicker({
//            dateFormat: "yy-mm-dd",
//            buttonImageOnly: true,
//            changeYear: true,
//            changeMonth: true,
//            yearRange: "1900:2100"
//        });
//    });

    //----7

    $(function txtDateDay7() {
        $("[id$=txtDateDay7]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtDay7() {
        $("[id$=txtDay7]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtStopDate7() {
        $("[id$=txtStopDate7]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    //---8

    $(function txtDateDay8() {
        $("[id$=txtDateDay8]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtDay8() {
        $("[id$=txtDay8]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtStopDate8() {
        $("[id$=txtStopDate8]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    //----9
    $(function txtDateDay16() {
        $("[id$=txtDateDay16]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtDay16() {
        $("[id$=txtDay16]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtStopDate16() {
        $("[id$=txtStopDate16]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    //--------10

    $(function txtDateDay17() {
        $("[id$=txtDateDay17]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtDay17() {
        $("[id$=txtDay17]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtStopDate17() {
        $("[id$=txtStopDate17]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    //And


    $(function txtTanggal3() {
        $("[id$=txtTanggal3]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtTanggal4() {
        $("[id$=txtTanggal4]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtTanggal5() {
        $("[id$=txtTanggal5]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtTanggal6() {
        $("[id$=txtTanggal6]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtTanggal7() {
        $("[id$=txtTanggal7]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtTanggal8() {
        $("[id$=txtTanggal8]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    //---------------

    $(function txtTanggal9() {
        $("[id$=txtTanggal9]").datepicker({
            dateFormat: "yy-mm-dd", buttonImageOnly: true, changeYear: true, changeMonth: true, yearRange: "1900:2100"
        });
    });

    $(function txtTanggal10() {
        $("[id$=txtTanggal10]").datepicker({
            dateFormat: "yy-mm-dd", buttonImageOnly: true, changeYear: true, changeMonth: true, yearRange: "1900:2100"
        });
    });

    $(function txtTanggal11() {
        $("[id$=txtTanggal11]").datepicker({
            dateFormat: "yy-mm-dd", buttonImageOnly: true, changeYear: true, changeMonth: true, yearRange: "1900:2100"
        });
    });

    $(function txtTanggal12() {
        $("[id$=txtTanggal12]").datepicker({
            dateFormat: "yy-mm-dd", buttonImageOnly: true, changeYear: true, changeMonth: true, yearRange: "1900:2100"
        });
    });

    $(function txtTanggal13() {
        $("[id$=txtTanggal13]").datepicker({
            dateFormat: "yy-mm-dd", buttonImageOnly: true, changeYear: true, changeMonth: true, yearRange: "1900:2100"
        });
    });

    $(function txtTanggal14() {
        $("[id$=txtTanggal14]").datepicker({
            dateFormat: "yy-mm-dd", buttonImageOnly: true, changeYear: true, changeMonth: true, yearRange: "1900:2100"
        });
    });

    $(function txtTanggal15() {
        $("[id$=txtTanggal15]").datepicker({
            dateFormat: "yy-mm-dd", buttonImageOnly: true, changeYear: true, changeMonth: true, yearRange: "1900:2100"
        });
    });

    $(function txtTanggal16() {
        $("[id$=txtTanggal16]").datepicker({
            dateFormat: "yy-mm-dd", buttonImageOnly: true, changeYear: true, changeMonth: true, yearRange: "1900:2100"
        });
    });

    $(function txtTanggal17() {
        $("[id$=txtTanggal17]").datepicker({
            dateFormat: "yy-mm-dd", buttonImageOnly: true, changeYear: true, changeMonth: true, yearRange: "1900:2100"
        });
    });

    $(function txtTanggal18() {
        $("[id$=txtTanggal18]").datepicker({
            dateFormat: "yy-mm-dd", buttonImageOnly: true, changeYear: true, changeMonth: true, yearRange: "1900:2100"
        });
    });

    $(function txtTanggal19() {
        $("[id$=txtTanggal19]").datepicker({
            dateFormat: "yy-mm-dd", buttonImageOnly: true, changeYear: true, changeMonth: true, yearRange: "1900:2100"
        });
    });

    $(function txtTanggal20() {
        $("[id$=txtTanggal20]").datepicker({
            dateFormat: "yy-mm-dd", buttonImageOnly: true, changeYear: true, changeMonth: true, yearRange: "1900:2100"
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

    function listmpp() {
        listmpp = new dhtmlXGridObject('gridmpp');
        listmpp.setImagePath("../JavaScript/codebase/imgs/");
        listmpp.setHeader("No.,Keterangan,File,Aksi");
        listmpp.setInitWidths("40,200,200,200");
        listmpp.setColAlign("left,left,left,left");
        listmpp.setColTypes("ro,ro,ro,link");
        listmpp.init();
        listmpp.setSkin("dhx_skyblue");
        listmpp.setPagingSkin("bricks");
        listmpp.setColSorting("str,str,str,str");
    }
    
    function listmpd() {
        listmpd = new dhtmlXGridObject('gridmpd');
        listmpd.setImagePath("../JavaScript/codebase/imgs/");
        listmpd.setHeader("No.,Keterangan,File,Aksi");
        listmpd.setInitWidths("40,200,200,200");
        listmpd.setColAlign("left,left,left,left");
        listmpd.setColTypes("ro,ro,ro,link");
        listmpd.init();
        listmpd.setSkin("dhx_skyblue");
        listmpd.setPagingSkin("bricks");
        listmpd.setColSorting("str,str,str,str");
    }
    
    function listdlm() {
        listdlm = new dhtmlXGridObject('griddlm');
        listdlm.setImagePath("../JavaScript/codebase/imgs/");
        listdlm.setHeader("No.,Keterangan,File,Aksi");
        listdlm.setInitWidths("40,200,200,200");
        listdlm.setColAlign("left,left,left,left");
        listdlm.setColTypes("ro,ro,ro,link");
        listdlm.init();
        listdlm.setSkin("dhx_skyblue");
        listdlm.setPagingSkin("bricks");
        listdlm.setColSorting("str,str,str,str");
    }

    
    function listgms() {
        listgms = new dhtmlXGridObject('gridgms');
        listgms.setImagePath("../JavaScript/codebase/imgs/");
        listgms.setHeader("No.,Keterangan,File,Aksi");
        listgms.setInitWidths("40,200,200,200");
        listgms.setColAlign("left,left,left,left");
        listgms.setColTypes("ro,ro,ro,link");
        listgms.init();
        listgms.setSkin("dhx_skyblue");
        listgms.setPagingSkin("bricks");
        listgms.setColSorting("str,str,str,str");
    }

    

    function listpsm() {
        listpsm = new dhtmlXGridObject('gridpsm');
        listpsm.setImagePath("../JavaScript/codebase/imgs/");
        listpsm.setHeader("No.,Keterangan,File,Aksi");
        listpsm.setInitWidths("40,200,200,200");
        listpsm.setColAlign("left,left,left,left");
        listpsm.setColTypes("ro,ro,ro,link");
        listpsm.init();
        listpsm.setSkin("dhx_skyblue");
        listpsm.setPagingSkin("bricks");
        listpsm.setColSorting("str,str,str,str");
    }

    


    function listmld() {
        listmld = new dhtmlXGridObject('gridmld');
        listmld.setImagePath("../JavaScript/codebase/imgs/");
        listmld.setHeader("No.,Keterangan,File,Aksi");
        listmld.setInitWidths("40,200,200,200");
        listmld.setColAlign("left,left,left,left");
        listmld.setColTypes("ro,ro,ro,link");
        listmld.init();
        listmld.setSkin("dhx_skyblue");
        listmld.setPagingSkin("bricks");
        listmld.setColSorting("str,str,str,str");
    }
    
    function listbdd() {
        listbdd = new dhtmlXGridObject('gridbdd');
        listbdd.setImagePath("../JavaScript/codebase/imgs/");
        listbdd.setHeader("No.,Keterangan,File,Aksi");
        listbdd.setInitWidths("40,200,200,200");
        listbdd.setColAlign("left,left,left,left");
        listbdd.setColTypes("ro,ro,ro,link");
        listbdd.init();
        listbdd.setSkin("dhx_skyblue");
        listbdd.setPagingSkin("bricks");
        listbdd.setColSorting("str,str,str,str");
    }
    
    function listbdtt() {
        listbdtt = new dhtmlXGridObject('griddtt');
        listbdtt.setImagePath("../JavaScript/codebase/imgs/");
        listbdtt.setHeader("No.,Keterangan,File,Aksi");
        listbdtt.setInitWidths("40,200,200,200");
        listbdtt.setColAlign("left,left,left,left");
        listbdtt.setColTypes("ro,ro,ro,link");
        listbdtt.init();
        listbdtt.setSkin("dhx_skyblue");
        listbdtt.setPagingSkin("bricks");
        listbdtt.setColSorting("str,str,str,str");
    }

    function listdtm() {
        listdtm = new dhtmlXGridObject('griddtm');
        listdtm.setImagePath("../JavaScript/codebase/imgs/");
        listdtm.setHeader("No.,Keterangan,File,Aksi");
        listdtm.setInitWidths("40,200,200,200");
        listdtm.setColAlign("left,left,left,left");
        listdtm.setColTypes("ro,ro,ro,link");
        listdtm.init();
        listdtm.setSkin("dhx_skyblue");
        listdtm.setPagingSkin("bricks");
        listdtm.setColSorting("str,str,str,str");
    }
    
    function listppl() {
        listppl = new dhtmlXGridObject('gridppl');
        listppl.setImagePath("../JavaScript/codebase/imgs/");
        listppl.setHeader("No.,Keterangan,File,Aksi");
        listppl.setInitWidths("40,200,200,200");
        listppl.setColAlign("left,left,left,left");
        listppl.setColTypes("ro,ro,ro,link");
        listppl.init();
        listppl.setSkin("dhx_skyblue");
        listppl.setPagingSkin("bricks");
        listppl.setColSorting("str,str,str,str");
    }
    
    function listskb() {
        listskb = new dhtmlXGridObject('gridskb');
        listskb.setImagePath("../JavaScript/codebase/imgs/");
        listskb.setHeader("No.,Keterangan,File,Aksi");
        listskb.setInitWidths("40,200,200,200");
        listskb.setColAlign("left,left,left,left");
        listskb.setColTypes("ro,ro,ro,link");
        listskb.init();
        listskb.setSkin("dhx_skyblue");
        listskb.setPagingSkin("bricks");
        listskb.setColSorting("str,str,str,str");
    }
</script>
</asp:Content>
