//>>built
define("epi-ecf-ui/contentediting/editors/PackageEntryCollectionReadOnlyEditor",["dojo/_base/declare","./ReadOnlyCollectionEditor","../viewmodel/PackageEntryCollectionReadOnlyEditorModel","epi/i18n!epi/cms/nls/commerce.contentediting.editors.packageentrycollectioneditor"],function(_1,_2,_3,_4){return _1([_2],{iconClass:"epi-iconObjectPackage",modelType:_3,_renderNoDataMessage:function(){this.grid.set("noDataMessage",_4.nodatamessage);this.inherited(arguments);},changeToView:"packageview",buttonLabel:_4.editbuttontext});});