<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="PersiapanInternalForm.aspx.cs" Inherits="Pages_LandCert_PersiapanInternalForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />

<h1>Form Tahapan Persiapan Internal</h1>
	
<hr />

    <div class="form-group">
    <div class="col-md-2">
       <asp:Label ID="Label9" runat="server" Text="Label">No. Persiapan Internal</asp:Label></div>
    <div class="col-md-2">
       <asp:TextBox ID="TextBox5" runat="server" class="form-control"></asp:TextBox></div>
    </div>


	<hr />  
    <br />

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label10" runat="server" Text="Label">Koordinasi Awal Dengan BPN Agar Sertipikasi Dapat Dilakukan Secara Tepat Aturan, Tepat Proses Dan Tepat Waktu</asp:Label>
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
            <input type="button" id="Button5" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="GridPersItl" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>

 <hr />
 <br />



    <div class="form-group">

     <div class="col-md-8">
     <asp:Label ID="Label1" runat="server" Text="Label">Penyiapan Surat Dan Dokumen Yang Dipersyaratkan Dalam Proses Sertipikasi Hak Atas Tanah</asp:Label>
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

    <hr />

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
                <div id="GridPersItl2" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>

 <hr />
 <br />

         <div class="form-group">

            <div class="col-md-8">
            <asp:Label ID="Label4" runat="server" Text="Label">Pemasangan Dan Pembuatan Tanda Batas Lahan</asp:Label>
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
            <input type="button" id="Button2" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
            </div>

            </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="GridPersItl3" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>

 <hr />
 <br />



      <div role="form" class="form-horizontal">
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
 <br />

<div class="form-group">
        <div class="col-md-10">
       
         <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default"  onclick="btnClick(this)" PostBackUrl="~/Pages/PraRegistrasiForm.aspx"/> 
         <input type="button" id="btnSave" value="Save"  class="btn btn-lg btn-success" onclick="btnClick(this)" />  
                     <%--<input type="button" id="Button9" value="Print"  class="btn btn-info btn-lg" onclick="btnAdd(this)" /> --%> 
      </div>
</div>


<script type="text/jscript">

    listGridPersItl();
    listGridPersItl2();
    listGridPersItl3();

    function listGridPersItl() {
        listPLM = new dhtmlXGridObject('GridPersItl');
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

    function listGridPersItl2() {
        listPLM = new dhtmlXGridObject('GridPersItl2');
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

    function listGridPersItl3() {
        listPLM = new dhtmlXGridObject('GridPersItl3');
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
