<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VerifikasiList.aspx.cs" Inherits="Pages_LandLiti_VerifikasiList"  MasterPageFile="~/MasterPages/mptamp.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<h2>Verifikasi Dokumen</h2>  
<hr />
<br />

<div class="form-group"> 
     <div class="col-lg-12" style=" width:100%; height:100%;">
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

         <asp:Button runat="server" ID="btnTambah" Text="Assign" class="btn btn-lg btn-success" PostBackUrl="~/Pages_LandLiti/VerifikasiAssign.aspx" />

    </div>
</div>    
     
    <div class="form-group"> 
        <div class="col-lg-12">
        <div style=" width:100%; height:300px;">
            <div id="gridlegal" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
            <div id="pageVerifikasi"></div>      
        </div>
        </div>
    </div>



    <%--Footer Awal--%>
     <footer class="site-footer">
          <div class="text-center">
              2015 - Aplikasi ALMIS
              <a href="#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
    <%--Footer Akhir--%>



<script type="text/javascript">

    var localURL = "VerifikasiList.aspx";
    var localURLForm = "VerifikasiForm.aspx?param1=I";

    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

    var btnRefresh = document.getElementById("btnRefresh");

    listVerikasi();
    SearchlistVerikasi();

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
    function SearchlistVerikasi(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=5"
            + "&param4="
            + "&param5="
			+ "";
        listVerikasi.clearAll();
        //listVerikasi.loadXML("../xml/ListVerifikasi.xml");
        listVerikasi.loadXML(localURL + "?" + s);
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
            listVerikasi.clearAll();
            //listVerikasi.loadXML("../xml/ListVerifikasi.xml");
            listVerikasi.loadXML(localURL + "?" + s);
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
        listVerikasi.clearAll();
        listVerikasi.loadXML(localURL + "?" + s);
        //alert(s);
    }



    function listVerikasi() {
        listVerikasi = new dhtmlXGridObject('gridlegal');
        listVerikasi.setImagePath("../JavaScript/codebase/imgs/");
        listVerikasi.setHeader("No,No Verifikasi,No Persiapan Dokumen,No Claim,Nama,Kabupaten,Kecamatan,Status,Nama Perusahaan,Action,#cspan,#cspan");
        listVerikasi.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,,,#rspan");
        listVerikasi.setInitWidths("40,160,160,160,160,160,160,160,160,45,45,45");
        listVerikasi.setColAlign("left,left,left,left,left,left,left,left,left,left,left,left");
        listVerikasi.setColTypes("ed,ed,ed,ed,ed,ed,ed,ed,ed,link,link,link");
        listVerikasi.init();
        listVerikasi.setSkin("dhx_skyblue");

        listVerikasi.setColSorting("str,str,str,str,str,str,str,str,str,str,str,str");
        listVerikasi.enablePaging(true, 15, 5, "pageVerifikasi", true);
        listVerikasi.setPagingSkin("bricks");
    }
</script>


</asp:Content>
