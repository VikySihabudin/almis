<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="UtilizationForm.aspx.cs" Inherits="Pages_LandUtil_UtilizationForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />

<h1>Land Utilization</h1>
	
<hr />


    <div class="form-group">
    <div class="col-md-2">
       <asp:Label ID="Label9" runat="server" Text="Label">No. Land Utilization :</asp:Label></div>
    <div class="col-md-2">
       <asp:TextBox ID="txtKdLhn" runat="server" class="form-control"></asp:TextBox></div>
    </div>


 <hr />
 <br />


   <div class="form-group">
    <div class="col-md-10">
    <asp:Label ID="Label1" runat="server" Text="Label">Mencari Dan Melengkapi Aplikasi Tanah</asp:Label>
    </div>
   </div>    

   <div class="form-group">
    <div class="col-md-2">
    <asp:Label ID="Label4" runat="server" Text="Label">Keterangan</asp:Label>
    </div>

	<div class="col-md-2">
		<asp:TextBox id="txtAlamat" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
	</div>


    <div class="col-md-1">
    <input type="button" id="Button3" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
    </div>
    </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="GridUtilizitaion1" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>


 <hr />
 <br />


   <div class="form-group">
    <div class="col-md-10">
    <asp:Label ID="Label2" runat="server" Text="Label">Melakukan Diskusi Dengan Stakholder</asp:Label>
    </div>
   </div>    

   <div class="form-group">
    <div class="col-md-2">
    <asp:Label ID="Label3" runat="server" Text="Label">Keterangan</asp:Label>
    </div>

	<div class="col-md-2">
		<asp:TextBox id="TextBox1" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
	</div>


    <div class="col-md-1">
    <input type="button" id="Button1" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
    </div>
    </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="GridUtilizitaion2" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>


 <hr />
 <br />


   <div class="form-group">
    <div class="col-md-10">
    <asp:Label ID="Label5" runat="server" Text="Label">Memberikan Informasi Mengenai Tujuan dan Target Pemanfaatan Lahan</asp:Label>
    </div>
   </div>    

   <div class="form-group">
    <div class="col-md-2">
    <asp:Label ID="Label6" runat="server" Text="Label">Keterangan</asp:Label>
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
            <div style=" width:850px; height:150px;">
                <div id="GridUtilizitaion3" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>


 <hr />
 <br />


   <div class="form-group">
    <div class="col-md-10">
    <asp:Label ID="Label7" runat="server" Text="Label">Memberikan Informasi Pendukung Mengenai Pemanfaatan Lahan</asp:Label>
    </div>
   </div>    

   <div class="form-group">
    <div class="col-md-2">
    <asp:Label ID="Label8" runat="server" Text="Label">Keterangan</asp:Label>
    </div>

	<div class="col-md-2">
		<asp:TextBox id="TextBox3" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
	</div>


    <div class="col-md-1">
    <input type="button" id="Button4" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
    </div>
    </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="GridUtilizitaion4" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>


 <hr />
 <br />


   <div class="form-group">
    <div class="col-md-10">
    <asp:Label ID="Label10" runat="server" Text="Label">Pembentukan Tim dan Jadwal Kerja</asp:Label>
    </div>
   </div>    

   <div class="form-group">
    <div class="col-md-2">
    <asp:Label ID="Label11" runat="server" Text="Label">Keterangan</asp:Label>
    </div>

	<div class="col-md-2">
		<asp:TextBox id="TextBox4" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
	</div>


    <div class="col-md-1">
    <input type="button" id="Button5" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
    </div>
    </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="GridUtilizitaion5" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>


 <hr />
 <br />


   <div class="form-group">
    <div class="col-md-10">
    <asp:Label ID="Label12" runat="server" Text="Label">Approve Tim dan Jadwal Kerja</asp:Label>
    </div>
   </div>    

   <div class="form-group">
    <div class="col-md-2">
    <asp:Label ID="Label13" runat="server" Text="Label">Keterangan</asp:Label>
    </div>

	<div class="col-md-2">
		<asp:TextBox id="TextBox5" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
	</div>


    <div class="col-md-1">
    <input type="button" id="Button6" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
    </div>
    </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="GridUtilizitaion6" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>

 <hr />
 <br />


   <div class="form-group">
    <div class="col-md-10">
    <asp:Label ID="Label14" runat="server" Text="Label">Peninjauan Informasi Tanah Berdasarkan Kondisi Saat Ini</asp:Label>
    </div>
   </div>    

   <div class="form-group">
    <div class="col-md-2">
    <asp:Label ID="Label15" runat="server" Text="Label">Keterangan</asp:Label>
    </div>

	<div class="col-md-2">
		<asp:TextBox id="TextBox6" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
	</div>


    <div class="col-md-1">
    <input type="button" id="Button7" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
    </div>
    </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="GridUtilizitaion7" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>


 <hr />
 <br />


   <div class="form-group">
    <div class="col-md-10">
    <asp:Label ID="Label16" runat="server" Text="Label">Memberikan Informasi Kondisi Lahan Saat Ini</asp:Label>
    </div>
   </div>    

   <div class="form-group">
    <div class="col-md-2">
    <asp:Label ID="Label17" runat="server" Text="Label">Keterangan</asp:Label>
    </div>

	<div class="col-md-2">
		<asp:TextBox id="TextBox7" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
	</div>


    <div class="col-md-1">
    <input type="button" id="Button8" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
    </div>
    </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="GridUtilizitaion8" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>


 <hr />
 <br />


   <div class="form-group">
    <div class="col-md-10">
    <asp:Label ID="Label18" runat="server" Text="Label">Melakukan Analisa Permasalahan</asp:Label>
    </div>
   </div>    

   <div class="form-group">
    <div class="col-md-2">
    <asp:Label ID="Label19" runat="server" Text="Label">Keterangan</asp:Label>
    </div>

	<div class="col-md-2">
		<asp:TextBox id="TextBox8" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
	</div>


    <div class="col-md-1">
    <input type="button" id="Button9" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
    </div>
    </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="GridUtilizitaion9" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>

 <hr />
 <br />


   <div class="form-group">
    <div class="col-md-10">
    <asp:Label ID="Label20" runat="server" Text="Label">Memberikan Informasi dan Analisa Permasalahan</asp:Label>
    </div>
   </div>    

   <div class="form-group">
    <div class="col-md-2">
    <asp:Label ID="Label21" runat="server" Text="Label">Keterangan</asp:Label>
    </div>

	<div class="col-md-2">
		<asp:TextBox id="TextBox9" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
	</div>


    <div class="col-md-1">
    <input type="button" id="Button10" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
    </div>
    </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="GridUtilizitaion10" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>


 <hr />
 <br />


   <div class="form-group">
    <div class="col-md-10">
    <asp:Label ID="Label22" runat="server" Text="Label">Identifikasi Pemecahan Masalah</asp:Label>
    </div>
   </div>    

   <div class="form-group">
    <div class="col-md-2">
    <asp:Label ID="Label23" runat="server" Text="Label">Keterangan</asp:Label>
    </div>

	<div class="col-md-2">
		<asp:TextBox id="TextBox10" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
	</div>


    <div class="col-md-1">
    <input type="button" id="Button11" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
    </div>
    </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="GridUtilizitaion11" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>


 <hr />
 <br />


   <div class="form-group">
    <div class="col-md-10">
    <asp:Label ID="Label24" runat="server" Text="Label">Evaluasi Kesesuaian Lahan</asp:Label>
    </div>
   </div>    

   <div class="form-group">
    <div class="col-md-2">
    <asp:Label ID="Label25" runat="server" Text="Label">Keterangan</asp:Label>
    </div>

	<div class="col-md-2">
		<asp:TextBox id="TextBox11" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
	</div>


    <div class="col-md-1">
    <input type="button" id="Button12" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
    </div>
    </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="GridUtilizitaion12" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>


 <hr />
 <br />


   <div class="form-group">
    <div class="col-md-10">
    <asp:Label ID="Label26" runat="server" Text="Label">Drafting dan Verifikasi MasterPlan</asp:Label>
    </div>
   </div>    

   <div class="form-group">
    <div class="col-md-2">
    <asp:Label ID="Label27" runat="server" Text="Label">Keterangan</asp:Label>
    </div>

	<div class="col-md-2">
		<asp:TextBox id="TextBox12" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
	</div>


    <div class="col-md-1">
    <input type="button" id="Button13" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
    </div>
    </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="GridUtilizitaion13" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>


 <hr />
 <br />


   <div class="form-group">
    <div class="col-md-10">
    <asp:Label ID="Label28" runat="server" Text="Label">Melakukan Verifikasi</asp:Label>
    </div>
   </div>    

   <div class="form-group">
    <div class="col-md-2">
    <asp:Label ID="Label29" runat="server" Text="Label">Keterangan</asp:Label>
    </div>

	<div class="col-md-2">
		<asp:TextBox id="TextBox13" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
	</div>


    <div class="col-md-1">
    <input type="button" id="Button14" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
    </div>
    </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="GridUtilizitaion14" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>


 <hr />
 <br />


   <div class="form-group">
    <div class="col-md-10">
    <asp:Label ID="Label30" runat="server" Text="Label">Presentasi Dihadapan BOD</asp:Label>
    </div>
   </div>    

   <div class="form-group">
    <div class="col-md-2">
    <asp:Label ID="Label31" runat="server" Text="Label">Keterangan</asp:Label>
    </div>

	<div class="col-md-2">
		<asp:TextBox id="TextBox14" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
	</div>


    <div class="col-md-1">
    <input type="button" id="Button15" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
    </div>
    </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="GridUtilizitaion15" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>


 <hr />
 <br />


   <div class="form-group">
    <div class="col-md-10">
    <asp:Label ID="Label32" runat="server" Text="Label">Menghadiri Presentasi MasterPlan </asp:Label>
    </div>
   </div>    

   <div class="form-group">
    <div class="col-md-2">
    <asp:Label ID="Label33" runat="server" Text="Label">Keterangan</asp:Label>
    </div>

	<div class="col-md-2">
		<asp:TextBox id="TextBox15" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
	</div>


    <div class="col-md-1">
    <input type="button" id="Button16" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
    </div>
    </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="GridUtilizitaion16" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>


 <hr />
 <br />


   <div class="form-group">
    <div class="col-md-10">
    <asp:Label ID="Label34" runat="server" Text="Label">Pengarsipan dan Pembuatan Report Kerja</asp:Label>
    </div>
   </div>    

   <div class="form-group">
    <div class="col-md-2">
    <asp:Label ID="Label35" runat="server" Text="Label">Keterangan</asp:Label>
    </div>

	<div class="col-md-2">
		<asp:TextBox id="TextBox16" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
	</div>


    <div class="col-md-1">
    <input type="button" id="Button17" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
    </div>
    </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="GridUtilizitaion17" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>


       <br />
         <hr />

        <div class="form-group">            
            <div class="col-md-8">

                <div id="map" >
                <div id="addshp">
              <div enctype="multipart/form-data" method="post" id="uploadForm">
              <div class="field">
                  <label class="file-upload">
                      <span><strong>Add SHP To Map</strong></span>
                      <!--input type="file" name="file" id="inFile" /-->
                      <input type="file" name="file" id="inFile" />
                  </label>
              </div>
              </div>
             
              <span class="file-upload-status" style="opacity:1;" id="upload-status"></span>
              <div id="fileInfo"> </div>
        </div></div> 
            </div>

            <div class="col-md-4">
                <div id="cari"> 
                    Parcel ID: <input type="text" id="pid" value=" " />      
                    <button id="search" data-dojo-type="dijit.form.Button" type="button" data-dojo-attach-point="button" class="btn btn-sm btn-success">Cari       
                    </button>
                </div>
                <div id="gris">
                    <table height="22em" width="100%" data-dojo-type="dojox/grid/DataGrid" data-dojo-id="grid"  id="grid" data-dojo-props="rowsPerPage:'5', rowSelector:'20px'">
                    <thead>
                    <tr>
                        <th field="PID">Parcel ID</th>
                        <th field="Status_Lhn" >Status</th>
                        <th field="Nama">Nama</th>
                        <th field="Desa">Desa</th>
                        <th field="Registrasi" >Registrasi</th>
                    </tr>
                    </thead>
                    </table>
                </div>
                 
            </div>
        </div>


        

 <hr />
 <br />

<div class="form-group">
        <div class="col-md-10">
       
         <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default"  onclick="btnClick(this)" /> 
         <input type="button" id="btnSave" value="Save"  class="btn btn-lg btn-success" onclick="btnClick(this)" />  

      </div>
</div>


    <%--ESRI JS--%>
    <link href="../JavaScript/webgis/js/313/dijit/themes/claro/claro.css" rel="stylesheet" type="text/css" />
    <link href="../JavaScript/webgis/js/313/dojox/grid/resources/Grid.css" rel="stylesheet" type="text/css" />
    <link href="../JavaScript/webgis/js/313/dojox/grid/resources/claroGrid.css" rel="stylesheet" type="text/css" />
    <link href="../JavaScript/webgis/js/313/esri/css/esri.css" rel="stylesheet" type="text/css" />
    <link href="../JavaScript/webgis/css/layout.css" rel="stylesheet" type="text/css" />
    
    <script src="../JavaScript/webgis/js/313/init.js" type="text/javascript" ></script>
    <script src="../JavaScript/webgis/adaro.js" type="text/javascript" ></script>
    <script src="../JavaScript/webgis/js/313/upclick-min.js" type="text/javascript" ></script>


<script type="text/jscript">

    var txtKdLhn = document.getElementById("<%= txtKdLhn.ClientID %>");

    txtKdLhn.disabled = true;

    ListUtilizitaion1();
    ListUtilizitaion2();
    ListUtilizitaion3();
    ListUtilizitaion4();
    ListUtilizitaion5();
    ListUtilizitaion6();
    ListUtilizitaion7();
    ListUtilizitaion8();
    ListUtilizitaion9();
    ListUtilizitaion10();
    ListUtilizitaion11();
    ListUtilizitaion12();
    ListUtilizitaion13();
    ListUtilizitaion14();
    ListUtilizitaion15();
    ListUtilizitaion16();
    ListUtilizitaion17();
    



    function ListUtilizitaion1() {
        ListUtilizitaion1 = new dhtmlXGridObject('GridUtilizitaion1');
        ListUtilizitaion1.setImagePath("../JavaScript/codebase/imgs/");
        ListUtilizitaion1.setHeader("No.,Keterangan,File,Aksi");
        ListUtilizitaion1.setInitWidths("50,200,200,200");
        ListUtilizitaion1.setColAlign("left,left,left,left");
        ListUtilizitaion1.setColTypes("ro,ro,ro,link");
        ListUtilizitaion1.init();
        ListUtilizitaion1.setSkin("dhx_skyblue");
        ListUtilizitaion1.setPagingSkin("bricks");
        ListUtilizitaion1.setColSorting("str,str,str,str");
    }

    function ListUtilizitaion2() {
        ListUtilizitaion2 = new dhtmlXGridObject('GridUtilizitaion2');
        ListUtilizitaion2.setImagePath("../JavaScript/codebase/imgs/");
        ListUtilizitaion2.setHeader("No.,Keterangan,File,Aksi");
        ListUtilizitaion2.setInitWidths("50,200,200,200");
        ListUtilizitaion2.setColAlign("left,left,left,left");
        ListUtilizitaion2.setColTypes("ro,ro,ro,link");
        ListUtilizitaion2.init();
        ListUtilizitaion2.setSkin("dhx_skyblue");
        ListUtilizitaion2.setPagingSkin("bricks");
        ListUtilizitaion2.setColSorting("str,str,str,str");
    }

    function ListUtilizitaion3() {
        ListUtilizitaion3 = new dhtmlXGridObject('GridUtilizitaion3');
        ListUtilizitaion3.setImagePath("../JavaScript/codebase/imgs/");
        ListUtilizitaion3.setHeader("No.,Keterangan,File,Aksi");
        ListUtilizitaion3.setInitWidths("50,200,200,200");
        ListUtilizitaion3.setColAlign("left,left,left,left");
        ListUtilizitaion3.setColTypes("ro,ro,ro,link");
        ListUtilizitaion3.init();
        ListUtilizitaion3.setSkin("dhx_skyblue");
        ListUtilizitaion3.setPagingSkin("bricks");
        ListUtilizitaion3.setColSorting("str,str,str,str");
    }

    function ListUtilizitaion4() {
        ListUtilizitaion4 = new dhtmlXGridObject('GridUtilizitaion4');
        ListUtilizitaion4.setImagePath("../JavaScript/codebase/imgs/");
        ListUtilizitaion4.setHeader("No.,Keterangan,File,Aksi");
        ListUtilizitaion4.setInitWidths("50,200,200,200");
        ListUtilizitaion4.setColAlign("left,left,left,left");
        ListUtilizitaion4.setColTypes("ro,ro,ro,link");
        ListUtilizitaion4.init();
        ListUtilizitaion4.setSkin("dhx_skyblue");
        ListUtilizitaion4.setPagingSkin("bricks");
        ListUtilizitaion4.setColSorting("str,str,str,str");
    }

    function ListUtilizitaion5() {
        ListUtilizitaion5 = new dhtmlXGridObject('GridUtilizitaion5');
        ListUtilizitaion5.setImagePath("../JavaScript/codebase/imgs/");
        ListUtilizitaion5.setHeader("No.,Keterangan,File,Aksi");
        ListUtilizitaion5.setInitWidths("50,200,200,200");
        ListUtilizitaion5.setColAlign("left,left,left,left");
        ListUtilizitaion5.setColTypes("ro,ro,ro,link");
        ListUtilizitaion5.init();
        ListUtilizitaion5.setSkin("dhx_skyblue");
        ListUtilizitaion5.setPagingSkin("bricks");
        ListUtilizitaion5.setColSorting("str,str,str,str");
    }

    function ListUtilizitaion6() {
        ListUtilizitaion6 = new dhtmlXGridObject('GridUtilizitaion6');
        ListUtilizitaion6.setImagePath("../JavaScript/codebase/imgs/");
        ListUtilizitaion6.setHeader("No.,Keterangan,File,Aksi");
        ListUtilizitaion6.setInitWidths("50,200,200,200");
        ListUtilizitaion6.setColAlign("left,left,left,left");
        ListUtilizitaion6.setColTypes("ro,ro,ro,link");
        ListUtilizitaion6.init();
        ListUtilizitaion6.setSkin("dhx_skyblue");
        ListUtilizitaion6.setPagingSkin("bricks");
        ListUtilizitaion6.setColSorting("str,str,str,str");
    }

    function ListUtilizitaion7() {
        ListUtilizitaion7 = new dhtmlXGridObject('GridUtilizitaion7');
        ListUtilizitaion7.setImagePath("../JavaScript/codebase/imgs/");
        ListUtilizitaion7.setHeader("No.,Keterangan,File,Aksi");
        ListUtilizitaion7.setInitWidths("50,200,200,200");
        ListUtilizitaion7.setColAlign("left,left,left,left");
        ListUtilizitaion7.setColTypes("ro,ro,ro,link");
        ListUtilizitaion7.init();
        ListUtilizitaion7.setSkin("dhx_skyblue");
        ListUtilizitaion7.setPagingSkin("bricks");
        ListUtilizitaion7.setColSorting("str,str,str,str");
    }

    function ListUtilizitaion8() {
        ListUtilizitaion8 = new dhtmlXGridObject('GridUtilizitaion8');
        ListUtilizitaion8.setImagePath("../JavaScript/codebase/imgs/");
        ListUtilizitaion8.setHeader("No.,Keterangan,File,Aksi");
        ListUtilizitaion8.setInitWidths("50,200,200,200");
        ListUtilizitaion8.setColAlign("left,left,left,left");
        ListUtilizitaion8.setColTypes("ro,ro,ro,link");
        ListUtilizitaion8.init();
        ListUtilizitaion8.setSkin("dhx_skyblue");
        ListUtilizitaion8.setPagingSkin("bricks");
        ListUtilizitaion8.setColSorting("str,str,str,str");
    }

    function ListUtilizitaion9() {
        ListUtilizitaion9 = new dhtmlXGridObject('GridUtilizitaion9');
        ListUtilizitaion9.setImagePath("../JavaScript/codebase/imgs/");
        ListUtilizitaion9.setHeader("No.,Keterangan,File,Aksi");
        ListUtilizitaion9.setInitWidths("50,200,200,200");
        ListUtilizitaion9.setColAlign("left,left,left,left");
        ListUtilizitaion9.setColTypes("ro,ro,ro,link");
        ListUtilizitaion9.init();
        ListUtilizitaion9.setSkin("dhx_skyblue");
        ListUtilizitaion9.setPagingSkin("bricks");
        ListUtilizitaion9.setColSorting("str,str,str,str");
    }

    function ListUtilizitaion10() {
        ListUtilizitaion10 = new dhtmlXGridObject('GridUtilizitaion10');
        ListUtilizitaion10.setImagePath("../JavaScript/codebase/imgs/");
        ListUtilizitaion10.setHeader("No.,Keterangan,File,Aksi");
        ListUtilizitaion10.setInitWidths("50,200,200,200");
        ListUtilizitaion10.setColAlign("left,left,left,left");
        ListUtilizitaion10.setColTypes("ro,ro,ro,link");
        ListUtilizitaion10.init();
        ListUtilizitaion10.setSkin("dhx_skyblue");
        ListUtilizitaion10.setPagingSkin("bricks");
        ListUtilizitaion10.setColSorting("str,str,str,str");
    }

    function ListUtilizitaion11() {
        ListUtilizitaion11 = new dhtmlXGridObject('GridUtilizitaion11');
        ListUtilizitaion11.setImagePath("../JavaScript/codebase/imgs/");
        ListUtilizitaion11.setHeader("No.,Keterangan,File,Aksi");
        ListUtilizitaion11.setInitWidths("50,200,200,200");
        ListUtilizitaion11.setColAlign("left,left,left,left");
        ListUtilizitaion11.setColTypes("ro,ro,ro,link");
        ListUtilizitaion11.init();
        ListUtilizitaion11.setSkin("dhx_skyblue");
        ListUtilizitaion11.setPagingSkin("bricks");
        ListUtilizitaion11.setColSorting("str,str,str,str");
    }


    function ListUtilizitaion12() {
        ListUtilizitaion12 = new dhtmlXGridObject('GridUtilizitaion12');
        ListUtilizitaion12.setImagePath("../JavaScript/codebase/imgs/");
        ListUtilizitaion12.setHeader("No.,Keterangan,File,Aksi");
        ListUtilizitaion12.setInitWidths("50,200,200,200");
        ListUtilizitaion12.setColAlign("left,left,left,left");
        ListUtilizitaion12.setColTypes("ro,ro,ro,link");
        ListUtilizitaion12.init();
        ListUtilizitaion12.setSkin("dhx_skyblue");
        ListUtilizitaion12.setPagingSkin("bricks");
        ListUtilizitaion12.setColSorting("str,str,str,str");
    }


    function ListUtilizitaion13() {
        ListUtilizitaion13 = new dhtmlXGridObject('GridUtilizitaion13');
        ListUtilizitaion13.setImagePath("../JavaScript/codebase/imgs/");
        ListUtilizitaion13.setHeader("No.,Keterangan,File,Aksi");
        ListUtilizitaion13.setInitWidths("50,200,200,200");
        ListUtilizitaion13.setColAlign("left,left,left,left");
        ListUtilizitaion13.setColTypes("ro,ro,ro,link");
        ListUtilizitaion13.init();
        ListUtilizitaion13.setSkin("dhx_skyblue");
        ListUtilizitaion13.setPagingSkin("bricks");
        ListUtilizitaion13.setColSorting("str,str,str,str");
    }


    function ListUtilizitaion14() {
        ListUtilizitaion14 = new dhtmlXGridObject('GridUtilizitaion14');
        ListUtilizitaion14.setImagePath("../JavaScript/codebase/imgs/");
        ListUtilizitaion14.setHeader("No.,Keterangan,File,Aksi");
        ListUtilizitaion14.setInitWidths("50,200,200,200");
        ListUtilizitaion14.setColAlign("left,left,left,left");
        ListUtilizitaion14.setColTypes("ro,ro,ro,link");
        ListUtilizitaion14.init();
        ListUtilizitaion14.setSkin("dhx_skyblue");
        ListUtilizitaion14.setPagingSkin("bricks");
        ListUtilizitaion14.setColSorting("str,str,str,str");
    }


    function ListUtilizitaion15() {
        ListUtilizitaion15 = new dhtmlXGridObject('GridUtilizitaion15');
        ListUtilizitaion15.setImagePath("../JavaScript/codebase/imgs/");
        ListUtilizitaion15.setHeader("No.,Keterangan,File,Aksi");
        ListUtilizitaion15.setInitWidths("50,200,200,200");
        ListUtilizitaion15.setColAlign("left,left,left,left");
        ListUtilizitaion15.setColTypes("ro,ro,ro,link");
        ListUtilizitaion15.init();
        ListUtilizitaion15.setSkin("dhx_skyblue");
        ListUtilizitaion15.setPagingSkin("bricks");
        ListUtilizitaion15.setColSorting("str,str,str,str");
    }


    function ListUtilizitaion16() {
        ListUtilizitaion16 = new dhtmlXGridObject('GridUtilizitaion16');
        ListUtilizitaion16.setImagePath("../JavaScript/codebase/imgs/");
        ListUtilizitaion16.setHeader("No.,Keterangan,File,Aksi");
        ListUtilizitaion16.setInitWidths("50,200,200,200");
        ListUtilizitaion16.setColAlign("left,left,left,left");
        ListUtilizitaion16.setColTypes("ro,ro,ro,link");
        ListUtilizitaion16.init();
        ListUtilizitaion16.setSkin("dhx_skyblue");
        ListUtilizitaion16.setPagingSkin("bricks");
        ListUtilizitaion16.setColSorting("str,str,str,str");
    }


    function ListUtilizitaion17() {
        ListUtilizitaion17 = new dhtmlXGridObject('GridUtilizitaion17');
        ListUtilizitaion17.setImagePath("../JavaScript/codebase/imgs/");
        ListUtilizitaion17.setHeader("No.,Keterangan,File,Aksi");
        ListUtilizitaion17.setInitWidths("50,200,200,200");
        ListUtilizitaion17.setColAlign("left,left,left,left");
        ListUtilizitaion17.setColTypes("ro,ro,ro,link");
        ListUtilizitaion17.init();
        ListUtilizitaion17.setSkin("dhx_skyblue");
        ListUtilizitaion17.setPagingSkin("bricks");
        ListUtilizitaion17.setColSorting("str,str,str,str");
    }


    


</script>


</asp:Content>
