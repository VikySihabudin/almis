<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="MasterIdentitasList.aspx.cs" Inherits="Pages_MasterIdentitasList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<h2>List Master Identitas</h2>  
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


            <%if (MasterIdentitasAssign.ToString().Equals("1") || groups.ToString().Equals("1"))
            { %> 
                <input type="button" onclick="tambah()" id="btnTambah" value="Tambah" class="btn btn-success btn-lg" />
            <%}%>

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

    var localURL = "MasterIdentitasList.aspx";
    var newURL = "MasterIdentitasForm.aspx?param1=I";
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

    listMasterIdentitas();
    SearchlistMasterIdentitas();

    function tambah(lo) {
        var url = window.location.toString();
        url = url.replace(localURL, newURL);
        //window.location.replace(url);
        window.open(url);

    }

    function SearchlistMasterIdentitas(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=5"
            + "&param4="
            + "&param5="
            //+ "&param2=PRAREG001"
			+ "";
        listMasterIdentitas.clearAll();
        listMasterIdentitas.loadXML(localURL + "?" + s);
    }

    
    //listpraregistrasi.loadXML("../xml/1_PraRegistrasi.xml");
    function listMasterIdentitas() {
        listMasterIdentitas = new dhtmlXGridObject('gridMasterIdentitas');
        listMasterIdentitas.setImagePath("../JavaScript/codebase/imgs/");
        listMasterIdentitas.setHeader("No,No Identitas,Nama Penjual,Jenis Kelamin,Tempat Lahir,Tanggal Lahir,Status,Kode Perusahaan,Action,#cspan,#cspan,#cspan");
        listMasterIdentitas.setInitWidths("50,188,188,188,188,188,188,150,62,62,62");
        listMasterIdentitas.setColAlign("left,left,left,left,left,left,left,left,left");
        listMasterIdentitas.setColTypes("ed,ed,ed,ed,ed,ed,ed,ed,link,link,link");
        listMasterIdentitas.init();
        listMasterIdentitas.setSkin("dhx_skyblue");
        
        listMasterIdentitas.setColSorting("str,str,str,str,str,str,str,str,str");
        listMasterIdentitas.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
        listMasterIdentitas.enablePaging(true, 15, 5, "pageMasterIdentitas", true);
        listMasterIdentitas.setPagingSkin("bricks");
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
        listMasterIdentitas.clearAll();
        listMasterIdentitas.loadXML(localURL + "?" + s);
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
    listMasterIdentitas.clearAll();
    listMasterIdentitas.loadXML(localURL + "?" + s);
    //alert(s);
}

</script>


</asp:Content>

