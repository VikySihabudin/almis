<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="LandcomplaForm.aspx.cs" Inherits="Pages_Landcompla_LandcomplaForm" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />



<h1>Form Land Compliance</h1>
	
	<hr />    
    

		<div class="form-group">

            <label for="nama" class="control-label col-md-2">Nama Peruhaan</label>
            <div class="col-md-2">
             <asp:DropDownList ID="ddprg" runat="server" class="form-control" onclick="handleClick()">
             <asp:ListItem Text="Balangan Coal" Value="0"></asp:ListItem>
             <asp:ListItem Text="Adaro Persada Mandiri" Value="1"></asp:ListItem>
             </asp:DropDownList>
            </div>
        </div>

		<div class="form-group">

            <label for="nama" class="control-label col-md-2">Jenis Project</label>
            <div class="col-md-2">
             <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" onclick="handleClick()">
             <asp:ListItem Text="Hauling" Value="0"></asp:ListItem>
             <asp:ListItem Text="Pit" Value="1"></asp:ListItem>
             <asp:ListItem Text="Disposa" Value="1"></asp:ListItem>
             </asp:DropDownList>
            </div>
        </div>

        <div class="form-group">

            <label for="nama" class="control-label col-md-2">Nama Project</label>
            <div class="col-md-2">
            <asp:TextBox ID="TextBox14" class="form-control input-md" runat="server" value= ""></asp:TextBox>
            </div>

            <div class="col-md-1">
            <input type="button" id="Button4" value="Cari" class="btn btn-info btn-md" onclick="CariCplm()" />
            </div>
        </div>

<%--        <div class="form-group">

            <label for="nama" class="control-label col-md-2">Company</label>
            <div class="col-md-2">
            <asp:TextBox ID="TextBox15" class="form-control input-md" runat="server" value= ""></asp:TextBox>
            </div>

            <div class="col-md-1">
            <input type="button" id="Button5" value="Cari" class="btn btn-info btn-md" onclick="refresh()" />
            </div>
        </div>--%>

        
        <div class="form-group">

            <label for="nama" class="control-label col-md-2">PIC</label>
            <div class="col-md-2">
            <asp:TextBox ID="TextBox2" class="form-control input-md" runat="server" value= ""></asp:TextBox>
            </div>

            <div class="col-md-1">
            <input type="button" id="Button2" value="Cari" class="btn btn-info btn-md" onclick="refresh()" />
            </div>
        </div>
        
        
        <div class="form-group">

            <label for="nama" class="control-label col-md-2">Project Analyst</label>
            <div class="col-md-2">
            <asp:TextBox ID="TextBox3" class="form-control input-md" runat="server" value= ""></asp:TextBox>
            </div>

            <div class="col-md-1">
            <input type="button" id="Button3" value="Cari" class="btn btn-info btn-md" onclick="refresh()" />
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




        <div class="form-group">

            <label for="nama" class="control-label col-md-2">Ulasan Untuk Update Atribut Project</label>
			<div class="col-md-2">
		    <asp:TextBox id="TextBox1" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <input type="button" id="Button1" value="Update" class="btn btn-info btn-md" onclick="refresh()" />
            </div>
        </div>

   <br />
   <hr />

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


               <%--ESRI JS--%>
    <link href="../JavaScript/webgis/js/313/dijit/themes/claro/claro.css" rel="stylesheet" type="text/css" />
    <link href="../JavaScript/webgis/js/313/dojox/grid/resources/Grid.css" rel="stylesheet" type="text/css" />
    <link href="../JavaScript/webgis/js/313/dojox/grid/resources/claroGrid.css" rel="stylesheet" type="text/css" />
    <link href="../JavaScript/webgis/js/313/esri/css/esri.css" rel="stylesheet" type="text/css" />
    <link href="../JavaScript/webgis/css/layout.css" rel="stylesheet" type="text/css" />
    
    <script src="../JavaScript/webgis/js/313/init.js" type="text/javascript" ></script>
    <script src="../JavaScript/webgis/adaro.js" type="text/javascript" ></script>
    <script src="../JavaScript/webgis/js/313/upclick-min.js" type="text/javascript" ></script>


<script type="text/javascript">

    var localURL = "LandcomplaForm.aspx";

    listCompliance();
    lisNmPro();

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
        //listplegal.loadXML(localURL + "?" + s);
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



    function lisNmPro() {
        lisNmPro = new dhtmlXGridObject('gridNmPro');
        lisNmPro.setImagePath("../JavaScript/codebase/imgs/");
        lisNmPro.setHeader("No.,Kode Project,Nama Project");
        lisNmPro.setInitWidths("50,250,250");
        lisNmPro.setColAlign("left,left,left");
        lisNmPro.setColTypes("ro,ro,ro");
        lisNmPro.init();
        lisNmPro.setSkin("dhx_skyblue");


        lisNmPro.setColSorting("str,str,str");
        lisNmPro.attachHeader("#text_filter,#text_filter,#text_filter");
        lisNmPro.enablePaging(true, 15, 5, "pageNmPro", true);
        lisNmPro.setPagingSkin("bricks");
    }




</script>


</asp:Content>
