// All material copyright ESRI, All Rights Reserved, unless otherwise specified.
// See http://js.arcgis.com/3.13/esri/copyright.txt for details.
//>>built
define("esri/dijit/metadata/base/ValidationTracker","dojo/_base/declare dojo/_base/lang dojo/_base/array dojo/has dijit/_WidgetBase ../../../kernel".split(" "),function(a,d,h,e,f,g){a=a([f],{documentTitle:null,hadValidationErrors:!1,ignoreErrors:!1,isSaveAsDraft:!1,validationPane:null,postCreate:function(){this.inherited(arguments)},handleValidationError:function(a,b,c){this.ignoreErrors||(this.isSaveAsDraft?a.isDocumentTitle&&(this.hadValidationErrors=!0,this.validationPane.addWarning(b,c)):(this.hadValidationErrors=
!0,this.validationPane.addWarning(b,c)))},whenComplete:function(){this.validationPane&&this.validationPane.whenComplete()}});e("extend-esri")&&d.setObject("dijit.metadata.base.ValidationTracker",a,g);return a});