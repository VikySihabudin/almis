<%@ Page Language="C#" MasterPageFile="~/MasterPages/mptamp.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Pages_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<script type="text/javascript" src="../Javascript/fusionchart/Contents/assets/ui/js/whver.js"></script>
    <script type="text/javascript" src="../Javascript/fusionchart/Contents/assets/ui/js/whutils.js"></script>
    <script type="text/javascript" src="../Javascript/fusionchart/Contents/assets/ui/js/whmsg.js"></script>
    <script type="text/javascript" src="../Javascript/fusionchart/Contents/assets/ui/js/whstub.js"></script>

        <script type="text/javascript" src="../Javascript/fusionchart/Charts/jquery.min.js"></script>
        <script type="text/javascript" src="../Javascript/fusionchart/Charts/FusionCharts.js"></script>
        <script type="text/javascript" src="../Javascript/fusionchart/Contents/assets/prettify/prettify.js"></script>
        <script type="text/javascript" src="../Javascript/fusionchart/Contents/assets/ui/js/json2.js"></script>
         <script type="text/javascript" src="../Javascript/fusionchart/Contents/assets/ui/js/lib.js" ></script>


    <script type="text/javascript" src="../Javascript/fusionchart/Contents/assets/ui/js/whstart.js"></script>

                    <%--Chart--%>
                    <br /><br />
                    <br /><br />

                     <div class ="bottom-left">
                     <div class="col-sm-7 col-md-5">
                        <div class="chart-wrapper">
                          <div class="chart-title">

                          </div>
                          <div class="chart-stage">
                            <div id="grid-1-1">
    <span id="chartdiv">January Column 2D Chart will load here</span>
                            </div>
                          </div>
                          <div class="chart-notes">
                            <br/><br/>
                          </div>
                        </div>
                      </div></div>



                     <div class ="bottom-right">
                     <div class="col-sm-7 col-md-5">
                        <div class="chart-wrapper">
                          <div class="chart-title">

                          </div>
                          <div class="chart-stage">
                            <div id="Div1">
    <span id="chartdiv2">January Column 2D Chart will load here</span>
                            </div>
                          </div>
                          <div class="chart-notes">
                            <br/><br/>
                          </div>
                        </div>
                      </div></div>




                      <br />

<%if (groups.ToString() == ("1") || groups.ToString() == ("90") || groups.ToString() == ("100") || groups.ToString() == ("105"))
 { %>

                     <div class ="bottom-left">
                     <div class="col-sm-7 col-md-5">
                        <div class="chart-wrapper">
                          <div class="chart-title">

                          </div>
                          <div class="chart-stage">
                            <div id="Div2">
    <span id="chartdiv3">January Column 2D Chart will load here</span>
                            </div>
                          </div>
                          <div class="chart-notes">
                            <br/><br/>
                          </div>
                        </div>
                      </div></div>

                     <div class ="bottom-right">
                     <div class="col-sm-7 col-md-5">
                        <div class="chart-wrapper">
                          <div class="chart-title">

                          </div>
                          <div class="chart-stage">
                            <div id="Div3">
    <span id="chartdiv4">January Column 2D Chart will load here</span>
                            </div>
                          </div>
                          <div class="chart-notes">
                            <br/><br/>
                          </div>
                        </div>
                      </div></div>
<%}%> 

                    <br />

                    
                            <div class="col-sm-7 col-md-10" >
                            <div style=" width:100%; height:300px;">
                                    <div id="gridhome" style=" width:100%; height:100%; background-color:white; border: 1px solid #A4BED4"></div>
                                    <div id="pagehome"> </div>
                            </div>
                            </div>




                      <%--Chart--%>






        <script src="../Javascript/fusionchart/Gallery/Data/String/js/MSStCol2DLine1.js" type="text/javascript"></script>
        <script src="../Javascript/fusionchart/Gallery/Data/String/js/MSStCol2DLine2.js" type="text/javascript"></script>

        <script src="../Javascript/fusionchart/Gallery/Data/String/js/XYPlot7.js" type="text/javascript"></script>
    
    <script type="text/javascript"><!--

    function graphic1() {
        var chart = new FusionCharts("../Javascript/fusionchart/Charts/MSStackedColumn2DLineDY.swf", "ChartId", "100%", "400", "0", "0");
        var s = ""
                + "rnd=" + Math.random() * 4
                + "&sm=graph"
                + "&param1=1"
                + "&param2="
                + "";
        chart.setXMLUrl(localURL + "?" + s);
        //        chart.setXMLUrl("../Javascript/fusionchart/Gallery/Data/XML/data.xml");
        chart.render("chartdiv");


        var chart2 = new FusionCharts("../Javascript/fusionchart/Charts/MSStackedColumn2DLineDY.swf", "ChartId2", "100%", "400", "0", "0");
        var s = ""
                + "rnd=" + Math.random() * 4
                + "&sm=graph"
                + "&param1=2"
                + "&param2="
                + "";
        chart2.setXMLUrl(localURL + "?" + s);
        chart2.render("chartdiv2");

        var chart3 = new FusionCharts("../Javascript/fusionchart/Charts/Scatter.swf", "ChartId3", "100%", "400", "0", "0");

        var s = ""
                + "rnd=" + Math.random() * 4
                + "&sm=graph"
                + "&param1=3"
                + "&param2="
                + "";
        chart3.setXMLUrl(localURL + "?" + s);
        chart3.render("chartdiv3");


        var chart4 = new FusionCharts("../Javascript/fusionchart/Charts/MSStackedColumn2DLineDY.swf", "ChartId4", "100%", "400", "0", "0");
        var s = ""
                + "rnd=" + Math.random() * 4
                + "&sm=graph"
                + "&param1=4"
                + "&param2=50000"
                + "";
        chart4.setXMLUrl(localURL + "?" + s);
        chart4.render("chartdiv4");
    }


    var localURL = "Home.aspx";
    listHome();
    SearchlistHome();
    graphic1();

    function SearchlistHome() {

        var s = ""
        + "rnd=" + Math.random() * 4
        + "&sm=L"
        + "&param1=L"
        + "&param2="
        + "";
        listHome.clearAll();
        listHome.loadXML(localURL + "?" + s);
    }

    function listHome() {
        listHome = new dhtmlXGridObject('gridhome');
        listHome.setImagePath("../JavaScript/codebase/imgs/");
        listHome.setHeader("No,Nama,No Registrasi,No Pengukuran T0,Status Negosiasi,Status Verifikasi,Status Pemberkasan,Status Pembayaran,Status Finalisasi");
        listHome.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
        listHome.setInitWidths("40,150,150,180,150,150,200,200,200");
        listHome.setColAlign("left,left,left,left,left,left,left,left,left");
        listHome.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro");
        listHome.init();
        listHome.setSkin("dhx_skyblue");

        listHome.setColSorting("str,str,str,str,str,str,str,str,str");
        listHome.enablePaging(true, 15, 5, "pagehome", true);
        listHome.setPagingSkin("bricks");
    }

    </script>

<!--start main -->

</asp:Content>