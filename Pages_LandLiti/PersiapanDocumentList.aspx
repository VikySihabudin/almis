<%@ Page Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="PersiapanDocumentList.aspx.cs" Inherits="Pages_LandLiti_PersiapanDocumentList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<h2>Persiapan Document</h2>  
<hr />

        <div class="form-group">
            <div class="col-sm-2">
                <asp:DropDownList ID="ddprg" runat="server" class="form-control" onclick="handleClick()">
                </asp:DropDownList>
            </div>


			<div class="col-lg-8" align="right">

                <label for="nama" class="control-label col-md-2">Date Awal</label>
                <div class="col-lg-2">
                <asp:TextBox id="txtDateAwal" type="text" runat="server" class="form-control" />
                </div>
                <label for="nama" class="control-label col-md-2">Date Akhir</label>
                <div class="col-lg-2">
                <asp:TextBox id="txtDateAkhir" type="text" runat="server" class="form-control" />
                </div>

                <div class="col-lg-1">
                <input type="button" id="btnRefresh" value="Refresh" class="btn btn-info btn-sm" onclick="refresh()" />
                </div>

            </div>
        </div>

        <div class="form-group">
            <div class="col-lg-12">
            <div style=" width:100%; height:400px;">
                <div id="gridMasterIdentitas" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pageMasterIdentitas"> </div>
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

    var localURL = "PersiapanDocumentList.aspx";
    var newURL = "PersiapanDocumentList.aspx?param1=I";
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");

    var btnRefresh = document.getElementById("btnRefresh");



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

    listPersiapanDocument();
    SearchlistPersiapanDocument();

    function tambah(lo) {
        var url = window.location.toString();
        url = url.replace(localURL, newURL);
        //window.location.replace(url);
        window.open(url);

    }

    function SearchlistPersiapanDocument(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=5"
            + "&param4="
            + "&param5="
			+ "";
        listPersiapanDocument.clearAll();
        listPersiapanDocument.loadXML(localURL + "?" + s);
       
    }




    //listpraregistrasi.loadXML("../xml/1_PraRegistrasi.xml");
    function listPersiapanDocument() {
        listPersiapanDocument = new dhtmlXGridObject('gridMasterIdentitas');
        listPersiapanDocument.setImagePath("../JavaScript/codebase/imgs/");
        listPersiapanDocument.setHeader("No,No Persiapan Document,No klaim,Nama,Kabupaten,Kecamatan,Desa ,Kode Perusahaan,Action,#cspan,#cspan,#cspan");
        listPersiapanDocument.setInitWidths("50,188,188,150,120,120,150,150,62,62,62");
        listPersiapanDocument.setColAlign("left,left,left,left,left,left,left,left,left,left,left");
        listPersiapanDocument.setColTypes("ed,ed,ed,ed,ed,ed,ed,ed,link,link,link");
        listPersiapanDocument.init();
        listPersiapanDocument.setSkin("dhx_skyblue");

        listPersiapanDocument.setColSorting("str,str,str,str,str,str,str,str,");
        listPersiapanDocument.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
        listPersiapanDocument.enablePaging(true, 15, 5, "pageMasterIdentitas", true);
        listPersiapanDocument.setPagingSkin("bricks");
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
			+ "";
            listPersiapanDocument.clearAll();
            listPersiapanDocument.loadXML(localURL + "?" + s);
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
			+ "";
        listPersiapanDocument.clearAll();
        listPersiapanDocument.loadXML(localURL + "?" + s);
        //alert(s);
    }

</script>


</asp:Content>
