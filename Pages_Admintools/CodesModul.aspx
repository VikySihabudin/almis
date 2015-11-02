<%@ Page Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="CodesModul.aspx.cs" Inherits="Pages_CodesModul" %>

<asp:Content ID="Head1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <input type="hidden" id="hidMode" value="0" />
    <input id="idcodehead" type="hidden" runat="server" />
    <input id="idcodes" type="hidden" runat="server" />




  <div class="panel panel-default bootstrap-admin-no-table-panel">

      <div class="panel-heading">
            <div class="text-muted bootstrap-admin-box-title"><h3>Codes Modul</h3></div>
        </div>

      <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
	     <div id="rootwizard">
		    <div class="navbar">
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation"><a href="#tab1" aria-controls="ListDropdown" role="tab" data-toggle="tab" class="active">List Dropdown</a></li>
                    <li role="presentation"><a href="#tab2" aria-controls="ListItem" role="tab" data-toggle="tab">List Item</a></li>
                </ul>		
		    </div>

            <div class="tab-content">
			<div class="tab-pane active" id="tab1">
                <form role="form" class="form-horizontal">
                    <div class="form-group">
                        <div class="col-sm-1">
                            </div>	 
                        <div class="col-lg-5" style=" width:430px; height:600px;">
                            <div id="GridListCodes" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                        </div>	
                    </div>
                </form>
            </div>

            <div class="tab-pane" id="tab2">
                <form role="form" class="form-horizontal">
                    <div class="form-group">
                        <div class="col-sm-1">
                            </div>	 
                        <div class="col-lg-5" style=" width:480px; height:600px;">
                            <div id="GridListItem" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                        </div>
                       <form role="form" class="form-horizontal">
                            <div class="form-group">
                                <div class="col-lg-5">
                                    <label for="codes" class="control-label col-lg-4">Nama Item :</label>
                                </div>
                                <div class="col-lg-3">
                                    <asp:TextBox id="codessDescs1" type="text" runat="server" class="form-control input-lg" placeholder= "..." />
                                </div>
                                <div class="col-lg-5" >
                                    <label for="codes" class="control-label col-lg-4">Keterangan :</label>
                                </div>
                                <div class="col-lg-3">
                                    <asp:TextBox id="codessDescs2" type="text" runat="server" class="form-control input-lg" placeholder= "..." />
                                    <br />
                                    <input type="button" id="btnAdd" value="New" runat="server" class="btn btn-lg btn-default" onclick="btnClick(this)" />
                                    <input type="button" id="btnCancel" value="Cancel" runat="server" class="btn btn-lg btn-default" onclick="btnClick(this)" />
                                    <input type="button" id="btnDelete" value="Delete" runat="server" class="btn btn-lg btn-default" onclick="btnClick(this)" />
                                </div>
                            </div>
                          </form>
                    </div>
                </form>
		    </div>

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

    <script type="text/javascript" language="javascript">
        var localURL = "CodesModul.aspx";

        var codessDescs1 = document.getElementById("<%= codessDescs1.ClientID %>");
        var codessDescs2 = document.getElementById("<%= codessDescs2.ClientID %>");
        var idcodehead = document.getElementById("<%= idcodehead.ClientID %>");
        var idcodes = document.getElementById("<%= idcodes.ClientID %>");
        var hidMode = document.getElementById("hidMode");
        var btnNew = document.getElementById("<%= btnAdd.ClientID %>");
        var btnCancel = document.getElementById("<%= btnCancel.ClientID %>");
        var btnDelete = document.getElementById("<%= btnDelete.ClientID %>");


        
        initGrid1();
        initGrid2();
        search1();
        gelap();

        function initGrid1() {
            mygrid1 = new dhtmlXGridObject('GridListCodes');
            mygrid1.setImagePath("../JavaScript/codebase/imgs/");
            mygrid1.setHeader("No,Head,Nama Dropdown,Keterangan,Status");
            mygrid1.attachHeader("#rspan,#rspan,#text_filter,#text_filter,#rspan");
            mygrid1.setInitWidths("40,0,190,150,0");
            mygrid1.setColAlign("center,center,left,center,left");
            mygrid1.setColTypes("ro,ro,ro,ro,ro");
            mygrid1.setColSorting("str,str,str,str,str");
            mygrid1.attachEvent("onRowSelect", doOnRowSelected);
            mygrid1.init();
            mygrid1.setSkin("dhx_skyblue");
        }

        function initGrid2() {
            mygrid2 = new dhtmlXGridObject('GridListItem');
            mygrid2.setImagePath("../JavaScript/codebase/imgs/");
            mygrid2.setHeader("No,Codes Codes,List Item,Keterangan,Status,Head");
            mygrid2.attachHeader("#rspan,#rspan,#text_filter,#text_filter,#rspan");
            mygrid2.setInitWidths("40,0,200,200,0,0");
            mygrid2.setColAlign("center,center,left,center,left");
            mygrid2.setColTypes("ro,ro,ro,ro,ro,ro");
            mygrid2.setColSorting("str,str,str,str,str,str");
            mygrid2.attachEvent("onRowSelect", doOnRowSelected2);
            mygrid2.init();
            mygrid2.setSkin("dhx_skyblue");
        }

        function search1() {
            
            var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=l"
			    + "";
            mygrid1.clearAll();
            centerLoadingImage();
            mygrid1.loadXML(localURL + "?" + s, function () {
                hideLoadingImage();
            });
        }

        function doOnRowSelected(id) {
            var s = ""
               + "rnd=" + Math.random() * 4
               + "&sm=li"
               + "&id=" + id
               + "";

            idcodehead.value = id;
            mygrid2.clearAll();
            mygrid2.loadXML(localURL + "?" + s);

        }

        function doOnRowSelected2(id) {
            select(id);
        }

        function select(id) {
            var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=s"
			    + "&id=" + id
			    + "&codeid=" + mygrid2.cells(id, 5).getValue()
			    + "";

            dhtmlxAjax.post(localURL, s, finishSelect);

        }
        function finishSelect(loader) {

            var a = loader.xmlDoc.responseText;
            var b = new Array();
            terang();
            b = a.split('|');

            codessDescs1.value = b[2];
            codessDescs2.value = b[3];
            idcodes.value = b[1];
            btnNew.value = 'Edit';
            btnCancel.disabled = false;
            btnDelete.disabled = false;

        }


        function saveGrid(type) {
            var s = ""
			    + "rnd=" + Math.random() * 4
			    + "&sm=i"
			    + "";
            if (type == 1) {
                // INSERT
                s += ""
                + "&tipe=" + hidMode.value
                + "&codessDescs1=" + codessDescs1.value
                + "&codessDescs2=" + codessDescs2.value
                + "&idcodes="
                + "&id=" + idcodehead.value
                + "";
                //                alert(type);
                //          alert(localURL+"?"+s);
                //centerLoadingImage();
                dhtmlxAjax.post(localURL, s, outputResponse);
            }
            else if (type == 2) {
                // UPDATE
                s += ""
                + "&tipe=" + hidMode.value
                + "&codessDescs1=" + codessDescs1.value
                + "&codessDescs2=" + codessDescs2.value
                + "&idcodes=" + idcodes.value
                + "&id=" + idcodehead.value
                + "";
                //                alert(type);
                //        alert(localURL+"?"+s);
                dhtmlxAjax.post(localURL, s, outputResponse);
            }
            else if (type == 3) {
                // UPDATE
                s += ""
                + "&tipe=" + type
                + "&codessDescs1=" + codessDescs1.value
                + "&codessDescs2=" + codessDescs2.value
                + "&idcodes=" + idcodes.value
                + "&id=" + idcodehead.value
                + "";
                //                alert(type);
                //alert(localURL+"?"+s);
                centerLoadingImage();
                dhtmlxAjax.post(localURL, s, function (loader) {
                    alert('Data berhasil di hapus');
                    searchcodes();
                    hideLoadingImage();
                    gelap();
                });
            }
            clearall();
        }


        function outputResponse(loader) {
            var a = loader.xmlDoc.responseText;
            var b = new Array();
            b = a.split('|');
            //alert(b[0]);
            searchcodes();
            gelap();
        }
        function searchcodes() {
            var s = ""
               + "rnd=" + Math.random() * 4
               + "&sm=li"
               + "&id=" + idcodehead.value
               + "";

            mygrid2.clearAll();
            centerLoadingImage();
            mygrid2.loadXML(localURL + "?" + s, function () {
                hideLoadingImage();
            });

        }


        function btnClick(objBtn) {
            switch (objBtn.value) {
                case "Cancel":
                    gelap();
                    hidMode.value = '0';
                    break;
                case "New":
                    if (idcodehead.value == '') {
                        alert('Pilih Nama Dropdown terlebih dahulu');
                        tabbar.setTabActive("tabCodesHead");
                    }
                    else {
                        terang();
                        hidMode.value = '1';
                        btnCancel.disabled = false;
                    }
                    break;
                case "Edit":
                    terang();
                    hidMode.value = '2';
                    btnCancel.disabled = false;
                    btnDelete.disabled = false;
                    break;
                case "Save":
                    saveGrid(hidMode.value);
                    break;
                case "Delete":
                    saveGrid('3');
                    break;
                default:
                    break;
            }
        }


        function gelap() {
            codessDescs1.disabled = true;
            codessDescs2.disabled = true;

            btnNew.value = 'New';
            btnNew.disabled = false;
            btnCancel.disabled = true;
            btnDelete.disabled = true;
            codessDescs1.value = "";
            codessDescs2.value = "";
        }

        function clearall() {
            codessDescs1.value = "";
            codessDescs2.value = "";
        }
        function terang() {
            btnNew.value = 'Save';
            codessDescs1.disabled = false;
            codessDescs2.disabled = false;

        }

    </script>
</asp:Content>