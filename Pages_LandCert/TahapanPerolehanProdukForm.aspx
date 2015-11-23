<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="TahapanPerolehanProdukForm.aspx.cs" Inherits="Pages_LandCert_TahapanPerolehanProdukForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />

<h1>Tahapan Perolehan Produk</h1>
	
<hr />

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">No. Pelaporan Produk</label>
            <div class="col-md-2"><asp:TextBox ID="txtIzinLok" class="form-control input-md" runat="server" value= ""></asp:TextBox></div>
        </div>

	<hr />  
    <br />

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label9" runat="server" Text="Label">BPN Sesuai Kewenangan Menerbitkan SK Pemberian Hak Atas Tanah</asp:Label>
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
                <div id="gridBsw" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>


    <hr />  
    <br />

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label5" runat="server" Text="Label">Pembayaran BPHTB Ke Dinas Pendapatan Daerah Setempat</asp:Label>
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

	<hr />  

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
                <div id="gridPBKD" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

        <div class="form-group">

            <div class="col-md-2">
            <asp:Label ID="Label45" runat="server" Text="Label">Pembayaran</asp:Label>
            </div>

            <div class="col-md-4">
            <asp:CheckBox ID="CheckBox4" runat="server" class="control-label"/>
            </div>

        </div>


	<hr />  
    <br />

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label1" runat="server" Text="Label">PIC Registrasi Menerima Sertipikat HAT dari BPN</asp:Label>
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
            <input type="button" id="Button1" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridPRMS" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

	<hr />  
    <br />

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label4" runat="server" Text="Label">PIC Registrasi Menyerahkan Sertipikat Pemberian HAT Kepada Perusahaan Pemohon</asp:Label>
            </div>

        </div>

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label10" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox3" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label11" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox7" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button3" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridPRMSP" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

<hr />
<br />

		<div class="form-group">
            <label for="nama" class="control-label col-md-1">Noner SK</label>
            <div class="col-md-2"><asp:TextBox ID="TextBox8" class="form-control input-md" runat="server" value= ""></asp:TextBox></div>

            <label for="nama" class="control-label col-md-1">Tanggal SK</label>
            <div class="col-md-2"><asp:TextBox ID="TextBox9" class="form-control input-md" runat="server" value= ""></asp:TextBox></div>
        </div>

    	<hr />  

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label12" runat="server" Text="Label">Tanggal</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox10" type="text" runat="server" class="form-control" />
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label14" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="TextBox13" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button4" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridSK" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
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

<script type="text/jscript">

    listBsw();
    listPBKD();
    listPRMS();
    listPRMSP();
    listSK();




    function listBsw() {
        listBsw = new dhtmlXGridObject('gridBsw');
        listBsw.setImagePath("../JavaScript/codebase/imgs/");
        listBsw.setHeader("No.,Keterangan,File,Aksi");
        listBsw.setInitWidths("40,200,200,200");
        listBsw.setColAlign("left,left,left,left");
        listBsw.setColTypes("ro,ro,ro,link");
        listBsw.init();
        listBsw.setSkin("dhx_skyblue");
        listBsw.setPagingSkin("bricks");
        listBsw.setColSorting("str,str,str,str");
    }
    
    function listPBKD() {
        listPBKD = new dhtmlXGridObject('gridPBKD');
        listPBKD.setImagePath("../JavaScript/codebase/imgs/");
        listPBKD.setHeader("No.,Keterangan,File,Aksi");
        listPBKD.setInitWidths("40,200,200,200");
        listPBKD.setColAlign("left,left,left,left");
        listPBKD.setColTypes("ro,ro,ro,link");
        listPBKD.init();
        listPBKD.setSkin("dhx_skyblue");
        listPBKD.setPagingSkin("bricks");
        listPBKD.setColSorting("str,str,str,str");
    }
    

    
    function listPRMS() {
        listPRMS = new dhtmlXGridObject('gridPRMS');
        listPRMS.setImagePath("../JavaScript/codebase/imgs/");
        listPRMS.setHeader("No.,Keterangan,File,Aksi");
        listPRMS.setInitWidths("40,200,200,200");
        listPRMS.setColAlign("left,left,left,left");
        listPRMS.setColTypes("ro,ro,ro,link");
        listPRMS.init();
        listPRMS.setSkin("dhx_skyblue");
        listPRMS.setPagingSkin("bricks");
        listPRMS.setColSorting("str,str,str,str");
    }

    function listPRMSP() {
        listPRMSP = new dhtmlXGridObject('gridPRMSP');
        listPRMSP.setImagePath("../JavaScript/codebase/imgs/");
        listPRMSP.setHeader("No.,Keterangan,File,Aksi");
        listPRMSP.setInitWidths("40,200,200,200");
        listPRMSP.setColAlign("left,left,left,left");
        listPRMSP.setColTypes("ro,ro,ro,link");
        listPRMSP.init();
        listPRMSP.setSkin("dhx_skyblue");
        listPRMSP.setPagingSkin("bricks");
        listPRMSP.setColSorting("str,str,str,str");
    }
    
    function listSK() {
        listSK = new dhtmlXGridObject('gridSK');
        listSK.setImagePath("../JavaScript/codebase/imgs/");
        listSK.setHeader("No.,Keterangan,File,Aksi");
        listSK.setInitWidths("40,200,200,200");
        listSK.setColAlign("left,left,left,left");
        listSK.setColTypes("ro,ro,ro,link");
        listSK.init();
        listSK.setSkin("dhx_skyblue");
        listSK.setPagingSkin("bricks");
        listSK.setColSorting("str,str,str,str");
    }

</script>


</asp:Content>