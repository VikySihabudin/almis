
require([
        "dojo/dom",
        "dojo/json",
        "dojo/on",
        "dojo/parser",
        "dojo/sniff",
        "dojo/_base/array",
        "dojo/_base/lang",

        "dojo/data/ItemFileReadStore",


        "dojox/grid/DataGrid",

        "esri/config",
        "esri/InfoTemplate",
        "esri/map",
        "esri/request",

        "esri/layers/ArcGISDynamicMapServiceLayer",
        "esri/layers/FeatureLayer",

        "esri/geometry/scaleUtils",

        "esri/renderers/SimpleRenderer",

        "esri/symbols/PictureMarkerSymbol",
        "esri/symbols/SimpleMarkerSymbol",
        "esri/symbols/SimpleLineSymbol",
        "esri/symbols/SimpleFillSymbol",

        "esri/tasks/FindTask",
        "esri/tasks/FindParameters",


       
        "dijit/registry",
        
        "esri/Color",

        

        


        "dijit/form/Button",
        "dijit/layout/BorderContainer",
        "dijit/layout/ContentPane",

        "dojo/domReady!"
      ], function (
        dom,
        JSON,
        on,
        parser, sniff, arrayUtils, lang,
        ItemFileReadStore,


        DataGrid,

       


        esriConfig,
        InfoTemplate,
        Map,
        request,

        ArcGISDynamicMapServiceLayer,
        FeatureLayer,


        scaleUtils,

        SimpleRenderer,

        PictureMarkerSymbol,
        SimpleMarkerSymbol,
        SimpleLineSymbol,
        SimpleFillSymbol,

        FindTask,
        FindParameters,





        
        
        registry,
        Color,

 
        Button

      ) {

          var findTask, findParams;
          var map, center, zoom;
          var grid, store;
          parser.parse();

          var portalUrl = "http://www.arcgis.com";

          window.onload = function () {
              on(dom.byId("uploadForm"), "change", function (event) {



                  var fileName = event.target.value.toLowerCase();

                  if (sniff("ie")) { //filename is full path in IE so extract the file name
                      var arr = fileName.split("\\");
                      fileName = arr[arr.length - 1];
                  }
                  if (fileName.indexOf(".zip") !== -1) {//is file a zip - if not notify user
                      generateFeatureCollection(fileName);
                  }
                  else {
                      dom.byId('upload-status').innerHTML = '<p style="color:red">Add shapefile as .zip file</p>';
                  }
              });
          }

          registry.byId("search").on("click", doFind);

          center = [115.5, -3.3];
          zoom = 9;
          map = new Map("map", {
              basemap: "streets",
              center: center,
              zoom: zoom
          });



          //Create Find Task using the URL of the map service to search
          findTask = new FindTask("http://192.168.0.57:6080/arcgis/rest/services/List_Persil/ADARO/MapServer/");


          map.on("load", function () {
              //Create the find parameters
              findParams = new FindParameters();
              findParams.returnGeometry = true;
              findParams.layerIds = [0];
              findParams.searchFields = ["PID"];
              findParams.outSpatialReference = map.spatialReference;
              console.log("find sr: ", findParams.outSpatialReference);
          });

          function doFind() {
              //Set the search text to the value in the box
              findParams.searchText = dom.byId("pid").value;
              findTask.execute(findParams, showResults);
          }

          function showResults(results) {
              //This function works with an array of FindResult that the task returns
              map.graphics.clear();
              var symbol = new SimpleFillSymbol(
            SimpleFillSymbol.STYLE_SOLID,
            new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID, new Color([255, 0, 0]), 2),
            new Color([255, 0, 0, 0.5])
          );

              //create array of attributes
              var items = arrayUtils.map(results, function (result) {
                  var graphic = result.feature;
                  graphic.setSymbol(symbol);
                  map.graphics.add(graphic);
                  return result.feature.attributes;
              });

              //Create data object to be used in store
              var data = {
                  identifier: "PID", //This field needs to have unique values
                  label: "Parcel ID", //Name field for display. Not pertinent to a grid but may be used elsewhere.
                  items: items
              };

              //Create data store and bind to grid.
              store = new ItemFileReadStore({
                  data: data
              });
              var grid = registry.byId("grid");
              grid.setStore(store);
              grid.on("rowclick", onRowClickHandler);

              //Zoom back to the initial map extent
              map.centerAndZoom(center, zoom);
          }

          //Zoom to the parcel when the user clicks a row
          function onRowClickHandler(evt) {
              var clickedparcelId = evt.grid.getItem(evt.rowIndex).PARCELID;
              var selectedparcel = arrayUtils.filter(map.graphics.graphics, function (graphic) {
                  return ((graphic.attributes) && graphic.attributes.PARCELID === clickedparcelId);
              });
              if (selectedparcel.length) {
                  map.setExtent(selectedparcel[0].geometry.getExtent(), true);
              }
          }

          //Dynamic layer
          // var lankom = new ArcGISDynamicMapServiceLayer("http://192.168.0.57:6080/arcgis/rest/services/List_Persil/ADARO/MapServer",{
          //   "opacity" : 0,
          //   visible : true
          // });

          var _lankomInfoTemplate = new InfoTemplate();
          _lankomInfoTemplate.setTitle("<b>Land Compensation</b>");
          var _lankomInfoContent =
            "<div class=\"demographicInfoContent\">" +
            "Parcel ID : ${PID}" +
            "<br>JPLK : ${PLK}" +
            "<br>Priority : ${Priority}" +
           " <br>Registrasi : ${Registrasi}" +
            "<br>Status Lahan : ${Status_Lhn}" +
            "<br>Nama : ${Nama}" +
            "<br>Tanggal Pngk : ${Tgl_Pngk}" +
            "<br>Desa : ${Desa}" +
            "<br>Kecamatan : ${Kec}" +
            "<br>TKabupaten : ${Kab}" +
            "<br>Desain : ${Desain}" +
            "<br>Progress : ${Progress}" +
            "<br>Penawaran : ${Penawaran}" +
            "<br>Permintaan : ${Permintaan}" +
            "<br>Zona : ${Zona}" +
            "</div>";

          _lankomInfoTemplate.setContent("${PID}<br>" +
              _lankomInfoContent);
          var lankom = new ArcGISDynamicMapServiceLayer("http://192.168.0.57:6080/arcgis/rest/services/List_Persil/ADARO/MapServer",
          {
              "opacity": 0,
              visible: true
          });
          lankom.setInfoTemplates({
              0: { infoTemplate: _lankomInfoTemplate }
          });
          map.addLayer(lankom);

          function generateFeatureCollection(fileName) {
              var name = fileName.split(".");
              //Chrome and IE add c:\fakepath to the value - we need to remove it
              //See this link for more info: http://davidwalsh.name/fakepath
              name = name[0].replace("c:\\fakepath\\", "");

              dom.byId('upload-status').innerHTML = '<b>Loading </b>' + name;

              //Define the input params for generate see the rest doc for details
              //http://www.arcgis.com/apidocs/rest/index.html?generate.html
              var params = {
                  'name': name,
                  'targetSR': map.spatialReference,
                  'maxRecordCount': 1000,
                  'enforceInputFileSizeLimit': true,
                  'enforceOutputJsonSizeLimit': true
              };
              var extent = scaleUtils.getExtentForScale(map, 40000);
              var resolution = extent.getWidth() / map.width;
              params.generalize = true;
              params.maxAllowableOffset = resolution;
              params.reducePrecision = true;
              params.numberOfDigitsAfterDecimal = 0;

              var myContent = {
                  'filetype': 'shapefile',
                  'publishParameters': JSON.stringify(params),
                  'f': 'json',
                  'callback.html': 'textarea'
              };

              //use the rest generate operation to generate a feature collection from the zipped shapefile
              request({
                  url: portalUrl + '/sharing/rest/content/features/generate',
                  content: myContent,
                  form: dom.byId('uploadForm'),
                  handleAs: 'json',
                  load: lang.hitch(this, function (response) {
                      if (response.error) {
                          errorHandler(response.error);
                          return;
                      }
                      var layerName = response.featureCollection.layers[0].layerDefinition.name;
                      dom.byId('upload-status').innerHTML = '<b>Loaded: </b>' + layerName;
                      addShapefileToMap(response.featureCollection);
                  }),
                  error: lang.hitch(this, errorHandler)
              });

              //alert('hanny');

          }

          function errorHandler(error) {
              dom.byId('upload-status').innerHTML =
            "<p style='color:red'>" + error.message + "</p>";
          }

          function addShapefileToMap(featureCollection) {
              //add the shapefile to the map and zoom to the feature collection extent
              //If you want to persist the feature collection when you reload browser you could store the collection in
              //local storage by serializing the layer using featureLayer.toJson()  see the 'Feature Collection in Local Storage' sample
              //for an example of how to work with local storage.


              var fullExtent;
              var layers = [];

              arrayUtils.forEach(featureCollection.layers, function (layer) {
                  var infoTemplate = new InfoTemplate("Details", "${*}");
                  var featureLayer = new FeatureLayer(layer, {
                      infoTemplate: infoTemplate
                  });
                  //associate the feature with the popup on click to enable highlight and zoom to
                  featureLayer.on('click', function (event) {
                      map.infoWindow.setFeatures([event.graphic]);
                  });
                  //change default symbol if desired. Comment this out and the layer will draw with the default symbology
                  changeRenderer(featureLayer);
                  fullExtent = fullExtent ?
                fullExtent.union(featureLayer.fullExtent) : featureLayer.fullExtent;
                  layers.push(featureLayer);
              });

              map.addLayers(layers);

              map.setExtent(fullExtent.expand(1.25), true);

              dom.byId('upload-status').innerHTML = "";
          }
          function changeRenderer(layer) {
              //change the default symbol for the feature collection for polygons and points
              var symbol = null;
              switch (layer.geometryType) {
                  case 'esriGeometryPoint':
                      symbol = new PictureMarkerSymbol({
                          'angle': 0,
                          'xoffset': 0,
                          'yoffset': 0,
                          'type': 'esriPMS',
                          'url': 'http://static.arcgis.com/images/Symbols/Shapes/BluePin1LargeB.png',
                          'contentType': 'image/png',
                          'width': 20,
                          'height': 20
                      });
                      break;
                  case 'esriGeometryPolygon':
                      symbol = new SimpleFillSymbol(SimpleFillSymbol.STYLE_SOLID,
                  new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID,
                    new Color([112, 112, 112]), 1), new Color([136, 136, 136, 0.25]));
                      break;
              }
              if (symbol) {
                  layer.setRenderer(new SimpleRenderer(symbol));

              }
          }

      });
     