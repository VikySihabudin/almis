<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="VerifikasiForm.aspx.cs" Inherits="Pages_LandLiti_VerifikasiForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />
<asp:HiddenField ID="namaFile" runat="server" />



<h1>Form Verifikasi</h1>
	
	<hr />


    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Verifikasi Dokumen</label>
            <div class="col-md-3"><asp:TextBox id="txtNoVerDoc" type="text" runat="server" class="form-control input-md" value= "VR0001" ></asp:TextBox></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Claim</label>
            <div class="col-md-3">
            <asp:TextBox id="txtNoClam" type="text" runat="server" class="form-control input-md" value= "KL0001" ></asp:TextBox></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nama</label>
            <div class="col-md-3"><asp:TextBox id="txtNama" type="text" runat="server" class="form-control input-md" value= "RAHMAT" ></asp:TextBox></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Lokasi Tanah</label>
            <div class="col-md-3">

                <asp:DropDownList ID="ddKabupaten" runat="server" class="form-control input-md">
                <asp:ListItem Text="Hampang" Value="0"></asp:ListItem>
                <asp:ListItem Text="Kelumpang Barat" Value="1"></asp:ListItem>
                <asp:ListItem Text="Kelumpang Hilir" Value="2"></asp:ListItem>

            </asp:DropDownList>
              
            </div>
            <div class="col-md-3">
                
                <asp:DropDownList ID="DropDownList1" runat="server" class="form-control input-md">
                <asp:ListItem Text="Kotabaru" Value="0"></asp:ListItem>
                <asp:ListItem Text="Bungkukan" Value="1"></asp:ListItem>
                <asp:ListItem Text="Langadai" Value="2"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-3">
                <asp:DropDownList ID="DropDownList2" runat="server" class="form-control input-md">
                <asp:ListItem Text="Cantung Kanan" Value="0"></asp:ListItem>
                <asp:ListItem Text="Lalapin" Value="1"></asp:ListItem>
                <asp:ListItem Text="Limbur" Value="2"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
    </div>



      <div class="form-group">
       <div class="col-lg-10">
            <div style=" width:650px; height:130px;">
                <div id="gridVer" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>


     <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Download Alas Hak</label>
            <div class="col-md-3"><input type="button" id="btnDwnAlasHak" value="Download"  class="btn btn-md btn-success" onclick="btnClick(this)" />  </div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Download Notulensi Rapat Mediasi</label>
            <div class="col-md-3"><input type="button" id="btnDwnNotuRaMe" value="Upload"  class="btn btn-md btn-success" onclick="btnClick(this)" />  </div>
        </div>
    </div>

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="LEksepsi" runat="server"  for="identitas" class="control-label col-md-2" Text="Litigasi" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
            <asp:CheckBox ID="cbEksepsi" runat="server"  CssClass="form-control checkbox-md" onclick="validasi()" /></div>
        </div>
    </div>

    <br /><hr />

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


<script type="text/javascript">
    var localURL = "VerfikasiForm.aspx";
    var newUrl = "VerfikasiForm.aspx";

    var txtNoVerDoc = document.getElementById("<%=txtNoVerDoc.ClientID%>");
    var txtNoClam = document.getElementById("<%=txtNoClam.ClientID%>");
    var txtNama = document.getElementById("<%=txtNama.ClientID%>");


    var btnDwnAlasHak = document.getElementById("btnDwnAlasHak");
    var btnDwnNotuRaMe = document.getElementById("btnDwnNotuRaMe");


    listVer();
    SearchlistVer();

    function SearchlistVer() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=L"
        + "&param1=L"
        + "&param2=4"
        + "";
        listVer.clearAll();
        listVer.loadXML("../xml/FormLegal.xml");
        //listplegal.loadXML(localURL + "?" + s);
    }

    function listVer() {
        listVer = new dhtmlXGridObject('gridVer');
        listVer.setImagePath("../JavaScript/codebase/imgs/");
        listVer.setHeader("No,PID,Nama Penjual,Alas Hak");
        listVer.setInitWidths("40,200,200,200");
        listVer.setColAlign("left,left,left,left");
        listVer.setColTypes("ro,ro,ro,link");
        listVer.init();
        listVer.setSkin("dhx_skyblue");
        listVer.setPagingSkin("bricks");
        listVer.setColSorting("str,str,str,str");
    }

    $(function TextBox4() {
        $("[id$=TextBox4]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });





</script>

</asp:Content>
