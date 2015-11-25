<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LegalAssign.aspx.cs" Inherits="Pages_LandLiti_LegalAssign" MasterPageFile="~/MasterPages/mptamp.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<h2>Assign Legal</h2>  
<hr />
<br>

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
    <div class="col-md-1"><asp:Button runat="server" id="a" Text="Back" class="btn btn-lg btn-success" PostBackUrl="~/Pages_LandLiti/LegalList.aspx" />
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
        <div style=" width:100%; height:300px;">
            <div id="gridlegal" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
            <div id="pagelegal"></div>      
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

    var localURL = "LegalAssign.aspx";
    var localURLForm = "LegalList.aspx?param1=I";
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

    var btnRefresh = document.getElementById("btnRefresh");
    var ddprs = document.getElementById("<%= ddprs.ClientID %>");
    var ddteknis = document.getElementById("<%= ddteknis.ClientID %>");

    listLegal();
    SearchlistLegal();
    UsrAsg();

    function tambah(lo) {
        var url = window.location.toString();
        url = url.replace(localURL, localURLForm);
        //window.location.replace(url);
        window.open(url);

    }

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
        SearchlistLegal();

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


    function openForm() {
        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=select"
			+ "&param1=I"
			+ "&param2="
			+ "";
        //alert(s);
        dhtmlxAjax.post(localURLForm, s);
    }

    function SearchlistLegal(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=5"
            + "&param4="
            + "&param5="
            + "&param9=" + ddprs.value
			+ "";
        listLegal.clearAll();
        //listLegal.loadXML("../xml/ListLegal.xml");
        listLegal.loadXML(localURL + "?" + s);
    }

    function refresh() {
        if ((txtDateAkhir.value == 0) || (txtDateAwal.value == 0))
        { alert('Date Awal Dan Akhir Date Akhir Tidak Boleh Kosong') }
        else {
            var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=4"
            + "&param4=" + txtDateAwal.value
            + "&param5=" + txtDateAkhir.value
            + "&param9=" + ddprs.value
			+ "";
            listLegal.clearAll();
            //listLegal.loadXML("../xml/ListLegal.xml");
            listLegal.loadXML(localURL + "?" + s);
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
            + "&param9=" + ddprs.value
			+ "";
        listLegal.clearAll();
        listLegal.loadXML(localURL + "?" + s);
        //alert(s);
    }


    
    function listLegal() {
        listLegal = new dhtmlXGridObject('gridlegal');
        listLegal.setImagePath("../JavaScript/codebase/imgs/");
        listLegal.setHeader("No,No Legal,No Verifikasi,No Persiapan,No Claim,Nama,Desa,Nama Perushaan,Assign,Action");
        listLegal.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
        listLegal.setInitWidths("40,160,160,160,160,160,160,160,160,65");
        listLegal.setColAlign("left,left,left,left,left,left,left,left,left,center");
        listLegal.setColTypes("ed,ed,ed,ed,ed,ed,ed,ed,ed,ch");
        listLegal.attachEvent("onCheckbox", doOnCheck);
        listLegal.init();
        listLegal.setSkin("dhx_skyblue");

        listLegal.setColSorting("str,str,str,str,str,str,str,str,str,str");
        listLegal.enablePaging(true, 15, 5, "pagelegal", true);
        listLegal.setPagingSkin("bricks");
    }

    function doOnCheck(rowId, cellInd, state) {

        if (state == 0) {
            var r = confirm("Batalkan Assign Kepada " + listLegal.cells(rowId, 8).getValue() + " ?");
            if (r == true) {

                var s = ""
                + "rnd=" + Math.random() * 4
                + "&sm=A"
                + "&param1=A"
                + "&param2=" + listLegal.cells(rowId, 1).getValue()
                + "&param4=" + listLegal.cells(rowId, 2).getValue()
                + "&param9=" + ddprs.value
                + "&param12="
                + "";

                //alert(s);
                dhtmlxAjax.post(localURL, s, outputResponse);
            }
            SearchlistLegal();
        }
        else if (state == 1) {
            var r = confirm("Assign Kepada " + ddteknis.value + " ?");
            if (r == true) {

                var s = ""
                + "rnd=" + Math.random() * 4
                + "&sm=A"
                + "&param1=A"
                + "&param2=" + listLegal.cells(rowId, 1).getValue()
                + "&param4=" + listLegal.cells(rowId, 2).getValue()
                + "&param9=" + ddprs.value
                + "&param12=" + ddteknis.value
                + "";

                //alert(s);
                dhtmlxAjax.post(localURL, s, outputResponse);
            }
            SearchlistLegal();
        }

    }

</script>


</asp:Content>

