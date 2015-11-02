<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="PemberkasanDuaList.aspx.cs" Inherits="Pages_PemberkasanDuaList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<h2>List Finalisasi</h2>  
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
                 <input type="button" id="btnRefresh" value="Refresh" class="btn btn-info btn-md" onclick="refresh()" />
                 </div>

            <%if (FinalisasiAssign.ToString().Equals("1") || groups.ToString().Equals("1"))
            { %> 
             <asp:Button runat="server" ID="btnTambah" Text="Assign" class="btn btn-lg btn-success" PostBackUrl="~/Pages_Landcomp/PemberkasanDuaAssign.aspx"/>
            <%}%>

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

    var localURL = "PemberkasanDuaList.aspx";
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");


    listPemberkasanDua();
    SearchlistPemberkasanDua();

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

    function handleClick() {
        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
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
            + "&param1=L"
            + "&param2=4"
            + "&param4=" + txtDateAwal.value
            + "&param5=" + txtDateAkhir.value
			+ "";
            listPemberkasanDua.clearAll();
            listPemberkasanDua.loadXML(localURL + "?" + s);
            //alert(s);
        }
    }


    function SearchlistPemberkasanDua(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=5" 
            + "&param4=" 
            + "&param5=" 
			+ "";
        listPemberkasanDua.clearAll();
        listPemberkasanDua.loadXML(localURL + "?" + s);
    }


    //listPemberkasanDua.loadXML("../xml/1_PemberkasanDua.xml");
    function listPemberkasanDua() {
        listPemberkasanDua = new dhtmlXGridObject('gridPemberkasanDua');
        listPemberkasanDua.setImagePath("../JavaScript/codebase/imgs/");
        listPemberkasanDua.setHeader("No,No Berkas,No registrasi,No Pid,Assignee,Status,Nama Penjual,Kode Perusahaan,Action,#cspan,#cspan");
        listPemberkasanDua.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,,,#rspan");
        listPemberkasanDua.setInitWidths("40,145,145,145,145,145,145,145,78,78,78");
        listPemberkasanDua.setColAlign("left,left,left,left,left,left,left,left,left,left,left");
        listPemberkasanDua.setColTypes("ed,ed,ed,ed,ed,ed,ed,ed,link,link,link");
        listPemberkasanDua.init();
        listPemberkasanDua.setSkin("dhx_skyblue");

        listPemberkasanDua.setColSorting("str,str,str,str,str,str,str,str,str,str");
        listPemberkasanDua.enablePaging(true, 15, 5, "pagePemberkasanDua", true);
        listPemberkasanDua.setPagingSkin("bricks");
    }




</script>

</asp:Content>

