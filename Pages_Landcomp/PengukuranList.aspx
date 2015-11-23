<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="PengukuranList.aspx.cs" Inherits="Pages_PengukuranList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h2>Pengukuran T0</h2>  
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


            <%if (PengukuranT0Assign.ToString().Equals("1") || groups.ToString().Equals("1"))
            { %> 
                <asp:Button runat="server" ID="btnTambah" Text="Assign" class="btn btn-lg btn-success" PostBackUrl="~/Pages_Landcomp/PengukuranAssign.aspx" />
            <%}%>
            </div>
        </div>
            
        <div class="form-group">
            <div class="col-md-12">
            <div style=" width:100%; height:400px;">
            <div id="gridPengukuran" style="width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
            <div id="pagePengukuran"></div>  
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

    var localURL = "PengukuranList.aspx";
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

    listPengukuran();
    SearchlistPengukuran();

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


    function SearchlistPengukuran(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=5"
            + "&param4="
            + "&param5="
			+ "";
        listPengukuran.clearAll();
        listPengukuran.loadXML(localURL + "?" + s);
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
            listPengukuran.clearAll();
            listPengukuran.loadXML(localURL + "?" + s);
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
        listPengukuran.clearAll();
        listPengukuran.loadXML(localURL + "?" + s);
        //alert(s);
    }


  //  listPengukuran.loadXML("../xml/1_Pengukuran_T0.xml");
    function listPengukuran() {
        listPengukuran = new dhtmlXGridObject('gridPengukuran');
        listPengukuran.setImagePath("../JavaScript/codebase/imgs/");
        listPengukuran.setHeader("No,PID,No Register,No Assignee,Status,Nama Penjual,Nama Perusahaan,Action,#cspan,#cspan");
        listPengukuran.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,,,#rspan");
        listPengukuran.setInitWidths("50,188,188,188,188,190,190,45,45,45");
        listPengukuran.setColAlign("left,left,left,left,left,left,left,left,left,left");
        listPengukuran.setColTypes("ed,ed,ed,ed,ed,ed,ed,link,link,link");
        listPengukuran.init();
        listPengukuran.setSkin("dhx_skyblue");

        listPengukuran.setColSorting("str,str,str,str,str,str,str,str,str");
        listPengukuran.enablePaging(true, 15, 5, "pagePengukuran", true);
        listPengukuran.setPagingSkin("bricks");
    }

</script>

</asp:Content>

