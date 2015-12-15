<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="LandcomplaForm.aspx.cs" Inherits="Pages_Landcompla_LandcomplaForm" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<input type="hidden" id="txtNamaProjectHid"/>
<input type="hidden" id="txtPICHid"/>
<input type="hidden" id="txtProjectAnalystHid"/>

<asp:HiddenField ID="namaFile" runat="server" />



<h1>Land Compliance</h1>
	
	<hr />    
    
    

		<div class="form-group">

            <label for="nama" class="control-label col-md-2">Nama Perusahaan</label>
            <div class="col-md-2">
             <asp:DropDownList ID="ddprs" runat="server" class="form-control">
             </asp:DropDownList>
            </div>
        </div>

         <div class="form-group">

            <label for="nama" class="control-label col-md-2">Nomor Complaince</label>
            <div class="col-md-2">
            <asp:TextBox ID="txtNmrComplaH" class="form-control input-md" runat="server"></asp:TextBox>
            </div>

         </div>

<%--         <div class="form-group">

            <label for="nama" class="control-label col-md-2">Date</label>
            <div class="col-md-2">
            <asp:TextBox ID="txtdate" class="form-control input-md" runat="server"></asp:TextBox>
            </div>

         </div>--%>

		<div class="form-group">

            <label for="nama" class="control-label col-md-2">Jenis Project</label>
            <div class="col-md-2">
             <asp:DropDownList ID="ddJenis" runat="server" class="form-control" onclick="handleClick()">             
             <asp:ListItem Text="Disposal" Value="2"></asp:ListItem>
             </asp:DropDownList>
            </div>
        </div>

        <div class="form-group">

            <label for="nama" class="control-label col-md-2">Nama Project</label>
            <div class="col-md-2">
            <asp:TextBox ID="txtNamaProject" class="form-control input-md" runat="server" ></asp:TextBox>
            </div>

            <div class="col-md-1">
            <input type="button" id="btnCariNamaProject" value="Search" class="btn btn-info btn-md" onclick="CariCplm()" />
            </div>
        </div>

<%--        <div class="form-group">

            <label for="nama" class="control-label col-md-2">Company</label>
            <div class="col-md-2">
            <asp:TextBox ID="TextBox15" class="form-control input-md" runat="server" ></asp:TextBox>
            </div>

            <div class="col-md-1">
            <input type="button" id="Button5" value="Cari" class="btn btn-info btn-md" onclick="refresh()" />
            </div>
        </div>--%>

        
        <div class="form-group">

            <label for="nama" class="control-label col-md-2">PIC</label>
            <div class="col-md-2">
            <asp:TextBox ID="txtPIC" class="form-control input-md" runat="server" ></asp:TextBox>
            </div>

            <div class="col-md-1">
            <input type="button" id="btnCariPIC" value="Search" class="btn btn-info btn-md" onclick="CariCplmpic()" />
            </div>
        </div>
        
        
        <div class="form-group">

            <label for="nama" class="control-label col-md-2">Project Analyst</label>
            <div class="col-md-2">
            <asp:TextBox ID="txtProjectAnalyst" class="form-control input-md" runat="server" ></asp:TextBox>
            </div>

            <div class="col-md-1">
            <input type="button" id="btnCariProjectAnalyst" value="Search" class="btn btn-info btn-md" onclick="CariCplmpana()" />
            </div>
        </div>

       <br />
         <hr />

      <%-- <iframe src="http://Viky-pcpeta" width="100%" height="600"></iframe>--%>

    <br />

    <%--Data Attribut Lancompliance--%>
 
    
    <div class="form-group">    
        <label for="nama" class="control-label col-md-1">Kegiatan</label>
        <label for="nama" class="control-label col-md-1">Jenis</label>
        <div class="col-md-5">
		<asp:TextBox id="txtjenis" type="text" runat="server" class="form-control input-md" />
		</div>
    </div> 
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">Deskripsi</label>
        <div class="col-md-5">
		<asp:TextBox id="txtdeskripsi" type="text" runat="server" class="form-control input-md" />
		</div>
    </div> 
    <div class="form-group">
        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">Kontraktor</label>
        <div class="col-md-5">
		<asp:TextBox id="txtkontraktor" type="text" runat="server" class="form-control input-md" />
		</div>
    </div> 
    <hr />
    <div class="form-group">    
        <label for="nama" class="control-label col-md-1">Wilayah Administrasi</label>
        <label for="nama" class="control-label col-md-1"></label>
        <div class="col-md-5">
		<asp:TextBox id="txtwiladmin" type="text" runat="server" class="form-control input-md" />
		</div>
    </div> 
    <hr />
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1">Luas Area Kegiatan</label>
        <label for="nama" class="control-label col-md-1"></label>
        <div class="col-md-5">
		<asp:TextBox id="txtluasarea" type="text" runat="server" class="form-control input-md" />
        
		</div>
        <label for="nama" class="control-label">ha</label>
    </div> 
    <hr />
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1">Data Persil</label>
        <label for="nama" class="control-label col-md-1"></label>
        <div class="col-md-5">
		<asp:TextBox id="txtdatapersil" TextMode="multiline" runat="server" Columns="15" Rows="5"  class="form-control input-md" />
		</div>
    </div> 
    <hr />
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1">Status Tanah</label>
        <label for="nama" class="control-label col-md-1">PKP2B</label>
        <div class="col-md-5">
		<asp:TextBox id="txtpkp2b" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">MoU*</label>
        <div class="col-md-5">
		<asp:TextBox id="txtmou" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">Reklamasi*</label>
        <div class="col-md-5">
		<asp:TextBox id="txtreklamasi" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <hr />
     <div class="form-group">        
        <label for="nama" class="control-label col-md-1">Kawasan Hutan</label>
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">Hutan Lindung</label>
        <div class="col-md-4">
		<asp:TextBox id="txthlindung" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">Hutan Produksi Terbatas</label>
        <div class="col-md-4">
		<asp:TextBox id="txthproduksiterbatas" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">Hutan Produksi Terbatas</label>
        <div class="col-md-4">
		<asp:TextBox id="txthproduksitetap" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
     <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">Hutan Produksi Dapat diKonversi</label>
        <div class="col-md-4">
		<asp:TextBox id="txthkonversi" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
     <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">Diluar Kawasan hutan (APL)</label>
        <div class="col-md-4">
		<asp:TextBox id="txtapl" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <hr />
     <div class="form-group">        
        <label for="nama" class="control-label col-md-1">Perizinan</label>
        <label for="nama" class="control-label col-md-1">IPPKH</label>
        <label for="nama" class="control-label col-sm-1">Tahap I</label>
        <div class="col-md-4">
		<asp:TextBox id="txtipkh1" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-sm-1">Tahap II</label>
        <div class="col-md-4">
		<asp:TextBox id="txtipkh2" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-sm-1">Tahap II</label>
        <div class="col-md-4">
		<asp:TextBox id="txtipkh3" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
     <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-sm-1">Tahap VI</label>
        <div class="col-md-4">
		<asp:TextBox id="txtipkh4" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
     <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-sm-1">Di Luar IPPKH</label>
        <div class="col-md-4">
		<asp:TextBox id="txtluaripkh" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <div class="form-group">
        <label for="nama" class="control-label col-md-1"></label> <hr class="control-label col-md-10"/>
    </div>
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">Izin Lokasi</label>
        <div class="col-md-5">
		<asp:TextBox id="txtizin1" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1"></label>
        <div class="col-md-5">
		<asp:TextBox id="txtizin2" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
     <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1"></label>
        <div class="col-md-5">
		<asp:TextBox id="txtizin3" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
     <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1"></label>
        <div class="col-md-5">
		<asp:TextBox id="txtizin4" type="text" runat="server" class="form-control input-md" />
		</div>
    </div> 
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1"></label>
        <div class="col-md-5">
		<asp:TextBox id="txtizin5" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>   
    <%--<asp:PlaceHolder id="PlaceHolder1" runat="server"></asp:PlaceHolder>--%>

    <div class="form-group">
        <label for="nama" class="control-label col-md-1"></label> <hr class="control-label col-md-10"/>
    </div>
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">Izin Dumping</label>
        <div class="col-md-5">
		<asp:TextBox id="txtizindumping" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">Izin Reklamasi*</label>
        <div class="col-md-5">
		<asp:TextBox id="txtizinreklamasi" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
     <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">Izin Penataan</label>
        <div class="col-md-5">
		<asp:TextBox id="txtizinpenataan" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
     <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">Izin Pemanfaatan Lain*</label>
        <div class="col-md-5">
		<asp:TextBox id="txtizinpemanfaatan" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
     <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">IMB</label>
        <div class="col-md-5">
		<asp:TextBox id="txtizinimb" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <hr />
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1">Pola Ruang (RTRW)</label>
        <label for="nama" class="control-label col-md-1">Status</label>
        <div class="col-md-5">		
		</div>
    </div>
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">Pertambangan Batu Bara : </label>
        <div class="col-md-4">        
		<asp:TextBox id="txtBatubara" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">Hutan Produksi Tetap</label>
        <div class="col-md-4">
		<asp:TextBox id="txthutanproduksi" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
     <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">Pemukiman</label>
        <div class="col-md-4">
		<asp:TextBox id="txtpemukiman" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
     <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">Industri</label>
        <div class="col-md-4">
		<asp:TextBox id="txtindustri" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">Tahun RTRW</label>
        <div class="col-md-5">
		<asp:TextBox id="txttahunrtrw" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <hr />    
     <div class="form-group">        
        <label for="nama" class="control-label col-md-1">Overlaping</label>
        <label for="nama" class="control-label col-md-1">HGU</label>
        <div class="col-md-5">
		<asp:TextBox id="txthgu1" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
     <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1"></label>
        <div class="col-md-5">
		<asp:TextBox id="txthgu2" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1"></label>
        <div class="col-md-5">
		<asp:TextBox id="txthgu3" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1"></label>
        <div class="col-md-5">
		<asp:TextBox id="txthgu4" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1"></label>
        <div class="col-md-5">
		<asp:TextBox id="txthgu5" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <%--<asp:PlaceHolder id="PlaceHolder2" runat="server"></asp:PlaceHolder>--%>

     <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1"></label>
        <div class="col-md-5">
		<asp:TextBox id="txthguluar" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">IUP Sekitar/IUP Lain</label>
        <div class="col-md-5">
		<asp:TextBox id="txtiup1" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <hr />
      <div class="form-group">        
        <label for="nama" class="control-label col-md-1">Fasilitas/Asset yang ada</label>
        <label for="nama" class="control-label col-md-1">Jenis</label>
        <div class="col-md-5">
		<asp:TextBox id="txtjenisaset" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1"></label>
        <label for="nama" class="control-label col-md-1">Status</label>
        <div class="col-md-5">
		<asp:TextBox id="txtstatusaset" type="text" runat="server" class="form-control input-md" />
		</div>
    </div>
    <hr />
    <div class="form-group">        
        <label for="nama" class="control-label col-md-1">Pemanfaatan Oleh Pihak Lain</label>
        <label for="nama" class="control-label col-md-1"></label>
        <div class="col-md-5">
		<asp:TextBox id="txtpemanfPhkLain" type="text" runat="server" class="form-control input-md" />
		</div>
    </div> 
    <hr />
    <%--Membuat Text Berulang--%>
     <%--<asp:PlaceHolder id="PlaceHolder1" runat="server"></asp:PlaceHolder>--%>


        <div class="form-group">

            <label for="nama" class="control-label col-md-1">Legal Note</label>
			<div class="col-md-5">
		    <asp:TextBox id="txtUlasan" TextMode="multiline" class="form-control input-md" Columns="15" Rows="5" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="btnUlasan" value="Update" class="btn btn-info btn-md" onclick="refresh()" />
            </div>
        </div>

   <br />
   <hr />

       <%-- <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label6" runat="server" Text="Label">Start Date</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtStDAte" type="text" runat="server" class="form-control input-md" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label7" runat="server" Text="Label">Interval</asp:Label>
            </div>

			<div class="col-md-1">
		    <asp:TextBox id="txtInterv" type="text" runat="server" class="form-control" onkeypress="return numbersonly(event, false)" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label8" runat="server" Text="Label">End Date</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtEndDate" type="text" runat="server" class="form-control input-md" />
			</div>

        </div>

    <hr />--%>


            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label44" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtTanggal" type="text" runat="server" class="form-control input-md" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label57" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtKeterangan" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="btnUpload" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridCompliance" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>


           
<%--       <div class="col-md-12">
            <div style=" width:550px; height:250px;">
                <div id="gridNmPro" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pageNmPro"> </div>
            </div>
        </div>
        --%>

    <hr />
    <br />
      
    <div class="form-group">
            <div class="col-md-10">
       
                     <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default"  onclick="btnClick(this)" /> 
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



<%--DIALOG--%>

<div id="dialogcom" title="Cari Nama Project" style="font-size:small;">

    <br />

     <div class="form-group">      
       <div class="col-md-12">
            <div style=" width:550px; height:250px;">
                <div id="gridNmPro" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pageNmPro"> </div>
            </div>
        </div>
    </div>
        

</div>

<div id="dialogcompic" title="Cari PIC" style="font-size:small;">

    <br />

     <div class="form-group">      
       <div class="col-md-12">
            <div style=" width:550px; height:250px;">
                <div id="gridPic" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pagePic"> </div>
            </div>
        </div>
    </div>
        

</div>
<div id="dialogcompana" title="Cari Project Analyst" style="font-size:small;">

    <br />

     <div class="form-group">      
       <div class="col-md-12">
            <div style=" width:550px; height:250px;">
                <div id="gridProAnal" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pageProAnal"> </div>
            </div>
        </div>
    </div>
        

</div>


<script type="text/javascript">

    var localURL = "LandcomplaForm.aspx";

    var txtNmrComplaH = document.getElementById("<%=txtNmrComplaH.ClientID%>");
    var txtNamaProject = document.getElementById("<%=txtNamaProject.ClientID%>");
    var txtPIC = document.getElementById("<%=txtPIC.ClientID%>");
    var txtUlasan = document.getElementById("<%=txtUlasan.ClientID%>");
    var txtProjectAnalyst = document.getElementById("<%=txtProjectAnalyst.ClientID%>");
    var txtUlasan = document.getElementById("<%=txtUlasan.ClientID%>");


    
    var ddprs = document.getElementById("<%=ddprs.ClientID%>");
    var ddJenis = document.getElementById("<%=ddJenis.ClientID%>");


    var btnCariNamaProject = document.getElementById("btnCariNamaProject");
    var btnCariPIC = document.getElementById("btnCariPIC");
    var btnCariProjectAnalyst = document.getElementById("btnCariProjectAnalyst");
    var btnUlasan = document.getElementById("btnUlasan");
    var btnUpload = document.getElementById("btnUpload");
    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");

    var Hidmode = document.getElementById("Hidmode");
    var txtPICHid = document.getElementById("txtPICHid");
    var txtProjectAnalystHid = document.getElementById("txtProjectAnalystHid");
    var txtNamaProjectHid = document.getElementById("txtNamaProjectHid");

    //atribut
    var txtjenis = document.getElementById("<%=txtjenis.ClientID%>");
    var txtdeskripsi = document.getElementById("<%=txtdeskripsi.ClientID%>");
    var txtkontraktor = document.getElementById("<%=txtkontraktor.ClientID%>");
    
    var txtwiladmin = document.getElementById("<%=txtwiladmin.ClientID%>");
    var txtluasarea = document.getElementById("<%=txtluasarea.ClientID%>");
    var txtdatapersil = document.getElementById("<%=txtdatapersil.ClientID%>");
    
    var txtpkp2b = document.getElementById("<%=txtpkp2b.ClientID%>");
    var txtmou = document.getElementById("<%=txtmou.ClientID%>");
    var txtreklamasi = document.getElementById("<%=txtreklamasi.ClientID%>");
   
    var txthlindung = document.getElementById("<%=txthlindung.ClientID%>");
    var txthproduksiterbatas = document.getElementById("<%=txthproduksiterbatas.ClientID%>");
    var txthproduksitetap = document.getElementById("<%=txthproduksitetap.ClientID%>");
    var txthkonversi = document.getElementById("<%=txthkonversi.ClientID%>");
    var txtapl = document.getElementById("<%=txtapl.ClientID%>");
     
    var txtipkh1 = document.getElementById("<%=txtipkh1.ClientID%>");
    var txtipkh2 = document.getElementById("<%=txtipkh2.ClientID%>");
    var txtipkh3 = document.getElementById("<%=txtipkh3.ClientID%>");
    var txtipkh4 = document.getElementById("<%=txtipkh4.ClientID%>");
    var txtluaripkh = document.getElementById("<%=txtluaripkh.ClientID%>");
   
    var txtizin1 = document.getElementById("<%=txtizin1.ClientID%>");
    var txtizin2 = document.getElementById("<%=txtizin2.ClientID%>");
    var txtizin3 = document.getElementById("<%=txtizin3.ClientID%>");
    var txtizin4 = document.getElementById("<%=txtizin4.ClientID%>");
    var txtizin5 = document.getElementById("<%=txtizin5.ClientID%>");
   
    var txtizindumping = document.getElementById("<%=txtizindumping.ClientID%>");
    var txtizinreklamasi = document.getElementById("<%=txtizinreklamasi.ClientID%>");
    var txtizinpenataan = document.getElementById("<%=txtizinpenataan.ClientID%>");
    var txtizinpemanfaatan = document.getElementById("<%=txtizinpemanfaatan.ClientID%>");
    var txtizinimb = document.getElementById("<%=txtizinimb.ClientID%>");

    var txthgu1 = document.getElementById("<%=txthgu1.ClientID%>");
    var txthgu2 = document.getElementById("<%=txthgu2.ClientID%>");
    var txthgu3 = document.getElementById("<%=txthgu3.ClientID%>");
    var txthgu4 = document.getElementById("<%=txthgu4.ClientID%>");
    var txthgu5 = document.getElementById("<%=txthgu5.ClientID%>");
    var txthguluar = document.getElementById("<%=txthguluar.ClientID%>");
    var txtiup1 = document.getElementById("<%=txtiup1.ClientID%>");

    var txtjenisaset = document.getElementById("<%=txtjenisaset.ClientID%>");
    var txtstatusaset = document.getElementById("<%=txtstatusaset.ClientID%>");
    var txtpemanfPhkLain = document.getElementById("<%=txtpemanfPhkLain.ClientID%>");

    var txtBatubara = document.getElementById("<%=txtBatubara.ClientID%>");
    var txthutanproduksi = document.getElementById("<%=txthutanproduksi.ClientID%>");
    var txtpemukiman = document.getElementById("<%=txtpemukiman.ClientID%>");
    var txtindustri = document.getElementById("<%=txtindustri.ClientID%>");

    var txttahunrtrw = document.getElementById("<%=txttahunrtrw.ClientID%>"); 



    lisNamaProject();
    listCompliance();
    lisPic();
    lisProjectAnalyst();
    SearchlisPic();
    SearchlisProjectAnalyst();
    SearchlisNmPro();

    terimaURL();



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

    function CRUD(tipe) {

        var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=" + hidMode.value
                + "&param2=" + txtNmrComplaH.value
                + "&param3="
                + "&param4=" + ddJenis.value
                + "&param5=" + txtNamaProjectHid.value
                + "&param6=" + txtPICHid.value
                + "&param7=" + txtProjectAnalystHid.value
                + "&param8=" + txtStDAte.value
                + "&param9=" + txtInterv.value
                + "&param10=" + txtEndDate.value
                + "&param11=" 
                +"&param12=" 
                + "&param13=" + ddprs.value
                + "&param14=" 
                + "";
        //alert(s);
        dhtmlxAjax.post(localURL, s, outputResponse);
    }

    $(function txtStDAte() {
        $("[id$=txtStDAte]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtEndDate() {
        $("[id$=txtEndDate]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtTanggal() {
        $("[id$=txtTanggal]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    function outputResponse(loader) {

        var a = loader.xmlDoc.responseText;
        if (a != '') {
            var b = new Array();
            b = a.split('|');
            
        }
        switch (b[0]) {
        
            case "E":
                alert("Data Berhasil di Edit");
                //window.location.replace(newUrl);
                close();
                break;
            case "I":
                alert("Data Berhasil di Input");
                //window.location.replace(newUrl);
                close();
                break;
            case "D":
                alert("Data Berhasil di Delete");
                //window.location.replace(newUrl);
                close();
                break;
            case "nodelete":
                alert("Data Complaince Tidak Dapat Dihapus Karena Sudah Dilalukan Persiapan Dokumen");
                break;
            case "noedit":
                alert("Data Complaince Tidak Dapat Di Edit Karena Sudah Dilalukan Persiapan Dokumen");
                break;
            case "gagal":
                alert("Data Gagal Disimpan");
                break;
            case "DP":
                alert("Folder Di Delete");
                break;
            default:
                break;
        }

    }

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
            lockComplaEdit();
        }

    }


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
            dhtmlxAjax.post(localURL, s, bindFormCompla);

            var x = b[2].replace("param1=", "");

            if (x == 'V') {

                lockComplaView();
                hidMode.value = 'I';
            }

            else if (x == 'D') {
                lockComplaDelete();
                btnSave.value = 'Delete';
                hidMode.value = 'D';

            }
            else if (x == 'E') {

                lockComplaEdit();
                btnSave.value = 'Save';
                hidMode.value = 'E';


            }
        }

    }

    function bindFormCompla(loader) {
        //alert(loader.xmlDoc.responseText);
        var a = loader.xmlDoc.responseText;
        //        lockKlaimUser();
        if (a != '0') {
            var b = new Array();
            b = a.split('|');

            ddprs.value = b[0];
            txtNmrComplaH.value = b[0];
            txtNamaProject.value = b[2];
            txtPICHid.value = b[4];
            txtProjectAnalystHid.value = b[5];
            txtPIC.value = b[10];
            txtProjectAnalyst.value = b[11];
            txtStDAte.value = b[6];
            txtInterv.value = b[7];
            txtEndDate.value = b[8];
            ddJenis.value = b[3];
//            txtNamaProjectHid.value=b[];
           
        }
    }

    function lockComplaView() {

        txtNamaProject.disabled = true;
        txtPIC.disabled = true;
        txtProjectAnalyst.disabled = true;
        txtUlasan.disabled = true;
        txtNmrComplaH.disabled = true;
        txtEndDate.disabled = true;
        txtInterv.disabled = true;
        txtStDAte.disabled = true;

        ddJenis.disabled = true;
        ddprs.disabled = true;

        document.getElementById('btnSave').style.visibility = 'hidden';
        document.getElementById('btnCariNamaProject').style.visibility = 'hidden';
        document.getElementById('btnCariPIC').style.visibility = 'hidden';
        document.getElementById('btnCariProjectAnalyst').style.visibility = 'hidden';
        document.getElementById('btnUpload').style.visibility = 'hidden';
        document.getElementById('btnUlasan').style.visibility = 'hidden';


        txtjenis.disabled = true;
        txtdeskripsi.disabled = true; 
        txtkontraktor.disabled = true;

        txtwiladmin.disabled = true; 
        txtluasarea.disabled = true; 
        txtdatapersil.disabled = true; 

        txtpkp2b.disabled = true;  
        txtmou.disabled = true;  
        txtreklamasi.disabled = true;  

        txthlindung.disabled = true;  
        txthproduksiterbatas.disabled = true; 
        txthproduksitetap.disabled = true;  
        txthkonversi.disabled = true;  
        txtapl.disabled = true; 

        txtipkh1.disabled = true; 
        txtipkh2.disabled = true;  
        txtipkh3.disabled = true;  
        txtipkh4.disabled = true; 
        txtluaripkh.disabled = true;  

        txtizin1.disabled = true;  
        txtizin2.disabled = true; 
        txtizin3.disabled = true;  
        txtizin4.disabled = true;  
        txtizin5.disabled = true;  

        txtizindumping.disabled = true;  
        txtizinreklamasi.disabled = true;  
        txtizinpenataan.disabled = true;  
        txtizinpemanfaatan.disabled = true;  
        txtizinimb.disabled = true;  

        txthgu1.disabled = true;  
        txthgu2.disabled = true;  
        txthgu3.disabled = true; 
        txthgu4.disabled = true;  
        txthgu5.disabled = true; 
        txthguluar.disabled = true;  
        txtiup1.disabled = true;  

        txtjenisaset.disabled = true;  
        txtstatusaset.disabled = true;  
        txtpemanfPhkLain.disabled = true;  

        txtBatubara.disabled = true;  
        txthutanproduksi.disabled = true;  
        txtpemukiman.disabled = true;  
        txtindustri.disabled = true;

        txttahunrtrw.disabled = true;
    }

    function lockComplaEdit() {
        txtNamaProject.disabled = true;
        txtPIC.disabled = true;
        txtProjectAnalyst.disabled = true;
        txtNmrComplaH.disabled = true;

        txtjenis.disabled = true;
        txtdeskripsi.disabled = true;
        txtkontraktor.disabled = true;

        txtwiladmin.disabled = true;
        txtluasarea.disabled = true;
        txtdatapersil.disabled = true;

        txtpkp2b.disabled = true;
        txtmou.disabled = true;
        txtreklamasi.disabled = true;

        txthlindung.disabled = true;
        txthproduksiterbatas.disabled = true;
        txthproduksitetap.disabled = true;
        txthkonversi.disabled = true;
        txtapl.disabled = true;

        txtipkh1.disabled = true;
        txtipkh2.disabled = true;
        txtipkh3.disabled = true;
        txtipkh4.disabled = true;
        txtluaripkh.disabled = true;

        txtizin1.disabled = true;
        txtizin2.disabled = true;
        txtizin3.disabled = true;
        txtizin4.disabled = true;
        txtizin5.disabled = true;

        txtizindumping.disabled = true;
        txtizinreklamasi.disabled = true;
        txtizinpenataan.disabled = true;
        txtizinpemanfaatan.disabled = true;
        txtizinimb.disabled = true;

        txthgu1.disabled = true;
        txthgu2.disabled = true;
        txthgu3.disabled = true;
        txthgu4.disabled = true;
        txthgu5.disabled = true;
        txthguluar.disabled = true;
        txtiup1.disabled = true;

        txtjenisaset.disabled = true;
        txtstatusaset.disabled = true;
        txtpemanfPhkLain.disabled = true;

        txtBatubara.disabled = true;
        txthutanproduksi.disabled = true;
        txtpemukiman.disabled = true;
        txtindustri.disabled = true;

        txttahunrtrw.disabled = true;
    }

    function lockComplaDelete() {
        txtNamaProject.disabled = true;
        txtPIC.disabled = true;
        txtProjectAnalyst.disabled = true;
        txtNmrComplaH.disabled = true;
        txtUlasan.disabled = true;
        txtStDAte.disabled = true;
        txtInterv.disabled = true;
        txtEndDate.disabled = true;
        ddprs.disabled = true;
        ddJenis.disabled = true;
        document.getElementById('btnCariNamaProject').style.visibility = 'hidden';
        document.getElementById('btnCariPIC').style.visibility = 'hidden';
        document.getElementById('btnCariProjectAnalyst').style.visibility = 'hidden';
        document.getElementById('btnUpload').style.visibility = 'hidden';
        document.getElementById('btnUlasan').style.visibility = 'hidden';

        txtjenis.disabled = true;
        txtdeskripsi.disabled = true;
        txtkontraktor.disabled = true;

        txtwiladmin.disabled = true;
        txtluasarea.disabled = true;
        txtdatapersil.disabled = true;

        txtpkp2b.disabled = true;
        txtmou.disabled = true;
        txtreklamasi.disabled = true;

        txthlindung.disabled = true;
        txthproduksiterbatas.disabled = true;
        txthproduksitetap.disabled = true;
        txthkonversi.disabled = true;
        txtapl.disabled = true;

        txtipkh1.disabled = true;
        txtipkh2.disabled = true;
        txtipkh3.disabled = true;
        txtipkh4.disabled = true;
        txtluaripkh.disabled = true;

        txtizin1.disabled = true;
        txtizin2.disabled = true;
        txtizin3.disabled = true;
        txtizin4.disabled = true;
        txtizin5.disabled = true;

        txtizindumping.disabled = true;
        txtizinreklamasi.disabled = true;
        txtizinpenataan.disabled = true;
        txtizinpemanfaatan.disabled = true;
        txtizinimb.disabled = true;

        txthgu1.disabled = true;
        txthgu2.disabled = true;
        txthgu3.disabled = true;
        txthgu4.disabled = true;
        txthgu5.disabled = true;
        txthguluar.disabled = true;
        txtiup1.disabled = true;

        txtjenisaset.disabled = true;
        txtstatusaset.disabled = true;
        txtpemanfPhkLain.disabled = true;

        txtBatubara.disabled = true;
        txthutanproduksi.disabled = true;
        txtpemukiman.disabled = true;
        txtindustri.disabled = true;

        txttahunrtrw.disabled = true;
    }







    function SearchlisNmPro() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=LNP"
        + "&param1=LNP"
        + "&param2="
        + "";
        lisNamaProject.clearAll();
        lisNamaProject.loadXML(localURL + "?" + s);
    }

    function onRowSelectedNmPro(rowId, cellIndex) {

        txtNamaProjectHid.value = lisNamaProject.cells(rowId, 1).getValue();
        txtNamaProject.value = lisNamaProject.cells(rowId, 1).getValue();

        //alert(txtNamaProject.value);

        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=cekRepeat"
        + "&param1=PRJ"
        + "&param2=" + lisNamaProject.cells(rowId, 1).getValue()
        + "";

        dhtmlxAjax.post(localURL, s, bindCekRepatJS);
        $("#dialogcom").dialog("close");


    }


    function bindCekRepatJS(loader) {
        //alert(loader.xmlDoc.responseText);
        var a = loader.xmlDoc.responseText;
        //        lockKlaimUser();
        if (a != '0') {
            var b = new Array();
            b = a.split('|');

            txtjenis.value = b[0];
            txtdeskripsi.value = b[1];
            txtkontraktor.value = b[2];

            txtwiladmin.value = b[3];
            txtluasarea.value = b[4];
            txtdatapersil.value = b[5];

            txtpkp2b.value = b[6];
            txtmou.value = b[7];
            txtreklamasi.value = b[8];

            txthlindung.value = b[9];
            txthproduksiterbatas.value = b[10];
            txthproduksitetap.value = b[11];
            txthkonversi.value = b[12];
            txtapl.value = b[13];

            txtipkh1.value = b[14];
            txtipkh2.value = b[15];
            txtipkh3.value = b[16];
            txtipkh4.value = b[17];
            txtluaripkh.value = b[18];

            txtizin1.value = b[19];
            txtizin2.value = b[20];
            txtizin3.value = b[21];
            txtizin4.value = b[22];
            txtizin5.value = b[23];

            txtizindumping.value = b[24];
            txtizinreklamasi.value = b[25];
            txtizinpenataan.value = b[26];
            txtizinpemanfaatan.value = b[27];
            txtizinimb.value = b[28];

            txthgu1.value = b[29];
            txthgu2.value = b[30];
            txthgu3.value = b[31];
            txthgu4.value = b[32];
            txthgu5.value = b[33];
            txthguluar.value = b[34];
            txtiup1.value = b[35];

            txtjenisaset.value = b[36];
            txtstatusaset.value = b[37];
            txtpemanfPhkLain.value = b[38];

            txtBatubara.value = b[39];
            txthutanproduksi.value = b[40];
            txtpemukiman.value = b[41];
            txtindustri.value = b[42];          

        }
    }


    function SearchlisPic() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=L"
        + "&param1=LP"
        + "&param2=4"
        + "";
        lisPic.clearAll();
        lisPic.loadXML(localURL + "?" + s);
    }

    function onRowSelectedPIC(rowId, cellIndex) {

        txtPICHid.value = lisPic.cells(rowId, 1).getValue();
        txtPIC.value = lisPic.cells(rowId, 2).getValue();
        $("#dialogcompic").dialog("close");

    }

    function onRowSelectedProAnal(rowId, cellIndex) {

        txtProjectAnalystHid.value = lisProjectAnalyst.cells(rowId, 1).getValue();
        txtProjectAnalyst.value = lisProjectAnalyst.cells(rowId, 2).getValue();
        $("#dialogcompana").dialog("close");

    }
    function SearchlisProjectAnalyst() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=L"
        + "&param1=LP"
        + "&param2=4"
        + "";
        lisProjectAnalyst.clearAll();
        lisProjectAnalyst.loadXML(localURL + "?" + s);
    }

    function CariCplm() {

        $("#dialogcom").dialog("open");

    }

    $(function () {
        $("#dialogcom").dialog
        ({
            autoOpen: false,
            width: 610,
            height: 330,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogcom").dialog("close");
        });
    });

    function CariCplmpic() {

        $("#dialogcompic").dialog("open");

    }

    $(function () {
        $("#dialogcompic").dialog
        ({
            autoOpen: false,
            width: 610,
            height: 330,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogcompic").dialog("close");
        });
    });

    function CariCplmpana() {

        $("#dialogcompana").dialog("open");

    }

    $(function () {
        $("#dialogcompana").dialog
        ({
            autoOpen: false,
            width: 610,
            height: 330,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogcompana").dialog("close");
        });
    });

    

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
        listRequest.loadXML("../xml/Compliance.xml");
    }

    function lisNamaProject() {
        lisNamaProject = new dhtmlXGridObject('gridNmPro');
        lisNamaProject.setImagePath("../JavaScript/codebase/imgs/");
        lisNamaProject.setHeader("No.,Kode Project,Nama Project");
        lisNamaProject.setInitWidths("50,250,0");
        lisNamaProject.setColAlign("left,left,left");
        lisNamaProject.setColTypes("ro,ro,ro");
        lisNamaProject.init();
        lisNamaProject.setSkin("dhx_skyblue");

        lisNamaProject.attachEvent("onRowSelect", onRowSelectedNmPro);

        lisNamaProject.setColSorting("str,str,str");
        lisNamaProject.attachHeader("#text_filter,#text_filter,#text_filter");
        lisNamaProject.enablePaging(true, 15, 5, "pageNmPro", true);
        lisNamaProject.setPagingSkin("bricks");
    }

    function lisPic() {
        lisPic = new dhtmlXGridObject('gridPic');
        lisPic.setImagePath("../JavaScript/codebase/imgs/");
        lisPic.setHeader("No.,Kode PIC,Nama PIC");
        lisPic.setInitWidths("50,250,250");
        lisPic.setColAlign("left,left,left");
        lisPic.setColTypes("ro,ro,ro");
        lisPic.init();
        lisPic.setSkin("dhx_skyblue");

        lisPic.attachEvent("onRowSelect", onRowSelectedPIC);

        lisPic.setColSorting("str,str,str");
        lisPic.attachHeader("#text_filter,#text_filter,#text_filter");
        lisPic.enablePaging(true, 15, 5, "pagePic", true);
        lisPic.setPagingSkin("bricks");
    }

    function lisProjectAnalyst() {
        lisProjectAnalyst = new dhtmlXGridObject('gridProAnal');
        lisProjectAnalyst.setImagePath("../JavaScript/codebase/imgs/");
        lisProjectAnalyst.setHeader("No.,Kode Project Analyst,Name Project Analyst");
        lisProjectAnalyst.setInitWidths("50,250,250");
        lisProjectAnalyst.setColAlign("left,left,left");
        lisProjectAnalyst.setColTypes("ro,ro,ro");
        lisProjectAnalyst.init();
        lisProjectAnalyst.setSkin("dhx_skyblue");

        lisProjectAnalyst.attachEvent("onRowSelect", onRowSelectedProAnal);

        lisProjectAnalyst.setColSorting("str,str,str");
        lisProjectAnalyst.attachHeader("#text_filter,#text_filter,#text_filter");
        lisProjectAnalyst.enablePaging(true, 15, 5, "pageProAnal", true);
        lisProjectAnalyst.setPagingSkin("bricks");
    }

    function listCompliance() {
        listRequest = new dhtmlXGridObject('gridCompliance');
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




</script>


</asp:Content>
