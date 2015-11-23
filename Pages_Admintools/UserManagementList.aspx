<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserManagementList.aspx.cs" Inherits="Pages_UserManagementList" MasterPageFile="~/MasterPages/mptamp.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<h2>User Management</h2>   
<hr />
<br />

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

            <%if (UserManagementAssign.ToString().Equals("1") || groups.ToString().Equals("1"))
            { %> 
             <input type="button" onclick="tambah()" id="Button1" value="Tambah" class="btn btn-success btn-lg" />  
            <%}%> 
                   
            </div>

        </div>
       
        <br /><br />    
      <div class="form-group">
            <div class="col-lg-12">
            <div style=" width:100%; height:400px;">
                <div id="gridUserManagement" style="width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
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

    var localURL = "UserManagementList.aspx";
    var newURL = "UserManagementForm.aspx?param1=I";
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");
    var txtDateAwal = document.getElementById("<%= txtDateAwal.ClientID %>");
    var txtDateAkhir = document.getElementById("<%= txtDateAkhir.ClientID %>");

    var btnRefresh = document.getElementById("btnRefresh");


    ListUserManagement();
    SearchListUserManagement();

    function tambah(lo) {
        var url = window.location.toString();
        url = url.replace(localURL, newURL);
        //window.location.replace(url);
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

    function SearchListUserManagement(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=5"
            + "&param4="
            + "&param5="
			+ "";
        ListUserManagement.clearAll();
        ListUserManagement.loadXML(localURL + "?" + s);
    }

    function ListUserManagement() {
        ListUserManagement = new dhtmlXGridObject('gridUserManagement');
        ListUserManagement.setImagePath("../JavaScript/codebase/imgs/");
        ListUserManagement.setHeader("No,User Id,Nama,Group,User Active,Kode Perusahaan,Action,#cspan,#cspan");
        ListUserManagement.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,,,#rspan");
        ListUserManagement.setInitWidths("60,226,226,226,226,0,78,78,78");
        ListUserManagement.setColAlign("left,left,left,left,left,left,left,left,left");
        ListUserManagement.setColTypes("ed,ed,ed,ed,ed,ed,link,link,link");
        ListUserManagement.init();
        ListUserManagement.setSkin("dhx_skyblue");
        ListUserManagement.setColSorting("str,str,str,str,str,str,str,str,str");
        ListUserManagement.enablePaging(true, 15, 5, "pageUser", true);
        ListUserManagement.setPagingSkin("bricks");
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
            ListUserManagement.clearAll();
            ListUserManagement.loadXML(localURL + "?" + s);
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
        ListUserManagement.clearAll();
        ListUserManagement.loadXML(localURL + "?" + s);
        //alert(s);
    }

</script>
</asp:Content>
