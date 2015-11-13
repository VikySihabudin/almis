<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="KelasLahanForm.aspx.cs" Inherits="Pages_LandUtil_KelasLahanForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />

<h1>Form Lahan</h1>
	
<hr />

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
       <asp:Label ID="Label7" runat="server" Text="Label">PID</asp:Label></div>
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
    <asp:Label ID="Label3" runat="server" Text="Label">Kriteria</asp:Label></div>

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
        <div class="col-md-10">
       
         <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default"  onclick="btnClick(this)" /> 
         <input type="button" id="btnSave" value="Save"  class="btn btn-lg btn-success" onclick="btnClick(this)" />  

      </div>
</div>


<script type="text/jscript">

    var txtKdLhn = document.getElementById("<%= txtKdLhn.ClientID %>");

    txtKdLhn.disabled = true;

    listGridKlsLhn();
    listGridKlsLhn2();



    function listGridKlsLhn() {
        listPLM = new dhtmlXGridObject('GridKlsLhnl');
        listPLM.setImagePath("../JavaScript/codebase/imgs/");
        listPLM.setHeader("No.,Alas Hak,Aksi");
        listPLM.setInitWidths("50,200,200");
        listPLM.setColAlign("left,left,left");
        listPLM.setColTypes("ro,ro,link");
        listPLM.init();
        listPLM.setSkin("dhx_skyblue");
        listPLM.setPagingSkin("bricks");
        listPLM.setColSorting("str,str,str");
    }

    function listGridKlsLhn2() {
        listPLM = new dhtmlXGridObject('GridKlsLhnl2');
        listPLM.setImagePath("../JavaScript/codebase/imgs/");
        listPLM.setHeader("No.,Kriteria,Deskripsi,Aksi");
        listPLM.setInitWidths("50,200,200,200");
        listPLM.setColAlign("left,left,left,left");
        listPLM.setColTypes("ro,ro,ro,link");
        listPLM.init();
        listPLM.setSkin("dhx_skyblue");
        listPLM.setPagingSkin("bricks");
        listPLM.setColSorting("str,str,str,str");
    }



</script>


</asp:Content>
