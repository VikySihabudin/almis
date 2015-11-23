<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="LMSAddFileForm.aspx.cs" Inherits="Pages_Dokumen_LMSAddFileForm" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />



<h1>LMS Add File</h1>
	
	<hr />    
    
        
		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Izin Lokasi</label>
            <div class="col-md-3"><asp:TextBox ID="txtIzinLok" class="form-control input-md" runat="server" value= ""></asp:TextBox></div>
            <div class="col-md-1"><input type="button" id="Button3" value="Cari"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>
            <%--<div class="col-md-1"><input type="button" id="Button7" value="Form Request"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>--%>
        </div>

	<hr />  

            <div class="form-group">

            <div class="col-sm-2">
            <asp:Label ID="Label1" runat="server" Text="Label">Dokumen</asp:Label>
            </div>


            <div class="col-md-1">
            <asp:Label ID="Label9" runat="server" Text="Label">Tanggal</asp:Label>
            </div>
               
			<div class="col-md-2">
			<asp:Label ID="Label10" runat="server" Text="Label">Keterangan</asp:Label>
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label11" runat="server" Text="Label">Due Date</asp:Label>
            </div>

            <div class="col-md-1">
            <asp:Label ID="Label12" runat="server" Text="Label">Day</asp:Label>
            </div>

            <div class="col-md-1">
            <asp:Label ID="Label13" runat="server" Text="Label">Stop Date</asp:Label>
            </div>

        </div>

        <div class="form-group">
            <div class="col-sm-2">
            <asp:DropDownList ID="ddprg" runat="server" class="form-control">
                <asp:ListItem Text="Yuridis" Value="0"></asp:ListItem>
                <asp:ListItem Text="Teknis" Value="1"></asp:ListItem>
                <asp:ListItem Text="Sosial Teritorial" Value="2"></asp:ListItem>
                <asp:ListItem Text="Rencana Peruntukan" Value="3"></asp:ListItem>
                <asp:ListItem Text="Koordinasi Tim Legal / Handling Lawyer" Value="1"></asp:ListItem>
                <asp:ListItem Text="PIC IL berkordinasi dengan PIC LC" Value="1"></asp:ListItem>
                <asp:ListItem Text="PIC Adm" Value="1"></asp:ListItem>
                <asp:ListItem Text="PIC GR dan pemda setempat terkait permohonanizin lokasi" Value="1"></asp:ListItem>
                <asp:ListItem Text="PIC GR menyampaikan surat permohonan dan dokumen pendukung kepada Pemerintah Daerah" Value="1"></asp:ListItem>
                <asp:ListItem Text="PIC GR menyampaikan surat dan lampiran dokumen permohonan Izin Prinsip kepada Pemda setempat (Dinas terkait yang telah ditunjuk)" Value="1"></asp:ListItem>
            </asp:DropDownList>
            </div>

                <div class="col-md-1">
                <asp:TextBox id="txtTgl" type="text" runat="server" class="form-control" />
                </div>
               
			<div class="col-md-2">
				<asp:TextBox id="txtAlamat" TextMode="multiline" class="form-control input-md" value ="Jalan Bogor Raya" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
            <asp:TextBox id="txtDueDate" type="text" runat="server" class="form-control" />
            </div>

            <div class="col-md-1">
            <asp:TextBox id="TxtDay" type="text" runat="server" class="form-control" />
            </div>

            <div class="col-md-1">
            <asp:TextBox id="TxtStopDate" type="text" runat="server" class="form-control" />
            </div>

                <div class="col-md-2">
                <input type="button" id="btnRefresh" value="Upload" class="btn btn-info btn-md" onclick="refresh()" />
                </div>

        </div>

	

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridLMS" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>



 <%--       <hr />

		
    <H3>Reminder :</H3>

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="LEksepsi" runat="server"  for="identitas" class="control-label col-md-2" Text="Pemda setempat melalui satuan kerja melaksanakan pemerikasaandokumen permohonan Izin Prinsip." Font-Bold="True"></asp:Label>
            
            <asp:Label  ID="Label2" runat="server"  for="identitas" class="control-label col-md-1" Text="Due Date" Font-Bold="True"></asp:Label>
            <div class="col-md-1">
           <asp:TextBox ID="TextBox1" class="form-control input-md" runat="server" value= ""></asp:TextBox>
            </div>

            <asp:Label  ID="Label3" runat="server"  for="identitas" class="control-label col-md-1" Text="Day" Font-Bold="True"></asp:Label>
            <div class="col-md-1">
            <asp:TextBox ID="TextBox2" class="form-control input-md" runat="server" value= ""></asp:TextBox>
            </div>

            <asp:Label  ID="Label4" runat="server"  for="identitas" class="control-label col-md-1" Text="Stop Date" Font-Bold="True"></asp:Label>
            <div class="col-md-1">
            <asp:TextBox ID="TextBox3" class="form-control input-md" runat="server" value= ""></asp:TextBox>
            </div>

        </div>
        </div>

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="Label5" runat="server"  for="identitas" class="control-label col-md-2" Text="Pemda setempat mempersiapkan draft Izin Prinsip. selanjutnya Bupati/ Walikota menerbitkan SK Izin Prinsip" Font-Bold="True"></asp:Label>
            
            <asp:Label  ID="Label6" runat="server"  for="identitas" class="control-label col-md-1" Text="Due Date" Font-Bold="True"></asp:Label>
            <div class="col-md-1">
           <asp:TextBox ID="TextBox4" class="form-control input-md" runat="server" value= ""></asp:TextBox>
            </div>

            <asp:Label  ID="Label7" runat="server"  for="identitas" class="control-label col-md-1" Text="Day" Font-Bold="True"></asp:Label>
            <div class="col-md-1">
            <asp:TextBox ID="TextBox5" class="form-control input-md" runat="server" value= ""></asp:TextBox>
            </div>

            <asp:Label  ID="Label8" runat="server"  for="identitas" class="control-label col-md-1" Text="Stop Date" Font-Bold="True"></asp:Label>
            <div class="col-md-1">
            <asp:TextBox ID="TextBox6" class="form-control input-md" runat="server" value= ""></asp:TextBox>
            </div>

        </div>
        </div>--%>

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

<script type="text/javascript">

    var localURL = "LMSAddFileForm.aspx";

    var ddprg = document.getElementById("<%= ddprg.ClientID %>");

    var txtIzinLok = document.getElementById("<%= txtIzinLok.ClientID %>");
    var txtTgl = document.getElementById("<%= txtTgl.ClientID %>");
    var txtDueDate = document.getElementById("<%= txtDueDate.ClientID %>");
    var TxtDay = document.getElementById("<%= TxtDay.ClientID %>");
    var TxtStopDate = document.getElementById("<%= TxtStopDate.ClientID %>");

    listLMS();
    SearchlistLMS();


    $(function txtTgl() {
        $("[id$=txtTgl]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtDueDate() {
        $("[id$=txtDueDate]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function TxtDay() {
        $("[id$=TxtDay]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function TxtStopDate() {
        $("[id$=TxtStopDate]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    function SearchlistLMS() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=L"
        + "&param1=L"
        + "&param2=4"
        + "";
        listLMS.clearAll();
        listLMS.loadXML("../xml/lms.xml");
        //listplegal.loadXML(localURL + "?" + s);
    }


    function listLMS() {
        listLMS = new dhtmlXGridObject('gridLMS');
        listLMS.setImagePath("../JavaScript/codebase/imgs/");
        listLMS.setHeader("No,Jenis Dokumen,Tanggal,Keterangan,File,Aksi");
        listLMS.setInitWidths("40,200,200,200,200,200");
        listLMS.setColAlign("left,left,left,left,left,left");
        listLMS.setColTypes("ro,ro,ro,ro,ro,link");
        listLMS.init();
        listLMS.setSkin("dhx_skyblue");
        listLMS.setPagingSkin("bricks");
        listLMS.setColSorting("str,str,str,str,str,str");
    }



</script>


</asp:Content>
