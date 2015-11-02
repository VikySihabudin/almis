<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="PembayaranForm.aspx.cs" Inherits="Pages_PembayaranForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<input type="hidden" id="hidMode" value="0" />
<input type="hidden" id="eksepsi" value="0" />
<input type="hidden" id="txtPerusahaan" value="0" />


    <h2>Approval Pembayaran</h2>
        <hr class="style-four"></hr>

            <form role="form" class="form-horizontal">
                <div class="form-group">
                    <label for="identitas" class="control-label col-md-2">
                    No Pembayaran
                    </label>
                    <div class="col-md-3">
                    <input id="txtNoPembayaran" type="text" class="form-control input-md" runat="server" placeholder= "..."  />
                    </div>

                    <label for="identitas" class="control-label col-md-2">
                    Tanggal Approval Section Head
                    </label>
                    <div class="col-md-3">
                    <input id="txtTglAppSectionHead" type="text" runat="server" class="form-control input-md"  />
                    </div>
                </div>
            </form>

            
            <form role="form" class="form-horizontal">
                <div class="form-group">
                    <label for="identitas" class="control-label col-md-2">
                    No Registrasi
                    </label>
                    <div class="col-md-3">
                    <input id="txtNoRegistrasi" type="text" class="form-control input-md" runat="server" placeholder= "..."  />
                    </div>

                    <label for="identitas" class="control-label col-md-2">
                    Tanggal Approval Manager
                    </label>
                    <div class="col-md-3">
                    <input id="txtTglAppManager" type="text" runat="server" class="form-control input-md"  />
                    </div>
                </div>
            </form>
            

            <form role="form" class="form-horizontal">
                <div class="form-group">
                    <label for="identitas" class="control-label col-md-2">
                    PID
                    </label>
                    <div class="col-md-3">
                    <input id="txtPID" type="text" class="form-control input-md" runat="server" placeholder= "..."  />
                    </div>

                    <label for="identitas" class="control-label col-md-2">
                    Tanggal Diterima Survey
                    </label>
                    <div class="col-md-3">
                    <input id="txtTglDiterimaSurvey" type="text" runat="server" class="form-control input-md"  />
                    </div>
                </div>
            </form>

            <form role="form" class="form-horizontal">
                <div class="form-group">
                    <label for="identitas" class="control-label col-md-2">
                    No Negosiasi
                    </label>
                    <div class="col-md-3">
                    <input id="txtNoNegosiasi" type="text" class="form-control input-md" runat="server" placeholder= "..."  />
                    </div>

                    <label for="identitas" class="control-label col-md-2">
                    Tanggal Approval GM Eksternal
                    </label>
                    <div class="col-md-3">
                    <input id="txtTglAppGMEksternal" type="text" runat="server" class="form-control input-md"  />
                    </div>
                </div>
            </form>

            <form role="form" class="form-horizontal">
                <div class="form-group">
                    <label for="identitas" class="control-label col-md-2">
                    No Visum
                    </label>
                    <div class="col-md-3">
                    <input id="txtNoVisum" type="text" class="form-control input-md" runat="server" placeholder= "..."  />
                    </div>

                    <label for="identitas" class="control-label col-md-2">
                    Tanggal Approval BOD
                    </label>
                    <div class="col-md-3">
                    <input id="txtTglAppBOD" type="text" runat="server" class="form-control input-md"  />
                    </div>
                </div>
            </form>

            <form role="form" class="form-horizontal">
                <div class="form-group">
                    <label for="identitas" class="control-label col-md-2">
                    No Pemberkasan
                    </label>
                    <div class="col-md-3">
                    <input id="txtNoPemberkasan" type="text" class="form-control input-md" runat="server" placeholder= "..."  />
                    </div>

                    <label for="identitas" class="control-label col-md-2">
                    Tanggal Diterima Akunting
                    </label>
                    <div class="col-md-3">
                    <input id="txtTglAppDiterimaAccounting" type="text" runat="server" class="form-control input-md"  />
                    </div>
                </div>
            </form>


            <form role="form" class="form-horizontal">
                <div class="form-group">
                    <label for="identitas" class="control-label col-md-2">
                    Pengembalian Berkas
                    </label>
                    <div class="col-md-3">
                    <asp:DropDownList ID="ddBerkas" runat="server" class="form-control input-md">
                     </asp:DropDownList>
                    </div>
                
                    <label for="identitas" class="control-label col-md-2">
                    Jumlah Pembayaran
                    </label>
                    <div class="col-md-3">
                    <input id="txtJumlahp" type="text" runat="server" class="form-control input-md"  onkeypress="return numbersonly(event, false)"/>
                    </div>                
                </div>
            </form>
            <hr />

            <form role="form" class="form-horizontal">
                <div class="form-group">
                    <label for="identitas" class="control-label col-md-2">
                    Nama Perusahaan
                    </label>
                    <div class="col-md-3">
                    <asp:TextBox id="txtNamaPerusahaan" type="text" onkeypress="return runScript(event)" runat="server" class="form-control input-md" placeholder= "..."  />
                    <%--<input id="txtPerusahaan" type="text" class="form-control input-md" runat="server" placeholder= "..."  />--%>
                    </div>
                    <div class="col-md-3">
                    <%--<input type="button" id="btnCari" value="Cari" class="btn btn-info btn-md" />--%>
                        <input type="button" id="btnCari" value="Cari"  class="btn btn-md btn-primary" onclick="lookupIdentitas(2)" />
                    </div>

                                        
        <div class="col-md-3">
            <input type="button" onclick="PopupAmbilFoto()" id="Button3" value="Ambil Foto" class="btn btn-info btn-md" />
                
        </div>
                 </div>

            </form>

    <%if (groups.ToString() != "1")
    { %>        
            <%if (lanjut.ToString() != "1")
            { %> 
            <div class="hidden">
            <%}%>

    <%}%>

            <form role="form" class="form-horizontal">
                <div class="form-group">
                    <asp:Label ID="LLanjut" for="identitas"  class="control-label col-md-2" runat="server" Text="Lanjut" Font-Bold="True"></asp:Label>
                    <div class="col-md-3">
                     <asp:DropDownList ID="ddLanjut" runat="server" class="form-control input-md">
                     </asp:DropDownList>
                    </div>
                </div>
            </form>

    <%if (groups.ToString() != "1")
    { %>        
            <%if (lanjut.ToString() != "1")
            { %> 
            </div>
            <%}%>

    <%}%>

            <form role="form" class="form-horizontal">
            <div class="form-group">
             <label for="identitas" class="control-label col-md-2">
                    Keterangan
                    </label>
                    <div class="col-md-3">
                    <asp:TextBox id="txtKeterangan" TextMode="multiline" Columns="15" Rows="3" runat="server" class="form-control input-md" placeholder= "..."  />
                    </div>
            </div>
            </form>

    <%if (groups.ToString() != "1")
    { %>        
            <%if (except.ToString() != "1")
            { %> 
            <div class="hidden">
            <%}%>

    <%}%>

            <form role="form" class="form-horizontal">
                <div class="form-group">
                    <asp:Label ID="LEksepsi" for="identitas"  class="control-label col-md-2" runat="server" Text="Eksepsi" Font-Bold="True"></asp:Label>
                    
                    <div class="col-md-3">
                    <asp:CheckBox ID="chkEksepsi" runat="server" CssClass="form-control checkbox-md"  onclick="validasi()"/>
                    </div>
                
                    <asp:Label ID="LKEksepsi" for="identitas"  class="control-label col-md-2" runat="server" Text="Keterangan Eksepsi" Font-Bold="True"></asp:Label>
                    <div class="col-md-3">
                    <asp:TextBox id="txtKetEks" TextMode="multiline" Columns="15" Rows="3" runat="server" class="form-control input-md" placeholder= "..."  />
                    </div>
                </div>
            </form>

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



   <div id="dialog3" title="Ambil Foto" style="font-size:small;">
        <div role="form" class="form-horizontal" action="#">

            <%--////////--%>


          
        <%--<form id="form1" runat="server">--%>
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center">
                    <u>Live Camera</u>
                </td>
                <td>
                </td>
                <td align="center">
                    <u>Captured Picture</u>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="webcam">
                    </div>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Image ID="imgCapture" runat="server" Style="visibility: hidden; width: 320px;
                        height: 240px" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnCapture" Text="Capture" runat="server" class="btn btn-md btn-success" OnClientClick="return Capture();" />
        <br />
        <span id="camStatus"></span>

            <%--////////--%>

        </div>
    </div>

<%--    <script src="../Css/bootstrap/js/1.6/jquery.min.js" type="text/javascript"></script>
    <link href="../Css/bootstrap/js/1.8/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Css/bootstrap/js/1.8/jquery-ui.min.js" type="text/javascript"></script>
        <script src="../JavaScript/jquery.min.js" type="text/javascript"></script>
    <script src="../JavaScript/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>--%>


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

    var localURL = "PembayaranForm.aspx";
    var newUrl = "PembayaranList.aspx";
    var txtNoPembayaran = document.getElementById("<%= txtNoPembayaran.ClientID %>");
    var txtNoRegistrasi = document.getElementById("<%= txtNoRegistrasi.ClientID %>");                                   
    var txtPID = document.getElementById("<%= txtPID.ClientID %>");
    var txtNoNegosiasi = document.getElementById("<%= txtNoNegosiasi.ClientID %>");
    var txtNoVisum = document.getElementById("<%= txtNoVisum.ClientID %>");
    var txtNoPemberkasan = document.getElementById("<%= txtNoPemberkasan.ClientID %>");
    var ddBerkas = document.getElementById("<%= ddBerkas.ClientID %>");
    var txtTglAppSectionHead = document.getElementById("<%= txtTglAppSectionHead.ClientID %>");
    var txtTglAppManager = document.getElementById("<%= txtTglAppManager.ClientID %>");
    var txtTglDiterimaSurvey = document.getElementById("<%= txtTglDiterimaSurvey.ClientID %>");
    var txtTglAppGMEksternal = document.getElementById("<%= txtTglAppGMEksternal.ClientID %>");
    var txtTglAppBOD = document.getElementById("<%= txtTglAppBOD.ClientID %>");
    var txtTglAppDiterimaAccounting = document.getElementById("<%= txtTglAppDiterimaAccounting.ClientID %>");
    var txtjumlahp = document.getElementById("<%= txtJumlahp.ClientID %>");
    var ddLanjut = document.getElementById("<%= ddLanjut.ClientID %>");
    var txtKeterangan = document.getElementById("<%= txtKeterangan.ClientID %>");
    var chkEksepsi = document.getElementById("<%= chkEksepsi.ClientID %>").checked;

    var txtKetEks = document.getElementById("<%= txtKetEks.ClientID %>");
    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");
    var btnDelete = document.getElementById("btnDelete");
    var btnCari = document.getElementById("btnCari");
    var hidMode = document.getElementById('hidMode');
    var txtNamaPerusahaan = document.getElementById("<%= txtNamaPerusahaan.ClientID %>");

    function validasi() {
        if (document.getElementById("<%= chkEksepsi.ClientID %>").checked) {
            eksepsi.value = '1';
        } else {
            eksepsi.value = '0';
        }
    }




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
        dhtmlxAjax.post(localURL, s, bindFormPembayaran);

        var x = b[2].replace("param1=", "");
        //alert(x);

        if (x == 'V') {
            lockPembayaranView();

        }

        else if (x == 'D') {
            lockPembayaranDelete();
            btnSave.value = 'Delete';
            hidMode.value = 'D';
        }
        else if (x == 'E') {
        lockPembayaranEdit();
            btnSave.value = 'Save';
            hidMode.value = 'E';


        }

    }
    function btnClick(objBtn) {
        switch (objBtn.value) {
            case "Save":
                if (txtNoPembayaran.value == '') { alert('No Pembayaran Harus di Assign'); }
                else {
                    Edit(hidMode.value)
                }
                break;

            case "Delete":
                if (txtNoPembayaran.value == '') { alert('No Pembayaran Harus Terisi'); }
                else {
                    if (objBtn.id == 'btnSave') {
                        if (confirm("Hapus Data Ini?"))
                            Delete(hidMode.value);
                    }
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

//    function validasi(keyEvent) //untuk mendapatkan nilai dari inputan yang dimasukkan
//    {
//        keyEvent = (keyEvent) ? keyEvent : window.event;
//        input = (keyEvent.target) ? keyEvent.target : keyEvent.srcElement;

//        if (keyEvent.type == "keyup") {
//            var targetDiv = document.getElementById("hasil");
//            targetDiv.innerHTML = "<div></div>";
//            if (input.value) {
//                getData("PembayaranForm.aspx?&sm=validasi&param1=" + txtPerusahaan.value);

//            }
//        }
//    }

    function bukaInfo(id) //membuka link dari hasil pencarian
    {
        ajaxRequest.open("GET", "PembayaranForm.aspx??&sm=validasi&param1=" + txtPerusahaan.value);
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



    function lookupIdentitas(jns) {
        var targets = txtPerusahaan.id + ',' + txtNamaPerusahaan.id + ',';
        var params = txtPerusahaan.value + ',';

        lookupOpen(jns, params, targets, '');
    
        
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
			+ "&sm=CRUD"
		    + "&param1=D"
            + "&param2=" + txtNoPembayaran.value
            + "&param3=" 
			+ "";

        // alert(s);
        dhtmlxAjax.post(localURL, s, outputResponse);

    }


    function Edit(tipe) {
        var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=" + tipe.replace("param1=", "")
                + "&param2=" + txtNoPembayaran.value
                + "&param3=" 
                + "&param4=" + txtNoRegistrasi.value
                + "&param5=" + txtPID.value
                + "&param6=" + txtNoNegosiasi.value
                + "&param7=" + txtNoVisum.value
                + "&param8=" + txtNoPemberkasan.value
                + "&param9=" + txtTglAppSectionHead.value
                + "&param10=" + txtTglAppManager.value
                + "&param11=" + txtTglDiterimaSurvey.value
                + "&param12=" + txtTglAppGMEksternal.value
                + "&param13=" + txtTglAppBOD.value
                + "&param14=" + txtTglAppDiterimaAccounting.value
                + "&param15=" + ddBerkas.value
                + "&param16=" + txtPerusahaan.value
                + "&param17=" + txtKeterangan.value
                + "&param18=" + ddLanjut.value
                + "&param19=" + eksepsi.value
                + "&param20=" + txtKetEks.value
                + "&param21=" 
                + "&param22=" 
                + "&param23="
       

        dhtmlxAjax.post(localURL, s, outputResponse);
        //        if (autorisasi.value.indexOf("A") == -1)
        //            btnAdd.disabled = true;
        //        else if (autorisasi.value.indexOf("A") != -1)
        //            btnAdd.disabled = false;
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
//                window.location.replace(newUrl);
                close();
                break;
            case "D":
                alert("Data Berhasil Di Delete");
                //                window.location.replace(newUrl);
                close();
                break;
            case "nodelete":
                alert("Data Pembayaran Tidak Dapat Di Hapus Karena Sudah Dilakukan Finalisasi");
                //                window.location.replace(newUrl);
                close();
                break;
            case "noedit":
                alert("Data Pembayaran Tidak Dapat Di Edit Karena Sudah Dilakukan Finalisasi");
                //                window.location.replace(newUrl);
                close();
                break;
            case "noadd":
                alert("Data Pembayaran Tidak Dapat Di Assign Karena Sudah Dilakukan Finalisasi");
                //                window.location.replace(newUrl);
                close();
                break;
            case "gagal":
                alert("Data Pembayaran Gagal Disimpan");
                //                window.location.replace(newUrl);
                close();
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

    $(function TglAppSectionHead() {
        $("[id$=txtTglAppSectionHead]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function TglAppManager() {
        $("[id$=txtTglAppManager]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function TglDiterimaSurvey() {
        $("[id$=txtTglDiterimaSurvey]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function TglAppGMEksternal() {
        $("[id$=txtTglAppGMEksternal]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function TglAppBOD() {
        $("[id$=txtTglAppBOD]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function TglAppDiterimaAccounting() {
        $("[id$=txtTglAppDiterimaAccounting]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });


    // bind
    function bindFormPembayaran(loader) 
    {
        //alert(loader.xmlDoc.responseText);
        var a = loader.xmlDoc.responseText;
        if (a != '0') 
        {
            var b = new Array();
            b = a.split('|');
            txtNoPembayaran.value = b[0];
            txtNoRegistrasi.value = b[1];
            txtPID.value = b[2];
            txtNoNegosiasi.value = b[3];
            txtNoVisum.value = b[4];
            txtNoPemberkasan.value = b[5];
            txtTglAppSectionHead.value = b[6];
            txtTglAppManager.value = b[7];
            txtTglDiterimaSurvey.value = b[8];
            txtTglAppGMEksternal.value = b[9];
            txtTglAppBOD.value = b[10];
            txtTglAppDiterimaAccounting.value = b[11];
            ddBerkas.value = b[12];
            txtKeterangan.value = b[13];
            ddLanjut.value = b[14];
            //            cbEksepsi.value = b[15];
            if (b[15] == '1') {
//                cbEksepsi.checked = true;
                document.getElementById("<%= chkEksepsi.ClientID %>").checked = b[15];
                eksepsi.value = b[15];
//                alert('x');
            }
            txtKetEks.value = b[16];
            txtNamaPerusahaan.value = b[17];
          txtjumlahp.value = b[18];
        }
    }


    function lockPembayaranView() 
    {
        txtNoPembayaran.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtPID.disabled = true;
        txtNoNegosiasi.disabled = true;
        txtNoVisum.disabled = true;
        txtNoPemberkasan.disabled = true;
        ddBerkas.disabled = true;
        txtTglAppSectionHead.disabled = true;
        txtTglAppManager.disabled = true;
        txtTglDiterimaSurvey.disabled = true;
        txtTglAppGMEksternal.disabled = true;
        txtTglAppBOD.disabled = true;
        txtTglAppDiterimaAccounting.disabled = true;
        txtjumlahp.disabled = true;
        ddLanjut.disabled = true;
        txtKeterangan.disabled = true;
        chkEksepsi.disabled = true;
        txtNamaPerusahaan.disabled = true;
        txtKetEks.disabled = true;
        document.getElementById('btnSave').style.visibility = 'hidden';
        document.getElementById('btnCari').style.visibility = 'hidden';
    }

    function lockPembayaranEdit() 
    {
        txtNoPembayaran.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtPID.disabled = true;
        txtNoNegosiasi.disabled = true;
        txtNoVisum.disabled = true;
        txtNoPemberkasan.disabled = true;
    }

    function lockPembayaranDelete() {
        txtNoPembayaran.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtPID.disabled = true;
        txtNoNegosiasi.disabled = true;
        txtNoVisum.disabled = true;
        txtNoPemberkasan.disabled = true;
        ddBerkas.disabled = true;
        txtTglAppSectionHead.disabled = true;
        txtTglAppManager.disabled = true;
        txtTglDiterimaSurvey.disabled = true;
        txtTglAppGMEksternal.disabled = true;
        txtTglAppBOD.disabled = true;
        txtTglAppDiterimaAccounting.disabled = true;
        txtjumlahp.disabled = true;
        ddLanjut.disabled = true;
        txtKeterangan.disabled = true;
        chkEksepsi.disabled = true;
        txtNamaPerusahaan.disabled = true;
        txtKetEks.disabled = true;
    }


    function PopupAmbilFoto() {
    $("#dialog3").dialog("open");
    }

    $(function () {
        $("#dialog3").dialog
        ({
            autoOpen: false,
            width: 700,
            height: 500,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialog3").dialog("close");
        });
    });
 

</script>

<%--<script type="text/javascript" src="Webcam_Plugin/jquery.min.js"></script>--%>
        <script src='<%=ResolveUrl("../Webcam_Plugin/jquery.webcam.js") %>' type="text/javascript"></script>
        <script type="text/javascript">
            var pageUrl = '<%=ResolveUrl("PembayaranForm.aspx") %>';
            $(function () {
                jQuery("#webcam").webcam({
                    width: 320,
                    height: 240,
                    mode: "save",
                    swffile: '<%=ResolveUrl("../Webcam_Plugin/jscam.swf") %>',
                    debug: function (type, status) {
                        $('#camStatus').append(type + ": " + status + '<br /><br />');
                    },
                    onSave: function (data) {
                        $.ajax({
                            type: "POST",
                            url: pageUrl + "/GetCapturedImage",
                            data: '',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (r) {
                                $("[id*=imgCapture]").css("visibility", "visible");
                                $("[id*=imgCapture]").attr("src", r.d);
                            },
                            failure: function (response) {
                                alert(response.d);
                            }
                        });
                    },
                    onCapture: function () {
                        webcam.save(pageUrl);
                    }
                });
            });
            function Capture() {
                webcam.capture();
                return false;
            }
        </script>

</asp:Content>

