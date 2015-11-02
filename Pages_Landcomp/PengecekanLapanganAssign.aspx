<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="PengecekanLapanganAssign.aspx.cs" Inherits="Pages_PengecekanLapanganAssign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<h2>Assign Pengecekan Lapangan</h2>  
<hr />

      <div class="form-group">
        <label for="identitas" class="control-label col-md-2">
        <asp:DropDownList ID="ddprg" runat="server" class="form-control" onclick="handleClick()">
        </asp:DropDownList></label>
        <label for="identitas" class="control-label col-md-1">Date Awal</label>
        <div class="col-md-2"><asp:TextBox id="txtDateAwal" type="text" runat="server" class="form-control" /></div>
        <label for="identitas" class="control-label col-md-1">Date Akhir</label>
        <div class="col-sm-2"><asp:TextBox id="txtDateAkhir" type="text" runat="server" class="form-control" /></div>
        <label for="identitas" class="control-label col-sm-1"></label>
        <div class="col-md-2">
        <input type="button" id="btnRefresh" value="Refresh" class="btn btn-info btn-md" onclick="refresh()" />
        </div>   
      </div>
      <hr class="style-four" />
      <div class="form-group">
        <label for="identitas" class="control-label col-md-2"><asp:DropDownList ID="ddteknis" runat="server" class="form-control"></asp:DropDownList></label>
        <label for="identitas" class="control-label col-md-1">Jadwal Tanggal Pengukuran</label>
        <div class="col-md-2"><asp:TextBox id="txtTglPenLap" type="text" runat="server" class="form-control" /></div>
        <label for="identitas" class="control-label col-sm-1"></label>
        <div class="col-sm-3"></div>
        <div class="col-md-1"><asp:Button runat="server" id="a" Text="Back" class="btn btn-lg btn-success" PostBackUrl="~/Pages_Landcomp/PengecekanLapanganList.aspx" /></div>    
      </div>

                
        <div class="form-group">
            <div class="col-lg-12">
            <div style=" width:100%; height:300px;">
                <div id="gridpengecekan" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pagePengecekanLapangan"> </div>
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

    var localURL = "PengecekanLapanganAssign.aspx";
//    var newUrl = "PraRegistrasiForm.aspx";
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");


    var currentTime = new Date();
    var tanggal = '0' + currentTime.getDate();
    var bulan = currentTime.getMonth()+1;
    var tahun = currentTime.getFullYear();

    bulan = '0' + bulan;
    document.getElementById("<%= txtTglPenLap.ClientID %>").value = tahun + '-' + bulan.substr(bulan.length - 2) + '-' + tanggal.substr(tanggal.length - 2);



    $(function txtTglPenLap() {
        $("[id$=txtTglPenLap]").datepicker({
            dateFormat: "yy-mm-dd",           
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "2000:2999"

        });
    });

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

    

    var localURL = "PengecekanLapanganAssign.aspx";
    var ddteknis = document.getElementById("<%= ddteknis.ClientID %>");
    var txtTglPenLap = document.getElementById("<%= txtTglPenLap.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

    listPengecekanLapangan();
    SearchlistPengecekanLapangan();

    function SearchlistPengecekanLapangan(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=LA"
            + "&param2=5" 
            + "&param4="
            + "&param5="
			+ "";
        listPengecekanLapangan.clearAll();
        listPengecekanLapangan.loadXML(localURL + "?" + s);
     
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
            listPengecekanLapangan.clearAll();
            listPengecekanLapangan.loadXML(localURL + "?" + s);
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
        listPengecekanLapangan.clearAll();
        listPengecekanLapangan.loadXML(localURL + "?" + s);
        //alert(s);
    }


   // listPengecekanLapangan.loadXML("../xml/2_PengecekanLapangan.xml");

    function listPengecekanLapangan() {
        listPengecekanLapangan = new dhtmlXGridObject('gridpengecekan');
        listPengecekanLapangan.setImagePath("../JavaScript/codebase/imgs/");
        listPengecekanLapangan.setHeader("No,Nomor PL,Nomor PR,Nama Penjual,Kecamatan,Desa,Assign,Nama Perusahaan,Action");
        listPengecekanLapangan.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
        listPengecekanLapangan.setInitWidths("40,181,181,181,181,181,181,181,60");
        listPengecekanLapangan.setColAlign("left,left,left,left,left,left,left,left,left");
        listPengecekanLapangan.setColTypes("ed,ed,ed,ed,ed,ed,ed,ed,ch");
        listPengecekanLapangan.attachEvent("onCheckbox", doOnCheck);
        listPengecekanLapangan.init();
        listPengecekanLapangan.setSkin("dhx_skyblue");
        
        listPengecekanLapangan.setColSorting("str,str,str,str,str,str,str,str,str");
        listPengecekanLapangan.enablePaging(true, 15, 5, "pagePengecekanLapangan", true);
        listPengecekanLapangan.setPagingSkin("bricks");
    }

    function doOnCheck(rowId, cellInd, state) {

        if (state == 0) {

            var s = ""

	    + "rnd=" + Math.random() * 4
	    + "&sm=E"
	    + "&param1=A"
        + "&param2=" + listPengecekanLapangan.cells(rowId, 1).getValue()
        + "&param6=" + listPengecekanLapangan.cells(rowId, 2).getValue()
        + "&param13="
        + "&param5=" + txtTglPenLap.value
        + "";

            //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);

        } 
        else if (state == 1) {

            var s = ""

	    + "rnd=" + Math.random() * 4
	    + "&sm=E"
	    + "&param1=A"
        + "&param2=" + listPengecekanLapangan.cells(rowId, 1).getValue()
        + "&param6=" + listPengecekanLapangan.cells(rowId, 2).getValue()
        + "&param13=" + ddteknis.value
        + "&param5=" + txtTglPenLap.value
        + "";

            //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);

        }

    }

    function outputResponse() {
        SearchlistPengecekanLapangan();
    }

</script>


</asp:Content>

