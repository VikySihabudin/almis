<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LegalForm.aspx.cs" Inherits="Pages_LandLiti_LegalForm" MasterPageFile="~/MasterPages/mptamp.master"%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<input type="hidden" id="hidMode" value="I" />



<h2>Form Legal</h2>

<hr />
<br />

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
            <label for="identitas" class="control-label col-md-2">Nomor Legal</label>
            <div class="col-md-3"><asp:TextBox id="txtlegal" type="text" runat="server" class="form-control input-md"  ></asp:TextBox></div>
        </div>
    </div>


    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Verifikasi Dokumen</label>
            <div class="col-md-3"><asp:TextBox id="txtverDoc" type="text" runat="server" class="form-control input-md"  ></asp:TextBox></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Claim</label>
            <div class="col-md-3">
            <asp:TextBox id="txtNoClam" type="text" runat="server" class="form-control input-md"  ></asp:TextBox></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nama</label>
            <div class="col-md-3"><asp:TextBox id="txtNama" type="text" runat="server" class="form-control input-md" ></asp:TextBox></div>
        </div>
    </div>

 
        <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Lokasi Tanah</label>
            <div class="col-md-3">
                <asp:DropDownList ID="ddKabupaten" type="text" runat="server" class="form-control input-md" ></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddKecamatan" runat="server" class="form-control input-md" ></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddDesa" runat="server" class="form-control input-md"></asp:DropDownList>
            </div>
        </div>
    </div>

    <hr />
    <h3>Dowload Alas Hak</h3>
    <br />

      <div class="form-group">
       <div class="col-lg-10">
            <div style=" width:650px; height:130px;">
                <div id="gridlegal" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>


    <hr />
    <h3>Download Notulensi Rapat Mediasi</h3>
    <br />

      <div class="form-group">
       <div class="col-lg-10">
            <div style=" width:650px; height:130px;">
                <div id="gridNotulen" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4">
            </div>
            </div>
        </div>
        </div>

<hr />


<%--<iframe src="http://Viky-PC/peta" width="100%" height="600"></iframe>--%>


<hr />

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Legal Note</label>
			<div class="col-md-3">
				<asp:TextBox id="TxtKetLeg" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>
        </div>

<hr />

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nomor Surat Putusan</label>
            <div class="col-md-3"><asp:TextBox id="txtNoSrtPts" type="text" runat="server" class="form-control input-md" ></asp:TextBox></div>
        </div>
    </div>

    <div role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Tanggal Surat Putusan</label>
            <div class="col-md-3"><asp:TextBox id="txtTglSrt" type="text" runat="server" class="form-control input-md"  ></asp:TextBox></div>
        </div>
    </div>


    <br /><hr />
    <div role="form" class="form-horizontal">
        <div class="form-group">
            <asp:Label  ID="LSelesai" runat="server"  for="identitas" class="control-label col-md-2"  Text="Selesai" Font-Bold="True"></asp:Label>
            <div class="col-md-3"><asp:DropDownList ID="ddLSelesai" runat="server" class="form-control input-md">
                </asp:DropDownList></div>
        </div>
    </div>

		<div class="form-group">
            <label for="nama" class="control-label col-md-2">Keterangan</label>
			<div class="col-md-3">
				<asp:TextBox id="TextBox2" TextMode="multiline" class="form-control input-md" Columns="15" Rows="3" runat="server" />
			</div>
        </div>

    <br /><hr />


    <div class="form-group">
            <div class="col-md-10">
       
                     <input type="button" id="btnCancel" value="Cancel" class="btn btn-lg btn-default"  onclick="btnClick(this)"/> 
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

    var localURL = "LegalForm.aspx";
    var newUrl = "LegalForm.aspx";

    var txtlegal = document.getElementById("<%= txtlegal.ClientID %>");
    var txtverDoc = document.getElementById("<%=txtverDoc.ClientID%>");
    var txtNoClam = document.getElementById("<%=txtNoClam.ClientID%>");
    var txtNama = document.getElementById("<%=txtNama.ClientID%>");
    

    var ddKabupaten = document.getElementById("<%= ddKabupaten.ClientID %>");
    var ddKecamatan = document.getElementById("<%= ddKecamatan.ClientID %>");
    var ddDesa = document.getElementById("<%= ddDesa.ClientID %>");

    var txtNoSrtPts = document.getElementById("<%= txtNoSrtPts.ClientID %>");
    var txtTglSrt = document.getElementById("<%= txtTglSrt.ClientID %>");
    var ddprs = document.getElementById("<%= ddprs.ClientID %>");
    var TxtKetLeg = document.getElementById("<%= ddprs.ClientID %>");

    var ddLSelesai = document.getElementById("<%= ddLSelesai.ClientID %>");

    var btnDwnAlashak = document.getElementById("btnDwnAlashak");
    var btnSave = document.getElementById("btnSave");
    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");
    var btnDwnNot = document.getElementById("btnDwnNot");
  
    terimaURL();
    listLegal();
    listNotulen();
    SearchlistLegal();


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
			    + "&sm=V"
			    + "&param1=V"
                + "&param4=" + b[3].replace("param2=", "")
			    + "";
            //alert(s);
            dhtmlxAjax.post(localURL, s, bindFormLegal);

            var x = b[2].replace("param1=", "");

            if (x == 'V') {

                lockLegalView();
                hidMode.value = 'I';
            }

            else if (x == 'D') {
                lockLegalDelete();
                btnSave.value = 'Delete';
                hidMode.value = 'D';

            }
            else if (x == 'E') {

                lockLegalEdit();
                btnSave.value = 'Save';
                hidMode.value = 'E';


            }
        }

    }

    function btnClick(objBtn) {
        switch (objBtn.value) {
            case "Save":
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
        + "&sm=CRUD"
        + "&param1=" + hidMode.value
        + "&param2=" + txtlegal.value
        + "&param3="
        + "&param4=" + txtverDoc.value
        + "&param5=" + txtNoSrtPts.value
        + "&param6=" + txtTglSrt.value
        + "&param7=" 
        + "&param8="
        + "&param9=" + ddprs.value
        + "";

        dhtmlxAjax.post(localURL, s, outputResponse);

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
                //window.location.replace(newUrl);
                close();
                break;

            case "D":
                alert("Data Berhasil Di Delete");
                //window.location.replace(newUrl);
                close();
                break;

            case "nodelete":
                alert("Data Legal Tidak Dapat Di Hapus Karena Sudah Selesai");
                //window.location.replace(newUrl);
                close();
                break;

            case "noedit":
                alert("Data Legal Tidak Dapat Di Edit Karena Sudah Selesai");
                //window.location.replace(newUrl);
                close();
                break;

            case "gagal":
                alert("Data Verifikasi Gagal Disimpan");
                //window.location.replace(newUrl);
                close();
                break;

            default:
                break;
        }
    }

    function bindFormLegal(loader) {
        //alert(loader.xmlDoc.responseText);
        var a = loader.xmlDoc.responseText;
        //        lockKlaimUser();
        if (a != '0') {
            var b = new Array();
            b = a.split('|');

            ddprs.value = b[0];
            txtlegal.value = b[1];
            txtverDoc.value = b[2];
            txtNoClam.value = b[3];
            txtNama.value = b[4];

            ddKabupaten.value = b[5];
            ddKecamatan.value = b[6];
            ddDesa.value = b[7];

            txtNoSrtPts.value = b[8];
            txtTglSrt.value = b[9];
            
        }

        SearchlistLegal();
        SearchlistNotulen();
    }

    function lockLegalView() {

        txtlegal.disabled = true;
        txtverDoc.disabled = true;
        txtNoClam.disabled = true;
        txtNama.disabled = true;

        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;

        ddprs.disabled = true;

        txtNoSrtPts.disabled = true;
        txtTglSrt.disabled = true;


        document.getElementById('btnSave').style.visibility = 'hidden';
    }

    function lockLegalEdit() {

        txtlegal.disabled = true;
        txtverDoc.disabled = true;
        txtNoClam.disabled = true;
        txtNama.disabled = true;

        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;

        ddprs.disabled = true;

    }

    function lockLegalDelete() {

        txtlegal.disabled = true;
        txtverDoc.disabled = true;
        txtNoClam.disabled = true;
        txtNama.disabled = true;

        ddKabupaten.disabled = true;
        ddKecamatan.disabled = true;
        ddDesa.disabled = true;

        ddprs.disabled = true;

        txtNoSrtPts.disabled = true;
        txtTglSrt.disabled = true;

    }


    function SearchlistLegal() {
        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=LP"
        + "&param1=LP"
        + "&param2=" + txtNoClam.value
        + "";
        listLegal.clearAll();
        listLegal.loadXML(localURL + "?" + s);
    }

    function SearchlistNotulen() {
        var s = ""

        + "rnd=" + Math.random() * 4
		+ "&sm=DOCpic"
		+ "&IDPerdok=" + txtverDoc.value
		+ "&param1=L"
        + "";
        //alert (s);
        listNotulen.clearAll();
        listNotulen.loadXML(localURL + "?" + s);

    }

    function listLegal() {
        listLegal = new dhtmlXGridObject('gridlegal');
        listLegal.setImagePath("../JavaScript/codebase/imgs/");
        listLegal.setHeader("No,PID,Nama Penjual,Alas Hak");
        listLegal.setInitWidths("40,200,200,200");
        listLegal.setColAlign("left,left,left,left");
        listLegal.setColTypes("ro,ro,ro,link");
        listLegal.init();
        listLegal.setSkin("dhx_skyblue");
        listLegal.setPagingSkin("bricks");
        listLegal.setColSorting("str,str,str,str");
    }

    function listNotulen() {
        listNotulen = new dhtmlXGridObject('gridNotulen');
        listNotulen.setImagePath("../JavaScript/codebase/imgs/");
        listNotulen.setHeader("No,Nama Notulen,Download");
        listNotulen.setInitWidths("40,200,200");
        listNotulen.setColAlign("left,left,left");
        listNotulen.setColTypes("ro,ro,link");
        listNotulen.init();
        listNotulen.setSkin("dhx_skyblue");
        listNotulen.setPagingSkin("bricks");
        listNotulen.setColSorting("str,str,str");
    }

    $(function txtTglSrt() {
        $("[id$=txtTglSrt]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });


  


</script>

</asp:Content>

