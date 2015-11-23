<%@ Page Language="C#" AutoEventWireup="true" CodeFile="KlaimUserList.aspx.cs" Inherits="Pages_LandLiti_KlaimUserList" MasterPageFile="~/MasterPages/mptamp.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<h2>Pengajuan Claim</h2>  
<hr />
<br />

        <div class="form-group">
            <div class="col-sm-2">
                <asp:DropDownList ID="ddprg" runat="server" class="form-control" onclick="handleClick()">
                </asp:DropDownList>
            </div>


			<div class="col-lg-8" align="right">

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

            </div>

           <div class="col-lg-1">

                <input type="button" onclick="tambah()" id="btnTambah" value="Add New" class="btn btn-success btn-lg" />  
                   
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

    var localURL = "KlaimUserList.aspx";
    var newURL = "KlaimUserForm.aspx?param1=I";
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

    var btnRefresh = document.getElementById("btnRefresh");


    listMasterKlaimUser();
    SearchlistMasterKlaimUser();

    function tambah(lo) {
        var url = window.location.toString();
        url = url.replace(localURL, newURL);
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

    function SearchlistMasterKlaimUser(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=5"
            + "&param4="
            + "&param5="
			+ "";
        listMasterKlaimUser.clearAll();
        listMasterKlaimUser.loadXML(localURL + "?" + s);
    }

    //listpraregistrasi.loadXML("../xml/1_PraRegistrasi.xml");
    function listMasterKlaimUser() {
        listMasterKlaimUser = new dhtmlXGridObject('gridMasterIdentitas');
        listMasterKlaimUser.setImagePath("../JavaScript/codebase/imgs/");
        listMasterKlaimUser.setHeader("No,No Claim,Nama , Kabupaten, Kecamatan,Desa,Nama Perusahaan,Action,#cspan,#cspan,#cspan");
        listMasterKlaimUser.setInitWidths("50,188,188,150,150,150,150,62,62,62");
        listMasterKlaimUser.setColAlign("left,left,left,left,left,left,left,left,left,left");
        listMasterKlaimUser.setColTypes("ed,ed,ed,ed,ed,ed,ed,link,link,link");
        listMasterKlaimUser.init();
        listMasterKlaimUser.setSkin("dhx_skyblue");

        listMasterKlaimUser.setColSorting("str,str,str,str,str,str,str,str");
        listMasterKlaimUser.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
        listMasterKlaimUser.enablePaging(true, 15, 5, "pageMasterIdentitas", true);
        listMasterKlaimUser.setPagingSkin("bricks");
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
            listMasterKlaimUser.clearAll();
            listMasterKlaimUser.loadXML(localURL + "?" + s);
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
        listMasterKlaimUser.clearAll();
        listMasterKlaimUser.loadXML(localURL + "?" + s);
        //alert(s);
    }

</script>
</asp:Content>
