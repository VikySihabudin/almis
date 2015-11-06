﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LandcomplaList.aspx.cs" Inherits="Pages_Landcompla_LandcomplaList" MasterPageFile="~/MasterPages/mptamp.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<h2>Land Compliance</h2>  
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

           <div class="col-lg-1">

                <input type="button" onclick="tambah()" id="btnTambah" value="Tambah" class="btn btn-success btn-lg" />  
                   
            </div>

        </div>
       

        <div class="form-group">
            <div class="col-lg-12">
            <div style=" width:100%; height:400px;">
                <div id="gridCompliance" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
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

    var localURL = "LandcomplaList.aspx";
    var newURL = "LandcomplaForm.aspx?param1=I";
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

    var btnRefresh = document.getElementById("btnRefresh");


    listCompliance();
    //SearchlistCompliance();

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


    function tambah(lo) {
        var url = window.location.toString();
        url = url.replace(localURL, newURL);
        //window.location.replace(url);
        window.open(url);

    }

    function SearchlistCompliance(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=5"
            + "&param4="
            + "&param5="
			+ "";
        listCompliance.clearAll();
        //listCompliance.loadXML(localURL + "?" + s);
        //listCompliance.loadXML("../xml/listCompliance.xml");
    }


    function listCompliance() {
        listCompliance = new dhtmlXGridObject('gridCompliance');
        listCompliance.setImagePath("../JavaScript/codebase/imgs/");
        listCompliance.setHeader("No.,No. Compliance, Company, PIC, Project Analyst, Status, Action,#cspan,#cspan,#cspan");
        listCompliance.setInitWidths("50,200,200,200,200,200,62,62,62");
        listCompliance.setColAlign("left,left,left,left,left,left,left,left,left");
        listCompliance.setColTypes("ed,ed,ed,ed,ed,ed,link,link,link");
        listCompliance.init();
        listCompliance.setSkin("dhx_skyblue");

        listCompliance.setColSorting("str,str,str,str,str,str,str");
        listCompliance.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
        listCompliance.enablePaging(true, 15, 5, "pageMasterIdentitas", true);
        listCompliance.setPagingSkin("bricks");
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
            listCompliance.clearAll();
            listCompliance.loadXML(localURL + "?" + s);
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
        listCompliance.clearAll();
        listCompliance.loadXML(localURL + "?" + s);
        //alert(s);
    }

</script>
</asp:Content>
