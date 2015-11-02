<%@ Page Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="FiveYear.aspx.cs" Inherits="Pages_peta" %>

<asp:Content  ContentPlaceHolderID="head" Runat="Server">


       </asp:Content>
<asp:Content  ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


            <div class="col-lg-12">
                <div id="map" >
                <div id="cari"> 
                    Parcel ID: <input type="text" id="pid" value=" " />      
                    <button id="search" data-dojo-type="dijit.form.Button" type="button" data-dojo-attach-point="button" class="btn btn-sm btn-success">Cari       
                    </button>
                </div>
                <div id="gris">
                    <table height="6em" width="100%" data-dojo-type="dojox/grid/DataGrid" data-dojo-id="grid"  id="grid" data-dojo-props="rowsPerPage:'5', rowSelector:'20px'">
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
            

    <%--<div id="addshp">
              <form enctype="multipart/form-data" method="post" id="uploadForm">
              <div class="field">
                  <label class="file-upload">
                      <span><strong>Add To Map</strong></span>
                      <!--input type="file" name="file" id="inFile" /-->
                      <input type="file" name="file" id="inFile" />
                  </label>
              </div>
              </form>
              <div class="field">
                  <label class="file-upload">
                      <span><strong>Upload</strong></span>
                      <!--input type="file" name="file" id="inFile" /-->
                      <input type="file" name="file" id="uploadshp" onclick="upload()"/>
                  </label>
              </div>
              <span class="file-upload-status" style="opacity:1;" id="upload-status"></span>
              <div id="fileInfo"> </div>
        </div>--%>
    
   
  <%--</div>--%>

    <link href="../JavaScript/webgis/js/313/dijit/themes/claro/claro.css" rel="stylesheet" type="text/css" />
    <link href="../JavaScript/webgis/js/313/dojox/grid/resources/Grid.css" rel="stylesheet" type="text/css" />
     <link href="../JavaScript/webgis/js/313/dojox/grid/resources/claroGrid.css" rel="stylesheet" type="text/css" />
     <link href="../JavaScript/webgis/js/313/esri/css/esri.css" rel="stylesheet" type="text/css" />
      <link href="../JavaScript/webgis/css/layout.css" rel="stylesheet" type="text/css" />
      <script src="../JavaScript/webgis/js/313/init.js" type="text/javascript"></script>
      <script src="../JavaScript/webgis/adaroFiveYear.js" type="text/javascript"></script>
      <script src="../JavaScript/webgis/js/313/upclick-min.js" type="text/javascript"></script>



  </asp:Content>
