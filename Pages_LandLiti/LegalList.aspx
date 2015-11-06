<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LegalList.aspx.cs" Inherits="Pages_LandLiti_LegalList" MasterPageFile="~/MasterPages/mptamp.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<h2>Legal</h2>  
<hr />
<div class="form-group"> 
     <div class="col-lg-12" style=" width:100%; height:100%;">
           <div class="col-sm-2">
                <asp:DropDownList ID="ddprg" runat="server" class="form-control" >
                </asp:DropDownList>
            </div>

            <label for="nama" class="control-label col-md-1">Date Awal</label>
            
            <div class="col-lg-2">
            <asp:TextBox id="txtDateAwal" type="text" runat="server" class="form-control" />
            </div>

            <label for="nama" class="control-label col-md-1">Date Akhir</label>

            <div class="col-lg-2">
                <asp:TextBox id="txtDateAkhir" type="text" runat="server" class="form-control" />
            </div>

            <div class="col-lg-1">
                <input type="button" id="btnRefresh" value="Refresh" class="btn btn-info btn-md"  />
            </div>


    </div>
</div>    
     
    <div class="form-group"> 
        <div class="col-lg-12">
        <div style=" width:100%; height:300px;">
            <div id="gridlegal" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
            <div id="pagePraregistrasi"></div>      
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

    var localURL = "LegalList.aspx";
    var localURLForm = "LegalList.aspx?param1=I";
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

    var btnRefresh = document.getElementById("btnRefresh");

    listLegal();
    SearchlistLegal();

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
			+ "";
            listLegal.clearAll();
            listLegal.loadXML("../xml/ListLegal.xml");
            //listLegal.loadXML(localURL + "?" + s);
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
        listLegal.clearAll();
        listLegal.loadXML(localURL + "?" + s);
        //alert(s);
    }


    
    function listLegal() {
        listLegal = new dhtmlXGridObject('gridlegal');
        listLegal.setImagePath("../JavaScript/codebase/imgs/");
        listLegal.setHeader("No,No Verifikasi,No Claim,Nama,Kabupaten,Kecamatan,Desa,Status,Action,#cspan,#cspan");
        listLegal.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,,,#rspan");
        listLegal.setInitWidths("40,160,160,160,160,160,160,160,45,45,45");
        listLegal.setColAlign("left,left,left,left,left,left,left,left,left,left,left");
        listLegal.setColTypes("ed,ed,ed,ed,ed,ed,ed,ed,link,link,link");
        listLegal.init();
        listLegal.setSkin("dhx_skyblue");

        listLegal.setColSorting("str,str,str,str,str,str,str,str,str,str,str");
        listLegal.enablePaging(true, 15, 5, "pagePraregistrasi", true);
        listLegal.setPagingSkin("bricks");
    }


</script>


</asp:Content>

