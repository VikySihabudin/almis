<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="FlowUtilForm.aspx.cs" Inherits="Pages_LandUtil_FlowUtilForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />

<h1>Form Flow Utilization</h1>
	
<hr />

    <div class="form-group">
    <div class="col-md-2">
       <asp:Label ID="Label9" runat="server" Text="Label">Kode Flow</asp:Label></div>
    <div class="col-md-2">
       <asp:TextBox ID="txtKdLhn" runat="server" class="form-control"></asp:TextBox></div>
    </div>


 <hr />
 <br />


   <div class="form-group">
    <div class="col-md-2">
    <asp:Label ID="Label4" runat="server" Text="Label">Flow</asp:Label></div>

    <div class="col-md-2">
    <asp:DropDownList ID="DropDownList2" runat="server" class="form-control input-md">
             <asp:ListItem Text="Menerima Dan Mencari Infromasi Tanah" Value="0"></asp:ListItem>
             <asp:ListItem Text="Melakukan Diskusi Dengan Stakholder" Value="1"></asp:ListItem>
             <asp:ListItem Text="Memberikan Informasi Mengenai Tujuan Dan Target Pemanfaatan Lahan" Value="1"></asp:ListItem>
             <asp:ListItem Text="Memberikan Infromasi Pendukung Mengenai Pemanfaatan Lahan" Value="1"></asp:ListItem>
             <asp:ListItem Text="Pembukaan Tim Dan Jadwal Kerja" Value="1"></asp:ListItem>  
             <asp:ListItem Text="Approve Tim dan Jadwal Kerja" Value="1"></asp:ListItem> 
             <asp:ListItem Text="Peninjauan Informasi Tanah Berdasarkan Kondisi Saat Ini" Value="1"></asp:ListItem> 
             <asp:ListItem Text="Memberikan Informasi Kondisi Lahan Saat Ini" Value="1"></asp:ListItem> 
             <asp:ListItem Text="Melakukan Analisa Permasalahan" Value="1"></asp:ListItem> 
             <asp:ListItem Text="Memberikan Informasi Analisa Permasalahan" Value="1"></asp:ListItem> 
             <asp:ListItem Text="Identifikasi Pemecahan Masalah" Value="1"></asp:ListItem> 
             <asp:ListItem Text="Evaluasi Kesesuaian Lahan" Value="1"></asp:ListItem>  
             <asp:ListItem Text="Drafting dan Verifikasi MasterPlan" Value="1"></asp:ListItem> 
             <asp:ListItem Text="Melakukan Verifikasi" Value="1"></asp:ListItem>  
             <asp:ListItem Text="Presentasi Dihadapan BOD" Value="1"></asp:ListItem>  
             <asp:ListItem Text="Menghadiri Presentasi MasterPlan" Value="1"></asp:ListItem>  
             <asp:ListItem Text="Pengarsipan dan Pembuatan Report Kerja" Value="1"></asp:ListItem>   
    </asp:DropDownList>
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
                <div id="GridFlow1" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
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

    listFlow1();
    



    function listFlow1() {
        listFlow1 = new dhtmlXGridObject('GridFlow1');
        listFlow1.setImagePath("../JavaScript/codebase/imgs/");
        listFlow1.setHeader("No.,Flow,Keterangan,Dokumen,Aksi");
        listFlow1.setInitWidths("50,200,200,200,200");
        listFlow1.setColAlign("left,left,left,left,left");
        listFlow1.setColTypes("ro,ro,ro,ro,link");
        listFlow1.init();
        listFlow1.setSkin("dhx_skyblue");
        listFlow1.setPagingSkin("bricks");
        listFlow1.setColSorting("str,str,str,str,str");
    }

    


</script>


</asp:Content>
