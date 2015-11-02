<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="VisumForm.aspx.cs" Inherits="Pages_VisumForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<input type="hidden" id="hidMode" value="0" />
<input type="hidden" id="eksepsi" value="0" />


<h2>Visum</h2>
    
    <hr />

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="nama" class="control-label col-md-2">Nama Perusahaan</label>
            <div class="col-md-3"> 
                <asp:DropDownList ID="ddprs" runat="server" class="form-control">
                </asp:DropDownList>
            </div>
        </div>
  </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">No Visum</label>
            <div class="col-md-3"><asp:TextBox id="txtNoVisum" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

     <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">No Regristasi</label>
            <div class="col-md-3"><asp:TextBox id="txtNoRegistrasi" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
		
        </div>
    </div>
      <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">No PID</label>
            <div class="col-md-3"><asp:TextBox id="txtPID" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
		
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Temuan Objek Lahan</label>
            <div class="col-md-3"><asp:DropDownList ID="ddTemObLah" class="form-control input-md" runat="server"></asp:DropDownList></div>
            <label for="identitas" class="control-label col-md-1">Keterangan</label>
            <div class="col-md-3"><asp:TextBox id="txtOKeterangan" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" runat="server" /></div>
            <div class="col-md-3"><input type="button" id="btnTambahObjek" value="Add"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>
        </div>
    </div>

<%--       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:100%; height:130px;">
                <div id="gridObLah" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>--%>

    <br />

     <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Temuan Subjek Lahan</label>
            <div class="col-md-3"><asp:DropDownList ID="ddTemSuLah" class="form-control input-md" runat="server"></asp:DropDownList></div>
            <label for="identitas" class="control-label col-md-1">Keterangan</label>
            <div class="col-md-3"><asp:TextBox id="txtKeteranganSubjek" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" runat="server" /></div>
            <div class="col-md-3"><input type="button" id="btnTambahSubjek" value="Add"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>
        </div>
    </div>

<%--       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:100%; height:130px;">
                <div id="gridSubLah" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>--%>

    <br />

         <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Temuan Documents Control</label>
            <div class="col-md-3"><asp:DropDownList ID="ddDocum" class="form-control input-md" runat="server"></asp:DropDownList></div>
            <label for="identitas" class="control-label col-md-1">Keterangan</label>
            <div class="col-md-3"><asp:TextBox id="txtKetDoc" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" runat="server" /></div>
            <div class="col-md-3"><input type="button" id="BtnDoc" value="Add"  class="btn btn-info btn-md" onclick="btnAdd(this)" /></div>
        </div>
    </div>

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:100%; height:330px;">
                <div id="gridDoc" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

    <br />
    <hr class="style-four"/>

<%--           <div class="form-group">
       <div class="col-md-5">
            <div style=" width:100%; height:130px;">
                <div id="gridVerifikasiObj" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        
       <div class="col-md-5">
            <div style=" width:100%; height:130px;">
                <div id="gridVerifikasiSbj" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>--%>

    <br />

       <div class="form-group">
       <div class="col-md-10">
            <div style=" width:100%; height:330px;">
                <div id="gridVerifikasiDoc" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

    <%if (groups.ToString() != "1")
    { %>        
            <%if (lanjut.ToString() != "1")
            { %> 
            <div class="hidden">
            <%}%>

    <%}%>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label ID="LLanjut" for="identitas"  class="control-label col-md-2" runat="server" Text="Lanjut" Font-Bold="True"></asp:Label>
            <div class="col-md-3"><asp:DropDownList ID="ddLanjut" runat="server" class="form-control input-md"></asp:DropDownList></div>
        </div>
    </div>

    <%if (groups.ToString() != "1")
    { %>        
            <%if (lanjut.ToString() != "1")
            { %> 
            </div>
            <%}%>

    <%}%>

    <%if (groups.ToString() != "1")
    { %>        
            <%if (except.ToString() != "1")
            { %> 
            <div class="hidden">
            <%}%>

    <%}%>  

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label ID="LEksepsi" for="identitas"  class="control-label col-md-2" runat="server" Text="Ekspesi" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
            <asp:CheckBox ID="cbEksepsi" runat="server" CssClass="form-control checkbox-md" Text="" onclick="validasi()"/>
            </div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label ID="LKEksepsi" for="identitas"  class="control-label col-md-2" runat="server" Text="Keterangan Ekspesi" Font-Bold="True"></asp:Label>
            <div class="col-md-3"> <asp:TextBox id="txtKetEks" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" runat="server" /></div>
        </div>
    </div>

    <%if (groups.ToString() != "1")
    { %>        
            <%if (except.ToString() != "1")
            { %> 
            </div>
            <%}%>

    <%}%>  

    <br /><hr />

    <div class="form-group">
            <div class="col-md-10">
                <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default" onclick="btnClick(this)" />
                <input type="button" id="btnSave" value="Save"  class="btn btn-lg btn-success" onclick="btnClick(this)" />

            </div>
    </div>


<%--//    var ddAksi = document.getElementById("<%= ddAksi.ClientID %>");
//    var txtRekomendasi = document.getElementById("<%= txtRekomendasi.ClientID %>");--%>


<div id="dialogrek" title="Rekomendasi" style="font-size:small;">
<div role="form" class="form-horizontal">

    <div class="form-group">
        <asp:Label ID="Label1" for="identitas"  class="control-label col-md-2" runat="server" Text="No Visums" Font-Bold="True"></asp:Label>
        <div class="col-sm-4">
            <asp:TextBox ID="txtnovi" class="form-control input-md" runat="server" Enabled="False"></asp:TextBox>
        </div>

        <asp:Label ID="Label3" for="identitas"  class="control-label col-md-2" runat="server" Text="Objek/Subjek Lahan" Font-Bold="True"></asp:Label>
        <div class="col-sm-4">
            <asp:TextBox ID="txtlahan" class="form-control input-md" runat="server" Enabled="False"></asp:TextBox>
        </div>


    </div>

    <div class="hidden">
       <div class="form-group">
        <asp:Label ID="Label2" for="identitas"  class="control-label col-md-2" runat="server" Text="No Sequen" Font-Bold="True"></asp:Label>
        <div class="col-sm-4">
            <asp:TextBox ID="txtsequ" class="form-control input-md" runat="server" Enabled="False"></asp:TextBox>
        </div>

        <asp:Label ID="Label6" for="identitas"  class="control-label col-md-2" runat="server" Text="Jenis" Font-Bold="True"></asp:Label>
        <div class="col-sm-4">
            <asp:TextBox ID="txtjen" class="form-control input-md" runat="server" Enabled="False"></asp:TextBox>
       </div>
     </div>
     </div>


    <div class="form-group">
        <asp:Label ID="Label4" for="identitas"  class="control-label col-md-2" runat="server" Text="Rekomendasi" Font-Bold="True"></asp:Label>
        <div class="col-sm-4">
            <asp:TextBox ID="txtKet" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" runat="server" ></asp:TextBox>
        </div>

        <asp:Label ID="Label5" for="identitas"  class="control-label col-md-2" runat="server" Text="Aksi" Font-Bold="True"></asp:Label>
        <div class="col-sm-4">
            <asp:DropDownList ID="ddAksi" runat="server" class="form-control input-md"></asp:DropDownList>
            <%--<asp:DropDownList ID="ddKondisiLahan" runat="server" class="form-control input-md"></asp:DropDownList>--%>
        </div>
    </div>

</div>
<div role="form" class="form-horizontal">
    <div class="form-group">
        <div class="col-md-11" align="right">
            <input type="button" id="PopupbtnSaveRek" value="Save" runat="server" class="btn btn-md btn-default" onclick="SaveKondisiRek()" />
        </div>
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


    <script src="../JavaScript/jquery.min.js" type="text/javascript"></script>
    <script src="../JavaScript/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
    <link rel="Stylesheet" type="text/css" href="../css/jquery-ui-1.10.3.custom.css" />

<script type="text/javascript">

    var localURL = "VisumForm.aspx";
    var newUrl = "VisumList.aspx";
    var txtNoVisum = document.getElementById("<%= txtNoVisum.ClientID %>");
    var txtNoRegistrasi = document.getElementById("<%= txtNoRegistrasi.ClientID %>");
    var txtPID = document.getElementById("<%= txtPID.ClientID %>");
    var ddTemObLah = document.getElementById("<%= ddTemObLah.ClientID %>");
    var txtOKeterangan = document.getElementById("<%= txtOKeterangan.ClientID %>");
    var ddTemSuLah = document.getElementById("<%= ddTemSuLah.ClientID %>");
    var txtKeteranganSubjek = document.getElementById("<%= txtKeteranganSubjek.ClientID %>");

    var ddLanjut = document.getElementById("<%= ddLanjut.ClientID %>");
    var cbEksepsi = document.getElementById("<%= cbEksepsi.ClientID %>");
    var txtKetEks = document.getElementById("<%= txtKetEks.ClientID %>");
    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");
    var btnDelete = document.getElementById("btnDelete");
    var hidMode = document.getElementById('hidMode');
    var btnTambahObjek = document.getElementById("btnTambahObjek");
    var btnTambahSubjek = document.getElementById("btnTambahSubjek");
    

    var txtnovi = document.getElementById("<%= txtnovi.ClientID %>");
    var txtsequ = document.getElementById("<%= txtsequ.ClientID %>");
    var txtlahan = document.getElementById("<%= txtlahan.ClientID %>");
    var txtKet = document.getElementById("<%= txtKet.ClientID %>");
    var ddAksi = document.getElementById("<%= ddAksi.ClientID %>");
    var txtjen = document.getElementById("<%= txtjen.ClientID %>");
    var PopupbtnSaveRek = document.getElementById("<%= PopupbtnSaveRek.ClientID %>");

    var txtKetDoc = document.getElementById("<%= txtKetDoc.ClientID %>");
    var ddDocum = document.getElementById("<%= ddDocum.ClientID %>");
    var BtnDoc = document.getElementById("BtnDoc")

    var ddprs = document.getElementById("<%= ddprs.ClientID %>");
    

    function validasi() {
        if (document.getElementById("<%= cbEksepsi.ClientID %>").checked) {
            eksepsi.value = '1';
        } else {
            eksepsi.value = '0';
        }
    }
  
//    listObLah();
//    listSubLah();
    listDoc();
//    listVerifikasiObj();
//    listVerifikasiSbj();
    listVerifikasiDoc();
    
    terimaURL();

    function terimaURL() {

        var url = window.location.toString();
        //ambil bagian parameternya
        url.match(/\?(.+)$/);
        var params = RegExp.$1;
        // pisahkan parameter URL ke associative array
        var params = '&' + params;

        splitparam(params);
    }


    function splitparam(loader) {

        var a = loader;
        if (a != '0') {
            var b = new Array();
            b = a.split('&');

        }
       // alert(b[2].replace("param1=", ""));

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=V"
			+ "&param1=V"
			+ "&param2=" + b[3].replace("param2=", "")
			+ "";
        // alert(b[3]);
        dhtmlxAjax.post(localURL, s, bindFormVisum);

        var x = b[2].replace("param1=", "");
        //alert(x);

        if (x == 'V') {
            lockVisumView();

        }

        else if (x == 'D') {
            lockVisumDelete();
            btnSave.value = 'Delete';
            hidMode.value = 'D';
        }
        else if (x == 'E') {
            lockVisumEdit();
            btnSave.value = 'Save';
            hidMode.value = 'E';


        }

    }

//    function SearchListObLah(id) {

//        var s = ""
//			+ "rnd=" + Math.random() * 4
//			+ "&sm=L"
//            + "&param1=L"
//            + "&param2=" + txtNoVisum.value
//            + "&param4=21"
//			+ "";
//        listObLah.clearAll();
//        listObLah.loadXML(localURL + "?" + s);
//    }

//    function SearchlistSubLah(id) {

//        var s = ""
//			+ "rnd=" + Math.random() * 4
//			+ "&sm=L"
//            + "&param1=L"
//            + "&param2=" + txtNoVisum.value
//            + "&param4=22"
//			+ "";
//        listSubLah.clearAll();
//        listSubLah.loadXML(localURL + "?" + s);
//    }

    function SearchlistDoc(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=LTK"
            + "&param2=" + txtNoVisum.value
            + "&param4=23"
			+ "";
        //alert(s);
        listDoc.clearAll();
        listDoc.loadXML(localURL + "?" + s);
    }

//    function SearchlistVerifikasiObj(id) {

//        var s = ""
//			+ "rnd=" + Math.random() * 4
//			+ "&sm=L"
//            + "&param1=LR"
//            + "&param2=" + txtNoVisum.value
//            + "&param4=21"
//			+ "";
//        listVerifikasiObj.clearAll();
//        listVerifikasiObj.loadXML(localURL + "?" + s);
//    }

//    function SearchlistVerifikasiSbj(id) {

//        var s = ""
//			+ "rnd=" + Math.random() * 4
//			+ "&sm=L"
//            + "&param1=LR"
//            + "&param2=" + txtNoVisum.value
//            + "&param4=22"
//			+ "";
//        listVerifikasiSbj.clearAll();
//        listVerifikasiSbj.loadXML(localURL + "?" + s);
//    }

    function SearchlistVerifikasiDoc(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=LRK"
            + "&param2=" + txtNoVisum.value
            + "&param4=23"
			+ "";
        listVerifikasiDoc.clearAll();
        listVerifikasiDoc.loadXML(localURL + "?" + s);
    }


    function Hapus(sm, param1, param2, param3) {
        var r = confirm("Delete?");
        if (r == true) {
            var s = ""
                    + "rnd=" + Math.random() * 4
			        + "&sm=CRUDOS"
                    + "&param1=" + param1
                    + "&param2=" + param2
                    + "&param3=" + param3
                    + "";
            dhtmlxAjax.post(localURL, s, outputResponse);
//            SearchListObLah();
//            SearchlistSubLah();
//            SearchlistVerifikasiObj();
//            SearchlistVerifikasiSbj();
            SearchlistVerifikasiDoc();
            SearchlistDoc();
        }
    }


    function btnAdd(objBtn) {
        switch (objBtn.id) {

            case "btnTambahObjek":
                //alert(hidMode.value);
                SaveO(hidMode.value)
                break;

            case "btnTambahSubjek":
                //alert(hidMode.value);
                SaveS(hidMode.value)
                break;
            case "BtnDoc":
                //alert(hidMode.value);
                SaveD(hidMode.value)
                break;
        }
    }

    function btnClick(objBtn) {
        switch (objBtn.value) {

            case "Save":
                if (txtNoVisum.value == '') { alert('No Visum Harus di Assign'); }
                else {
                    Edit(hidMode.value)
                }
                break;

            case "Delete":
                if (txtNoVisum.value == '') { alert('No Visum Harus di Ada'); }
                else {

                    if (objBtn.id == 'btnSave') {
                        if (confirm("Hapus Data Ini?"))
                            Delete(hidMode.value);
                    }
                }
                break;

            case "Cancel":
                close();
                break;

            default:
                break;
        }
    }

    function Delete() {

        var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=D"
                + "&param2=" + txtNoVisum.value
                + "&param3="
                + "&param4=" + txtNoRegistrasi.value
                + "&param5=" + txtPID.value
                + "&param6=" + ddLanjut.value
                + "&param7=" + eksepsi.value
                + "&param8=" + txtKetEks.value
                + "&param9="
                + "&param10="
                + "&param11="
                + "&param12=" + ddprs.value
                + "";
        dhtmlxAjax.post(localURL, s, outputResponse);
    }

    function SaveO(tipe) {
        var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUDOS"
                + "&param1=I"
                + "&param2=" + txtNoVisum.value
                + "&param3="
                + "&param4=21"
                + "&param5=" + ddTemObLah.value
                + "&param6=" + txtOKeterangan.value
                + "&param7=" 
        //alert(s);
        dhtmlxAjax.post(localURL, s, outputResponse);
    }

    function SaveS(tipe) {
        var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUDOS"
                + "&param1=I"
                + "&param2=" + txtNoVisum.value
                + "&param3="
                + "&param4=22"
                + "&param5=" + ddTemSuLah.value
                + "&param6=" + txtKeteranganSubjek.value
                + "&param7="
        //alert(s);
        dhtmlxAjax.post(localURL, s, outputResponse);
    }

    function SaveD(tipe) {
        var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUDOS"
                + "&param1=I"
                + "&param2=" + txtNoVisum.value
                + "&param3="
                + "&param4=23"
                + "&param5=" + ddDocum.value
                + "&param6=" + txtKetDoc.value
                + "&param7=" 
        //alert(s);
        dhtmlxAjax.post(localURL, s, outputResponse);
    }


    function Edit(tipe) {
        var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=" + tipe.replace("param1=", "")
                + "&param2=" + txtNoVisum.value
                + "&param3="
                + "&param4=" + txtNoRegistrasi.value
                + "&param5=" + txtPID.value
                + "&param6=" + ddLanjut.value
                + "&param7=" + eksepsi.value
                + "&param8=" + txtKetEks.value
                + "&param9="
                + "&param10="
                + "&param11="
                + "&param12=" + ddprs.value
                + "";

              
        //alert(s);
        dhtmlxAjax.post(localURL, s, outputResponse);
        //        if (autorisasi.value.indexOf("A") == -1)
        //            btnAdd.disabled = true;
        //        else if (autorisasi.value.indexOf("A") != -1)
        //            btnAdd.disabled = false;
    }

    function bindFormVisum(loader) 
    {
        //alert(loader.xmlDoc.responseText);
        var a = loader.xmlDoc.responseText;
        if (a != '0') {
            var b = new Array();
            b = a.split('|');
            txtNoVisum.value = b[0];
            txtNoRegistrasi.value = b[1];
            txtPID.value = b[2];
            ddLanjut.value = b[3];
            if (b[4] == 1) {
                cbEksepsi.checked = b[4];                
            }

            txtKetEks.value = b[5];
//            ddTemObLah.value = b[3];
//            txtOKeterangan.value = b[4];
//            ddTemSuLah.value = b[5];
//            ddAksi.value = b[6];
//            txtRKeterangan.value = b[7];
//            SearchListObLah();
//            SearchlistSubLah();
//            SearchlistVerifikasiObj();
//            SearchlistVerifikasiSbj();
            SearchlistVerifikasiDoc();
            SearchlistDoc();

        }
    }

    function lockVisumView() 
    {
        txtNoVisum.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtPID.disabled = true;
        ddTemObLah.disabled = true;
        txtOKeterangan.disabled = true;
        ddTemSuLah.disabled = true;
        txtKeteranganSubjek.disabled = true;
        ddAksi.disabled = true;
        
        ddLanjut.disabled = true;
        cbEksepsi.disabled = true;
        txtKetEks.disabled = true;
        ddDocum.disabled = true;
        txtKetDoc.disabled = true;

        document.getElementById('BtnDoc').style.visibility = 'hidden';
        document.getElementById('btnSave').style.visibility = 'hidden';
       
        document.getElementById('btnTambahObjek').style.visibility = 'hidden';
        document.getElementById('btnTambahSubjek').style.visibility = 'hidden';
       
    }

    function lockVisumEdit() {
        txtNoVisum.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtPID.disabled = true;
    }

    function lockVisumDelete() {
        txtNoVisum.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtPID.disabled = true;
        ddTemObLah.disabled = true;
        txtOKeterangan.disabled = true;
        ddTemSuLah.disabled = true;
        txtKeteranganSubjek.disabled = true;
        ddAksi.disabled = true;

        ddLanjut.disabled = true;
        cbEksepsi.disabled = true;
        txtKetEks.disabled = true;
        ddDocum.disabled = true;
        txtKetDoc.disabled = true;

        document.getElementById('BtnDoc').style.visibility = 'hidden';

        document.getElementById('btnTambahObjek').style.visibility = 'hidden';
        document.getElementById('btnTambahSubjek').style.visibility = 'hidden';
    }

//    function onRowSelected1(rowId, cellIndex) {
//        txtnovi.value = txtNoVisum.value;
//        txtsequ.value = listVerifikasiObj.cells(rowId, 5).getValue();
//        txtlahan.value = listVerifikasiObj.cells(rowId, 1).getValue();
//        txtKet.value = listVerifikasiObj.cells(rowId, 3).getValue();
//        txtjen.value = "21";
////      alert('a');
//        $("#dialogrek").dialog("open");

//    }

//    function onRowSelected2(rowId, cellIndex) {
//        txtnovi.value = txtNoVisum.value;
//        txtsequ.value = listVerifikasiSbj.cells(rowId, 5).getValue();
//        txtlahan.value = listVerifikasiSbj.cells(rowId, 1).getValue();
//        txtKet.value = listVerifikasiSbj.cells(rowId, 3).getValue();
//        txtjen.value = "22";
//        //      alert('a');
//        $("#dialogrek").dialog("open");

//    }

    function onRowSelected3(rowId, cellIndex) {
        txtnovi.value = txtNoVisum.value;
        txtsequ.value = listVerifikasiDoc.cells(rowId, 5).getValue();
        txtlahan.value = listVerifikasiDoc.cells(rowId, 1).getValue();
        txtKet.value = listVerifikasiDoc.cells(rowId, 3).getValue();
        txtjen.value = "23";
        //      alert('a');
        $("#dialogrek").dialog("open");

    }

    $(function () {
        $("#dialogrek").dialog
        ({
            autoOpen: false,
            width: 610,
            height: 320,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogrek").dialog("close");
        });
    });

    function SaveKondisiRek() {
        var s = ""
                  + "rnd=" + Math.random() * 4
                  + "&sm=CRUDOS"
                  + "&param1=IR"
                  + "&param2=" + txtnovi.value
                  + "&param3=" + txtsequ.value
                  + "&param4=" + txtjen.value
                  + "&param5=" 
                  + "&param6=" 
                  + "&param7=" + ddAksi.value
                  + "&param8=" + txtKet.value
                  + "";
        dhtmlxAjax.post(localURL, s);
        alert("Data Berhasil Disimpan")
       // alert(s);
//        SearchlistVerifikasiObj();
//        SearchlistVerifikasiSbj();
        SearchlistVerifikasiDoc();
        $("#dialogrek").dialog("close");
    }



//    function listVerifikasiObj() {
//        listVerifikasiObj = new dhtmlXGridObject('gridVerifikasiObj');
//        listVerifikasiObj.setImagePath("../JavaScript/codebase/imgs/");
//        listVerifikasiObj.setHeader("No,Kepastian Objek Lahan,Keterangan,Rekomendasi,Aksi,Squen");
//        listVerifikasiObj.setInitWidths("40,180,135,135,100,0");
//        listVerifikasiObj.setColAlign("left,left,left,left,left,left");
//        listVerifikasiObj.setColTypes("ro,ro,ro,ro,ro,ro");
//        listVerifikasiObj.init();
//        listVerifikasiObj.setSkin("dhx_skyblue");
//        listVerifikasiObj.attachEvent("onRowSelect", onRowSelected1);
//        listVerifikasiObj.setPagingSkin("bricks");
//        listVerifikasiObj.setColSorting("str,str,str,str,str,str");
//    }

//    function listVerifikasiSbj() {
//        listVerifikasiSbj = new dhtmlXGridObject('gridVerifikasiSbj');
//        listVerifikasiSbj.setImagePath("../JavaScript/codebase/imgs/");
//        listVerifikasiSbj.setHeader("No,Kepastian Subjek Lahan,Keterangan,Rekomendasi,Aksi,Squen");
//        listVerifikasiSbj.setInitWidths("40,180,135,135,100,0");
//        listVerifikasiSbj.setColAlign("left,left,left,left,left,left");
//        listVerifikasiSbj.setColTypes("ro,ro,ro,ro,ro,ro");
//        listVerifikasiSbj.init();
//        listVerifikasiSbj.setSkin("dhx_skyblue");
//        listVerifikasiSbj.attachEvent("onRowSelect", onRowSelected2);
//        listVerifikasiSbj.setPagingSkin("bricks");
//        listVerifikasiSbj.setColSorting("str,str,str,str,str,str");
//    }

    function listVerifikasiDoc() {
        listVerifikasiDoc = new dhtmlXGridObject('gridVerifikasiDoc');
        listVerifikasiDoc.setImagePath("../JavaScript/codebase/imgs/");
        listVerifikasiDoc.setHeader("No,Kepastian Keseluruhan,Keterangan,Rekomendasi,Aksi,Squen");
        listVerifikasiDoc.setInitWidths("40,200,300,300,100,0");
        listVerifikasiDoc.setColAlign("left,left,left,left,left,left");
        listVerifikasiDoc.setColTypes("ro,ro,ro,ro,ro,ro");
        listVerifikasiDoc.init();
        listVerifikasiDoc.setSkin("dhx_skyblue");
        listVerifikasiDoc.attachEvent("onRowSelect", onRowSelected3);
        listVerifikasiDoc.setPagingSkin("bricks");
        listVerifikasiDoc.setColSorting("str,str,str,str,str,str");
    }


//    function listObLah() {
//        listObLah = new dhtmlXGridObject('gridObLah');
//        listObLah.setImagePath("../JavaScript/codebase/imgs/");
//        listObLah.setHeader("No,Temuan Object ,Keterangan,Hapus");
//        listObLah.setInitWidths("40,400,400,100");
//        listObLah.setColAlign("left,left,left,left");
//        listObLah.setColTypes("ro,ro,ro,link");
//        listObLah.init();
//        listObLah.setSkin("dhx_skyblue");
//        listObLah.setPagingSkin("bricks");
//        listObLah.setColSorting("str,str,str,str");
//    }

//    function listSubLah() {
//        listSubLah = new dhtmlXGridObject('gridSubLah');
//        listSubLah.setImagePath("../JavaScript/codebase/imgs/");
//        listSubLah.setHeader("No,Temuan Subject ,Keterangan,Hapus");
//        listSubLah.setInitWidths("40,400,400,100");
//        listSubLah.setColAlign("left,left,left,left");
//        listSubLah.setColTypes("ro,ro,ro,link");
//        listSubLah.init();
//        listSubLah.setSkin("dhx_skyblue");
//        listSubLah.setPagingSkin("bricks");
//        listSubLah.setColSorting("str,str,str,str");
//    }

    function listDoc() {
        listDoc = new dhtmlXGridObject('gridDoc');
        listDoc.setImagePath("../JavaScript/codebase/imgs/");
        listDoc.setHeader("No,Temuan Keseluruhan ,Keterangan,Hapus");
        listDoc.setInitWidths("40,200,600,100");
        listDoc.setColAlign("left,left,left,left");
        listDoc.setColTypes("ed,ed,ed,link");
        listDoc.init();
        listDoc.setSkin("dhx_skyblue");
        listDoc.setPagingSkin("bricks");
        listDoc.setColSorting("str,str,str,str");
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
                //window.location.replace(newUrl);
                close();
                break;
            case "nodelete":
                alert("Data Visum Tidak Dapat Di Hapus Karena Sudah Dilakukan Pemberkasan");
                //window.location.replace(newUrl);
                close();
                break;
            case "noedit":
                alert("Data Visum Tidak Dapat Di Edit Karena Sudah Dilakukan Pemberkasan");
                //window.location.replace(newUrl);
                close();
                break;
            case "noadd":
                alert("Data Visum Tidak Dapat Di Assign Karena Sudah Dilakukan Pemberkasan");
                //window.location.replace(newUrl);
                close();
                break;
            case "gagal":
                alert("Data Visum Gagal Disimpan");
                //window.location.replace(newUrl);
                close();
                break;
            case "I":
//                SearchlistVerifikasiObj();
//                SearchlistVerifikasiSbj();
                SearchlistVerifikasiDoc();
//                SearchListObLah();
//                SearchlistSubLah();
                SearchlistDoc();
                alert("Data Berhasil Di Disimpan");
                break;
            case "DO":
//                SearchlistVerifikasiObj();
//                SearchlistVerifikasiSbj();
                SearchlistVerifikasiDoc();
//                SearchListObLah();
//                SearchlistSubLah();
                SearchlistDoc();
                alert("Data Berhasil Di Delete");

                break;
            default:
                break;
        }
        //        fillGrid();
        //        fillGrid2();
        //        lock();
        //        clear();
        //        lockTeknik();
        //        clearTeknik();
    }
        </script>

</asp:Content>

