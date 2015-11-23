<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="KelasLahanForm.aspx.cs" Inherits="Pages_LandUtil_KelasLahanForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />

<h1>Lahan</h1>
	
<hr />
<br>

    <div class="form-group">
    <div class="col-md-2">
       <asp:Label ID="Label9" runat="server" Text="Label">Kode Lahan</asp:Label></div>
    <div class="col-md-2">
       <asp:TextBox ID="txtKdLhn" runat="server" class="form-control"></asp:TextBox></div>
    </div>


	<hr />  
    <br />

    <div class="form-group">
    <div class="col-md-2">
       <asp:Label ID="Label7" runat="server" Text="Label">Id Poligon</asp:Label></div>
    <div class="col-md-2">
       <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>

    </div>
    <div class="col-md-1">
    <input type="button" id="Button2" value="Cari" class="btn btn-info btn-md" onclick="refresh()" />
    </div>
    </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="GridKlsLhnl" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>

 <hr />
 <br />

    <div class="form-group">
    <div class="col-md-2">
       <asp:Label ID="Label1" runat="server" Text="Label">No. Sk Izin</asp:Label></div>
    <div class="col-md-2">
       <asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox></div>
    </div>

    <div class="form-group">
    <div class="col-md-2">
       <asp:Label ID="Label2" runat="server" Text="Label">Masa Aktif</asp:Label></div>
    <div class="col-md-2">
       <asp:TextBox ID="TextBox3" runat="server" class="form-control"></asp:TextBox></div>
    </div>

 <hr />
 <br />

   <div class="form-group">
    <div class="col-md-2">
    <asp:Label ID="Label3" runat="server" Text="Label">Kelas Lahan</asp:Label></div>

    <div class="col-md-2">
    <asp:DropDownList ID="ddLanjut" runat="server" class="form-control input-md">
    </asp:DropDownList>
    </div>

    <div class="col-md-2">
    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control input-md">
    </asp:DropDownList>
    </div>

    <div class="col-md-1">
    <input type="button" id="Button1" value="Add" class="btn btn-info btn-md" onclick="refresh()" />
    </div>
    </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="GridKlsLhnl2" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>

 <hr />
 <br />

   <div class="form-group">
    <div class="col-md-2">
    <asp:Label ID="Label4" runat="server" Text="Label">Kesesuaian Lahan</asp:Label></div>

    <div class="col-md-2">
    <asp:DropDownList ID="DropDownList2" runat="server" class="form-control input-md">
    </asp:DropDownList>
    </div>

    <div class="col-md-2">
    <asp:DropDownList ID="DropDownList3" runat="server" class="form-control input-md">
    </asp:DropDownList>
    </div>

    <div class="col-md-1">
    <input type="button" id="Button3" value="Add" class="btn btn-info btn-md" onclick="refresh()" />
    </div>
    </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="GridKlsLhnl3" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>

 <hr />
 <br />

   <div class="form-group">
    <div class="col-md-2">
    <asp:Label ID="Label5" runat="server" Text="Label">Penggunaan Lahan</asp:Label></div>

    <div class="col-md-2">
    <asp:DropDownList ID="DropDownList4" runat="server" class="form-control input-md">
    </asp:DropDownList>
    </div>

    <div class="col-md-2">
    <asp:DropDownList ID="DropDownList5" runat="server" class="form-control input-md">
    </asp:DropDownList>
    </div>

    <div class="col-md-1">
    <input type="button" id="Button4" value="Add" class="btn btn-info btn-md" onclick="refresh()" />
    </div>
    </div>
    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="GridKlsLhnl4" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
    </div>
    </div>

 <hr />
<h3>Rekomendasi Lahan</h3>
 <br />

    
    <div class="form-group">
       <div class="col-md-10">
            <div style=" width:850px; height:150px;">
                <div id="GridKlsLhnl5" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
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


<script type="text/jscript">

    var txtKdLhn = document.getElementById("<%= txtKdLhn.ClientID %>");

    txtKdLhn.disabled = true;

    listKlsLhn1();
    listKlsLhn2();
    listKlsLhn3();
    listKlsLhn4();
    listKlsLhn5();



    function listKlsLhn1() {
        listKlsLhn1 = new dhtmlXGridObject('GridKlsLhnl');
        listKlsLhn1.setImagePath("../JavaScript/codebase/imgs/");
        listKlsLhn1.setHeader("No.,Alas Hak,Aksi");
        listKlsLhn1.setInitWidths("50,200,200");
        listKlsLhn1.setColAlign("left,left,left");
        listKlsLhn1.setColTypes("ro,ro,link");
        listKlsLhn1.init();
        listKlsLhn1.setSkin("dhx_skyblue");
        listKlsLhn1.setPagingSkin("bricks");
        listKlsLhn1.setColSorting("str,str,str");
    }

    function listKlsLhn2() {
        listKlsLhn2 = new dhtmlXGridObject('GridKlsLhnl2');
        listKlsLhn2.setImagePath("../JavaScript/codebase/imgs/");
        listKlsLhn2.setHeader("No.,Kriteria,Deskripsi,Aksi");
        listKlsLhn2.setInitWidths("50,200,200,200");
        listKlsLhn2.setColAlign("left,left,left,left");
        listKlsLhn2.setColTypes("ro,ro,ro,link");
        listKlsLhn2.init();
        listKlsLhn2.setSkin("dhx_skyblue");
        listKlsLhn2.setPagingSkin("bricks");
        listKlsLhn2.setColSorting("str,str,str,str");
    }

    function listKlsLhn3() {
        listKlsLhn3 = new dhtmlXGridObject('GridKlsLhnl3');
        listKlsLhn3.setImagePath("../JavaScript/codebase/imgs/");
        listKlsLhn3.setHeader("No.,Kriteria,Deskripsi,Aksi");
        listKlsLhn3.setInitWidths("50,200,200,200");
        listKlsLhn3.setColAlign("left,left,left,left");
        listKlsLhn3.setColTypes("ro,ro,ro,link");
        listKlsLhn3.init();
        listKlsLhn3.setSkin("dhx_skyblue");
        listKlsLhn3.setPagingSkin("bricks");
        listKlsLhn3.setColSorting("str,str,str,str");
    }

    function listKlsLhn4() {
        listKlsLhn4 = new dhtmlXGridObject('GridKlsLhnl4');
        listKlsLhn4.setImagePath("../JavaScript/codebase/imgs/");
        listKlsLhn4.setHeader("No.,Kriteria,Deskripsi,Aksi");
        listKlsLhn4.setInitWidths("50,200,200,200");
        listKlsLhn4.setColAlign("left,left,left,left");
        listKlsLhn4.setColTypes("ro,ro,ro,link");
        listKlsLhn4.init();
        listKlsLhn4.setSkin("dhx_skyblue");
        listKlsLhn4.setPagingSkin("bricks");
        listKlsLhn4.setColSorting("str,str,str,str");
    }

    function listKlsLhn5() {
        listKlsLhn5 = new dhtmlXGridObject('GridKlsLhnl5');
        listKlsLhn5.setImagePath("../JavaScript/codebase/imgs/");
        listKlsLhn5.setHeader("No.,Lahan,Rekomendasi,Aksi");
        listKlsLhn5.setInitWidths("50,200,400,0");
        listKlsLhn5.setColAlign("left,left,left,left");
        listKlsLhn5.setColTypes("ro,ro,ro,link");
        listKlsLhn5.init();
        listKlsLhn5.setSkin("dhx_skyblue");
        listKlsLhn5.setPagingSkin("bricks");
        listKlsLhn5.setColSorting("str,str,str,str");
    }


</script>


</asp:Content>
