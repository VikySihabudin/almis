<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="VisumList.aspx.cs" Inherits="Pages_VisumList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<h2>Visum</h2>  
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



            <%if (VerifikasiAssign.ToString().Equals("1") || groups.ToString().Equals("1"))
            { %> 

             <asp:Button runat="server" ID="btnTambah" Text="Assign" class="btn btn-lg btn-success" PostBackUrl="~/Pages_Landcomp/VisumAssign.aspx"/>

            <%}%>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12">
            <div style=" width:100%; height:400px;">
                <div id="gridVisum" style="width:100%; height:100%;; background-color:white; border: 1px solid #A4BED4"></div>
                <div class="pagination" id="pageVisums"></div>
            </div>
            </div>
        </div>

    <br /><br />
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

    var localURL = "VisumList.aspx";
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

    ListVisum();
    SearchListVisum();

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

    function SearchListVisum(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=5"
            + "&param4="
            + "&param5="
			+ "";
        ListVisum.clearAll();
        ListVisum.loadXML(localURL + "?" + s);
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
            ListVisum.clearAll();
            ListVisum.loadXML(localURL + "?" + s);
          
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
        ListVisum.clearAll();
        ListVisum.loadXML(localURL + "?" + s);
       
    }

    function ListVisum() {
        ListVisum = new dhtmlXGridObject('gridVisum');
        ListVisum.setImagePath("../JavaScript/codebase/imgs/");
        ListVisum.setHeader("No,No Visum,No Registrasi,PID,Assigne,Status,Nama Penjual,Nama PLK,Nama Perusahaan,Action,#cspan,#cspan");
        ListVisum.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,,,#rspan");
        ListVisum.setInitWidths("40,132,132,132,132,132,156,156,156,40,40,40");
        ListVisum.setColAlign("left,left,left,left,left,left,left,left,left,left,left,left");
        ListVisum.setColTypes("ed,ed,ed,ed,ed,ed,ed,ed,ed,link,link,link");
        ListVisum.init();
        ListVisum.setSkin("dhx_skyblue");

        ListVisum.setColSorting("str,str,str,str,str,str,str,str,str,str,str,str");
        ListVisum.enablePaging(true, 15, 5, "pageVisums", true);
        ListVisum.setPagingSkin("bricks");

    }




</script>

</asp:Content>

