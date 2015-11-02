<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="R_Registrasi.aspx.cs" Inherits="Pages_R_Registrasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<center>
    <h2>REPORT REGISTRASI</h2>
    <br />
    <hr class="style-four"></hr>
</center>
    <form role="form" class="form-horizontal">
        <div class="form-group">
            <label for="identitas" class="control-label col-md-2">Bulan</label>
            <div class="col-md-3">
                <asp:DropDownList ID="ddBulan" runat="server" class="form-control input-lg"></asp:DropDownList>
            </div>
            <label for="identitas" class="control-label col-md-1">Tahun</label>
            <div class="col-md-3">
                <asp:TextBox id="txtTahun" type="text" runat="server" class="form-control input-lg" placeholder= "..." onkeypress="return numbersonly(event, false)"/>
            </div>
            <%--<div class="col-md-2">
                <input type="button" id="btnPdf" value="PDF"  class="btn btn-lg btn-success" onclick="btnClick(this)" />  
            </div>--%>
        </div>
    </form>  
    
        <div class="form-group">
        <center>    
            <div class="col-lg-12">
                <input type="button" id="btnPdf" value="Generate to PDF"  class="btn btn-lg btn-success" onclick="btnClick(this)" />
                
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
    var localURL = "R_Registrasi.aspx";

    var bulan = document.getElementById("<%= ddBulan.ClientID %>");
    var tahun = document.getElementById("<%= txtTahun.ClientID %>");
    var btnPDF = document.getElementById("btnPDF");

    datetime();

    function btnClick(btn) {





        var url = "http://localhost/almis/Report_Landcomp/r003.aspx";
        url += "?rnd=" + Math.random() * 4
                + "&sm=l"
                + "&param1=" + tahun.value + "-" + bulan.value + "-01"
                + "&param2=V"
                + "";

        window.open(url, '', 'width=700,height=300');

    }

    function datetime() {
        var currentTime = new Date();
        var bulan = currentTime.getMonth() + 1;
        document.getElementById("<%= ddBulan.ClientID %>").value = bulan

        var tahun = currentTime.getFullYear();
        document.getElementById("<%= txtTahun.ClientID %>").value = tahun
    }


</script>

</asp:Content>

