<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="NegosiasiAssign.aspx.cs" Inherits="Pages_NegosiasiAssign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<h2>Assign Negosiasi</h2>  
<hr />
<br />

<div class="form-group">
    <label for="nama" class="control-label col-md-2">Nama Perusahaan</label>
    <div class="col-sm-2">
        <asp:DropDownList ID="ddprs" runat="server" class="form-control" onclick="UsrAsg()">
        </asp:DropDownList>
    </div>

    <label for="nama" class="control-label col-md-1">Assign</label>
    <div class="col-sm-2">
        <asp:DropDownList ID="ddteknis" runat="server" class="form-control">
        </asp:DropDownList>
    </div>

    <div class="col-sm-3"></div>
    <div class="col-md-1">
        <asp:Button runat="server" ID="btnSave" Text="Back" class="btn btn-lg btn-success" PostBackUrl="~/Pages_Landcomp/NegosiasiList.aspx"/>    
    </div>

</div>

<hr />
<br />

<div class="form-group"> 

            <label for="nama" class="control-label col-md-2">Filter</label>
           <div class="col-sm-2">
                <asp:DropDownList ID="ddprg" runat="server" class="form-control" onclick="handleClick()" >
                </asp:DropDownList>
            </div>

            <label for="nama" class="control-label col-md-1">Start Date</label>
            
            <div class="col-lg-2">
            <asp:TextBox id="txtDateAwal" type="text" runat="server" class="form-control" />
            </div>

            <label for="nama" class="control-label col-md-1">End Date</label>

            <div class="col-lg-2">
                <asp:TextBox id="txtDateAkhir" type="text" runat="server" class="form-control" />
            </div>

            <div class="col-lg-1">
                <input type="button" id="btnRefresh" value="Search" class="btn btn-info btn-md" onclick="refresh()"  />
            </div>


</div> 

                       
        <div class="form-group">
            <div class="col-lg-12">
            <div style=" width:100%; height:400px;">
                <div id="gridNegosiasi" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pageNegosiasi"></div> 
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

    var localURL = "NegosiasiAssign.aspx";
    var ddteknis = document.getElementById("<%= ddteknis.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var ddprs = document.getElementById("<%= ddprs.ClientID %>");

    listNegosiasi();
    SearchlistNegosiasi();
    UsrAsg();

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


    function UsrAsg() {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=UA"
            + "&param1=UA"
            + "&param2=" + ddprs.value
			+ "";
        dhtmlxAjax.post(localURL, s, outputAsg);
        SearchlistNegosiasi();

    }

    function SearchlistNegosiasi(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=5" 
            + "&param4="
            + "&param5="
            + "&param14=" + ddprs.value
			+ "";
        listNegosiasi.clearAll();
        listNegosiasi.loadXML(localURL + "?" + s);
    }

    function refresh() {
        if ((txtDateAkhir.value == 0) || (txtDateAwal.value == 0))
        { alert('Start Date Dan End Date \n    Tidak Boleh Kosong') }
        else {
            var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=4"
            + "&param4=" + txtDateAwal.value
            + "&param5=" + txtDateAkhir.value
            + "&param14=" + ddprs.value
			+ "";
            listNegosiasi.clearAll();
            listNegosiasi.loadXML(localURL + "?" + s);
            //alert(s);
        }
    }

    function handleClick() {
        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=" + ddprg.value
            + "&param4="
            + "&param5="
            + "&param14=" + ddprs.value
			+ "";
        listNegosiasi.clearAll();
        listNegosiasi.loadXML(localURL + "?" + s);
        //alert(s);
    }


    //    listNegosiasi.loadXML("../xml/1_Negosiasi.xml");
    function listNegosiasi() {
        listNegosiasi = new dhtmlXGridObject('gridNegosiasi');
        listNegosiasi.setImagePath("../JavaScript/codebase/imgs/");
        listNegosiasi.setHeader("No,No Negosiasi,No Registrasi,PID,Status,Assigne,Nama Penjual,Nama PLK,Nama Perusahaan,Action");
        listNegosiasi.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
        listNegosiasi.setInitWidths("40,132,132,132,132,132,166,166,166,94");
        listNegosiasi.setColAlign("left,left,left,left,left,left,left,left,left,left");
        listNegosiasi.setColTypes("ed,ed,ed,ed,ed,ed,ed,ed,ed,ch");
        listNegosiasi.attachEvent("onCheckbox", doOnCheck);
        listNegosiasi.init();
        listNegosiasi.setSkin("dhx_skyblue");

        listNegosiasi.setColSorting("str,str,str,str,str,str,str,str,str,str");
        listNegosiasi.enablePaging(true, 15, 5, "pageNegosiasi", true);
        listNegosiasi.setPagingSkin("bricks");
    }

    function doOnCheck(rowId, cellInd, state) {

        if (state == 0) {
            var s = ""
	    + "rnd=" + Math.random() * 4
	    + "&sm=E"
	    + "&param1=A"
        + "&param2=" + listNegosiasi.cells(rowId, 1).getValue()
        + "&param4=" + listNegosiasi.cells(rowId, 2).getValue()
        + "&param5=" + listNegosiasi.cells(rowId, 3).getValue()
        + "&param11="
        + "&param14=" + ddprs.value
        + "";

            //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }
        else if (state == 1) {

            var s = ""
	    + "rnd=" + Math.random() * 4
	    + "&sm=E"
	    + "&param1=A"
        + "&param2=" + listNegosiasi.cells(rowId, 1).getValue()
        + "&param4=" + listNegosiasi.cells(rowId, 2).getValue()
        + "&param5=" + listNegosiasi.cells(rowId, 3).getValue()
        + "&param11=" + ddteknis.value
        + "&param14=" + ddprs.value
        + "";

            //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }

    }

    function outputResponse() {
        SearchlistNegosiasi();
    }

    function outputAsg(loader) {

        var select = document.getElementById("<%= ddteknis.ClientID %>");
        var length = select.options.length;
        for (i = 0; i < length; i++) {
            select.options[i] = null;
        }

        var a = loader.xmlDoc.responseText;
        if (a != '0') {
            var b = new Array();
            var len;
            b = a.split('*');

            for (var i = 0; i < b.length - 1; i++) {
                //              alert(b[i]);
                len = b[i].indexOf('|');
                //                alert(len);
                //                alert(b[i].substring(0, len));
                //                alert(b[i].substring(len + 1, len + 4));

                var opt = document.createElement("option");
                document.getElementById("<%= ddteknis.ClientID %>").options.add(opt);
                opt.text = b[i].substring(0, len);
                opt.value = b[i].substring(len + 1);
            }

        }


    }


</script>

</asp:Content>

