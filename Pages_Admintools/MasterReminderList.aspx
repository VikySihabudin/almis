<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="MasterReminderList.aspx.cs" Inherits="Pages_Admintools_MasterReminderList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<h2>Master Reminder</h2>   
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
                <input type="button" id="btnRefresh" value="Refresh" class="btn btn-info btn-sm" onclick="refresh()" />
                </div>

            </div>

           <div class="col-lg-1">

     
             <input type="button" onclick="tambah()" id="Button1" value="Add New" class="btn btn-success btn-lg" />  
  
                   
            </div>

        </div>
       
        <br /><br />    
      <div class="form-group">
            <div class="col-lg-12">
            <div style=" width:100%; height:400px;">
                <div id="gridMasterReminder" style="width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pageUser"></div>   
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

    var localURL = "MasterReminderList.aspx";
    var newURL = "MasterReminderForm.aspx?param1=I";
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

    var btnRefresh = document.getElementById("btnRefresh");


    ListMasterReminder();
    SearchListMasterReminder();

    function tambah(lo) {
        var url = window.location.toString();
        url = url.replace(localURL, newURL);
        window.open(newURL);

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

    function SearchListMasterReminder(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=5"
            + "&param4="
            + "&param5="
			+ "";
        ListMasterReminder.clearAll();
        ListMasterReminder.loadXML(localURL + "?" + s);
    }

    function ListMasterReminder() {
        ListMasterReminder = new dhtmlXGridObject('gridMasterReminder');
        ListMasterReminder.setImagePath("../JavaScript/codebase/imgs/");
        ListMasterReminder.setHeader("No,Modul,Sub Modul,Keterangan Modul,Subject,Body,Action,#cspan,#cspan");
        ListMasterReminder.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,,,#rspan");
        ListMasterReminder.setInitWidths("60,226,226,226,226,226,78,78,78");
        ListMasterReminder.setColAlign("left,left,left,left,left,left,left,left,left");
        ListMasterReminder.setColTypes("ed,ed,ed,ed,ed,ed,link,link,link");
        ListMasterReminder.init();
        ListMasterReminder.setSkin("dhx_skyblue");
        ListMasterReminder.setColSorting("str,str,str,str,str,str,str,str,str");
        ListMasterReminder.enablePaging(true, 15, 5, "pageUser", true);
        ListMasterReminder.setPagingSkin("bricks");
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
			+ "";
            ListMasterReminder.clearAll();
            ListMasterReminder.loadXML(localURL + "?" + s);
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
        ListMasterReminder.clearAll();
        ListMasterReminder.loadXML(localURL + "?" + s);
        //alert(s);
    }

</script>
</asp:Content>

