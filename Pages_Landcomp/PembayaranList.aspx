<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="PembayaranList.aspx.cs" Inherits="Pages_PembayaranList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     


<h2>List Pembayaran</h2>  
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

            <%if (PembayaranAssign.ToString().Equals("1") || groups.ToString().Equals("1"))
            { %> 
             <asp:Button runat="server" ID="btnTambah" Text="Assign" class="btn btn-lg btn-success" PostBackUrl="~/Pages_Landcomp/PembayaranAssign.aspx"/>
            <%}%>

            </div>
               </div>
        <div class="form-group">
            <div class="col-lg-12">
            <div style=" width:100%; height:400px;">
                 <div id="gridPembayaran" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                 <div id="pagePembayaran"></div>  
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


    var localURL = "PembayaranList.aspx";
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

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

    listPembayaran();
    SearchlistPembayaran();


    function SearchlistPembayaran(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=5"
            + "&param4="
            + "&param5="
			+ "";
        listPembayaran.clearAll();
        listPembayaran.loadXML(localURL + "?" + s);
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
        listPembayaran.clearAll();
        listPembayaran.loadXML(localURL + "?" + s);
        //alert(s);
    }

//    listPembayaran.loadXML("../xml/1_Pembayaran.xml");
    function listPembayaran() {
        listPembayaran = new dhtmlXGridObject('gridPembayaran');
        listPembayaran.setImagePath("../JavaScript/codebase/imgs/");
        listPembayaran.setHeader("No,No Pembayaran,No Registrasi,No PID,Assignee,Status,Nama Penjual,Kode Perusahaan,Action,#cspan,#cspan");
        listPembayaran.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,,,#rspan");
        listPembayaran.setInitWidths("40,145,145,145,145,145,170,170,65,65,65")
        listPembayaran.setColAlign("left,left,left,left,left,left,left,left,left,left");
        listPembayaran.setColTypes("ed,ed,ed,ed,ed,ed,ed,ed,link,link,link");
        listPembayaran.init();
        listPembayaran.setSkin("dhx_skyblue");

        listPembayaran.setColSorting("str,str,str,str,str,str,str,str,str,str");
        listPembayaran.enablePaging(true, 15, 5, "pagePembayaran", true);
        listPembayaran.setPagingSkin("bricks");
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
            listPembayaran.clearAll();
            listPembayaran.loadXML(localURL + "?" + s);
            //alert(s);
        }
    }
</script>


</asp:Content>

