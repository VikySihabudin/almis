// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.13/esri/copyright.txt for details.
//>>built
define("esri/dijit/Basemap","dojo/_base/declare dojo/_base/array dojo/_base/lang dojo/has ../kernel ../request ./BasemapLayer".split(" "),function(b,e,c,f,d,g,h){b=b(null,{declaredClass:"esri.dijit.Basemap",id:null,title:"",thumbnailUrl:null,layers:null,itemId:null,basemapGallery:null,constructor:function(a,k){a=a||{};!a.layers&&!a.itemId&&console.error("esri.dijit.Basemap: unable to find the 'layers' property in parameters");this.id=a.id;this.itemId=a.itemId;this.layers=a.layers;this.title=a.title||
"";this.thumbnailUrl=a.thumbnailUrl;this.basemapGallery=k},getLayers:function(a){if(this.layers)return this.layers;if(this.itemId)return a=g({url:(a||d.dijit._arcgisUrl)+"/content/items/"+this.itemId+"/data",content:{f:"json"},callbackParamName:"callback",error:c.hitch(this,function(a,b){if(this.basemapGallery)this.basemapGallery.onError("esri.dijit.Basemap: could not access basemap item.");else console.error("esri.dijit.Basemap: could not access basemap item.")})}),a.addCallback(c.hitch(this,function(a,
b){if(a.baseMap)return this.layers=[],e.forEach(a.baseMap.baseMapLayers,function(a){this.layers.push(new h(a))},this),this.layers;if(this.basemapGallery)this.basemapGallery.onError("esri.dijit.Basemap: could not access basemap item.");else console.error("esri.dijit.Basemap: could not access basemap item.");return[]})),a}});f("extend-esri")&&c.setObject("dijit.Basemap",b,d);return b});