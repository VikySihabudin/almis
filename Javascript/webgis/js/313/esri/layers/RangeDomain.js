// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.13/esri/copyright.txt for details.
//>>built
define("esri/layers/RangeDomain","dojo/_base/declare dojo/_base/lang dojo/has ../kernel ../lang ./Domain".split(" "),function(b,c,d,e,f,g){b=b([g],{declaredClass:"esri.layers.RangeDomain",constructor:function(a){a&&c.isObject(a)&&(this.minValue=a.range[0],this.maxValue=a.range[1])},toJson:function(){var a=this.inherited(arguments);a.range=[this.minValue,this.maxValue];return f.fixJson(a)}});d("extend-esri")&&c.setObject("layers.RangeDomain",b,e);return b});