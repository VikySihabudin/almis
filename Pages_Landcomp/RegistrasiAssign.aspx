<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="RegistrasiAssign.aspx.cs" Inherits="Pages_RegistrasiAssign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<h2>Assign Registrasi</h2>  
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
        <asp:Button runat="server" id="btnBack" Text="Back" class="btn btn-lg btn-success" PostBackUrl="~/Pages_Landcomp/RegistrasiList.aspx" />   
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
                <div id="gridregistrasi" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pageRegistrasi"></div>  
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

    var localURL = "RegistrasiAssign.aspx";
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

    var btnRefresh = document.getElementById("btnRefresh");
    var ddprs = document.getElementById("<%= ddprs.ClientID %>");
    var ddteknis = document.getElementById("<%= ddteknis.ClientID %>");

    listRegistrasi();
    SearchlistRegistrasi();
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


    function SearchlistRegistrasi(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=5" 
            + "&param4="
            + "&param5="
            + "&param35=" + ddprs.value
			+ "";
        listRegistrasi.clearAll();
        listRegistrasi.loadXML(localURL + "?" + s);
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
            + "&param35=" + ddprs.value
			+ "";
            listRegistrasi.clearAll();
            listRegistrasi.loadXML(localURL + "?" + s);
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
            + "&param35=" + ddprs.value
			+ "";
        listRegistrasi.clearAll();
        listRegistrasi.loadXML(localURL + "?" + s);
        //alert(s);
    }
        //listRegistrasi.loadXML("../xml/2_Registrasi.xml");

    function listRegistrasi() {
        listRegistrasi = new dhtmlXGridObject('gridregistrasi');
        listRegistrasi.setImagePath("../JavaScript/codebase/imgs/");
        listRegistrasi.setHeader("No,No Registrasi,No PL,Nama Penjual,Kecamatan,Desa,Assign,Nama Perusahaan,Action,Mident");
        listRegistrasi.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
        listRegistrasi.setInitWidths("40,161,161,161,161,161,171,171,100,0");
        listRegistrasi.setColAlign("left,left,left,left,left,left,left,left,left,left");
        listRegistrasi.setColTypes("ed,ed,ed,ed,ed,ed,ed,ed,ch,ed");
        listRegistrasi.attachEvent("onCheckbox", doOnCheck);
        listRegistrasi.init();
        listRegistrasi.setSkin("dhx_skyblue");
        
        listRegistrasi.setColSorting("str,str,str,str,str,str,str,str,str,str");
        listRegistrasi.enablePaging(true, 15, 5, "pageRegistrasi", true);
        listRegistrasi.setPagingSkin("bricks");
    }

    function doOnCheck(rowId, cellInd, state) {

        if (state == 0) {
            var s = ""
	    + "rnd=" + Math.random() * 4
	    + "&sm=E"
	    + "&param1=A"
        + "&param2=" + listRegistrasi.cells(rowId, 1).getValue()
        + "&param4=" + listRegistrasi.cells(rowId, 2).getValue()
        + "&param5=" + listRegistrasi.cells(rowId, 9).getValue()
        + "&param34="
        + "&param35=" + ddprs.value
        + "";

            //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }
        else if (state == 1) {

            var s = ""
	    + "rnd=" + Math.random() * 4
	    + "&sm=E"
	    + "&param1=A"
        + "&param2=" + listRegistrasi.cells(rowId, 1).getValue()
        + "&param4=" + listRegistrasi.cells(rowId, 2).getValue()
        + "&param5=" + listRegistrasi.cells(rowId, 9).getValue()
        + "&param34=" + ddteknis.value
        + "&param35=" + ddprs.value
        + "";

            //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }

    }

    function outputResponse() {
        SearchlistRegistrasi();
    }

    function UsrAsg() {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=UA"
            + "&param1=UA"
            + "&param2=" + ddprs.value
			+ "";
        dhtmlxAjax.post(localURL, s, outputAsg);
        SearchlistRegistrasi();

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

