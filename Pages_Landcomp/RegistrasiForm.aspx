<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MPtamp.master" AutoEventWireup="true" CodeFile="RegistrasiForm.aspx.cs" Inherits="Pages_RegistrasiForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>

<input type="hidden" id="hidMode" value="0" />
<input type="hidden" id="eksepsi" value="0" />
<input type="hidden" id="skt" value="0" />
<input type="hidden" id="shm" value="0" />
<input type="hidden" id="hak" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />


<h1>Registrasi</h1>
	
	<hr />


	<div role="form" class="form-horizontal" action="#">
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Nama Perusahaan</label>
            <div class="col-md-3"> 
                <asp:DropDownList ID="ddprs" runat="server" class="form-control">
                </asp:DropDownList>
            </div>
        </div>
    </div>
    
    
	<div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Registrasi</label>
            <div class="col-md-3"><asp:TextBox ID="txtNoRegister" class="form-control input-md" runat="server"></asp:TextBox></div>			
        </div>
    </div>

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor PL</label>
            <div class="col-md-3"><asp:TextBox ID="txtNoPL" class="form-control input-md" runat="server"></asp:TextBox></div>			
        </div>
    </div>

    <hr>
    <h4>Identitas Penjual Lahan :</h4>
	<br />

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Identitas</label>
            <div class="col-md-3"><asp:TextBox ID="txtNoIdentitasPenjual" class="form-control input-md" runat="server"></asp:TextBox></div>			
        </div>
    </div>

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nama</label>
            <div class="col-md-3"><asp:TextBox ID="txtNamaPenjual" class="form-control input-md" runat="server"></asp:TextBox></div>			
        </div>
    </div>

    <hr>
    <h4>Identitas Pemilik Lahan :</h4>
	<br />

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Identitas</label>
            <div class="col-md-3"><asp:TextBox ID="txtNoIdentitasPemilik" class="form-control input-md" runat="server"></asp:TextBox></div>			
                     <input type="button" id="btnCari" value="Cari"  class="btn btn-md btn-success" onclick="lookupIdentitas(1)" />  
        </div>
    </div>

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nama</label>
            <div class="col-md-3"><asp:TextBox ID="txtNamaPemilik" class="form-control input-md" runat="server"></asp:TextBox></div>			
        </div>
    </div>

     <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Jenis Kelamin</label>
            <div class="col-md-3">
                <asp:DropDownList ID="ddJenisKelamin" runat="server" class="form-control input-md"></asp:DropDownList>
            </div>			
        </div>
    </div>

     <div class="form-group" class="form-horizontal" action="#">

            <label for="nama" class="control-label col-md-2">Tempat Tanggal Lahir</label>
            <div class="col-sm-2"><asp:TextBox ID="txtTempatLahir" class="form-control input-md" runat="server"></asp:TextBox></div>
			<div class="col-sm-2"><asp:TextBox ID="txtTglLahir" class="form-control input-md" runat="server" type="text"></asp:TextBox></div>
      
     </div>

     <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Pekerjaan</label>
            <div class="col-md-3"> <asp:DropDownList ID="ddPekerjaan" runat="server" class="form-control input-md"></asp:DropDownList></div>			
        </div>
    </div>

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Induk Pegawai</label>
            <div class="col-md-3"><asp:TextBox ID="txtNoIndukPegawai" class="form-control input-md" runat="server"></asp:TextBox></div>			
        </div>
    </div>

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Alamat</label>
            <div class="col-md-3"><asp:TextBox id="txtAlamat" TextMode="multiline" Columns="15" Rows="3" runat="server" class="form-control input-md" placeholder= "..." /></div>			
        </div>
    </div>

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Tanda Identitas yang Berlaku</label>
            <div class="col-md-3"><asp:DropDownList ID="ddTandaIdentitas" class="form-control input-md" runat="server"></asp:DropDownList></div>			
        </div>
    </div>

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Handphone</label>
            <div class="col-md-3"><asp:TextBox id="txtNoHandphone" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>			
        </div>
    </div>

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Status Menikah</label>
            <div class="col-md-3">
                <asp:DropDownList ID="ddStatus" class="form-control input-md" runat="server"></asp:DropDownList>
            </div>			
        </div>
    </div>

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nama Pasangan</label>
            <div class="col-md-3"><asp:TextBox id="txtNamaPasangan" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>			
        </div>
    </div>

     <div class="form-group" class="form-horizontal" action="#">
            <label for="nama" class="control-label col-md-2">Tempat Tanggal Lahir</label>
            <div class="col-sm-2"><asp:TextBox ID="txtTempatLahirPasangan" class="form-control input-md" runat="server"></asp:TextBox></div>
			<div class="col-sm-2"><asp:TextBox ID="txtTglLahirPasangan" class="form-control input-md" runat="server" type="text"></asp:TextBox></div>
     </div>

     <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Tahun Menikah</label>
            <div class="col-md-3"><asp:TextBox id="txtTahunMenikah" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>			
        </div>
    </div>

 <hr />

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:100%; height:130px;">
                <div id="gridAnak" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>
   
              
       <div class="form-group">
            <div class="col-md-10">
            <div style=" width:100%; height:130px;">
                <div id="gridAyah" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

        
       <div class="form-group">
            <div class="col-md-10">
            <div style=" width:100%; height:130px;">
                <div id="gridIbu" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"> 
            </div>
            </div>
        </div>  
        </div>

        
       <div class="form-group">
            <div class="col-md-10">
            <div style=" width:100%; height:130px;">
                <div id="gridSaudara" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>                                     
        </div>


     <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-5">Apakah pemilik lahan pernah membebaskan lahan ke PT. Adaro Indonesia ?</label>
            <div class="col-md-3">
                <asp:DropDownList ID="DDQuest1" class="form-control input-md" runat="server">
                </asp:DropDownList>
                <br />
                <input id="txtBerapaKaliQuest1" type="text" runat="server" class="form-control input-md" placeholder="..." onkeypress="return numbersonly(event, false)"/>
            </div>			
        </div>
    </div>

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-5">Apakah pemilik lahan pernah melakukan claim <br />ke PT. Adaro Indonesia ?</label>
            <div class="col-md-3">
                <asp:DropDownList ID="ddQuest2" class="form-control input-md" runat="server">
                </asp:DropDownList>
                <br />
                <input id="txtBerapaKaliQuest2" type="text" runat="server" class="form-control input-md" placeholder="..." onkeypress="return numbersonly(event, false)"/>
            </div>			
        </div>
    </div>

    <hr>
    <h4>Identitas Lahan :</h4>
	<br />

    <div role="form" class="form-horizontal">
        <div class="col-md-13">            
            <div class="col-sm-2"><asp:CheckBox id="chAlasHak" runat="server" CssClass="form-control checkbox-md" onclick="valala()" Text="Alas Hak" /></div>
            <div class="col-md-2"><asp:DropDownList ID="ddSHM" class="form-control input-md" runat="server"></asp:DropDownList></div>
            <label for="identitas" class="control-label col-sm-2">Nomor</label>
            <div class="col-sm-2"><asp:TextBox id="txtShmNomor" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
            <div class="col-sm-2"><input type="button" id="btnCekSHM" value="cek" onclick="cekDuplikat()" class="btn btn-md btn-success" /></div> 
        </div>
    </div>

    <br />

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
        <div class="col-md-3">
            <asp:Label runat="server" ID="myThrobber" Style="display: none;"><img align="absmiddle" alt="" src="../images/uploading.gif"/></asp:Label>
                <asp:AjaxFileUpload ID="AjaxFileUploadIdentitasLahan" runat="server"
                    onuploadcomplete="AjaxFileUploadIdentitasLahan_UploadComplete" 
                    ThrobberID="myThrobber" 
                    MaximumNumberOfFiles="8" 
                    AllowedFileTypes="jpg,jpeg,png,pdf,doc,docx,xls,xlxs,txt,zip,rar,7z"
                    OnClientUploadComplete="onClientUploadCompleteIdentitasLahan"
                    ViewStateMode="Inherit"/>
            </div>
        </div>
    </div>

       <div class="form-group">
            <div class="col-md-10">
            <div style=" width:100%; height:130px;">
                <div id="gridAlasHak" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>	
            </div>                                     
            </div>
        </div>

    <br />

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <div class="col-md-2"><asp:DropDownList ID="ddPerolehanLahan" class="form-control input-md" runat="server" onChange="javascript:DDKelengkapan()"></asp:DropDownList></div>
            <div class="col-md-3"><asp:DropDownList ID="ddKelengkapan" class="form-control input-md" runat="server"></asp:DropDownList></div>
            <div class="col-md-3">
            <asp:Label runat="server" ID="myThrobber2" Style="display: none;"><img align="absmiddle" alt="" src="../images/uploading.gif"/></asp:Label>
                <asp:AjaxFileUpload ID="AjaxFileUploadKelengkapan" runat="server"
                    onuploadcomplete="AjaxFileUploadKelengkapan_UploadComplete" 
                    ThrobberID="myThrobber" 
                    MaximumNumberOfFiles="8" 
                    AllowedFileTypes="jpg,jpeg,png,pdf,doc,docx,xls,xlxs,txt,zip,rar,7z"
                    OnClientUploadComplete="onClientUploadComplete_Kelengkapan"
                    ViewStateMode="Inherit"/>
            </div>	
        </div>
    </div>

    <div class="form-group">
        <div class="col-md-10">
            <div style=" width:100%; height:130px;">
                 <div id="gridPerolehanLahan" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>		
            </div>                                     
        </div>
    </div>


    <br />

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Tahun Penguasaan Lahan</label>
            <div class="col-md-3"><asp:TextBox ID="txtTahunPemguasaan" class="form-control input-md" runat="server"></asp:TextBox></div>			
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Lokasi Tanah</label>
            <div class="col-md-2">
                <asp:DropDownList ID="ddKabupaten" runat="server" class="form-control input-md"></asp:DropDownList>
            </div>
            <div class="col-md-2">
                <asp:DropDownList ID="ddKecamatan" runat="server" class="form-control input-md"></asp:DropDownList>
            </div>
            <div class="col-md-2">
                <asp:DropDownList ID="ddDesa" runat="server" class="form-control input-md"></asp:DropDownList>
            </div>
        </div>
    </div>

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">

            <label for="identitas" class="control-label col-md-2">Luas Lahan</label>
            <div class="col-md-3"><asp:TextBox ID="txtLuasLahan" class="form-control input-md" runat="server" onkeypress="return numbersonly(event, false)"></asp:TextBox>
            
            
            </div>	
            <label>M2</label>
        </div>
    </div>
    
    <br />

    <div id="dialogKondisiLahan" title="Kondisi Lahan" style="font-size:small;">
    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-3">Kondisi Lahan</label>
            <div class="col-md-5">
                <asp:DropDownList ID="ddKondisiLahan" runat="server" class="form-control input-md"></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="txtKondisiLahan" class="form-control input-md" runat="server"></asp:TextBox>
            </div>
        </div>
    </div>
    <div role="form" class="form-horizontal">
        <div class="form-group">
            <div class="col-md-11" align="right">
                <input type="button" id="PopupbtnSaveKondisiLahan" value="Save" runat="server" class="btn btn-md btn-default" onclick="SaveKondisiLahan()" />
            </div>
        </div>
    </div>
    </div>


    <div role="form" class="form-horizontal">
        <div class="form-group">
            <div class="col-md-10" align="right">
                <input type="button" onclick="PopupKondisiLahan()" id="btnTambahKondisiLahan" value="Tambah" class="btn btn-info btn-md" />
            </div>
        </div>
    </div>

       <div class="form-group">
            <div class="col-md-10">
            <div style=" width:100%; height:130px;">
                <div id="gridKondisiLahan" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>                                     
        </div>

    <br />

    <div id="dialogInfrastruktur" title="Infrastruktur" style="font-size:small;">
    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-3">Infrastruktur</label>
            <div class="col-md-5">
                <asp:DropDownList ID="ddInfrastruktur" runat="server" class="form-control input-md"></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="txtInfrastruktur" class="form-control input-md" runat="server"></asp:TextBox>
            </div>
        </div>
    </div>
    <div role="form" class="form-horizontal">
        <div class="form-group">
            <div class="col-md-11" align="right">
                <input type="button" ID="btnTambahInfastruktur" value="Save" class="btn btn-md btn-default" onclick="SaveInfrastruktur()" />
            </div>
        </div>
    </div>
    </div>


    <div role="form" class="form-horizontal">
        <div class="form-group">
            <div class="col-md-10" align="right">
                <input type="button" onclick="PopupInfrastruktur()" id="Button2" value="Tambah" class="btn btn-info btn-md" />
            </div>
        </div>
    </div>
    
           <div class="form-group">
            <div class="col-md-10">
            <div style=" width:100%; height:130px;">
                <div id="gridInfrastruktur" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>                                     
        </div>


    <br />

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Batas Lahan</label>
            <label for="identitas" class="control-label col-md-1">Utara</label>
            <div class="col-md-2"><asp:TextBox ID="txtBatasUtara" class="form-control input-md" runat="server" onkeypress="return numbersonly(event, false)"></asp:TextBox></div>
            <label for="identitas" class="control-label col-md-1">Selatan</label>		
            <div class="col-md-2"><asp:TextBox ID="txtBatasSelatan" class="form-control input-md" runat="server" onkeypress="return numbersonly(event, false)"></asp:TextBox></div>
        </div>
    </div>

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">&nbsp;</label>
            <label for="identitas" class="control-label col-md-1">Timur</label>
            <div class="col-md-2"><asp:TextBox ID="txtBatasTimur" class="form-control input-md" runat="server" onkeypress="return numbersonly(event, false)"></asp:TextBox></div>
            <label for="identitas" class="control-label col-md-1">Barat</label>		
            <div class="col-md-2"><asp:TextBox ID="txtBatasBarat" class="form-control input-md" runat="server" onkeypress="return numbersonly(event, false)"></asp:TextBox></div>
        </div>
    </div>

    <br /><hr />

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-5">Apakah lahan pernah menjadi sengketa ?</label>
            <div class="col-md-3">
               <asp:DropDownList ID="ddSengketa" class="form-control input-md" runat="server">
                </asp:DropDownList>
                <br />
                <input id="txtPernahSengketa" type="text" runat="server" class="form-control input-md" placeholder="..." onkeypress="return numbersonly(event, false)"/>
            </div>			
        </div>
    </div>

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-5">Apakah lahan pernah menjadi diagunkan ?</label>
            <div class="col-md-3">
               <asp:DropDownList ID="ddDiagunkan" class="form-control input-md" runat="server">
                </asp:DropDownList>
                <br />
                <input id="txtPernahDiagunkan" type="text" runat="server" class="form-control input-md" placeholder="..." onkeypress="return numbersonly(event, false)"/>
            </div>			
        </div>
    </div>

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-5">Apakah alas hak pecahan dari alas hak orang lain ?</label>
            <div class="col-md-3">
               <asp:DropDownList ID="DDPecahanAlasHak" class="form-control input-md" runat="server">
                </asp:DropDownList>
                <br />
                <input id="txtTahunPecahanAlasHak" type="text" runat="server" class="form-control input-md" placeholder="..." onkeypress="return numbersonly(event, false)"/>
            </div>			
        </div>
    </div>

    <hr />

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Keterangan</label>
            <div class="col-md-3"><asp:TextBox id="txtKeterangan" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" runat="server" /></div>			
            <%--<label for="identitas" class="control-label col-md-2">Eksepsi</label>--%>


    <%if (groups.ToString() != "1")
    { %>        
            <%if (except.ToString() != "1")
            { %> 
            <div class="hidden">
            <%}%>

    <%}%> 

            <asp:Label ID="LEksepsi" for="identitas"  class="control-label col-md-2" runat="server" Text="Ekspesi" Font-Bold="True"></asp:Label>
            <div class="col-md-3"><asp:CheckBox ID="chkEksepsi" runat="server" text="Ya" CssClass="form-control checkbox-md" onclick="valeks"/></div>

    <%if (groups.ToString() != "1")
    { %>        
            <%if (except.ToString() != "1")
            { %> 
                </div>
            <%}%>

    <%}%> 

        </div>
    </div>

    <div role="form" class="form-horizontal" action="#">
        <div class="form-group">
        <%--<label for="identitas" class="control-label col-md-2">Lanjut</label>--%>

    <%if (groups.ToString() != "1")
    { %>        
            <%if (lanjut.ToString() != "1")
            { %> 
            <div class="hidden">
            <%}%>

    <%}%> 

         <asp:Label ID="LLanjut" for="identitas"  class="control-label col-md-2" runat="server" Text="Lanjut" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
                <asp:DropDownList ID="ddLanjut" class="form-control input-md" runat="server">
                </asp:DropDownList> 
            </div>

    <%if (groups.ToString() != "1")
    { %>        
            <%if (lanjut.ToString() != "1")
            { %> 
                </div>
            <%}%>

    <%}%>  

    <%if (groups.ToString() != "1")
    { %>        
            <%if (except.ToString() != "1")
            { %> 
                <div class="hidden">
            <%}%>

    <%}%>  

            <asp:Label ID="LKEksepsi" for="identitas"  class="control-label col-md-2" runat="server" Text="Keterangan Ekspesi" Font-Bold="True"></asp:Label>
            <div class="col-md-3"><asp:TextBox id="txtKetEksepsi" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" runat="server" /></div>	

    <%if (groups.ToString() != "1")
    { %>        
            <%if (except.ToString() != "1")
            { %> 
                </div>
            <%}%>

    <%}%>          
            	            
        </div>
    </div>

    <hr />
    <div class="form-group">
        <div class="col-md-10"><center>
                <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default" onclick="btnClick(this)" />
                <input type="button" id="btnSave" value="Save"  class="btn btn-lg btn-success" onclick="btnClick(this)" />
         </center>
        </div>
   </div>




    <script src="../JavaScript/jquery.min.js" type="text/javascript"></script>
    <script src="../JavaScript/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
    <link rel="Stylesheet" type="text/css" href="../css/jquery-ui-1.10.3.custom.css" />


<script type="text/javascript">



    $(function () {
        $("#dialogKondisiLahan").dialog
        ({
            autoOpen: false,
            width: 600,
            height: 200,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogKondisiLahan").dialog("close");
        });
    });


    function PopupKondisiLahan() {
        $("#dialogKondisiLahan").dialog("open");
    }

    function SaveKondisiLahan() {
        var s = ""
                  + "rnd=" + Math.random() * 4
                  + "&sm=IA"
                  + "&param1=I"
                  + "&param2=" + txtNoRegister.value
                  + "&param3=14"
                  + "&param4=" + ddKondisiLahan.value
                  + "&param5=" + txtKondisiLahan.value
                  + "&param6="
                  + "";
        dhtmlxAjax.post(localURL, s);
        alert("Data Kondisi Lahan Berhasil Disimpan")
        SearchlistKondisiLahan();
        $("#dialogKondisiLahan").dialog("close");
    }

    function SearchlistKondisiLahan(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=SA"
            + "&param1=SA"
            + "&param2=" + txtNoRegister.value
            + "&param3=14"
			+ "";
        listKondisiLahan.clearAll();
        listKondisiLahan.loadXML(localURL + "?" + s);
    }


    $(function () {
        $("#dialogInfrastruktur").dialog
        ({
            autoOpen: false,
            width: 600,
            height: 200,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogInfrastruktur").dialog("close");
        });
    });


    function PopupInfrastruktur() {
        $("#dialogInfrastruktur").dialog("open");
    }

    function SaveInfrastruktur() {
        var s = ""
                  + "rnd=" + Math.random() * 4
                  + "&sm=IA"
                  + "&param1=I"
                  + "&param2=" + txtNoRegister.value
                  + "&param3=15"
                  + "&param4=" + ddInfrastruktur.value
                  + "&param5=" + txtInfrastruktur.value
                  + "&param6="
                  + "";
        dhtmlxAjax.post(localURL, s);
        alert("Data Infrastruktur Berhasil Disimpan")
        SearchlistInfrastruktur();
        $("#dialogInfrastruktur").dialog("close");
    }

    function SearchlistInfrastruktur(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=SA"
            + "&param1=SA"
            + "&param2=" + txtNoRegister.value
            + "&param3=15"
			+ "";
        listInfrastrukturLahan.clearAll();
        listInfrastrukturLahan.loadXML(localURL + "?" + s);
    }



    $(function tglLahir() {
        $("[id$=txtTglLahir]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function tglLahirpas() {
        $("[id$=txtTglLahirPasangan]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });


    listKondisiLahan();
    listInfrastrukturLahan();

    listAnak();
    listAyah();
    listIbu();
    listSaudara();
    listAlasHak();
    listPerolehanLahan();








    function valeks() {
        if (document.getElementById("<%= chkEksepsi.ClientID %>").checked) {
            eksepsi.value = '1';
        } else {
            eksepsi.value = '0';
        }
    }


    function valala() {
        if (document.getElementById("<%= chAlasHak.ClientID %>").checked) {
            hak.value = '1';
        } else {
            hak.value = '0';
        }
    }
    

    function listAnak() {
        listAnak = new dhtmlXGridObject('gridAnak');
        listAnak.setImagePath("../JavaScript/codebase/imgs/");
        listAnak.setHeader("No,Nama Anak Kandung,Tanggal Lahir,Pekerjaan,Alamat");
        listAnak.setInitWidths("40,200,200,200,200");
        listAnak.setColAlign("left,left,left,left,left");
        listAnak.setColTypes("ro,ro,ro,ro,ro");
        listAnak.init();
        listAnak.setSkin("dhx_skyblue");
        listAnak.setPagingSkin("bricks");
        listAnak.setColSorting("str,str,str,str,str");
    }

    function listAyah() {
        listAyah = new dhtmlXGridObject('gridAyah');
        listAyah.setImagePath("../JavaScript/codebase/imgs/");
        listAyah.setHeader("No,Nama Ayah Kandung,Tanggal Lahir,Pekerjaan,Alamat");
        listAyah.setInitWidths("40,200,200,200,200");
        listAyah.setColAlign("left,left,left,left,left");
        listAyah.setColTypes("ro,ro,ro,ro,ro");
        listAyah.init();
        listAyah.setSkin("dhx_skyblue");
        listAyah.setPagingSkin("bricks");
        listAyah.setColSorting("str,str,str,str,str");
    }

    function listIbu() {
        listIbu = new dhtmlXGridObject('gridIbu');
        listIbu.setImagePath("../JavaScript/codebase/imgs/");
        listIbu.setHeader("No,Nama Ibu Kandung,Tanggal Lahir,Pekerjaan,Alamat");
        listIbu.setInitWidths("40,200,200,200,200");
        listIbu.setColAlign("left,left,left,left,left");
        listIbu.setColTypes("ro,ro,ro,ro,ro");
        listIbu.init();
        listIbu.setSkin("dhx_skyblue");
        listIbu.setPagingSkin("bricks");
        listIbu.setColSorting("str,str,str,str,str");
    }

    function listSaudara() {
        listSaudara = new dhtmlXGridObject('gridSaudara');
        listSaudara.setImagePath("../JavaScript/codebase/imgs/");
        listSaudara.setHeader("No,Nama Saudara Kandung,Tanggal Lahir,Pekerjaan,Alamat");
        listSaudara.setInitWidths("40,200,200,200,200");
        listSaudara.setColAlign("left,left,left,left,left");
        listSaudara.setColTypes("ro,ro,ro,ro,ro");
        listSaudara.init();
        listSaudara.setSkin("dhx_skyblue");
        listSaudara.setPagingSkin("bricks");
        listSaudara.setColSorting("str,str,str,str,str");
    }

    function listAlasHak() {
        listAlasHak = new dhtmlXGridObject('gridAlasHak');
        listAlasHak.setImagePath("../JavaScript/codebase/imgs/");
        listAlasHak.setHeader("No,Alas Hak,File,Action");
        listAlasHak.setInitWidths("40,200,200,200");
        listAlasHak.setColAlign("left,left,left,left");
        listAlasHak.setColTypes("ro,ro,ro,link");
        listAlasHak.init();
        listAlasHak.setSkin("dhx_skyblue");
        listAlasHak.setPagingSkin("bricks");
        listAlasHak.setColSorting("str,str,str,str");
    }

    function listPerolehanLahan() {
        listPerolehanLahan = new dhtmlXGridObject('gridPerolehanLahan');
        listPerolehanLahan.setImagePath("../JavaScript/codebase/imgs/");
        listPerolehanLahan.setHeader("No,Perolehan Lahan,Keterangan,File,Action");
        listPerolehanLahan.setInitWidths("40,200,200,200,100");
        listPerolehanLahan.setColAlign("left,left,left,left,left");
        listPerolehanLahan.setColTypes("ro,ro,ro,ro,link");
        listPerolehanLahan.init();
        listPerolehanLahan.setSkin("dhx_skyblue");
        listPerolehanLahan.setPagingSkin("bricks");
        listPerolehanLahan.setColSorting("str,str,str,str,str");
    }


    function listKondisiLahan() {
        listKondisiLahan = new dhtmlXGridObject('gridKondisiLahan');
        listKondisiLahan.setImagePath("../JavaScript/codebase/imgs/");
        listKondisiLahan.setHeader("No,Kondisi Lahan,Keterangan,Action");
        listKondisiLahan.setInitWidths("40,200,200,62");
        listKondisiLahan.setColAlign("left,left,left,left");
        listKondisiLahan.setColTypes("ro,ro,ro,link");
        listKondisiLahan.init();
        listKondisiLahan.setSkin("dhx_skyblue");
        listKondisiLahan.setPagingSkin("bricks");
        listKondisiLahan.setColSorting("str,str,str,str");
    }
        
    function listInfrastrukturLahan() {
        listInfrastrukturLahan = new dhtmlXGridObject('gridInfrastruktur');
        listInfrastrukturLahan.setImagePath("../JavaScript/codebase/imgs/");
        listInfrastrukturLahan.setHeader("No,Infrastruktur,Keterangan,Action");
        listInfrastrukturLahan.setInitWidths("40,200,200,100");
        listInfrastrukturLahan.setColAlign("left,left,left,left");
        listInfrastrukturLahan.setColTypes("ro,ro,ro,link");
        listInfrastrukturLahan.init();
        listInfrastrukturLahan.setSkin("dhx_skyblue");
        listInfrastrukturLahan.setPagingSkin("bricks");
        listInfrastrukturLahan.setColSorting("str,str,str,str");
    }
</script>


<script type="text/javascript">

    var localURL = "RegistrasiForm.aspx";
    var txtNoRegister = document.getElementById("<%= txtNoRegister.ClientID %>");
    var txtNoPL = document.getElementById("<%= txtNoPL.ClientID %>");
    var txtNoIdentitasPenjual = document.getElementById("<%= txtNoIdentitasPenjual.ClientID %>");
    var txtNamaPenjual = document.getElementById("<%= txtNamaPenjual.ClientID %>");
    var txtNoIdentitasPemilik = document.getElementById("<%= txtNoIdentitasPemilik.ClientID %>");
    var txtNamaPemilik = document.getElementById("<%= txtNamaPemilik.ClientID %>");
    var ddJenisKelamin = document.getElementById("<%= ddJenisKelamin.ClientID %>");
    var txtTempatLahir = document.getElementById("<%= txtTempatLahir.ClientID %>");
    var txtTglLahir = document.getElementById("<%= txtTglLahir.ClientID %>");
    var ddPekerjaan = document.getElementById("<%= ddPekerjaan.ClientID %>");
    var txtNoIndukPegawai = document.getElementById("<%= txtNoIndukPegawai.ClientID %>");
    var txtAlamat = document.getElementById("<%= txtAlamat.ClientID %>");
    var ddTandaIdentitas = document.getElementById("<%= ddTandaIdentitas.ClientID %>");
    var txtNoHandphone = document.getElementById("<%= txtNoHandphone.ClientID %>");
    var ddStatus = document.getElementById("<%= ddStatus.ClientID %>");
    var txtNamaPasangan = document.getElementById("<%= txtNamaPasangan.ClientID %>");
    var txtTempatLahirPasangan = document.getElementById("<%= txtTempatLahirPasangan.ClientID %>");
    var txtTglLahirPasangan = document.getElementById("<%= txtTglLahirPasangan.ClientID %>");
    var txtTahunMenikah = document.getElementById("<%= txtTahunMenikah.ClientID %>");
    var DDQuest1 = document.getElementById("<%= DDQuest1.ClientID %>");
    var txtBerapaKaliQuest1 = document.getElementById("<%= txtBerapaKaliQuest1.ClientID %>");
    var ddQuest2 = document.getElementById("<%= ddQuest2.ClientID %>");
    var txtBerapaKaliQuest2 = document.getElementById("<%= txtBerapaKaliQuest2.ClientID %>");
    var chAlasHak = document.getElementById("<%= chAlasHak.ClientID %>");
    
    var txtShmNomor = document.getElementById("<%= txtShmNomor.ClientID %>");

   
    var ddSHM = document.getElementById("<%= ddSHM.ClientID %>");
    var ddPerolehanLahan = document.getElementById("<%= ddPerolehanLahan.ClientID %>");
    
    var ddKelengkapan = document.getElementById("<%= ddKelengkapan.ClientID %>");
    var txtTahunPemguasaan = document.getElementById("<%= txtTahunPemguasaan.ClientID %>");
    var ddKabupaten = document.getElementById("<%= ddKabupaten.ClientID %>");
    var ddKecamatan = document.getElementById("<%= ddKecamatan.ClientID %>");
    var ddDesa = document.getElementById("<%= ddDesa.ClientID %>");
    var txtLuasLahan = document.getElementById("<%= txtLuasLahan.ClientID %>");
    var ddKondisiLahan = document.getElementById("<%= ddKondisiLahan.ClientID %>");
    var txtKondisiLahan = document.getElementById("<%= txtKondisiLahan.ClientID %>");
    var ddInfrastruktur = document.getElementById("<%= ddInfrastruktur.ClientID %>");
    var txtInfrastruktur = document.getElementById("<%= txtInfrastruktur.ClientID %>");
    var txtBatasUtara = document.getElementById("<%= txtBatasUtara.ClientID %>");
    var txtBatasSelatan = document.getElementById("<%= txtBatasSelatan.ClientID %>");
    var txtBatasTimur = document.getElementById("<%= txtBatasTimur.ClientID %>");
    var txtBatasBarat = document.getElementById("<%= txtBatasBarat.ClientID %>");
    var ddSengketa = document.getElementById("<%= ddSengketa.ClientID %>");
    var txtPernahSengketa = document.getElementById("<%= txtPernahSengketa.ClientID %>");
    var ddDiagunkan = document.getElementById("<%= ddDiagunkan.ClientID %>");
    var txtPernahDiagunkan = document.getElementById("<%= txtPernahDiagunkan.ClientID %>");
    var DDPecahanAlasHak = document.getElementById("<%= DDPecahanAlasHak.ClientID %>");
    var txtTahunPecahanAlasHak = document.getElementById("<%= txtTahunPecahanAlasHak.ClientID %>");
    var txtKeterangan = document.getElementById("<%= txtKeterangan.ClientID %>");
    var chkEksepsi = document.getElementById("<%= chkEksepsi.ClientID %>");
    var ddLanjut = document.getElementById("<%= ddLanjut.ClientID %>");
    var txtKetEksepsi = document.getElementById("<%= txtKetEksepsi.ClientID %>");
    var ddLanjut = document.getElementById("<%= ddLanjut.ClientID %>");
    var txtKetEksepsi = document.getElementById("<%= txtKetEksepsi.ClientID %>");
   // var btnUpload = document.getElementById("btnUploadAlashak");
    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");
    var btnDelete = document.getElementById("btnDelete");
    var btnCari = document.getElementById("btnCari");
    var btnCekSHM = document.getElementById("btnCekSHM");
    var btnCekSKT = document.getElementById("btnCekSKT");
    var btnTambahInfastruktur = document.getElementById("btnTambahInfastruktur");
    //var btnUploadSurat = document.getElementById("btnUploadSurat");
    var btnTambahKondisiLahan = document.getElementById("btnTambahKondisiLahan");
    var Button2 = document.getElementById("Button2");
    var ddprs = document.getElementById("<%= ddprs.ClientID %>");


    

        terimaURL();



    function terimaURL() {

        var url = window.location.toString();
        //ambil bagian parameternya
        url.match(/\?(.+)$/);
        var params = RegExp.$1;
        // pisahkan parameter URL ke associative array
        var params = '&' + params;
        splitparam(params);
        //alert(params);
    }

    function splitparam(loader) {
        var a = loader;

        if (a != '0') {
            var b = new Array();
            b = a.split('&');

        }
        //alert(b[2].replace("param1=", ""));


        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=SA"
            + "&param1=SA"
            + "&param2=" + b[3].replace("param2=", "")
            + "&param3=14"
			+ "";
        listKondisiLahan.clearAll();
        listKondisiLahan.loadXML(localURL + "?" + s);

        ReloadDetail(b[3].replace("param2=", ""));
        ReloadDetailKelengkapan(b[3].replace("param2=", ""));

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=SA"
            + "&param1=SA"
            + "&param2=" + b[3].replace("param2=", "")
            + "&param3=15"
			+ "";
        listInfrastrukturLahan.clearAll();
        listInfrastrukturLahan.loadXML(localURL + "?" + s);


        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=V"
			+ "&param1=V"
			+ "&param2=" + b[3].replace("param2=", "")
			+ "";

        //alert(s);
        dhtmlxAjax.post(localURL, s, bindFormRegistrasi);

        var x = b[2].replace("param1=", "");
        //alert(x);

        if (x == 'V') {
            lockRegistrasiView();

        }

        else if (x == 'D') {
            lockRegistrasiDelete();
            btnSave.value = 'Delete';
            hidMode.value = 'D';
            //alert(x);

        }
        else if (x == 'E') {
            //alert(x);
            lockRegistrasiEdit();
            btnSave.value = 'Save';
            hidMode.value = 'E';
        }

    }

    
    function bindFormRegistrasi(loader) {        
        var a = loader.xmlDoc.responseText;        

        if (a != '0') {
            var b = new Array();
            b = a.split('|');
            txtNoRegister.value = b[0];
            txtNoPL.value = b[1];

            txtNoIdentitasPenjual.value = b[2];
            txtNamaPenjual.value = b[3];

            txtNoIdentitasPemilik.value = b[4];
            txtNamaPemilik.value = b[5];
            ddJenisKelamin.value = b[6];
            txtTempatLahir.value = b[7];
            txtTglLahir.value = b[8];
            ddPekerjaan.value = b[9];
            txtNoIndukPegawai.value = b[10];
            txtAlamat.value = b[11];
            ddTandaIdentitas.value = b[12];
            txtNoHandphone.value = b[13];
            ddStatus.value = b[14];

            txtNamaPasangan.value = b[15];
            txtTempatLahirPasangan.value = b[16];
            txtTglLahirPasangan.value = b[17];
            txtTahunMenikah.value = b[18];

            

            DDQuest1.value = b[19];
            txtBerapaKaliQuest1.value = b[20];

            ddQuest2.value = b[21];
            txtBerapaKaliQuest2.value = b[22];
            if (b[23] == '1') {
                document.getElementById("<%= chAlasHak.ClientID %>").checked = true;
                hak.value = b[23];
                
            }
            ddSHM.value = b[24];
            txtShmNomor.value = b[25];
            if (b[26] == 1) {
                chSKt.checked = b[26];
            }
//            txtSktNomor.value = b[27];

            txtTahunPemguasaan.value = b[28];
            ddKabupaten.value = b[29];
            ddKecamatan.value = b[30];
            ddDesa.value = b[31];
            txtLuasLahan.value = b[32];

            txtBatasUtara.value = b[33];
            txtBatasSelatan.value = b[34];
            txtBatasTimur.value = b[35];
            txtBatasBarat.value = b[36];

            ddSengketa.value = b[37];
            txtPernahSengketa.value = b[38];

            ddDiagunkan.value = b[39];
            txtPernahDiagunkan.value = b[40];

            DDPecahanAlasHak.value = b[41];
            txtTahunPecahanAlasHak.value = b[42];

            txtKeterangan.value = b[43];
            if (b[44] == 1) {
                chkEksepsi.checked = b[44];
            }
            ddLanjut.value = b[45];
            txtKetEksepsi.value = b[46];
            ddprs.value = b[47];

        }

        Searchlist();
    }

        function Searchlist() {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=LAN"
            + "&param1=LAN"
            + "&param2=" + txtNoIdentitasPenjual.value
			+ "";
        listAnak.clearAll();
        listAnak.loadXML(localURL + "?" + s);

       var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=LAN"
            + "&param1=LS"
            + "&param2=" + txtNoIdentitasPenjual.value
			+ "";
        listSaudara.clearAll();
        listSaudara.loadXML(localURL + "?" + s);

       var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=LAY"
            + "&param1=LAY"
            + "&param2=" + txtNoIdentitasPenjual.value
			+ "";
        listAyah.clearAll();
        listAyah.loadXML(localURL + "?" + s);

       var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=LIB"
            + "&param1=LIB"
            + "&param2=" + txtNoIdentitasPenjual.value
			+ "";
        listIbu.clearAll();
        listIbu.loadXML(localURL + "?" + s);

    }


    function lockRegistrasiView() {
        txtNoRegister.disabled = true;
        txtNoPL.disabled = true;
        txtNoIdentitasPemilik.disabled = true;

        txtNoIdentitasPenjual.disabled = true;
        txtNamaPenjual.disabled = true;

        txtNamaPemilik.disabled = true;
        ddJenisKelamin.disabled = true;
        txtTempatLahir.disabled = true;
        txtTglLahir.disabled = true;
        ddPekerjaan.disabled = true;
        txtNoIndukPegawai.disabled = true;
        txtAlamat.disabled = true;
        ddTandaIdentitas.disabled = true;
        txtNoHandphone.disabled = true;
        ddStatus.disabled = true;
        ddKondisiLahan.disabled = true;
        txtNamaPasangan.disabled = true;
        txtTempatLahirPasangan.disabled = true;
        txtTglLahirPasangan.disabled = true;
        txtTahunMenikah.disabled = true;
        txtLuasLahan.disabled = true;
        txtShmNomor.disabled = true;
//        txtSktNomor.disabled = true;
        txtInfrastruktur.disabled = true;
        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;
        txtKondisiLahan.disabled = true;
        txtBatasUtara.disabled = true;
        txtBatasSelatan.disabled = true;
        txtBatasTimur.disabled = true;
        txtBatasBarat.disabled = true;
        ddSengketa.disabled = true;
        txtPernahSengketa.disabled = true;
        ddDiagunkan.disabled = true;
        txtPernahDiagunkan.disabled = true;
        DDPecahanAlasHak.disabled = true;
        txtTahunPecahanAlasHak.disabled = true;
        txtKeterangan.disabled = true;
        chkEksepsi.disabled = true;
        ddLanjut.disabled = true;
        txtKetEksepsi.disabled = true;
        DDQuest1.disabled = true;
        txtBerapaKaliQuest1.disabled = true;
        ddInfrastruktur.disabled = true;
        ddQuest2.disabled = true;
        txtBerapaKaliQuest2.disabled = true;
        txtTahunPemguasaan.disabled = true;
        chAlasHak.disabled = true;
//        chSHM.disabled = true;
//        chSKt.disabled = true;
        ddSHM.disabled = true;

        ddPerolehanLahan.disabled = true;
        ddKelengkapan.disabled = true;

        //        fileSurat.disabled = true;

        ddprs.disabled = true;

        document.getElementById('btnTambahKondisiLahan').style.visibility = 'hidden';
        document.getElementById('btnTambahInfastruktur').style.visibility = 'hidden';
        document.getElementById('btnCari').style.visibility = 'hidden';
        //document.getElementById('btnUploadSurat').style.visibility = 'hidden';
        
        //document.getElementById('btnUploadAlashak').style.visibility = 'hidden';
        document.getElementById('btnCekSHM').style.visibility = 'hidden';
        //document.getElementById('btnCekSKT').style.visibility = 'hidden';
        txtNoIdentitasPemilik.disabled = true;

        btnSave.disabled = true;
        
        document.getElementById('btnSave').style.visibility = 'hidden';
        document.getElementById('Button2').style.visibility = 'hidden';
        //document.getElementById('btnCancel').style.visibility = 'hidden';

    }



    function lockRegistrasiEdit() {
        txtNoRegister.disabled = true;
        txtNoPL.disabled = true;
        txtNoIdentitasPenjual.disabled = true;
        txtNamaPenjual.disabled = true;

        txtNoIdentitasPemilik.disabled = true;

        txtNamaPemilik.disabled = true;
        ddJenisKelamin.disabled = true;
        txtTempatLahir.disabled = true;
        txtTglLahir.disabled = true;
        ddPekerjaan.disabled = true;
        txtNoIndukPegawai.disabled = true;
        txtAlamat.disabled = true;
        ddTandaIdentitas.disabled = true;
        txtNoHandphone.disabled = true;
        ddStatus.disabled = true;

        txtNamaPasangan.disabled = true;
        txtTempatLahirPasangan.disabled = true;
        txtTglLahirPasangan.disabled = true;
        txtTahunMenikah.disabled = true;

//        txtShmNomor.disabled = true;
//        txtSktNomor.disabled = true;

        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;
    }
    function lockRegistrasiDelete() {
           txtNoRegister.disabled = true;
        txtNoPL.disabled = true;
        txtNoIdentitasPemilik.disabled = true;

        txtNoIdentitasPenjual.disabled = true;
        txtNamaPenjual.disabled = true;

        txtNamaPemilik.disabled = true;
        ddJenisKelamin.disabled = true;
        txtTempatLahir.disabled = true;
        txtTglLahir.disabled = true;
        ddPekerjaan.disabled = true;
        txtNoIndukPegawai.disabled = true;
        txtAlamat.disabled = true;
        ddTandaIdentitas.disabled = true;
        txtNoHandphone.disabled = true;
        ddStatus.disabled = true;
        ddKondisiLahan.disabled = true;
        txtNamaPasangan.disabled = true;
        txtTempatLahirPasangan.disabled = true;
        txtTglLahirPasangan.disabled = true;
        txtTahunMenikah.disabled = true;
        txtLuasLahan.disabled = true;
        txtShmNomor.disabled = true;
//        txtSktNomor.disabled = true;
        txtInfrastruktur.disabled = true;
        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;
        txtKondisiLahan.disabled = true;
        txtBatasUtara.disabled = true;
        txtBatasSelatan.disabled = true;
        txtBatasTimur.disabled = true;
        txtBatasBarat.disabled = true;
        ddSengketa.disabled = true;
        txtPernahSengketa.disabled = true;
        ddDiagunkan.disabled = true;
        txtPernahDiagunkan.disabled = true;
        DDPecahanAlasHak.disabled = true;
        txtTahunPecahanAlasHak.disabled = true;
        txtKeterangan.disabled = true;
        chkEksepsi.disabled = true;
        ddLanjut.disabled = true;
        txtKetEksepsi.disabled = true;
        DDQuest1.disabled = true;
        txtBerapaKaliQuest1.disabled = true;
        ddInfrastruktur.disabled = true;
        ddQuest2.disabled = true;
        txtBerapaKaliQuest2.disabled = true;
        txtTahunPemguasaan.disabled = true;
        chAlasHak.disabled = true;
//        chSHM.disabled = true;
//        chSKt.disabled = true;
        ddSHM.disabled = true;

        ddPerolehanLahan.disabled = true;
        ddKelengkapan.disabled = true;

//        fileSurat.disabled = true;
        ddprs.disabled = true;

        document.getElementById('btnTambahKondisiLahan').style.visibility = 'hidden';
        document.getElementById('btnTambahInfastruktur').style.visibility = 'hidden';
        document.getElementById('btnCari').style.visibility = 'hidden';
        //document.getElementById('btnUploadSurat').style.visibility = 'hidden';
        
        //document.getElementById('btnUploadAlashak').style.visibility = 'hidden';
        document.getElementById('btnCekSHM').style.visibility = 'hidden';
        //document.getElementById('btnCekSKT').style.visibility = 'hidden';
        txtNoIdentitasPemilik.disabled = true;

        //btnSave.disabled = true;
        
        //document.getElementById('btnSave').style.visibility = 'hidden';
        document.getElementById('Button2').style.visibility = 'hidden';
        //document.getElementById('btnCancel').style.visibility = 'hidden';
        

    }

    
    function btnClick(objBtn) {
        switch (objBtn.value) {
            case "Save":
                //alert(hidMode.value);
                CRUD(hidMode.value)
                break;

            case "Delete":
                //alert(objBtn.id);
                if (objBtn.id == 'btnSave') {
                    
                    if (confirm("Hapus Data Ini?"))
                        CRUD(hidMode.value);
                }
                break;

            case "Cancel":
                close();
                break;

            default:
                break;
        }
    }



    function cekDuplikat() {
            var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=cek"
                + "&param1=cek"
                + "&param2="+ txtShmNomor.value
        dhtmlxAjax.post(localURL, s, outputResponse);

    }


    function outputResponse(loader) {
        var a = loader.xmlDoc.responseText;
        if (a != '') {
            var b = new Array();
            b = a.split('|');

            //alert(b);
        }
        switch (b[0]) {
            case "E":
                alert("Data Berhasil Di Edit");
                close();
                break;
            case "D":
                alert("Data Berhasil Di Delete");
                close();
                break;
            case "nodelete":
                alert("Data Registrasi Tidak Dapat Di Hapus Karena Sudah Dilakukan di Transaksi Berikutnya");
                close();
                break;
            case "noedit":
                alert("Data Registrasi Tidak Dapat Di Edit Karena Sudah Dilakukan Pengukuran T0");
                break;
            case "duplikat":
                alert("Data sudah terdaftar di "+b[1]);
                break;
            case "tidak":
                alert("Belum pernah terdaftar, silahkan lanjut.");
                break;
            case "gagal":
                alert("Data Registrasi Gagal Disimpan");
                break;
            default:
                break;
        }

    }

        function Hapus(sm, param1, param2, param3) {
        var r = confirm("Delete?");
        if (r == true) {
            var s = ""
                    + "rnd=" + Math.random() * 4
			        + "&sm=" + sm
                    + "&param1=" + param1
                    + "&param2=" + param2
                    + "&param3=" + param3
                    + "";
            dhtmlxAjax.post(localURL, s);
            SearchlistKondisiLahan();
            SearchlistInfrastruktur();
        }
    }


    function CRUD(tipe) {
        var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=" + tipe.replace("param1=", "")
                + "&param2=" + txtNoRegister.value
                + "&param3="
                + "&param4=" + txtNoPL.value
                + "&param5=" + txtNoIdentitasPemilik.value
                + "&param6=" + DDQuest1.value
                + "&param7=" + txtBerapaKaliQuest1.value
                + "&param8=" + ddQuest2.value
                + "&param9=" + txtBerapaKaliQuest2.value
                + "&param10=" + hak.value
                + "&param11=" + ddSHM.value
                + "&param12=" + txtShmNomor.value
                + "&param13=" + skt.value
                + "&param14=" + //txtSktNomor.value
                + "&param15="
                + "&param16=" + txtTahunPemguasaan.value
                + "&param17=" + txtLuasLahan.value
                + "&param18=" + txtBatasUtara.value
                + "&param19=" + txtBatasSelatan.value
                + "&param20=" + txtBatasTimur.value
                + "&param21=" + txtBatasBarat.value
                + "&param22=" + ddSengketa.value
                + "&param23=" + txtPernahSengketa.value
                + "&param24=" + ddDiagunkan.value
                + "&param25=" + txtPernahDiagunkan.value
                + "&param26=" + DDPecahanAlasHak.value
                + "&param27=" + txtTahunPecahanAlasHak.value
                + "&param28=" + txtKeterangan.value
                + "&param29=" + ddLanjut.value
                + "&param30=" + eksepsi.value
                + "&param31=" + txtKetEksepsi.value
                + "&param32=" 
                + "&param33=" 
                + "&param34="
                + "&param35=" + ddprs.value
                + "";

        //alert(s);

        dhtmlxAjax.post(localURL, s, outputResponse);
          // btnAdd.disabled = false;
    }

   function DDKelengkapan()
    {
    var e = document.getElementById("<%= Page.Master.FindControl("ContentPlaceHolder1").FindControl("ddPerolehanLahan").ClientID %>");
    
            var s = ""
		    + "rnd=" + Math.random()*4
		    + "&sm=ddkl"
            + "&param1=" + e.value
            + "";
        dhtmlxAjax.post(localURL,s,finishSelect);
            
               
    }

    function finishSelect(loader)
	    {		
			
	        var ji=0;
	           
               var i;
               for (i=document.getElementById("<%= Page.Master.FindControl("ContentPlaceHolder1").FindControl("ddKelengkapan").ClientID %>").length-1;i>=0;i--)
               {
                    document.getElementById("<%= Page.Master.FindControl("ContentPlaceHolder1").FindControl("ddKelengkapan").ClientID %>").remove(i);

               }
            var x = new Array();
            x = [];
            x = loader.xmlDoc.responseText.split("|");
            var revid = new Array();
            
            revid = x[0].split("^");
                    
            for(var i = 0;i<x.length-1;i++)
            {
                var y = x[i].split("^");
                
                for(var a = 0;a<y.length-1;a++);
                {
                    var opt = document.createElement("option");
                   
                    document.getElementById("<%= Page.Master.FindControl("ContentPlaceHolder1").FindControl("ddKelengkapan").ClientID %>").options.add(opt);

                    opt.text = y[1];
                    opt.value = y[0];
                }                
            } 

	    }

    function onClientUploadCompleteIdentitasLahan(sender, e) {
        document.getElementById('<%=namaFile.ClientID %>').value = e.get_postedUrl();
        ReloadIdentitasLahan(document.getElementById('<%=txtNoRegister.ClientID %>').value, document.getElementById('<%=namaFile.ClientID %>').value);
        alert('Data Berasil diUpload');
    }
    

    function ReloadIdentitasLahan(id, nama) {

        SaveIdentitasLahan(id, nama);

        var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=ListUploadIdentitasLahan"
			    + "&IDRegistrasi=" + txtNoRegister.value
			    + "&param1=UI"

			    + "";
        centerLoadingImage();
        listAlasHak.clearAll();
        listAlasHak.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }

    function SaveIdentitasLahan(id, nama) {
        var a = nama;
        //alert(a);
        if (a != '') {
            var b = new Array();
            b = a.split('|');
        }
        //        alert(b[0]);
        var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=SaveUploadRegistrasi"
			    + "&IDREGISTRASI=" + txtNoRegister.value
			    + "&NAMA=" + b[0]
			    + "&KETERANGAN="// + ket
			    + "&NOMOR=" + b[1]
                + "&user=" + b[2]
			    + "&wilay=" + b[3]
			    + "&param1=I"
			    + "&param5=" //+ ddJenis.value
			    + "";
+"";
//alert(s);
        centerLoadingImage();
        listAlasHak.clearAll();
        listAlasHak.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }

    function ReloadDetail(nomorRegister) {

//        alert(nomorBayar);
        var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=ListUploadIdentitasLahan"
			    + "&IDRegistrasi=" + nomorRegister
			    + "&param1=UI"

			    + "";
        centerLoadingImage();
        listAlasHak.clearAll();
        listAlasHak.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }

    function onClientUploadComplete_Kelengkapan(sender, e) {

        document.getElementById('<%=namaFile.ClientID %>').value = e.get_postedUrl();
        ReloadKelengkapan(document.getElementById('<%=txtNoRegister.ClientID %>').value, document.getElementById('<%=namaFile.ClientID %>').value);
        alert('Data Berasil diUpload');
    }

    function ReloadKelengkapan(id, nama) {

        SaveKelengkapan(id, nama);

        var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=ListUploadKelengkapan"
			    + "&IDRegistrasi=" + txtNoRegister.value
			    + "&param1=LK"

			    + "";
        centerLoadingImage();
        listPerolehanLahan.clearAll();
        listPerolehanLahan.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });
        //alert(s);

    }

    function SaveKelengkapan(id, nama) {
        var a = nama;
        //alert(a);
        if (a != '') {
            var b = new Array();
            b = a.split('|');
        }
        //        alert(b[0]);
        var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=SaveUploadKelengkapan"
			    + "&IDREGISTRASI=" + txtNoRegister.value
			    + "&NAMA=" + b[0]
			    + "&KETERANGAN="// + ket
			    + "&NOMOR=" + b[1]
                + "&user=" + b[2]
			    + "&wilay=" + b[3]
			    + "&param1=IK"
			    + "&param4=" + ddPerolehanLahan.value
			    + "&param5=" + ddKelengkapan.value
			    + "";
+"";
//alert(s);
        centerLoadingImage();
        listPerolehanLahan.clearAll();
        listPerolehanLahan.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });

    }


    function ReloadDetailKelengkapan(nomorRegister) {

//        alert(nomorBayar);
        var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=ListUploadKelengkapan"
			    + "&IDRegistrasi=" + nomorRegister
			    + "&param1=LK"

			    + "";
        centerLoadingImage();
        listPerolehanLahan.clearAll();
        listPerolehanLahan.loadXML(localURL + "?" + s, function () {
            hideLoadingImage();
        });
        //alert(s);
    }

    function lookupIdentitas(jns) {
        var targets = txtNoIdentitasPemilik.id + ',' + txtNamaPemilik.id + ',';
        var params = txtNoIdentitasPemilik.value + ',';

        lookupOpen(jns, params, targets, '');
    }




</script>

</asp:Content>

