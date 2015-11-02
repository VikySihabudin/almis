var lookupgrid = null;
var lt = "";
var lps = "";
var lts = "";
var ls = "";

function lookupOpen(lookupType,lookupParams,lookupTargets,lookupSearch)
{
    var url = ''; var params = '';
    
    lt = lookupType; lps = lookupParams; lts = lookupTargets; ls = lookupSearch;
    url = '../Pages/Lookup.aspx';
    params = 'rnd=' + Math.random()*4
           + '&lt=' + lt
           + '&lps=' + lps
           + '&lts=' + lts
           + '&ls=' + ls
           + '';

    showDiv('lookup');
	initLookupGrid();
    //alert(params);
	lookupgrid.clearAll();

}

function lookupOpen2(lookupType, lookupParams, lookupTargets, lookupSearch) {
    var url = ''; var params = '';

    lt = lookupType; lps = lookupParams; lts = lookupTargets; ls = lookupSearch;
    url = '../Pages/Lookup.aspx';
    params = 'rnd=' + Math.random() * 4
           + '&lt=' + lt
           + '&lps=' + lps
           + '&lts=' + lts
           + '&ls=' + ls
           + '';

    showDiv('lookup2');
    initLookupGrid2();
    //alert(params);
    lookupgrid2.clearAll();

}

function lookupSearch(lookupSearch)
{
    ls = lookupSearch;
    url = '../Pages/Lookup.aspx';
    params = 'rnd=' + Math.random()*4
           + '&lt=' + lt
           + '&lps=' + lps
           + '&lts=' + lts
           + '&ls=' + ls
           + '';
    lookupgrid.clearAll();
    centerLoadingImage();
    lookupgrid.loadXML(url+'?'+params ,function()
			{
				hideLoadingImageLookUp();
				});
}

function lookupSearch2(lookupSearch) {
    ls = lookupSearch;
    url = '../Pages/Lookup.aspx';
    params = 'rnd=' + Math.random() * 4
           + '&lt=' + lt
           + '&lps=' + lps
           + '&lts=' + lts
           + '&ls=' + ls
           + '';
    lookupgrid2.clearAll();
    centerLoadingImage();
    lookupgrid2.loadXML(url + '?' + params, function () {
        hideLoadingImageLookUp2();
    });
}

function bindToTarget(id)
{
    var controls = new Array();
    controls = lts.split(",");
    try
    {
        for (var i=0;i<controls.length - 1;i++)
        {
//            var element = controls[i];
            var element = document.getElementById(controls[i]);

//            if(element.type=="text" || element.type=="hidden")
//			{
				element.value = lookupgrid.cells(id, 1 + i).getValue();
				if(element.type=="text")
				element.focus();
//			}
//			else if(element.type=="select-one")
//				this.setDropDownList(element,this.Grid.cells(id, i+1).getValue());
//			else
//			    element.value = lookupgrid.cells(id, i + 1).getValue();
        }
    }
    catch(ex)
    {
        alert(ex.description);
    }
}

function bindToTarget2(id) {
    var controls = new Array();
    controls = lts.split(",");
    try {
        for (var i = 0; i < controls.length - 1; i++) {
            //            var element = controls[i];
            var element = document.getElementById(controls[i]);

            //            if(element.type=="text" || element.type=="hidden")
            //			{
            element.value = lookupgrid2.cells(id, 1 + i).getValue();
            if (element.type == "text")
                element.focus();
            //			}
            //			else if(element.type=="select-one")
            //				this.setDropDownList(element,this.Grid.cells(id, i+1).getValue());
            //			else
            //			    element.value = lookupgrid.cells(id, i + 1).getValue();
        }
    }
    catch (ex) {
        alert(ex.description);
    }
}

function outputResponse(loader)
{
    if (loader.xmlDoc.responseText != null)
        alert('We Got Response\n\n' + loader.doSerialization() + ' ' + loader.xmlDoc.responseText);
    else
        alert('Response contains no XML');
}

function showDiv(idDiv)
{
    try
    {
        var obj = null;
        var x = null; var y = null;
		document.getElementById('lookupKey').value = '';
        obj = document.getElementById(idDiv);
        obj.style.width = "500px";
        obj.style.height = "300px";
        obj.style.backgroundColor = "#dfdfdf";
        obj.style.border = "solid 1 #000000";
        obj.style.zIndex = "9999";
        obj.style.position = "fixed";
        obj.style.display = "block";
        obj.style.visibility = "visible";
        goToCenter(idDiv);
        showBackLookup();
        //initLookupGrid(url);
    }
    catch(e)
    {
        alert(e.description);
    }
}

function showDiv2(idDiv) {
    try {
        var obj = null;
        var x = null; var y = null;
        document.getElementById('lookupKey2').value = '';
        obj = document.getElementById(idDiv);
        obj.style.width = "500px";
        obj.style.height = "300px";
        obj.style.backgroundColor = "#dfdfdf";
        obj.style.border = "solid 1 #000000";
        obj.style.zIndex = "9999";
        obj.style.position = "fixed";
        obj.style.display = "block";
        obj.style.visibility = "visible";
        goToCenter(idDiv);
        showBackLookup();
        //initLookupGrid(url);
    }
    catch (e) {
        alert(e.description);
    }
}

function initLookupGrid()
{
    lookupgrid = new dhtmlXGridObject('gridLookup');
    lookupgrid.setImagePath("../JavaScript/codebase/imgs/");
    lookupgrid.setHeader("No,ID,Nama, Alamat");
    lookupgrid.setInitWidths("50,80,80,200");
    lookupgrid.setColAlign("center,left,left,left");
    lookupgrid.setColTypes("ro,ro,ro,ro");
    lookupgrid.setColSorting("str,str,str,str");
    lookupgrid.setSkin("dhx_skyblue");
    lookupgrid.attachEvent("onRowSelect",onRowSelected);
    lookupgrid.init();
//    if (url=='') url = '../Commons/Lookup.aspx';
//    lookupgrid.loadXML(url);
}

function initLookupGrid2() {
    lookupgrid2 = new dhtmlXGridObject('gridLookup2');
    lookupgrid2.setImagePath("../JavaScript/codebase/imgs/");
    lookupgrid2.setHeader("No,ID,Nama, Alamat");
    lookupgrid2.setInitWidths("50,80,80,200");
    lookupgrid2.setColAlign("center,left,left,left");
    lookupgrid2.setColTypes("ro,ro,ro,ro");
    lookupgrid2.setColSorting("str,str,str,str");
    lookupgrid2.setSkin("dhx_skyblue");
    lookupgrid2.attachEvent("onRowSelect", onRowSelected2);
    lookupgrid2.init();
    //    if (url=='') url = '../Commons/Lookup.aspx';
    //    lookupgrid.loadXML(url);
}

function onRowSelected(rowId, cellIndex) {
    bindToTarget(rowId);
    hideLookup('lookup');
}

function onRowSelected2(rowId, cellIndex) {
    bindToTarget2(rowId);
    hideLookup('lookup2');
}

function goToCenter(idDiv)
{
    var obj = null;
    obj = document.getElementById(idDiv);
    x = (screen.availWidth / 2) - 250;
    y = (screen.height / 2) - 300;
    obj.style.marginLeft = x + "px";
    obj.style.marginTop = y + "px";
}

function goImgToCenter(idDiv)
{
    var obj = null;
    obj = document.getElementById(idDiv);
    x = (screen.availWidth / 2) - 150;
    y = (screen.height / 2) - 200;
    obj.style.marginLeft = x + "px";
    obj.style.marginTop = y + "px";
   // alert(x);
}

function hideLookup(idDiv)
{
    try
    {
        var obj = null;
        var x = null; var y = null;
        obj = document.getElementById(idDiv);
        obj.style.width = "0px";
        obj.style.height = "0px";
        obj.style.backgroundColor = "#dfdfdf";
        obj.style.border = "solid 1 #000000";
        obj.style.zIndex = "-1";
        obj.style.position = "fixed";
        obj.style.display = "block";
        obj.style.visibility = "hidden";
        hideBackLookup();
        hideBackLookup2();
    }
    catch(e)
    {
        alert(e.description);
    }
}



function showBackLookup() {
    var obj = null;
    var x = null; var y = null;
    obj = document.getElementById('backLookup');
    obj.style.width = screen.availWidth + "px";
    obj.style.height = screen.availHeight + "px";
    obj.style.left = "0px";
    obj.style.top = "0px";
    obj.style.zIndex = "9998";
    obj.style.position = "fixed";
    obj.style.display = "block";
    obj.style.visibility = "visible";
}

function showBackLookup2() {
    var obj = null;
    var x = null; var y = null;
    obj = document.getElementById('backLookup2');
    obj.style.width = screen.availWidth + "px";
    obj.style.height = screen.availHeight + "px";
    obj.style.left = "0px";
    obj.style.top = "0px";
    obj.style.zIndex = "9998";
    obj.style.position = "fixed";
    obj.style.display = "block";
    obj.style.visibility = "visible";
}

function centerLoadingImage() {
    var obj = null;
    obj = document.getElementById('loadDiv');
    obj.style.width = "100px";
    obj.style.height = "100px";
    obj.style.backgroundColor = "#dfdfdf";
    obj.style.border = "solid 1 #000000";
    obj.style.zIndex = "9999";
    obj.style.position = "fixed";
    obj.style.display = "block";
    obj.style.visibility = "visible";
    goImgToCenter('loadDiv');
    showBackLookup();
    //    goToCenter("loadDiv");
    //    obj.style.zIndex = "9999";
}



function centerLoadingImage2() {
    var obj = null;
    obj = document.getElementById('loadDiv2');
    obj.style.width = "100px";
    obj.style.height = "100px";
    obj.style.backgroundColor = "#dfdfdf";
    obj.style.border = "solid 1 #000000";
    obj.style.zIndex = "9999";
    obj.style.position = "fixed";
    obj.style.display = "block";
    obj.style.visibility = "visible";
    goImgToCenter('loadDiv2');
    showBackLookup();
    //    goToCenter("loadDiv");
    //    obj.style.zIndex = "9999";
}

function hideLoadingImage()
{
    var obj = null;
    obj = document.getElementById('loadDiv');
    obj.style.width = "0px";
    obj.style.height = "0px";
    obj.style.left = "0px";
    obj.style.top = "0px";
    obj.style.zIndex = "-1";
    obj.style.position = "fixed";
    obj.style.display = "block";
    obj.style.visibility = "hidden";
    hideBackLookup();
}

function hideLoadingImage2() {
    var obj = null;
    obj = document.getElementById('loadDiv2');
    obj.style.width = "0px";
    obj.style.height = "0px";
    obj.style.left = "0px";
    obj.style.top = "0px";
    obj.style.zIndex = "-1";
    obj.style.position = "fixed";
    obj.style.display = "block";
    obj.style.visibility = "hidden";
    hideBackLookup();
}
function hideBackLookup()
{
    var obj = null;
    var x = null; var y = null;
    obj = document.getElementById('backLookup');
    obj.style.width = "0px";
    obj.style.height = "0px";
    obj.style.left = "0px";
    obj.style.top = "0px";
    obj.style.zIndex = "-1";
    obj.style.position = "fixed";
    obj.style.display = "block";
    obj.style.visibility = "hidden";
}

function hideBackLookup2() {
    var obj = null;
    var x = null; var y = null;
    obj = document.getElementById('backLookup2');
    obj.style.width = "0px";
    obj.style.height = "0px";
    obj.style.left = "0px";
    obj.style.top = "0px";
    obj.style.zIndex = "-1";
    obj.style.position = "fixed";
    obj.style.display = "block";
    obj.style.visibility = "hidden";
}
function hideLoadingImageLookUp()
{
    var obj = null;
    obj = document.getElementById('loadDiv');
    obj.style.width = "0px";
    obj.style.height = "0px";
    obj.style.left = "0px";
    obj.style.top = "0px";
    obj.style.zIndex = "-1";
    obj.style.position = "fixed";
    obj.style.display = "block";
    obj.style.visibility = "hidden";
    showBackLookup();
}

function hideLoadingImageLookUp2() {
    var obj = null;
    obj = document.getElementById('loadDiv2');
    obj.style.width = "0px";
    obj.style.height = "0px";
    obj.style.left = "0px";
    obj.style.top = "0px";
    obj.style.zIndex = "-1";
    obj.style.position = "fixed";
    obj.style.display = "block";
    obj.style.visibility = "hidden";
    showBackLookup2();
}