﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="PemberkasanSatuAssign.aspx.cs" Inherits="Pages_PemberkasanSatuAssign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">




<h2>Assign Pemberkasan</h2>  
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
        <asp:Button runat="server" ID="Button1" Text="Back" class="btn btn-lg btn-success" PostBackUrl="~/Pages_Landcomp/PemberkasanSatuList.aspx"/>  
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
                <div id="gridPemberkasan" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div  id="pagePemberkasan"></div>
            </div>
            </div>
        </div>

    <%--Footer Awal--%>
     <footer class="site-footer">
          <div class="text-center">
              2015 - Aplikasi ALMIS
              <a href="#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
    <%--Footer Akhir--%>

<script type="text/javascript">

    var localURL = "PemberkasanSatuAssign.aspx";

    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

    var btnRefresh = document.getElementById("btnRefresh");
    var ddprs = document.getElementById("<%= ddprs.ClientID %>");
    var ddteknis = document.getElementById("<%= ddteknis.ClientID %>");

    listPemberkasan();
    SearchlistPemberkasan();
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



    function SearchlistPemberkasan(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=5" 
            + "&param4="
            + "&param5="
            + "&param15=" + ddprs.value
			+ "";
        listPemberkasan.clearAll();
        listPemberkasan.loadXML(localURL + "?" + s);
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
            + "&param15=" + ddprs.value
			+ "";
            listPemberkasan.clearAll();
            listPemberkasan.loadXML(localURL + "?" + s);
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
            + "&param15=" + ddprs.value
			+ "";
        listPemberkasan.clearAll();
        listPemberkasan.loadXML(localURL + "?" + s);
        //alert(s);
    }

    // listPemberkasan.loadXML("../xml/1_Pemberkasan.xml");
    function listPemberkasan() {
        listPemberkasan = new dhtmlXGridObject('gridPemberkasan');
        listPemberkasan.setImagePath("../JavaScript/codebase/imgs/");
        listPemberkasan.setHeader("No,No Pemberkasan,No PID,No Registrasi,No Visum,Assignee,Status,Nama Penjual,Nama Perusahaan,Action,No Negosiasi");
        listPemberkasan.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
        listPemberkasan.setInitWidths("40,140,140,140,140,140,140,170,170,85,0");
        listPemberkasan.setColAlign("left,left,left,left,left,left,left,left,left,left");
        listPemberkasan.setColTypes("ed,ed,ed,ed,ed,ed,ed,ed,ed,ch,ed");
        listPemberkasan.attachEvent("onCheckbox", doOnCheck);
        listPemberkasan.init();
        listPemberkasan.setSkin("dhx_skyblue");

        listPemberkasan.setColSorting("str,str,str,str,str,str,str,str,str,str,str");
        listPemberkasan.enablePaging(true, 15, 5, "pagePemberkasan", true);
        listPemberkasan.setPagingSkin("bricks");
    }

    function doOnCheck(rowId, cellInd, state) {

        if (state == 0) {
            var s = ""
	    + "rnd=" + Math.random() * 4
	    + "&sm=E"
	    + "&param1=A"
        + "&param2=" + listPemberkasan.cells(rowId, 1).getValue() // No Pemberkasan
        + "&param4=" + listPemberkasan.cells(rowId, 3).getValue() // Negosi
        + "&param5=" + listPemberkasan.cells(rowId, 2).getValue()
        + "&param6=" + listPemberkasan.cells(rowId, 10).getValue() // No Registrasi
        + "&param7=" + listPemberkasan.cells(rowId, 4).getValue()
        + "&param12="
        + "&param15=" + ddprs.value
        + "";

           //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }

        else if (state == 1) {

            var s = ""
	    + "rnd=" + Math.random() * 4
	    + "&sm=E"
	    + "&param1=A"
        + "&param2=" + listPemberkasan.cells(rowId, 1).getValue() // No Pemberkasan
        + "&param4=" + listPemberkasan.cells(rowId, 3).getValue() // Negosi
        + "&param5=" + listPemberkasan.cells(rowId, 2).getValue()
        + "&param6=" + listPemberkasan.cells(rowId, 10).getValue() // No Registrasi
        + "&param7=" + listPemberkasan.cells(rowId, 4).getValue()
        + "&param12=" + ddteknis.value
        + "&param15=" + ddprs.value
        + "";

            //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }

    }

    function outputResponse() {
        SearchlistPemberkasan();
    }

    function UsrAsg() {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=UA"
            + "&param1=UA"
            + "&param2=" + ddprs.value
			+ "";
        dhtmlxAjax.post(localURL, s, outputAsg);
        SearchlistPemberkasan();

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

