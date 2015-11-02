<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="MasterMenu.aspx.cs" Inherits="Pages_MasterMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<h2>List Master Menu</h2>  
<hr />


        <label for="nama" class="control-label col-md-2">Pilih Group</label> 
      
        <div class="col-lg-2">
            <div class="input-group">
                <asp:DropDownList ID="ddprg" runat="server" class="form-control input-md" onclick="handleClick()">
                </asp:DropDownList>
            </div>
         </div>

    <br /><br /> 
  
        <div class="form-group">
            <div class="col-md-12">
            <div style=" width:100%; height:400px;">
                <div id="GridMasterMenu" style="width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                <div id="pageNegosiasi"></div>  
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

    var localURL = "MasterMenu.aspx";
    var ddprg = document.getElementById("<%= ddprg.ClientID %>");


    ListMasterMenu();
    SearchListMasterMenu();


    function SearchListMasterMenu(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2="
            + "&param3=" + ddprg.value
			+ "";
        ListMasterMenu.clearAll();
        ListMasterMenu.loadXML(localURL + "?" + s);
    }

    function handleClick() {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2="
            + "&param3=" + ddprg.value
			+ "";
        ListMasterMenu.clearAll();
        ListMasterMenu.loadXML(localURL + "?" + s);
    }

  

    //    ListMasterMenu.loadXML("../xml/ListMasterMenu.xml");

    function ListMasterMenu() {
        ListMasterMenu = new dhtmlXGridObject('GridMasterMenu');
        ListMasterMenu.setImagePath("../JavaScript/codebase/imgs/");
        ListMasterMenu.setHeader("No,Modul,Insert,Edit,Delete,View,Report");
        ListMasterMenu.setInitWidths("50,350,75,75,75,75,75");
        ListMasterMenu.setColAlign("center,left,center,center,center,center,center");
        ListMasterMenu.setColTypes("ro,ro,ch,ch,ch,ch,ch");
        ListMasterMenu.setColSorting("int,str");
        ListMasterMenu.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
        ListMasterMenu.attachEvent("onCheckbox", doOnCheck);
        ListMasterMenu.init();
        ListMasterMenu.setSkin("dhx_skyblue");
    }

    function doOnCheck(rowId, cellInd, state) {

        var cell = ""

        if (cellInd == 2) { //Insert
            cell = "A";
        } else if (cellInd == 3) { //Edit
            cell = "E";
        } else if (cellInd == 4) { //Delete
            cell = "D";
        } else if (cellInd == 5) { //View
            cell = "V";
        } else if (cellInd == 6) { //Assign
            cell = "P";
        }
      
        var s = ""
        +"rnd=" + Math.random() * 4
        + "&sm=HA"
        + "&param1=HA" //Parameter
        + "&param2=" //GrupmnIdssss
        + "&param3=" + ddprg.value // GrupmnIdents
        + "&param4=" + ListMasterMenu.cells(rowId, 1).getValue() // GrupmnModuls
        + "&param5=" // GrupmnParent
        + "&param6=" + cell // GrupmnAction
        + "&param7=" // GrupmnUserId
        + "&param8=" // GrupmnDatess
        + "";
//        alert(s);
        dhtmlxAjax.post(localURL, s);

    return true;
    }



</script>

</asp:Content>

