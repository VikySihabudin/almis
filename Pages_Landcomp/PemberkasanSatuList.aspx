<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="PemberkasanSatuList.aspx.cs" Inherits="Pages_PemberkasanSatuList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">




<h2>Pemberkasan</h2>  
<hr />

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
                 <input type="button" id="btnRefresh" value="Search" class="btn btn-info btn-md" onclick="refresh()" />
                 </div>




            <%if (PemberkasanAssign.ToString().Equals("1") || groups.ToString().Equals("1"))
            { %> 
             <asp:Button runat="server" ID="btnTambah" Text="Assign" class="btn btn-lg btn-success" PostBackUrl="~/Pages_Landcomp/PemberkasanSatuAssign.aspx"/>
            <%}%>

            </div>
        </div>

        <div class="form-group">
            <div class="col-lg-12">
            <div style=" width:100%; height:400px;">
                <div id="gridPemberkasan" style=" width:100%; height:100%;  background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pagePemberkasan"></div>
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

    var localURL = "PemberkasanSatuList.aspx";
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

    listPemberkasan();
    SearchlistPemberkasan();

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
			+ "";
        listPemberkasan.clearAll();
        listPemberkasan.loadXML(localURL + "?" + s);
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
			+ "";
        listPemberkasan.clearAll();
        listPemberkasan.loadXML(localURL + "?" + s);
        //alert(s);
    }

   // listPemberkasan.loadXML("../xml/1_Pemberkasan.xml");
    function listPemberkasan() {
        listPemberkasan = new dhtmlXGridObject('gridPemberkasan');
        listPemberkasan.setImagePath("../JavaScript/codebase/imgs/");
        listPemberkasan.setHeader("No,No Berkas,No Registrasi,No PID,Assignee,Nama Penjual,Nama Perusahaan,Action,#cspan,#cspan");
        listPemberkasan.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,,,#rspan");
        listPemberkasan.setInitWidths("40,166,166,166,166,236,236,65,65,65");
        listPemberkasan.setColAlign("left,left,left,left,left,left,left,left,left,left");
        listPemberkasan.setColTypes("ed,ed,ed,ed,ed,ed,ed,link,link,link");
        listPemberkasan.init();
        listPemberkasan.setSkin("dhx_skyblue");

        listPemberkasan.setColSorting("str,str,str,str,str,str,str,str,str,str");
        listPemberkasan.enablePaging(true, 15, 5, "pagePemberkasan", true);
        listPemberkasan.setPagingSkin("bricks");
    }

</script>

</asp:Content>

