﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="RegistrasiList.aspx.cs" Inherits="Pages_RegistrasiList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<h2>Registrasi</h2>  
<hr />
<br />


        <div class="form-group">

            <div class="col-sm-2">
                <asp:DropDownList ID="ddprs" runat="server" class="form-control" onclick="Perusahaan()" >
                </asp:DropDownList>
            </div>

            <div class="col-sm-2">
                <asp:DropDownList ID="ddprg" runat="server" class="form-control" onclick="handleClick()">
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
                <input type="button" id="btnRefresh" value="Search" class="btn btn-info btn-sm" onclick="refresh()" />
                </div>

            <%if (RegistrasiAssign.ToString().Equals("1") || groups.ToString().Equals("1"))
            { %> 
                <asp:Button runat="server" ID="btnTambah" Text="Assign" class="btn btn-lg btn-success" PostBackUrl="~/Pages_Landcomp/RegistrasiAssign.aspx" />
            <%}%>

        </div>  


        <div class="form-group">
            <div class="col-lg-12">
            <div style=" width:100%; height:400px;">
                <div id="gridRegistrasi" style="width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pageRegistrasi"></div>   
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
    var localURL = "RegistrasiList.aspx";
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");
    var ddprs = document.getElementById("<%= ddprs.ClientID %>");

    listRegistrasi();
    SearchlistRegistrasi();

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

    function Perusahaan() {

        SearchlistRegistrasi();

    }


    function SearchlistRegistrasi(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=5"
            + "&param4="
            + "&param5="
            + "&param35=" + ddprs.value
			+ "";
        listRegistrasi.clearAll();
        listRegistrasi.loadXML(localURL + "?" + s);
    }

    function refresh() {
        if ((txtDateAkhir.value == 0) || (txtDateAwal.value == 0))
        { alert('Start Date Dan End Date \n    Tidak Boleh Kosong') }
        else {
            var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=4"
            + "&param4=" + txtDateAwal.value
            + "&param5=" + txtDateAkhir.value
            + "&param35=" + ddprs.value
			+ "";
            listRegistrasi.clearAll();
            listRegistrasi.loadXML(localURL + "?" + s);
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
            + "&param35=" + ddprs.value
			+ "";
        listRegistrasi.clearAll();
        listRegistrasi.loadXML(localURL + "?" + s);
        //alert(s);
    }

 // listRegistrasi.loadXML("../xml/1_Registrasi.xml");
    function listRegistrasi() {
        listRegistrasi = new dhtmlXGridObject('gridRegistrasi');
        listRegistrasi.setImagePath("../JavaScript/codebase/imgs/");
        listRegistrasi.setHeader("No,No Registrasi,No Pengecekan Lapangan,No Pra Registrasi,Assignee,Status,Nama Penjual,Nama Perusahaan,Action,#cspan,#cspan");
        listRegistrasi.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,,,#rspan");
        listRegistrasi.setInitWidths("50,150,200,160,110,130,140,140,76,76,76");
        listRegistrasi.setColAlign("left,left,left,left,left,left,left,left,left,left,left");
        listRegistrasi.setColTypes("ed,ed,ed,ed,ed,ed,ed,ed,link,link,link");
        listRegistrasi.init();
        listRegistrasi.setSkin("dhx_skyblue");

        listRegistrasi.setColSorting("str,str,str,str,str,str,str,str,str,str,str");
        listRegistrasi.enablePaging(true, 15, 5, "pageRegistrasi", true);
        listRegistrasi.setPagingSkin("bricks");
    }

</script>

</asp:Content>

