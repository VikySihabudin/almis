<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="PemberkasanDuaAssign.aspx.cs" Inherits="Pages_PemberkasanDuaAssign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<h2>Assign Finalisasi</h2>  
<hr />

        <div class="form-group">            
            <div class="col-sm-2">
                <asp:DropDownList ID="ddteknis" runat="server" class="form-control">                   
                </asp:DropDownList>
            </div>
          
			<div class="col-lg-8" align="right">
            <div class="col-lg-2">
                <asp:DropDownList ID="ddprg" runat="server" class="form-control" onclick="handleClick()">
                </asp:DropDownList>
               </div>
              <label for="nama" class="control-label col-md-2">Start Date</label>
                <div class="col-lg-2">
                <asp:TextBox id="txtDateAwal" type="text" runat="server" class="form-control" />
                </div>
                <label for="nama" class="control-label col-md-2">End Date</label>
                <div class="col-lg-2">
                <asp:TextBox id="txtDateAkhir" type="text" runat="server" class="form-control" />
                </div>
                <div class="col-lg-1">
                 <input type="button" id="btnRefresh" value="Search" class="btn btn-info btn-sm" onclick="refresh()" />
                 </div>
               <div class="col-lg-1">
                <asp:Button runat="server" ID="btnSaves" Text="Back" class="btn btn-lg btn-success" PostBackUrl="~/Pages_Landcomp/PemberkasanDuaList.aspx"/>
              </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12">
            <div style=" width:100%; height:400px;">
                <div id="gridPemberkasanDua" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pagePemberkasanDua"></div>
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

    var localURL = "PemberkasanDuaAssign.aspx";
    var ddteknis = document.getElementById("<%= ddteknis.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");

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

    listPemberkasanDua();
    SearchlistPemberkasanDua();

    function SearchlistPemberkasanDua(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=LA"
            + "&param2=5"
            + "&param4="
            + "&param5=" 
			+ "";
        listPemberkasanDua.clearAll();
        listPemberkasanDua.loadXML(localURL + "?" + s);
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
        listPemberkasanDua.clearAll();
        listPemberkasanDua.loadXML(localURL + "?" + s);
        //alert(s);
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
            listPemberkasanDua.clearAll();
            listPemberkasanDua.loadXML(localURL + "?" + s);
            //alert(s);
        }

    }


    //listPemberkasanDua.loadXML("../xml/1_PemberkasanDua.xml");
    function listPemberkasanDua() {
        listPemberkasanDua = new dhtmlXGridObject('gridPemberkasanDua');
        listPemberkasanDua.setImagePath("../JavaScript/codebase/imgs/");
        listPemberkasanDua.setHeader("No,No Berkas,NmrReg,No PID,Assignee,Status,Nama Penjual,Nama Perusahaan,Action,NmrNeg,Novism,NmrPbr,NmrByr");
        listPemberkasanDua.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
        listPemberkasanDua.setInitWidths("40,166,166,166,166,166,166,166,100,0,0,0,0");
        listPemberkasanDua.setColAlign("left,left,left,left,left,left,left,left,left,left,left,left,left");
        listPemberkasanDua.setColTypes("ed,ed,ed,ed,ed,ed,ed,ed,ch,ed,ed,ed,ed");
        listPemberkasanDua.attachEvent("onCheckbox", doOnCheck);
        listPemberkasanDua.init();
        listPemberkasanDua.setSkin("dhx_skyblue");

        listPemberkasanDua.setColSorting("str,str,str,str,str,str,str,str,str,str,str,str,str");
        listPemberkasanDua.enablePaging(true, 15, 5, "pagePemberkasanDua", true);
        listPemberkasanDua.setPagingSkin("bricks");
    }

    function doOnCheck(rowId, cellInd, state) {

        if (state == 0) {
            var s = ""
	    + "rnd=" + Math.random() * 4
	    + "&sm=E"
	    + "&param1=A"
        + "&param2=" + listPemberkasanDua.cells(rowId, 1).getValue()
        + "&param4=" + listPemberkasanDua.cells(rowId, 2).getValue()
        + "&param5=" + listPemberkasanDua.cells(rowId, 3).getValue()
        + "&param6=" + listPemberkasanDua.cells(rowId, 9).getValue()
        + "&param7=" + listPemberkasanDua.cells(rowId, 10).getValue()
        + "&param8=" + listPemberkasanDua.cells(rowId, 11).getValue()
        + "&param9=" + listPemberkasanDua.cells(rowId, 12).getValue()
        + "&param15=" 
        + "";

            //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }
        else if (state == 1) {

            var s = ""
	    + "rnd=" + Math.random() * 4
	    + "&sm=E"
	    + "&param1=A"
        + "&param2=" + listPemberkasanDua.cells(rowId, 1).getValue()
        + "&param4=" + listPemberkasanDua.cells(rowId, 2).getValue()
        + "&param5=" + listPemberkasanDua.cells(rowId, 3).getValue()
        + "&param6=" + listPemberkasanDua.cells(rowId, 9).getValue()
        + "&param7=" + listPemberkasanDua.cells(rowId, 10).getValue()
        + "&param8=" + listPemberkasanDua.cells(rowId, 11).getValue()
        + "&param9=" + listPemberkasanDua.cells(rowId, 12).getValue()
        + "&param15=" + ddteknis.value
        + "";


            //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }

    }

    function outputResponse() {
        SearchlistPemberkasanDua();
    }
</script>

</asp:Content>

