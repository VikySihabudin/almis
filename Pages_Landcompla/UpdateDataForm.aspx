<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/mptamp.master" CodeFile="UpdateDataForm.aspx.cs" Inherits="Pages_Landcompla_UpdateDataForm" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" CombineScripts="false"></asp:ToolkitScriptManager>--%>
    
<input type="hidden" id="hidMode" value="0" />

<asp:HiddenField ID="namaFile" runat="server" />



<h1>Update Data Compliance</h1>
	
	<hr />    
    
    
		<div class="form-group">

            <label for="nama" class="control-label col-md-2">Nama Perusahaan</label>
            <div class="col-md-2">
             <asp:DropDownList ID="ddprs" runat="server" class="form-control">
             </asp:DropDownList>
            </div>
        </div>



		<div class="form-group">

            <label for="nama" class="control-label col-md-2">Jenis Project</label>
            <div class="col-md-2">
             <asp:DropDownList ID="ddJnsPro" runat="server" class="form-control">
             <asp:ListItem Text="Hauling" Value="0"></asp:ListItem>
             <asp:ListItem Text="Pit" Value="1"></asp:ListItem>
             <asp:ListItem Text="Disposa" Value="2"></asp:ListItem>
             </asp:DropDownList>
            </div>
        </div>

         <div class="form-group">

            <label for="nama" class="control-label col-md-2">Nama Project</label>
            <div class="col-md-2">
            <asp:TextBox ID="TxtNmPro" class="form-control input-md" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-1">
            <input type="button" id="BtncariNmPro" value="Search" class="btn btn-info btn-md" onclick="CariNmPro()" />
            </div>

         </div>

    <hr />
    <br />
      
    <div class="form-group">
            <div class="col-md-10">
       
                     <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default"  onclick="btnClick(this)" /> 
                     <input type="button" id="btnSave" value="Update"  class="btn btn-lg btn-success" onclick="btnClick(this)" />  
            </div>
    </div>	
    
    
    <div id="dialogNmPro" title="Cari Nama Project" style="font-size:small;">

        <br />

         <div class="form-group">      
           <div class="col-md-12">
                <div style=" width:550px; height:250px;">
                    <div id="gridNmPro" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                    <div id="pageNmPro"> </div>
                </div>
            </div>
        </div>
        

    </div>    	


<script type="text/javascript">

    var localURL = "UpdateDataForm.aspx";

    var ddprs = document.getElementById("<%=ddprs.ClientID%>");
    var TxtNmPro = document.getElementById("<%=TxtNmPro.ClientID%>");
    var ddJnsPro = document.getElementById("<%=ddJnsPro.ClientID%>");
    
    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");
    var BtncariNmPro = document.getElementById("BtncariNmPro");

    var Hidmode = document.getElementById("Hidmode");

    // terimaURL();
    lisNamaProject();
    SearchlisNmPro();

    function CariNmPro() {

        $("#dialogNmPro").dialog("open");

    }

    $(function () {
        $("#dialogNmPro").dialog
        ({
            autoOpen: false,
            width: 610,
            height: 330,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogNmPro").dialog("close");
        });
    });

    function lisNamaProject() {
        lisNamaProject = new dhtmlXGridObject('gridNmPro');
        lisNamaProject.setImagePath("../JavaScript/codebase/imgs/");
        lisNamaProject.setHeader("No.,Kode Project,Nama Project");
        lisNamaProject.setInitWidths("50,250,0");
        lisNamaProject.setColAlign("left,left,left");
        lisNamaProject.setColTypes("ro,ro,ro");
        lisNamaProject.init();
        lisNamaProject.setSkin("dhx_skyblue");

        lisNamaProject.attachEvent("onRowSelect", onRowSelectedNmPro);

        lisNamaProject.setColSorting("str,str,str");
        lisNamaProject.attachHeader("#text_filter,#text_filter,#text_filter");
        lisNamaProject.enablePaging(true, 15, 5, "pageNmPro", true);
        lisNamaProject.setPagingSkin("bricks");
    }

    function onRowSelectedNmPro(rowId, cellIndex) {

        TxtNmPro.value = lisNamaProject.cells(rowId, 1).getValue();
        $("#dialogNmPro").dialog("close");

    }

    function SearchlisNmPro() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=L"
        + "&param1=LNP"
        + "&param2="
        + "";
        lisNamaProject.clearAll();
        lisNamaProject.loadXML(localURL + "?" + s);
    }



    function btnClick(objBtn) {
        switch (objBtn.value) {
            case "Update":
                CRUD(hidMode.value);
                break;

            case "Delete":
                if (objBtn.id == 'btnSave') {
                    if (confirm("Hapus Data Ini?"))
                        CRUD(hidMode.value);
                }
                break;

            case "Cancel":
                close();
                window.location.replace(newUrl);
                break;

            default:
                break;
        }
    }

    function CRUD(tipe) {

        var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=E"
                + "&param1=U"
                + "&param2=" + ddprs.value
                + "&param3=" + ddJnsPro.value
                + "&param4=" + TxtNmPro.value
                + "";
        //alert(s);
        dhtmlxAjax.post(localURL, s, outputResponse);
    }

 
    function outputResponse(loader) {


        alert("Data Berhasil Di Update");

        //var a = loader.xmlDoc.responseText;
        //if (a != '') {
        //    var b = new Array();
        //    b = a.split('|');
            
        //}
        //switch (b[0]) {
        
        //    case "E":
        //        alert("Data Berhasil di Edit");
        //        //window.location.replace(newUrl);
        //        close();
        //        break;
        //    case "I":
        //        alert("Data Berhasil di Input");
        //        //window.location.replace(newUrl);
        //        close();
        //        break;
        //    case "D":
        //        alert("Data Berhasil di Delete");
        //        //window.location.replace(newUrl);
        //        close();
        //        break;
        //    case "nodelete":
        //        alert("Data Complaince Tidak Dapat Dihapus Karena Sudah Dilalukan Persiapan Dokumen");
        //        break;
        //    case "noedit":
        //        alert("Data Complaince Tidak Dapat Di Edit Karena Sudah Dilalukan Persiapan Dokumen");
        //        break;
        //    case "gagal":
        //        alert("Data Gagal Disimpan");
        //        break;
        //    case "DP":
        //        alert("Folder Di Delete");
        //        break;
        //    default:
        //        break;
        //}

    }

    function terimaURL() {


        var url = window.location.toString();
        //ambil bagian parameternya
        url.match(/\?(.+)$/);
        var params = RegExp.$1;


        //alert(params);

        if (params != 'param1=I') {
            // pisahkan parameter URL ke associative array
            var params = '&' + params;
            //            alert(params);
            splitparam(params);
        } else {
            hidMode.value = 'I';
            lockComplaEdit();
        }

    }


    function splitparam(loader) {

        var a = loader;
        if (a != '&div') {
            //alert(a);
            var b = new Array();
            b = a.split('&');
            //alert(b[3]);
            var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=V"
			    + "&param1=V"
                + "&param2=" + b[3].replace("param2=", "")
			    + "";
            //alert(s);
            dhtmlxAjax.post(localURL, s, bindFormCompla);

            var x = b[2].replace("param1=", "");

            if (x == 'V') {

                lockComplaView();
                hidMode.value = 'I';
            }

            else if (x == 'D') {
                lockComplaDelete();
                btnSave.value = 'Delete';
                hidMode.value = 'D';

            }
            else if (x == 'E') {

                lockComplaEdit();
                btnSave.value = 'Save';
                hidMode.value = 'E';


            }
        }

    }

    function bindFormCompla(loader) {
        //alert(loader.xmlDoc.responseText);
        var a = loader.xmlDoc.responseText;
        if (a != '0') {
            var b = new Array();
            b = a.split('|');

            ddprs.value = b[0];
           
           
        }
    }

    function lockComplaView() {

        
        ddprs.disabled = true;

        document.getElementById('btnSave').style.visibility = 'hidden';
        


    }

    function lockComplaEdit() {

        ddprs.disabled = true;
    }

    function lockComplaDelete() {
    
        ddprs.disabled = true;

    }


</script>


</asp:Content>
