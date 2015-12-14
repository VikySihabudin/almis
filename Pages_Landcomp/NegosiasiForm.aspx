<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="NegosiasiForm.aspx.cs" Inherits="Pages_NegosiasiForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<input type="hidden" id="hidMode" value="0" />
<input type="hidden" id="eksepsi"  />
<input type="hidden" id="SKGRPHAT"  />



<h1>Negosiasi</h1>
    
    <hr />

    <div role="form" class="form-horizontal" >
    	<div class="form-group">
            <label for="nama" class="control-label col-md-2">Nama Perusahaan</label>
            <div class="col-md-2"> 
                <asp:DropDownList ID="ddprs" runat="server" class="form-control">
                </asp:DropDownList>
            </div>
        </div>
   </div>

    <div role="form" class="form-horizontal" >
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">No Negosiasi</label>
            <div class="col-md-2"><asp:TextBox id="txtNoNegosiasi" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
            <label for="identitas" class="control-label col-md-1">No Registrasi</label>
            <div class="col-md-2"><asp:TextBox id="txtNoRegistrasi" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
            <label for="identitas" class="control-label col-md-1">No PID</label>
            <div class="col-md-2"><asp:TextBox id="txtNoPID" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <div role="form" class="form-horizontal" >
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Negoisasi ke</label>
            <div class="col-md-2">
            <asp:DropDownList ID="ddNegosiasi" runat="server" class="form-control input-md" onclick="refresh()">
            </asp:DropDownList>            
            </div>
            <div class="col-sm-2">
            <input type="button" id="Button2" value="Tambah" runat="server" class="btn btn-md btn-success" onclick="TambahNegosiasiKe()" />
            </div>
           <div class="col-sm-1"></div>
            <label for="identitas" class="control-label col-md-1">Tanggal Negosiasi</label>
            <div class="col-md-2">
                <%--<asp:TextBox id="txtTglNeg" type="text" runat="server" placeholder= "..."  class="form-control input-md" />--%>
                <asp:TextBox id="txtTglNeg" type="text" runat="server" class="form-control input-md" />
            </div>
        </div>
    </div>

    <br /><hr />

    <br /><br />

<div class="hidden"> <%--Di Hiden--%>
     <div role="form" class="form-horizontal" >
     <div class="form-group">
        <label for="identitas" class="control-label col-sm-1">Objek</label>
        <div class="col-md-2"><asp:DropDownList ID="ddObjek" class="form-control input-md" runat="server"></asp:DropDownList></div>
        <label for="identitas" class="control-label col-sm-1">Luas</label>
        <div class="col-md-2"><asp:TextBox id="txtLuas" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        <label for="identitas" class="control-label col-sm-1">Harga Permintaan</label>
        <div class="col-md-2"><asp:TextBox id="txtHargaPermintaan" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        <label for="identitas" class="control-label col-sm-1">Harga Penawaran</label>
        <div class="col-md-2"><asp:TextBox id="txtHargaPenawaran" type="text" runat="server" class="form-control input-md" placeholder= "..." />
            <input type="button" id="Button1" value="Save"  class="btn btn-md btn-success" onclick="saveDetail(this)" />
        </div>  
         <%--<div class="col-md-2"><input type="button" id="btnSavePenawaran" value="Save"  class="btn btn-md btn-success" onclick="btnClickSavePenawaran(this)" /></div>  --%>  
      </div>
      </div>
</div>

    <div class="form-group">
        <div class="col-md-10">
            <div style=" width:100%; height:230px;">
                 <div id="gridNegosiasi" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>		
            </div>                                     
        </div>
    </div>


      <div role="form" class="form-horizontal" >
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Total Harga Permintaan</label>
            <div class="col-md-3"><asp:TextBox id="txtTHargaPermintaan" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
            <label for="identitas" class="control-label col-md-2">Total Harga Penawaran</label>
            <div class="col-md-3"><asp:TextBox id="txtTHargaPenawaran" type="text" runat="server" class="form-control input-md" placeholder= "..." /></div>
        </div>
    </div>

    <%if (groups.ToString() != "1")
    { %>        
            <%if (lanjut.ToString() != "1")
            { %> 
            <div class="hidden">
            <%}%>

    <%}%>

    <div role="form" class="form-horizontal" >
        <div class="form-group">
            <asp:Label ID="LSepakat" for="identitas"  class="control-label col-md-2" runat="server" Text="Sepakat" Font-Bold="True"></asp:Label>
            <div class="col-md-3"><asp:DropDownList ID="ddSepakat" class="form-control input-md" runat="server"></asp:DropDownList></div>
            
        </div>
    </div>

    <%if (groups.ToString() != "1")
    { %>        
            <%if (lanjut.ToString() != "1")
            { %> 
            </div>
            <%}%>

    <%}%>

    <div role="form" class="form-horizontal" >
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Keterangan</label>
            <div class="col-md-3"><asp:TextBox id="txtKeterangan" type="text" runat="server" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" placeholder= "..." /></div>
            <label for="identitas" class="control-label col-md-2">BANL</label>
            <div class="col-md-3"><asp:CheckBox CssClass="form-control checkbox-md" ID="cbSKGRPHAT" runat="server" onclick="validasi()"/></div>
        </div>
    </div>

    <%if (groups.ToString() != "1")
    { %>        
            <%if (except.ToString() != "1")
            { %> 
            <div class="hidden">
            <%}%>

    <%}%> 

    <div role="form" class="form-horizontal" >
        <div class="form-group">
            <asp:Label ID="LEksepsi" for="identitas"  class="control-label col-md-2" runat="server" Text="Ekspesi" Font-Bold="True"></asp:Label>
            <div class="col-md-3"><asp:CheckBox ID="chEksepsi" CssClass="form-control checkbox-md" runat="server" text="" onclick="validasi()"/></div>
        </div>
    </div>

    <div role="form" class="form-horizontal" >
        <div class="form-group">
            <asp:Label ID="LKEksepsi" for="identitas"  class="control-label col-md-2" runat="server" Text="Keterangan Ekspesi" Font-Bold="True"></asp:Label>
            <div class="col-md-3"> <asp:TextBox id="txtKetEksepsi" class="form-control input-md" TextMode="multiline" Columns="15" Rows="3" runat="server" /></div>
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


<%--DIALOG--%>

<div id="dialogNeg" title="Detail Negosiasi" style="font-size:small;">
<div role="form" class="form-horizontal" >

    <div class="form-group">

        <asp:Label ID="Label1" for="identitas"  class="control-label col-md-2" runat="server" Text="No Negosiasi" Font-Bold="True"></asp:Label>
        <div class="col-sm-4">
            <asp:TextBox ID="txtNoNego" class="form-control input-md" runat="server" Enabled="False"></asp:TextBox>
        </div>

        <asp:Label ID="Label3" for="identitas"  class="control-label col-md-2" runat="server" Text="Tanggal" Font-Bold="True"></asp:Label>
        <div class="col-sm-4">
            <asp:TextBox ID="txttgl" class="form-control input-md" runat="server" ></asp:TextBox>
        </div>

    </div>

    <div class="form-group">

        <asp:Label ID="Label2" for="identitas"  class="control-label col-md-2" runat="server" Text="Objek" Font-Bold="True"></asp:Label>
        <div class="col-sm-4">



        
       <asp:DropDownList ID="ddobj" class="form-control input-md" runat="server"></asp:DropDownList>
        
        <div class="hidden">
            <asp:TextBox ID="txtobj" class="form-control input-md" runat="server" Enabled="False"></asp:TextBox>
        </div>
        </div>

        <asp:Label ID="Label6" for="identitas"  class="control-label col-md-2" runat="server" Text="Luas" Font-Bold="True"></asp:Label>
        <div class="col-sm-4">
            <asp:TextBox ID="txtluasd" class="form-control input-md" runat="server" Enabled="True" onkeypress="return numbersonly(event, false)"></asp:TextBox>
       </div>

     </div>

    <div class="form-group">

        <asp:Label ID="Label4" for="identitas"  class="control-label col-md-2" runat="server" Text="Harga Permintaan" Font-Bold="True"></asp:Label>
        <div class="col-sm-4">
            <asp:TextBox ID="txthrgpermin" class="form-control input-md" runat="server" Enabled="True" onkeypress="return numbersonly(event, false)"></asp:TextBox>
        </div>

        <asp:Label ID="Label7" for="identitas"  class="control-label col-md-2" runat="server" Text="Harga Penawaran" Font-Bold="True" ></asp:Label>
        <div class="col-sm-4">
            <asp:TextBox ID="txthrgpena" class="form-control input-md" runat="server" Enabled="True" onkeypress="return numbersonly(event, false)"></asp:TextBox>
       </div>

     </div>

   <div class="hidden"> <%--DI Hiden--%>
    <div class="form-group">

        <asp:Label ID="Label8" for="identitas"  class="control-label col-md-2" runat="server" Text="Jumlah Harga Permintaan" Font-Bold="True"></asp:Label>
        <div class="col-sm-4">
            <asp:TextBox ID="txtjmlhrgpermin" class="form-control input-md" runat="server" Enabled="False"></asp:TextBox>
        </div>

        <asp:Label ID="Label9" for="identitas"  class="control-label col-md-2" runat="server" Text="Jumlah Harga Penawaran" Font-Bold="True"></asp:Label>
        <div class="col-sm-4">
            <asp:TextBox ID="txtjmlhrgpena" class="form-control input-md" runat="server" Enabled="False"></asp:TextBox>
       </div>

     </div >

     <div class="form-group">

         <asp:Label ID="Label10" for="identitas"  class="control-label col-md-2" runat="server" Text="Selisih" Font-Bold="True"></asp:Label>
           <div class="col-sm-4">
            <asp:TextBox ID="txtselisih" class="form-control input-md" runat="server" Enabled="False"></asp:TextBox>
           </div>

         <asp:Label ID="Label5" for="identitas"  class="control-label col-md-2" runat="server" Text="No Squen" Font-Bold="True"></asp:Label>
           <div class="col-sm-4">
            <asp:TextBox ID="txtsequ" class="form-control input-md" runat="server" Enabled="False"></asp:TextBox>
           </div>

     </div>
     
    

     <div class="form-group">

         <asp:Label ID="Label11" for="identitas"  class="control-label col-md-2" runat="server" Text="Negosiasi Ke" Font-Bold="True"></asp:Label>
           <div class="col-sm-2">
           <asp:TextBox ID="txtNegKe" class="form-control input-md" runat="server" Enabled="False"></asp:TextBox>
           </div>
           <div class="col-sm-2">
           <input type="button" id="btntambah" value="Tambah" runat="server" class="btn btn-md btn-info" onclick="SaveKondisiNegq()" />
           </div>
<%--         <asp:Label ID="Label12" for="identitas"  class="control-label col-md-2" runat="server" Text="No Squen" Font-Bold="True"></asp:Label>
           <div class="col-sm-4">
            <asp:TextBox ID="TextBox2" class="form-control input-md" runat="server" Enabled="False"></asp:TextBox>
           </div>--%>

     </div>

     </div>

<div role="form" class="form-horizontal">
    <div class="form-group">
        <div class="col-md-11" align="right">
            <input type="button" id="PopupbtnSaveNeg" value="Save" runat="server" class="btn btn-md btn-success" onclick="SaveKondisiNeg()" />
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

<script type="text/javascript">

    var localURL = "NegosiasiForm.aspx";
    var newUrl = "NegosiasiList.aspx";
    var txtNoNegosiasi = document.getElementById("<%= txtNoNegosiasi.ClientID %>");
    var txtNoRegistrasi = document.getElementById("<%= txtNoRegistrasi.ClientID %>");
    var txtNoPID = document.getElementById("<%= txtNoPID.ClientID %>");
    var ddNegosiasi = document.getElementById("<%= ddNegosiasi.ClientID %>");
    var txtTglNeg = document.getElementById("<%= txtTglNeg.ClientID %>");
    var ddObjek = document.getElementById("<%= ddObjek.ClientID %>");
    var txtLuas = document.getElementById("<%= txtLuas.ClientID %>");
    var txtHargaPermintaan = document.getElementById("<%= txtHargaPermintaan.ClientID %>");
    var txtHargaPenawaran = document.getElementById("<%= txtHargaPenawaran.ClientID %>");
    var txtTHargaPermintaan = document.getElementById("<%= txtTHargaPermintaan.ClientID %>");
    var txtTHargaPenawaran = document.getElementById("<%= txtTHargaPenawaran.ClientID %>");
    var txtKeterangan = document.getElementById("<%= txtKeterangan.ClientID %>");
    var ddSepakat = document.getElementById("<%= ddSepakat.ClientID %>");
    var cbSKGRPHAT = document.getElementById("<%= cbSKGRPHAT.ClientID %>");
    var txtKetEksepsi = document.getElementById("<%= txtKetEksepsi.ClientID %>");
    var chEksepsi = document.getElementById("<%= chEksepsi.ClientID %>");
    var btnSave = document.getElementById("btnSave");
    var btnCancel = document.getElementById("btnCancel");
    var btnDelete = document.getElementById("btnDelete");


    var hidMode = document.getElementById('hidMode');
    var txtNoNego = document.getElementById("<%= txtNoNego.ClientID %>");
    var txttgl = document.getElementById("<%= txttgl.ClientID %>");
    var txtobj = document.getElementById("<%= txtobj.ClientID %>");
    var txtluasd = document.getElementById("<%= txtluasd.ClientID %>");
    var txthrgpermin = document.getElementById("<%= txthrgpermin.ClientID %>");
    var txtjmlhrgpermin = document.getElementById("<%= txtjmlhrgpermin.ClientID %>");
    var txthrgpena = document.getElementById("<%= txthrgpena.ClientID %>");
    var txtjmlhrgpena = document.getElementById("<%= txtjmlhrgpena.ClientID %>");
    var txtselisih = document.getElementById("<%= txtselisih.ClientID %>");
    var txtsequ = document.getElementById("<%= txtsequ.ClientID %>");
    var txtNegKe = document.getElementById("<%= txtNegKe.ClientID %>");
    var PopupbtnSaveNeg = document.getElementById("PopupbtnSaveNeg");
    var btntambah = document.getElementById("btntambah");
    var gridNegosiasi = document.getElementById("gridNegosiasi");
    var ddobj = document.getElementById("<%= ddobj.ClientID %>");
    var ddprs = document.getElementById("<%= ddprs.ClientID %>");

    
    terimaURL();
    listNegosiasi();
  
//    alert(txtNoNegosiasi.value);


    $(function txttgl() {
        $("[id$=txttgl]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    $(function txtTglNeg() {
        $("[id$=txtTglNeg]").datepicker({
            dateFormat: "yy-mm-dd",
            buttonImageOnly: true,
            changeYear: true,
            changeMonth: true,
            yearRange: "1900:2100"
        });
    });

    function validasi() {
            if (document.getElementById("<%= chEksepsi.ClientID %>").checked) {
                eksepsi.value = '1';
            } else {
                eksepsi.value = '0';
             }
            if (document.getElementById("<%= cbSKGRPHAT.ClientID %>").checked) {
                SKGRPHAT.value = '1';
            } else {
                SKGRPHAT.value = '0';
             }
        
    }   

    function terimaURL() {

        var url = window.location.toString();
        //ambil bagian parameternya
        url.match(/\?(.+)$/);
        var params = RegExp.$1;
        // pisahkan parameter URL ke associative array
        var params = '&' + params;

        splitparam(params);
//        alert(txtNoNegosiasi.value);
        
    }


     function splitparam(loader) {

        var a = loader;
        //lockPengukuran();
        if (a != '0') {
            var b = new Array();
            b = a.split('&');
//            alert(a);
            
        }
        //alert(b[2].replace("param1=", ""));

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=V"
			+ "&param1=V" 
			+ "&param2=" + b[3].replace("param2=","")
			+ "";

//         alert(s);
        dhtmlxAjax.post(localURL, s, bindFormNegosiasi);

        var x = b[2].replace("param1=", "");
//        alert(b[3]);

        if (x == 'V') {
            lockNegosiasiView();

            }

        else if (x == 'D') {
            lockNegosiasiDelete();
            btnSave.value = 'Delete';
            hidMode.value = 'D';
        }
        else if (x == 'E') {
            lockNegosiasiEdit();
            btnSave.value = 'Save';
            hidMode.value = 'E';
            
        }
       
    }

    function btnClick(objBtn) {
        switch (objBtn.value) {
     
            case "Save":
//                alert(hidMode.value);
                Edit(hidMode.value)
                break;

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



    function TambahNegosiasiKe() {
        if (confirm("Apakah Anda Ingin Menambah Data Negosiasi?")) {
            var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=I"
                + "&param1=TN"
                + "&param2=" + txtNoNegosiasi.value
                + "&param3=" + txtTglNeg.value

            //alert(s);
            dhtmlxAjax.post(localURL, s);
            alert("Data Berhasil Ditambah");

            SearchNegoKe();
            location.reload();
        }

    }

    function Delete() {

        var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=D"
                + "&param2=" + txtNoNegosiasi.value
                + "&param3="
                + "&param4=" + txtNoRegistrasi.value
                + "&param5=" + txtNoPID.value
                + "&param6=" + txtKeterangan.value
                + "&param7=" + ddSepakat.value
                + "&param8=" + SKGRPHAT.value
                + "&param9=" + eksepsi.value
                + "&param10=" + txtKetEksepsi.value
                + "&param11="
                + "&param12="
                + "&param13="
                + "&param14=" + ddprs.value
                + "";
     //alert(s);
        dhtmlxAjax.post(localURL, s, outputResponse);

    }

    function SearchlistNegosiasi(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=LD"
            + "&param1=L"
            + "&param2=" + txtNoNegosiasi.value
			+ "";
        listNegosiasi.clearAll();
        listNegosiasi.loadXML(localURL + "?" + s);

    }




    function SearchNegoKe() {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=NK"
            + "&param1=NK"
            + "&param2=" + txtNoNegosiasi.value
			+ "";
        dhtmlxAjax.post(localURL, s );
    }

    function Edit(tipe) {
        if (eksepsi.value == 1) {
            var s = ""
                + "rnd=" + Math.random() * 4
			    + "&sm=CRUD"
                + "&param1=" + tipe.replace("param1=", "")
                + "&param2=" + txtNoNegosiasi.value
                + "&param3="
                + "&param4=" + txtNoRegistrasi.value
                + "&param5=" + txtNoPID.value
                + "&param6=" + txtKeterangan.value
                + "&param7=" + ddSepakat.value
                + "&param8=" + SKGRPHAT.value
                + "&param9=" + eksepsi.value
                + "&param10=" + txtKetEksepsi.value
                + "&param11="
                + "&param12="
                + "&param13="
                + "&param14=" + ddprs.value
                + "";

              //alert('Eks 1');
            dhtmlxAjax.post(localURL, s, outputResponse);
        }
        else {
            if (ddSepakat.value == 1) {
                //alert('spt 1');
                if (txtTHargaPermintaan.value == txtTHargaPenawaran.value) {
                    var s = ""
                    + "rnd=" + Math.random() * 4
			        + "&sm=CRUD"
                    + "&param1=" + tipe.replace("param1=", "")
                    + "&param2=" + txtNoNegosiasi.value
                    + "&param3="
                    + "&param4=" + txtNoRegistrasi.value
                    + "&param5=" + txtNoPID.value
                    + "&param6=" + txtKeterangan.value
                    + "&param7=" + ddSepakat.value
                    + "&param8=" + SKGRPHAT.value
                    + "&param9=" + eksepsi.value
                    + "&param10=" + txtKetEksepsi.value
                    + "&param11="
                    + "&param12="
                    + "&param13="
                    + "&param14=" + ddprs.value
                    + "";

                    //  alert(s);
                   // alert('Harga Sama');
                    dhtmlxAjax.post(localURL, s, outputResponse);
                }
                else {
                    alert('Data Harga Permintaan Dan Penawaran Tidak Sama');
                }
            }
            else {
                var s = ""
                        + "rnd=" + Math.random() * 4
			            + "&sm=CRUD"
                        + "&param1=" + tipe.replace("param1=", "")
                        + "&param2=" + txtNoNegosiasi.value
                        + "&param3="
                        + "&param4=" + txtNoRegistrasi.value
                        + "&param5=" + txtNoPID.value
                        + "&param6=" + txtKeterangan.value
                        + "&param7=" + ddSepakat.value
                        + "&param8=" + SKGRPHAT.value
                        + "&param9=" + eksepsi.value
                        + "&param10=" + txtKetEksepsi.value
                        + "&param11="
                        + "&param12="
                        + "&param13="

                //  alert(s);
                //alert('Tidak Sepakat');
                dhtmlxAjax.post(localURL, s, outputResponse);
            }
        }
    }


//    function bindNegoKe(loader) {
//        var a = loader.xmlDoc.responseText;
////        //lockPengukuran();
//        if (a != '0') {
//            var b = new Array();
//            b = a.split('|');
//            ddNegosiasi.value = b[0];
//        }
//    }

    function bindFormNegosiasi(loader) {
        //alert(loader.xmlDoc.responseText);
        var a = loader.xmlDoc.responseText;
//        lockNegosiasiView();
        if (a != '0') {
            var b = new Array();
            b = a.split('|');
            txtNoNegosiasi.value = b[0];
            txtNoRegistrasi.value = b[1];
            txtNoPID.value = b[2];
            txtKeterangan.value = b[3];
            ddSepakat.value = b[4];

            if (b[5] == 1) {
                cbSKGRPHAT.checked = true;
                SKGRPHAT.value = b[5];
            }
            txtKetEksepsi.value = b[6];

            if (b[7] == 1) {
                chEksepsi.checked = true;
                eksepsi.value = b[7];
            }

            txtTHargaPermintaan.value = b[8];
            txtTHargaPenawaran.value = b[9];
            txtTglNeg.value = b[10];
            ddNegosiasi.value = b[11];

//            txtTglNeg.value = b[8];

            //txtPerLahKet.value = b[5];
            //ddPerolehanLahan.value = b[6];
            //FilePerolehanLahan.value = b[7];

        }

        SearchlistNegosiasi();
//        alert(txtNoNegosiasi.value);
//              SearchNegoKe();

        
    }

    function lockNegosiasiView() {
//        gridNegosiasi.enableTooltips("true,true,true,true,true");

//        gridNegosiasi.cells.setDisabled(true);
        gridNegosiasi.setDisabled = true;
        txtNoNegosiasi.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtNoPID.disabled = true;
        ddNegosiasi.disabled = true;
        txtTglNeg.disabled = true;
        ddObjek.disabled = true;
        txtLuas.disabled = true;
        txtHargaPermintaan.disabled = true;
        txtHargaPenawaran.disabled = true;
        txtTHargaPermintaan.disabled = true;
        txtTHargaPenawaran.disabled = true;
        txtKeterangan.disabled = true;
        ddSepakat.disabled = true;
        cbSKGRPHAT.disabled = true;
        txtKetEksepsi.disabled = true;
        chEksepsi.disabled = true;
        document.getElementById('btnSave').style.visibility = 'hidden';
        ddprs.disabled = true
       
    }

    function lockNegosiasiEdit() {
        txtNoNegosiasi.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtNoPID.disabled = true;
        txtTHargaPermintaan.disabled = true;
        txtTHargaPenawaran.disabled = true;
        ddprs.disabled = true
    }

    function lockNegosiasiDelete() {
       txtNoNegosiasi.disabled = true;
        txtNoRegistrasi.disabled = true;
        txtNoPID.disabled = true;
        ddNegosiasi.disabled = true;
        txtTglNeg.disabled = true;
        ddObjek.disabled = true;
        txtLuas.disabled = true;
        txtHargaPermintaan.disabled = true;
        txtHargaPenawaran.disabled = true;
        txtTHargaPermintaan.disabled = true;
        txtTHargaPenawaran.disabled = true;
        txtKeterangan.disabled = true;
        ddSepakat.disabled = true;
        cbSKGRPHAT.disabled = true;
        txtKetEksepsi.disabled = true;
        chEksepsi.disabled = true;
        ddprs.disabled = true
    }


    function SearchlistNegosiasi(id) {

        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=" + txtNoNegosiasi.value
            + "&param5=" + ddNegosiasi.value
			+ "";
        listNegosiasi.clearAll();
        listNegosiasi.loadXML(localURL + "?" + s);
//        dhtmlxAjax.post(localURL, s, bindFormNegosiasiTHP);
//        alert('dddd');

    }

    function refresh() {
        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=L"
            + "&param1=L"
            + "&param2=" + txtNoNegosiasi.value
            + "&param5=" + ddNegosiasi.value
			+ "";
        listNegosiasi.clearAll();
        listNegosiasi.loadXML(localURL + "?" + s);


        var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=VNK"
            + "&param1=VNK"
            + "&param2=" + txtNoNegosiasi.value
            + "&param5=" + ddNegosiasi.value
			+ "";
        dhtmlxAjax.post(localURL, s, bindFormNegosiasiTHP);
        
    }

    function bindFormNegosiasiTHP(loader) {
        var a = loader.xmlDoc.responseText;
        var b = new Array();
        b = a.split('|');
        txtTHargaPermintaan.value = b[0];
        txtTHargaPenawaran.value = b[1];


    }

    function SaveKondisiNeg() {
        if (txtluasd.value == 0) {
            alert('Data Luas Tidak Boleh Kosong');
        }
        else if (txthrgpena.value == 0) {
            alert('Data Penawaran Tidak Boleh Kosong');
        }
        else if (txthrgpermin.value == 0) {
            alert('Data Permintaan Tidak Boleh Kosong');
        }
        else {
            var s = ""
                  + "rnd=" + Math.random() * 4
                  + "&sm=I"
                  + "&param1=I"
                  + "&param2=" + txtNoNegosiasi.value
                  + "&param3=" + txttgl.value
                  + "&param4=" + txtsequ.value
                  + "&param5=" + txtNegKe.value
                  + "&param6=" + ddobj.value
            // + "&param6=" + txtobj.value
                  + "&param7=" + txtluasd.value
                  + "&param8=" + txthrgpermin.value
                  + "&param9=" + txthrgpena.value
                  + "";
            dhtmlxAjax.post(localURL, s);
            alert("Data Berhasil Disimpan")
            // alert(s);
            SearchlistNegosiasi();
            $("#dialogNeg").dialog("close");

            var s = ""
			+ "rnd=" + Math.random() * 4
			+ "&sm=V"
			+ "&param1=V"
			+ "&param2=" + txtNoRegistrasi.value
			+ "";

            dhtmlxAjax.post(localURL, s, bindFormNegosiasi);
        }
    }

    function Hapus(sm, param1, param2, param4, param5) {

        if (hidMode.value == "E") {
            var r = confirm("Apakah Anda Yakin Akan Delete Semua Data Negosiasi Ke " + ddNegosiasi.value + " ?");
            if (r == true) {
                var s = ""
                    + "rnd=" + Math.random() * 4
			        + "&sm=I"
                    + "&param1=" + param1
                    + "&param2=" + param2
                    + "&param4=" + param4
                    + "&param5=" + param5
                    + "";
                dhtmlxAjax.post(localURL, s);
                //SearchlistNegosiasi();
                alert("Data Negosiasi Ke " + ddNegosiasi.value + " Berhasil Di Delete");
                location.reload();
            }
        }
    }

    function onRowSelected(rowId, cellIndex) {
        txtNoNego.value = txtNoNegosiasi.value;
        txttgl.value = listNegosiasi.cells(rowId, 1).getValue();
        txtobj.value = listNegosiasi.cells(rowId, 2).getValue();
        ddobj.value = listNegosiasi.cells(rowId, 2).getValue();
        txtluasd.value = listNegosiasi.cells(rowId, 3).getValue();
        txthrgpermin.value = listNegosiasi.cells(rowId, 4).getValue();
        txtjmlhrgpermin.value = listNegosiasi.cells(rowId, 5).getValue();
        txthrgpena.value = listNegosiasi.cells(rowId, 6).getValue();
        txtjmlhrgpena.value = listNegosiasi.cells(rowId, 7).getValue();
        txtselisih.value = listNegosiasi.cells(rowId, 8).getValue();
        txtsequ.value = listNegosiasi.cells(rowId, 9).getValue();
        txtNegKe.value = listNegosiasi.cells(rowId, 10).getValue();
        //alert('a');
        $("#dialogNeg").dialog("open");

    }

    $(function () {
        $("#dialogNeg").dialog
        ({
            autoOpen: false,
            width: 610,
            height: 330,
            modal: true
        });

        $(".btnSubmit").on("click", function () {

            $("#dialogNeg").dialog("close");
        });
    });


    function listNegosiasi() {
        listNegosiasi = new dhtmlXGridObject('gridNegosiasi');
        listNegosiasi.setImagePath("../JavaScript/codebase/imgs/");
        listNegosiasi.setHeader("No,Tanggal,Objek,Luas,Harga Permintaan,Jumlah Harga Permintaan,Harga Penawaran,Jumlah Harga Penawaran,Selisih,Sequen,Negosiasi Ke,Action");
        listNegosiasi.setInitWidths("40,80,80,80,150,220,140,220,100,0,0,60");
        listNegosiasi.setColAlign("left,left,left,left,left,left,left,left,left,left,left,left");
        listNegosiasi.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,link");
        listNegosiasi.init();
        listNegosiasi.setSkin("dhx_skyblue");

        if (hidMode.value == "E") {
        //alert(hidMode.value);
        listNegosiasi.attachEvent("onRowSelect", onRowSelected);
        }

        listNegosiasi.setPagingSkin("bricks");
        listNegosiasi.setColSorting("str,str,str,str,str,str,str,str,str,str,str,str");
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
                //window.location.replace(newUrl);;
                close();
                break;
            case "D":
                alert("Data Berhasil Di Delete");
                //window.location.replace(newUrl);
                close();
                break;
            case "nodelete":
                alert("Data Negosiasi Tidak Dapat Di Hapus Karena Sudah Dilakukan Pembayaran");
                //window.location.replace(newUrl);
                close();
                break;
            case "noedit":
                alert("Data Negosiasi Tidak Dapat Di Edit Karena Sudah Dilakukan Pembayaran");
                //window.location.replace(newUrl);
                close();
                break;
            case "noadd":
                alert("Data Negosiasi Tidak Dapat Di Assign Karena Sudah Dilakukan Pembayaran"); 
                //window.location.replace(newUrl);
                close();
                break;
            case "gagal":
                alert("Data Negosiasi Gagal Disimpan");
                //window.location.replace(newUrl);
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


</script>

</asp:Content>

