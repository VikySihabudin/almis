<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LegalForm.aspx.cs" Inherits="Pages_LandLiti_LegalForm" MasterPageFile="~/MasterPages/mptamp.master"%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<input type="hidden" id="hidMode" value="I" />



<h2>Form Legal</h2>

<hr />


    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Verifikasi Dokumen</label>
            <div class="col-md-3"><asp:TextBox id="txtverDoc" type="text" runat="server" class="form-control input-md" value= "VR0001" ></asp:TextBox></div>
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
                <div id="gridlegal" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>


     <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Download Alas Hak</label>
            <div class="col-md-3"><input type="button" id="btnDwnAlashak" value="Download"  class="btn btn-md btn-success" onclick="btnClick(this)" />  </div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Download Notulensi Rapat Mediasi</label>
            <div class="col-md-3"><input type="button" id="btnDwnNot" value="Download"  class="btn btn-md btn-success" onclick="btnClick(this)" />  </div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Surat Putusan</label>
            <div class="col-md-3"><asp:TextBox id="txtNoSrtPts" type="text" runat="server" class="form-control input-md" value= "68/Pdt.G/2009/PN.Dps" ></asp:TextBox></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Tanggal Surat Putusan</label>
            <div class="col-md-3"><asp:TextBox id="txtTglSrt" type="text" runat="server" class="form-control input-md" value= "2015-10-13" ></asp:TextBox></div>
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

    var localURL = "LegalForm.aspx";
    var newUrl = "LegalForm.aspx";
    var txtverDoc = document.getElementById("<%=txtverDoc.ClientID%>");
    var txtNoClam = document.getElementById("<%=txtNoClam.ClientID%>");
    var txtNama = document.getElementById("<%=txtNama.ClientID%>");
    

    var btnDwnAlashak = document.getElementById("btnDwnAlashak");
    var btnSave = document.getElementById("btnSave");
    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");
    var btnDwnNot = document.getElementById("btnDwnNot");
  
    
    listLegal();
    SearchlistLegal();

    function SearchlistLegal() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=L"
        + "&param1=L"
        + "&param2=4"
        + "";
        listLegal.clearAll();
        listLegal.loadXML("../xml/FormLegal.xml");
        //listplegal.loadXML(localURL + "?" + s);
    }

    function listLegal() {
        listLegal = new dhtmlXGridObject('gridlegal');
        listLegal.setImagePath("../JavaScript/codebase/imgs/");
        listLegal.setHeader("No,PID,Nama Penjual,Alas Hak");
        listLegal.setInitWidths("40,200,200,200");
        listLegal.setColAlign("left,left,left,left");
        listLegal.setColTypes("ro,ro,ro,link");
        listLegal.init();
        listLegal.setSkin("dhx_skyblue");
        listLegal.setPagingSkin("bricks");
        listLegal.setColSorting("str,str,str,str");
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

