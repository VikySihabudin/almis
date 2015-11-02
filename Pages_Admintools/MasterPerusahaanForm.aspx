<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="MasterPerusahaanForm.aspx.cs" Inherits="Pages_MasterPerusahaanForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<input type="hidden" id="hidMode" value="I" />


<h1>Master Perusahaan</h1>
	
	<hr class="style-four">    
    
	<form role="form" class="form-horizontal" action="#">
    
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">ID Perusahaan</label>
            <div class="col-md-3"><asp:TextBox id="txtIdPerusahaan" class="form-control input-md" type="text" runat="server" /></div>			
        </div>

        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Nama Perusahaan</label>
            <div class="col-md-3"><asp:TextBox id="txtNamaPerusahaan" class="form-control input-md" type="text" runat="server" /></div>			
        </div>

        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Keterangan</label>
            <div class="col-md-3"><asp:TextBox id="txtKeterangan" TextMode="multiline" Columns="15" Rows="3" runat="server" class="form-control" placeholder= "..." /></div>			
        </div>

        <hr />

        <div class="form-group">
            <div class="col-md-10">
  
                <%--<center><asp:CheckBox id="cbTest" CssClass="form-control checkbox-md" runat="server" />           --%>   
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

    var localURL = "MasterPerusahaanForm.aspx";
    var newUrl = "MasterPerusahaanList.aspx";
    var txtIdPerusahaan = document.getElementById("<%= txtIdPerusahaan.ClientID %>");
    var txtNamaPerusahaan = document.getElementById("<%= txtNamaPerusahaan.ClientID %>");
    var txtKeterangan = document.getElementById("<%= txtKeterangan.ClientID %>");
    var hidMode = document.getElementById('hidMode');
    var hiIdentitas = document.getElementById('hiIdentitas');
    
    terimaURL();

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
        }
    }

    function splitparam(loader) {
        var a = loader;
        if (a != '&load') {
            var b = new Array();
            b = a.split('&');
            //            alert(a);


            var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=V"
			+ "&param1=V"
			+ "&param2=" + b[3].replace("param2=", "")
			+ "";

            dhtmlxAjax.post(localURL, s, bindFormMasterPerusahaan);

            var x = b[2].replace("param1=", "");
        }
        if (x == 'V') {
            txtIdPerusahaan.disabled = true;
            txtNamaPerusahaan.disabled = true;
            txtKeterangan.disabled = true;
            
            
        }

        else if (x == 'E') {
            txtIdPerusahaan.disabled = true;
            btnSave.value = 'Save';
            hidMode.value = 'E';
            //alert(hidMode.value);
        }
        else if (x == 'D') {
            btnSave.value = 'Delete';
            hidMode.value = 'D';
            //alert(hidMode.value);
        }
    }



    function bindFormMasterPerusahaan(loader) {
        //alert(loader.xmlDoc.responseText);
        var a = loader.xmlDoc.responseText;
        //lockPengecekanLapangan();
        if (a != '0') {
            var b = new Array();
            b = a.split('|');

            //alert(b[0]);



            //hiIdentitas.value = b[0];
            txtIdPerusahaan.value = b[0];
            txtNamaPerusahaan.value = b[2];
            txtKeterangan.value = b[3];

            //alert(b[2]);
        }
    }


    function btnClick(objBtn) {
        switch (objBtn.value) {
            case "Save":
                //alert(hidMode.value);
                Edit(hidMode.value)
                break;
            //alert(hidMode.value);   
            case "Delete":
                if (objBtn.id == 'btnSave') {
                    if (confirm("Hapus Data Ini?"))
                        Delete(hidMode.value);
                }
                break;

            case "Cancel":
                close();
                break;

            default:
                break;
        }
    }

    function Edit(tipe) {

        
        if (tipe.replace("param1=", "") == 'I') {
//            alert(tipe.replace("param2=", ""));
            var s = ""
                        + "rnd=" + Math.random() * 4
			            + "&sm=CRUD"
                        + "&param1=" + tipe
                        + "&param2=" + txtIdPerusahaan.value
                        + "&param3="
                        + "&param4=" + txtNamaPerusahaan.value
                        + "&param5=" + txtKeterangan.value

            //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }

        else if (tipe.replace("param1=", "") == 'E') {
            //alert("testE");
            //alert(tipe);
            //alert(hiIdentitas.value); //100
            var s = ""
                        + "rnd=" + Math.random() * 4
			            + "&sm=CRUD"
                        + "&param1=" + tipe
                        + "&param2=" + txtIdPerusahaan.value
                        + "&param3="
                        + "&param4=" + txtNamaPerusahaan.value
                        + "&param5=" + txtKeterangan.value

            //alert(s);
            dhtmlxAjax.post(localURL, s, outputResponse);
        }
    }

    function Delete() {

        var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=D"
                + "&param2=" + txtIdPerusahaan.value

        //alert(s);
        dhtmlxAjax.post(localURL, s, outputResponse);


    }

    function outputResponse(loader) {
        //alert('out');
        var a = loader.xmlDoc.responseText;
        if (a != '') {
            var b = new Array();
            b = a.split('|');
        }

        //alert(b[0]+'xxxxxx');

        switch (b[0]) {
            case "I":
                alert("Data Berhasil Di Input");
                window.location.replace(newUrl);
//                close();
                break;
            case "E":
                alert("Data Berhasil Di Edit");
                //                window.location.replace(newUrl);
                close();
                break;
            case "D":
                alert("Data Berhasil Di Delete");
                //          window.location.replace(newUrl);
                close();
                break;
            case "nodelete":
                alert("Data Master Identitas Tidak Dapat Di Hapus Karena Sudah Dilakukan digunakan");
                //                window.location.replace(newUrl);
                close();
                break;
            
            case "gagal":
                alert("Data Group Gagal Disimpan");
                //                window.location.replace(newUrl);
                close();
                break;
            default:
                break;
        }
    }
    

</script>

</asp:Content>

