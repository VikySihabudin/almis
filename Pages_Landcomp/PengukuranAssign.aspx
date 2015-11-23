<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="PengukuranAssign.aspx.cs" Inherits="Pages_PengukuranAssign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<h2>Assign Pengukuran T0</h2>  
<hr />

        
        <div class="form-group">
        <label for="identitas" class="control-label col-md-2">
        <asp:DropDownList ID="ddprg" runat="server" class="form-control" onclick="handleClick()">
        </asp:DropDownList></label>
        <label for="identitas" class="control-label col-md-1">Start Date</label>
        <div class="col-md-2"><asp:TextBox id="txtDateAwal" type="text" runat="server" class="form-control" /></div>
        <label for="identitas" class="control-label col-md-1">End Date</label>
        <div class="col-sm-2"><asp:TextBox id="txtDateAkhir" type="text" runat="server" class="form-control" /></div>
        <label for="identitas" class="control-label col-sm-1"></label>
        <div class="col-md-2">
        <input type="button" id="btnRefresh" value="Search" class="btn btn-info btn-md" onclick="refresh()" />
        </div>   
      </div>
      <hr class="style-four" />
      <div class="form-group">
        <label for="identitas" class="control-label col-md-2"><asp:DropDownList ID="ddteknis" runat="server" class="form-control"></asp:DropDownList></label>
        <label for="identitas" class="control-label col-md-1">Tanggal Pengukuran</label>
        <div class="col-md-2"><asp:TextBox id="txtTglPengukuran" type="text" runat="server" class="form-control" /></div>
        <label for="identitas" class="control-label col-sm-1"></label>
        <div class="col-md-4"><asp:Button runat="server" ID="btnSave" Text="Back" class="btn btn-lg btn-success" PostBackUrl="~/Pages_Landcomp/PengukuranList.aspx"/></div>    
      </div>
        
         


        
        <div class="form-group">
            <div class="col-lg-12">
            <div style=" width:100%; height:300px;">
                <div id="gridpengukuran" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pagePengukuran"></div>  
            </div>
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

    var localURL = "PengukuranAssign.aspx";
    //    var newUrl = "PraRegistrasiForm.aspx";
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

    listPengukuran();
    SearchlistPengukuran();

    $(function txtTglPengukuran() {
        $("[id$=txtTglPengukuran]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    var localURL = "PengukuranAssign.aspx";
    var ddteknis = document.getElementById("<%= ddteknis.ClientID %>");
    var txtTglPengukuran = document.getElementById("<%= txtTglPengukuran.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

    $(function txtDateAwal() {
        $("[id$=txtDateAwal]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtDateAkhir() {
        $("[id$=txtDateAkhir]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    function SearchlistPengukuran(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=LA"
            + "&param2=5"
            + "&param4="
            + "&param5="
			+ "";
        listPengukuran.clearAll();
        listPengukuran.loadXML(localURL + "?" + s);
    }

    function refresh() {
        if ((txtDateAkhir.value == 0) || (txtDateAwal.value == 0))
        { alert('Date Awal Dan Akhir Date Akhir Tidak Boleh Kosong') }
        else {
            var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=LA"
            + "&param2=4"
            + "&param4=" + txtDateAwal.value
            + "&param5=" + txtDateAkhir.value
			+ "";
            listPengukuran.clearAll();
            listPengukuran.loadXML(localURL + "?" + s);
            //alert(s);
        }
    }

    function handleClick() {
        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=LA"
            + "&param2=" + ddprg.value
            + "&param4="
            + "&param5="
			+ "";
        listPengukuran.clearAll();
        listPengukuran.loadXML(localURL + "?" + s);
        //alert(s);
    }

    

    function listPengukuran() {
        listPengukuran = new dhtmlXGridObject('gridpengukuran');
        listPengukuran.setImagePath("../JavaScript/codebase/imgs/");
        listPengukuran.setHeader("No,PID,No Registrasi,Nama Penjual,Kecamatan,Desa,Assign,Nama Perusahaan,Action,No Identitas");
        listPengukuran.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,");
        listPengukuran.setInitWidths("40,170,170,170,180,180,180,180,60,0");
        listPengukuran.setColAlign("left,left,left,left,left,left,left,left,center,center");
        listPengukuran.setColTypes("ed,ed,ed,ed,ed,ed,ed,ed,ch,ed");
        listPengukuran.attachEvent("onCheckbox", doOnCheck);
        listPengukuran.init();
        listPengukuran.setSkin("dhx_skyblue");
        
        listPengukuran.setColSorting("str,str,str,str,str,str,str,str,str,str");
        listPengukuran.enablePaging(true, 15, 5, "pagePengukuran", true);
        listPengukuran.setPagingSkin("bricks");
    }


    function doOnCheck(rowId, cellInd, state) {

       if (state == 0) {
            var s = ""
	    + "rnd=" + Math.random() * 4
	    + "&sm=E"
	    + "&param1=A"
        + "&param2=" + listPengukuran.cells(rowId, 1).getValue()
        + "&param5=" + listPengukuran.cells(rowId, 2).getValue()
        + "&param6=" + txtTglPengukuran.value
        + "&param20="
        + "&param3=" + listPengukuran.cells(rowId, 9).getValue()
        + "";

            //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }
        else if (state == 1) {
         
        var s = ""
	    + "rnd=" + Math.random() * 4
	    + "&sm=E"
	    + "&param1=A"
        + "&param2=" + listPengukuran.cells(rowId, 1).getValue()
        + "&param5=" + listPengukuran.cells(rowId, 2).getValue()
        + "&param6=" + txtTglPengukuran.value
        + "&param20=" + ddteknis.value
        + "&param3=" + listPengukuran.cells(rowId, 9).getValue()
        + "";

        //alert(s);
        dhtmlxAjax.post(localURL, s, outputResponse);
        }

}

function outputResponse() {
    SearchlistPengukuran();
}

</script>


</asp:Content>

