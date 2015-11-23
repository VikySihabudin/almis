<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="UserManagementForm.aspx.cs" Inherits="Pages_UserManagementForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<input type="hidden" id="hidMode" value="0" />
<input type="hidden" id="eksepsi" value="0" />


<h2>User Management</h2>
    
    <hr />
    <br />



    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">User Id</label>
            <div class="col-md-3"><asp:TextBox id="txtUserId" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nama</label>
            <div class="col-md-3"><asp:TextBox id="txtNama" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Email</label>
            <div class="col-md-3"><asp:TextBox id="txtemail" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div class="hidden">

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Password</label>
            <div class="col-md-3"><asp:TextBox id="txtPassword" TextMode="password" type="text" runat="server" class="form-control input-md" /></div>
        </div>
    </div>

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">New Password</label>
            <div class="col-md-3"><asp:TextBox id="txtNewPass" TextMode="password" type="text" runat="server" class="form-control input-md" /></div>
        </div>
    </div>

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Confirmasi New Password</label>
            <div class="col-md-3"><asp:TextBox id="txtconfirmasiPassword"  TextMode="password" onkeyup="checkPass();" type="text" runat="server" class="form-control input-md" /><span id="confirmMessage" class="confirmMessage"></span></div>
        </div>
    </div>

    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Group</label>
            <div class="col-md-3"><asp:DropDownList ID="ddGroup" class="form-control input-md" runat="server"></asp:DropDownList></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Status Active</label>
            
            <div class="col-md-3"><asp:DropDownList ID="ddStatusActive" class="form-control input-md" runat="server"></asp:DropDownList></div>
        </div>
    </div>

    <hr />


    <h3>Tambah Perusahaan</h3>
    <br />

            <div class="form-group">

            <div class="col-md-1">
            <asp:Label ID="Label13" runat="server" Text="Label">Nama Perusahaan</asp:Label>
            </div>

			<div class="col-md-2">
            <asp:DropDownList ID="ddprs" runat="server" class="form-control">
            </asp:DropDownList>
			</div>

            <div class="col-md-1">
            <asp:Label ID="Label15" runat="server" Text="Label">Keterangan</asp:Label>
            </div>

			<div class="col-md-2">
		    <asp:TextBox id="txtket" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>

            <div class="col-md-1">
                <input type="button" id="btnAdd" value="Add" class="btn btn-info btn-md" onclick="Add(this)" />
            </div>

            </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:1050px; height:150px;">
                <div id="gridPrs" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>


    <br /><hr />

    <div class="form-group">
            <div class="col-md-10">
                <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default" onclick="btnClick(this)" />
                <input type="button" id="btnSave" value="Save"  class="btn btn-lg btn-success" onclick="btnClick(this)" />
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

    var localURL = "UserManagementForm.aspx";
    var newUrl = "UserManagementList.aspx";
    var txtUserId = document.getElementById("<%= txtUserId.ClientID %>");
    var txtPassword = document.getElementById("<%= txtPassword.ClientID %>");
    var txtconfirmasiPassword = document.getElementById("<%= txtconfirmasiPassword.ClientID %>");
    var ddGroup = document.getElementById("<%= ddGroup.ClientID %>");
    var txtNama = document.getElementById("<%= txtNama.ClientID %>");
    var ddStatusActive = document.getElementById("<%= ddStatusActive.ClientID %>");
    var txtNewPass = document.getElementById("<%= txtNewPass.ClientID %>");
    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");
    var hidMode = document.getElementById('hidMode');
    var btnAdd = document.getElementById("btnAdd");
    var txtket = document.getElementById("<%= txtket.ClientID %>");
    var ddprs = document.getElementById("<%= ddprs.ClientID %>");
    var txtemail = document.getElementById("<%= txtemail.ClientID %>");
    

    terimaURL();
    listPrs();



    function SearchlistPrs(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=" + txtUserId.value
            + "&param4="
            + "&param5="
			+ "";
        listPrs.clearAll();
        listPrs.loadXML(localURL + "?" + s);
    }

    function Add(objBtn){
        if (txtUserId.value == '')
        {
            alert('Kode User Tidak Boleh Kosong')
        }
        else {
            var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=ID"
            + "&param1=ID"
            + "&param2=" + txtUserId.value
            + "&param3=" 
            + "&param4=" + ddprs.value
            + "&param5=" + txtket.value
			+ "";
            dhtmlxAjax.post(localURL, s, outputResponse);
        }
    }

    function terimaURL() {

        var url = window.location.toString();
        //ambil bagian parameternya
        url.match(/\?(.+)$/);
        var params = RegExp.$1;
        if (params != 'param1=I') {
            // pisahkan parameter URL ke associative array
            var params = '&' + params;
            //            alert(params);
            splitparam(params);
        } else {
            hidMode.value = 'I';
            document.getElementById('btnAdd').style.visibility = 'hidden';
        }
    }

    function splitparam(loader) {

        var a = loader;
        //lockPengukuran();
        if (a != '0') {
            var b = new Array();
            b = a.split('&');

        }
        //alert(b[2].replace("param1=", ""));

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=V"
			+ "&param1=V"
			+ "&param2=" + b[3].replace("param2=", "")
			+ "";

        // alert(s);
        dhtmlxAjax.post(localURL, s, bindUserManagement);

        var x = b[2].replace("param1=", "");
        //alert(x);

        if (x == 'V') {
            lockUserManagementView();

        }

        else if (x == 'D') {
            lockUserManagementDelete();
            btnSave.value = 'Delete';
            hidMode.value = 'D';
        }
        else if (x == 'E') {
            lockUserManagementEdit();
            btnSave.value = 'Save';
            hidMode.value = 'E';
        }

        else if (x == 'I') {
            btnSave.value = 'Save';
            hidMode.value = 'I';
        }
    }

    function checkPass() {

        //Store the Confimation Message Object ...
        var message = document.getElementById('confirmMessage');
        //Set the colors we will be using ...
        var goodColor = "#66cc66";
        var badColor = "#ff6666";
        //Compare the values in the password field
        //and the confirmation field
        if (txtNewPass.value == txtconfirmasiPassword.value) {
            //The passwords match.
            //Set the color to the good color and inform
            //the user that they have entered the correct password
            txtconfirmasiPassword.style.backgroundColor = goodColor;
            message.style.color = goodColor;
            message.innerHTML = "Passwords Match!"
        } else {
            //The passwords do not match.
            //Set the color to the bad color and
            //notify the user.
            txtconfirmasiPassword.style.backgroundColor = badColor;
            message.style.color = badColor;
            message.innerHTML = "Passwords Do Not Match!"
        }
    }  

    function btnClick(objBtn) {
        switch (objBtn.value) {
            case "Save":
                //alert(hidMode.value);
                CRUD(hidMode.value)
                break;

            case "Edit":
                if (txtNewPass.value == txtconfirmasiPassword.value) {
                    //alert(hidMode.value);
                    CRUD(hidMode.value)
                }
                else {
                    alert("Kombinasi Password Dan Konfirmasi Password Salah");
                    txtconfirmasiPassword.focus();
                }
                break;

            case "Delete":
                if (confirm("Hapus Data Ini?"))
                    CRUD(hidMode.value);
                break;

            

            case "Cancel":
                close();
                break;

            default:
                break;
        }
    }

    function Delete() {

        var url = window.location.toString();
        //ambil bagian parameternya
        url.match(/\?(.+)$/);
        var params = RegExp.$1;
        // pisahkan parameter URL ke associative array
        var params = '&' + params;

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=D"
			+ params
			+ "";

        // alert(s);
        dhtmlxAjax.post(localURL, s, outputResponse);

    }

    function Hapus(sm, param1, param2, param4) {
        var r = confirm("Delete?");
        if (r == true) {
            var s = ""
                    + "rnd=" + Math.random() * 4
			        + "&sm=" + sm
                    + "&param1=" + param1
                    + "&param2=" + param2
                    + "&param3="
                    + "&param4=" + param4
                    + "";
            dhtmlxAjax.post(localURL, s);
            SearchlistPrs();
        }
    }

    function outputResponse(loader) {
        //alert(loader.xmlDoc.responseText);
        //document.getElementById('debug').value = loader.xmlDoc.responseText;
        var a = loader.xmlDoc.responseText;
        if (a != '') {
            var b = new Array();
            b = a.split('|');
        }
        switch (b[0]) {
            case "E":
                alert("Data Berhasil Di Edit");
                close();
                //window.location.replace(newUrl);
                break;
            case "D":
                alert("Data Berhasil Di Delete");
                close();
                //window.location.replace(newUrl);
                break;
            case "I":
                alert("Data Berhasil Di Simpan");
                close();
               //window.location.replace(newUrl);
                break;
            case "ID":
                alert("Data Berhasil Di Simpan");
                SearchlistPrs();
                break;
            case "noedit":
                alert("Kata Sandi Password Lama Salah");
                break;
            case "notambah":
                alert("Data Tidak Bisa Di Tambah Karena Username Sudah Ada");
                SearchlistPrs();
                break;
             case "gagal":
                alert("Data Gagal Disimpan");
                //window.location.replace(newUrl);
                break;
            default:
                break;
        }
    }

    function CRUD(tipe) {
        var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=" + hidMode.value
                + "&param2=" + txtUserId.value
                + "&param3=" + txtNama.value
                + "&param4=" + txtNewPass.value
                + "&param5=" + ddGroup.value
                + "&param6=" + ddStatusActive.value
                + "&param7="
                + "&param8="
                + "&param11=" + txtemail.value
                + "";
        dhtmlxAjax.post(localURL, s, outputResponse);
    }

    function bindUserManagement(loader) {
        //alert(loader.xmlDoc.responseText);
        var a = loader.xmlDoc.responseText;
        //lockUserManagementView();
        if (a != '0') {
            var b = new Array();
            b = a.split('|');
            txtUserId.value = b[0];
            //txtPassword.value = b[1];
            txtNama.value = b[1];
            ddGroup.value = b[2];
            ddStatusActive.value = b[3];
            txtemail.value = b[4];
        }
        SearchlistPrs();
    }

    function lockUserManagementView() {
        txtUserId.disabled = true;
        txtPassword.disabled = true;
        ddGroup.disabled = true;
        txtNama.disabled = true;
        ddStatusActive.disabled = true;
        txtconfirmasiPassword.disabled = true;
        txtNewPass.disabled = true;
        txtemail.disabled = true;
        document.getElementById('btnSave').style.visibility = 'hidden'; 
        document.getElementById('btnAdd').style.visibility = 'hidden';
    }

    function lockUserManagementEdit() {
        txtUserId.disabled = true;
    }

    function lockUserManagementDelete() {
        txtemail.disabled = true;
        txtUserId.disabled = true;
        txtPassword.disabled = true;
        ddGroup.disabled = true;
        txtNama.disabled = true;
        txtNewPass.disabled = true;
        ddStatusActive.disabled = true;
        txtconfirmasiPassword.disabled = true;
        document.getElementById('btnAdd').style.visibility = 'hidden';
    }

    function listPrs() {
        listPrs = new dhtmlXGridObject('gridPrs');
        listPrs.setImagePath("../JavaScript/codebase/imgs/");
        listPrs.setHeader("No,Kode Perusahaan,Nama Perusahaan,Keterangan,Aksi");
        listPrs.setInitWidths("40,200,200,200,200");
        listPrs.setColAlign("left,left,left,left,left");
        listPrs.setColTypes("ro,ro,ro,ro,link");
        listPrs.init();
        listPrs.setSkin("dhx_skyblue");
        listPrs.setPagingSkin("bricks");
        listPrs.setColSorting("str,str,str,str,str");
    }

</script>



</asp:Content>

