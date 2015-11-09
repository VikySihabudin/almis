<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="PraRegistrasiForm.aspx.cs" Inherits="Pages_PraRegistrasiForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<input type="hidden" id="hidMode" value="I" />



<h2>Pra Registrasi</h2><br />
    <h4>Identifikasi identitas diri penjual :</h4>
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
            <label for="identitas" class="control-label col-md-2">Nomor PraRegistrasi</label>
            <div class="col-md-3">
                
                <asp:TextBox id="txtPraRegistrasi" type="text" runat="server" class="form-control input-md" placeholder= "..."  />
               
            </div>

        </div>
    </div>



    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Identitas</label>
            <div class="col-md-3">
                
                <asp:TextBox id="txtNoIdentitas" type="text"  runat="server" class="form-control input-md" placeholder= "..."  />
               
            </div>
			<div class="col-md-3">
                     <input type="button" id="btnCari" value="Cari"  class="btn btn-md btn-success" onclick="lookupIdentitas(1)" />  
            </div>
        </div>
    </div>

    <hr>
	
	<br />

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nama</label>
            <div class="col-md-3"><asp:TextBox id="txtNama" type="text" runat="server" class="form-control input-md" placeholder= "..." ></asp:TextBox></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Jenis Kelamin</label>
            <div class="col-md-3">
            <asp:DropDownList id="ddJenisKelamin" runat="server" class="form-control input-md"></asp:DropDownList></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Tempat Tanggal Lahir</label>
            <div class="col-md-3"><asp:TextBox id="txtTempatLahir" type="text" runat="server" placeholder= "..." class="form-control input-md" /></div>
            <div class="col-md-3"><asp:TextBox id="txtTglLahir" type="text" runat="server" placeholder= "..." class="form-control input-md" /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Pekerjaan</label>
            <div class="col-md-3"><asp:DropDownList ID="ddPekerjaan" runat="server" class="form-control input-md"></asp:DropDownList></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Alamat</label>
            <div class="col-md-3"><asp:TextBox id="txtAlamat" TextMode="multiline" Columns="15" Rows="3" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor HP</label>
            <div class="col-md-3"><asp:TextBox id="txtNoHandphone" type="text" runat="server" class="form-control input-md" placeholder= "..."></asp:TextBox></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Tanda Identitas yang Berlaku</label>
            <div class="col-md-3"><asp:DropDownList ID="ddTandaIdentitas" runat="server" class="form-control input-md"></asp:DropDownList></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Lokasi Tanah</label>
            <div class="col-md-3">
                <asp:DropDownList ID="ddKabupaten" type="text" runat="server" class="form-control input-md" onchange="changeKabupaten(this.value)"></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddKecamatan" runat="server" class="form-control input-md" onchange="changeKecamatan(this.value)"></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddDesa" runat="server" class="form-control input-md"></asp:DropDownList>
            </div>
        </div>
    </div>

<%if (lanjut.ToString() != "1" || groups.ToString() != "1")
{ %> 
<div class="hidden">
<%}%>

        <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label ID="LLanjut" for="identitas"  class="control-label col-md-2" runat="server" Text="Lanjut" Font-Bold="True"></asp:Label>
            <div class="col-md-3">
                <asp:DropDownList ID="ddLanjut" runat="server" class="form-control input-md">
                </asp:DropDownList>
            </div>
        </div>
        </div>
<%if (lanjut.ToString() != "1" || groups.ToString() != "1")
{ %> 
</div>
<%}%>

    <br /><hr />

    <div class="form-group">
            <div class="col-md-10">
       
                     <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default"  onclick="btnClick(this)" PostBackUrl="~/Pages/PraRegistrasiForm.aspx"/> 
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


   

    var localURL = "PraregistrasiForm.aspx";
    var newUrl = "PraregistrasiList.aspx";
    var txtPraRegistrasi = document.getElementById("<%= txtPraRegistrasi.ClientID %>");
    var txtNoIdentitas = document.getElementById("<%= txtNoIdentitas.ClientID %>");
    var txtNama = document.getElementById("<%= txtNama.ClientID %>");
    var ddJenisKelamin = document.getElementById("<%= ddJenisKelamin.ClientID %>");
    var txtTempatLahir = document.getElementById("<%= txtTempatLahir.ClientID %>");
    var txtTglLahir = document.getElementById("<%= txtTglLahir.ClientID %>");
    var ddPekerjaan = document.getElementById("<%= ddPekerjaan.ClientID %>");
    var txtAlamat = document.getElementById("<%= txtAlamat.ClientID %>");
    var txtNoHandphone = document.getElementById("<%= txtNoHandphone.ClientID %>");
    var ddTandaIdentitas = document.getElementById("<%= ddTandaIdentitas.ClientID %>");
    var ddKabupaten = document.getElementById("<%= ddKabupaten.ClientID %>");
    var ddKecamatan = document.getElementById("<%= ddKecamatan.ClientID %>");
    var ddDesa = document.getElementById("<%= ddDesa.ClientID %>");
    var ddLanjut = document.getElementById("<%= ddLanjut.ClientID %>");
    var btnDelete = document.getElementById("btnDelete");
    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");
    var btnCari = document.getElementById("btnCari");
    var hidMode = document.getElementById('hidMode');
    var ddprs = document.getElementById("<%= ddprs.ClientID %>");
    

    terimaURL();
    lockPraregistrasiInsert();
        
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
			    + "&sm=select"
			    + "&param1=V"
                + "&param2=" + b[3].replace("param2=", "")
			    + "";
            //alert(s);
            dhtmlxAjax.post(localURL, s, bindFormPraregistrasi);

            var x = b[2].replace("param1=", "");

            if (x == 'V') {

                lockPraregistrasiView();
                hidMode.value = 'I';
            }

            else if (x == 'D') {
                lockPraregistrasiDelete();
                btnSave.value = 'Delete';
                hidMode.value = 'D';

            }
            else if (x == 'E') {
                
                lockPraregistrasiEdit();
                btnSave.value = 'Save';
                hidMode.value = 'E';
                txtPraRegistrasi.disabled = true;
                txtNoIdentitas.disabled = true;


            }

        }
    }




$(function txtTglLahir() {
    $("[id$=txtTglLahir]").datepicker({
        dateFormat: "yy-mm-dd",
        buttonImageOnly: true,
        changeYear: true,
        changeMonth: true,
        yearRange: "1900:2100"
    });
});

    function btnClick(objBtn) {
        switch (objBtn.value) {
            case "Save":
                //alert(hidMode.value);
                CRUD(hidMode.value);
                break;

            case "Delete":
                if (objBtn.id == 'btnSave') {
                    if (confirm("Hapus Data Ini?"))
                        CRUD(hidMode.value);
//                    alert('del');
                }
                break;

            case "Cancel":
                close();
                window.location.replace(newUrl);
                 break;

            case "Cari":
                if (objBtn.id == 'btnCari') {
                    searchlistAMR();

                }
                break;

            default:
                break;
        }
    }


    function CRUD(tipe) {

        if (txtNoIdentitas.value != '') {
            var s = ""
                    + "rnd=" + Math.random() * 4
			        + "&sm=CRUD"
                    + "&param1=" + hidMode.value
                    + "&param2=" + txtPraRegistrasi.value
                    + "&param3=" 
                    + "&param4=" + txtNoIdentitas.value
                    + "&param5=" + ddKabupaten.value
                    + "&param6=" + ddKecamatan.value
                    + "&param7=" + ddDesa.value
                    + "&param8=" + ddLanjut.value
                    + "&param9="
                    + "&param10="
                    + "&param11=" + ddprs.value
                    + "";

            dhtmlxAjax.post(localURL, s, outputResponse);
        }
        else {alert('Data Identitas Harus diisi');}
    }



    function bindFormPraregistrasi(loader) {
        //alert(loader.xmlDoc.responseText);
        var a = loader.xmlDoc.responseText;
//        lockPraregistrasi();
        if (a != '0') {
            var b = new Array();
            b = a.split('|');

//            alert(b[12]);

            txtPraRegistrasi.value = b[0];
            txtNoIdentitas.value = b[1];
            txtNama.value = b[2];
            ddJenisKelamin.value = b[3];
            txtTempatLahir.value = b[4];
            txtTglLahir.value = b[5];
            ddPekerjaan.value = b[6];
            txtAlamat.value = b[7];
            txtNoHandphone.value = b[8];
            ddTandaIdentitas.value = b[9];
            ddKabupaten.value = b[10];
            ddKecamatan.value = b[11];
            document.getElementById("<%= ddDesa.ClientID %>").value = b[12];
            //ddDesa.value = b[12];
            ddLanjut.value = b[13];
            ddprs.value = b[14];
        }
    }

    function lockPraregistrasiInsert() {
        txtPraRegistrasi.disabled = true;
        txtNoIdentitas.disabled = true;
        txtNama.disabled = true;
        ddJenisKelamin.disabled = true;
        txtTempatLahir.disabled = true;
        txtTglLahir.disabled = true;
        ddPekerjaan.disabled = true;
        txtAlamat.disabled = true;
        txtNoHandphone.disabled = true;
        ddTandaIdentitas.disabled = true;

    }


    function lockPraregistrasiView() {
        txtPraRegistrasi.disabled = true;
        txtNoIdentitas.disabled = true;
        txtNama.disabled = true;
        ddJenisKelamin.disabled = true;
        txtTempatLahir.disabled = true;
        txtTglLahir.disabled = true;
        ddPekerjaan.disabled = true;
        txtAlamat.disabled = true;
        txtNoHandphone.disabled = true;
        ddTandaIdentitas.disabled = true;
        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;
        ddLanjut.disabled = true;
        ddprs.disabled = true;
        document.getElementById('btnSave').style.visibility = 'hidden';
        document.getElementById('btnCari').style.visibility = 'hidden';

    }

    function lockPraregistrasiEdit() {
        txtPraRegistrasi.disabled = true;
        txtNoIdentitas.disabled = true;
        document.getElementById('btnCari').style.visibility = 'hidden';
        //txtNoRegistrasi.disabled = true;
//        txtPID.disabled = true;
    }

    function lockPraregistrasiDelete() {
        txtPraRegistrasi.disabled = true;
        txtNoIdentitas.disabled = true;
        txtNama.disabled = true;
        ddJenisKelamin.disabled = true;
        txtTempatLahir.disabled = true;
        txtTglLahir.disabled = true;
        ddPekerjaan.disabled = true;
        txtAlamat.disabled = true;
        txtNoHandphone.disabled = true;
        ddTandaIdentitas.disabled = true;
        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;
        ddLanjut.disabled = true;
        ddprs.disabled = true;
        document.getElementById('btnCari').style.visibility = 'hidden';
    }
    
    function outputResponse(loader) {

        var a = loader.xmlDoc.responseText;
        if (a != '') {
            var b = new Array();
            b = a.split('|');
        }
        switch (b[0]) {
            case "E":
                alert("Data Berhasil di Edit");
                //window.location.replace(newUrl);
                close();
                break;
            case "I":
                alert("Data Berhasil di Input");
                //window.location.replace(newUrl);
                close();
                break;
            case "D":
                alert("Data Berhasil di Delete");
                //window.location.replace(newUrl);
                close();
                break;
            case "nodelete":
                alert("Data Pra Registrasi Tidak Dapat Dihapus Karena Sudah Dilalukan Pengecekan Lapangan");
                break;
            case "noedit":
                alert("Data Pra Registrasi Tidak Dapat Di Edit Karena Sudah Dilalukan Pengecekan Lapangan");
                break;
            case "notam":
                alert("Data Tidak Bisa Di Tambah");
                break;
            case "gagal":
                alert("Data Gagal Disimpan");
                break;
            default:
                break;
        }

    }


    var ajaxRequest;
    function getAjax() //memeriksa apakah web browser mendukun AJAX
    {
        try {
            // Opera 8.0+, Firefox, Safari
            ajaxRequest = new XMLHttpRequest();
        }
        catch (e) {
            // Internet Explorer Browsers
            try {
                ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
            }
            catch (e) {
                try {
                    ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
                }
                catch (e) {
                    // Something went wrong
                    alert("Your browser broke!");
                    return false;
                }
            }
        }
    }

    function validasi(keyEvent) //Untuk Mendapatkan Nilai Dari inputan yang dimasukkan
    {
        keyEvent = (keyEvent) ? keyEvent : window.event;
        input = (keyEvent.target) ? keyEvent.target : keyEvent.srcElement;

        if (keyEvent.type == "keyup") {
            var targetDiv = document.getElementById("hasil");
            targetDiv.innerHTML = "<div></div>";
            if (input.value) {
                getData("PraregistrasiForm.aspx?&sm=validasi&param1=" + txtNoIdentitas.value);

            }
        }
    }

    function bukaInfo(id) //membuka link dari hasil pencarian
    {
        ajaxRequest.open("GET", "PraregistrasiForm.aspx??&sm=validasi&param1=" + txtNoIdentitas.value);
        ajaxRequest.onreadystatechange =
		function () {
		    var targetDiv = document.getElementById("info");
		    targetDiv.innerHTML = ajaxRequest.responseText;
		}
        ajaxRequest.send(null);
    }

    function getData(dataSource) //menampilkan kemungkinan hasil nama barang yang diinput
    {
        getAjax();
        if (ajaxRequest) {
            ajaxRequest.open("GET", dataSource);
            ajaxRequest.onreadystatechange =
			function () {
			    if (ajaxRequest.readyState == 4 && ajaxRequest.status == 200) {
			        var targetDiv = document.getElementById("hasil");
			        targetDiv.innerHTML = ajaxRequest.responseText;
			    }
			}
            ajaxRequest.send(null);
        }
    }

    function changeKabupaten(obj) {
        var ji = 0;
        for (var j = document.getElementById("<%= ddKecamatan.ClientID %>").length; j >= 0; j--) {   // alert(j);
            document.getElementById("<%= ddKecamatan.ClientID %>").remove(j);
            ji++;
        }


        var ji = 0;
        for (var j = document.getElementById("<%= ddDesa.ClientID %>").length; j >= 0; j--) {    //alert(j);
            document.getElementById("<%= ddDesa.ClientID %>").remove(j);
            ji++;
        }

        var s = ""
			        + "rnd=" + Math.random() * 4
			        + "&sm=dd"
			        + "&param1=2"
			        + "&param2=" + obj
			        + "";
        //	alert(localURL+"?"+s);
        dhtmlxAjax.post(localURL, s, outputResponseKabupaten);
    }

    function outputResponseKabupaten(loader) {
        var a = loader.xmlDoc.responseText;
        if (a != '0') {
            var b = new Array();
            var len;
            b = a.split('*');

            for (var i = 0; i < b.length - 1; i++) {
//                alert(b[i]);
                len = b[i].indexOf('|');
//                alert(len);
//                alert(b[i].substring(0, len));
//                alert(b[i].substring(len + 1, len + 4));

                var opt = document.createElement("option");
                document.getElementById("<%= ddKecamatan.ClientID %>").options.add(opt);
                opt.text = b[i].substring(0, len);
                opt.value = b[i].substring(len + 1, len + 4);

            }

        } 
    }

    function changeKecamatan(obj) {
        var ji = 0;
        for (var j = document.getElementById("<%= ddDesa.ClientID %>").length; j >= 0; j--) {   // alert(j);
            document.getElementById("<%= ddDesa.ClientID %>").remove(j);
            ji++;
        }

        var s = ""
			        + "rnd=" + Math.random() * 4
			        + "&sm=dd"
			        + "&param1=3"
			        + "&param2=" + obj
			        + "";
        //	alert(localURL+"?"+s);
        dhtmlxAjax.post(localURL, s, outputResponseKecamatan);
    }

    function outputResponseKecamatan(loader) {
        var a = loader.xmlDoc.responseText;
        if (a != '0') {
            var b = new Array();
            var len;
            b = a.split('*');

            for (var i = 0; i < b.length - 1; i++) {
                //                alert(b[i]);
                len = b[i].indexOf('|');
                //                alert(len);
                //                alert(b[i].substring(0, len));
                //                alert(b[i].substring(len + 1, len + 4));

                var opt = document.createElement("option");
                document.getElementById("<%= ddDesa.ClientID %>").options.add(opt);
                opt.text = b[i].substring(0, len);
                opt.value = b[i].substring(len + 1, len + 4);

            }

        }
    }

    function runScript(e) {
        if (e.keyCode == 13) {
            var tb = document.getElementById("txtNoIdentitas");
            //searchlistAMR();
            return false;
        }
    }

    function lookupIdentitas(jns) {
        var targets = txtNoIdentitas.id + ',' + txtNama.id + ',' + ddJenisKelamin.id + ',' + txtTempatLahir.id + ',' + txtTglLahir.id + ',' + ddPekerjaan.id + ',' + txtAlamat.id + ',' + txtNoHandphone.id + ',' + ddTandaIdentitas.id + ',';
        var params = txtNoIdentitas.value + ',';

        lookupOpen(jns, params, targets, '');
    }

    
</script>

</asp:Content>

