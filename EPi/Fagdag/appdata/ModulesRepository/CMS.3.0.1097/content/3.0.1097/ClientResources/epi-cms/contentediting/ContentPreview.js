//>>built
define("epi-cms/contentediting/ContentPreview",["dojo/_base/declare","epi-cms/contentediting/_View"],function(_1,_2){return _1([_2],{noPreview:true,constructor:function(){this.defaultQueryParameters={};},startup:function(){this.inherited(arguments);this.overlay.set("enabled",true);this.iframeWithOverlay.set("previewClass","epi-editorViewport-preview--previewing");},destroy:function(){this.iframeWithOverlay.set("previewClass","");this.inherited(arguments);}});});