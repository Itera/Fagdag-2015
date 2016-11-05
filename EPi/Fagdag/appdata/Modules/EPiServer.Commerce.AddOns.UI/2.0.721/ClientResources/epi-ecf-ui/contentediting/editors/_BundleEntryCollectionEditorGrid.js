//>>built
define("epi-ecf-ui/contentediting/editors/_BundleEntryCollectionEditorGrid",["dojo/_base/array","dojo/_base/declare","dojo/_base/lang","dojo/dom-construct","dojo/aspect","dojo/Deferred","dojo/when","dojo/Stateful","dijit/_Widget","dijit/_TemplatedMixin","dgrid/editor","dgrid/Selection","dijit/form/Button","dgrid/OnDemandGrid","epi/dependency","epi/string","epi/shell/_ContextMixin","epi/shell/command/builder/ButtonBuilder","epi/shell/widget/dialog/Dialog","epi/shell/dgrid/_EditorMetadataMixin","epi-cms/dgrid/DnD","epi/shell/widget/_FocusableMixin","epi/shell/widget/_ModelBindingMixin","epi/shell/widget/dialog/Confirmation","epi-cms/widget/ContentSelectorDialog","epi-cms/contentediting/editors/_AddItemDialogMixin","epi-cms/core/ContentReference","epi-cms/dgrid/WithContextMenu","epi-cms/dgrid/formatters","../ModelSupport","./_CollectionEditorDndMixin","../../dgrid/_ClickablePathColumnMixin","epi/i18n!epi/cms/nls/commerce.contentediting.editors.relationcollectioneditor"],function(_1,_2,_3,_4,_5,_6,_7,_8,_9,_a,_b,_c,_d,_e,_f,_10,_11,_12,_13,_14,DnD,_15,_16,_17,_18,_19,_1a,_1b,_1c,_1d,_1e,_1f,_20){return _2([_9,_a,_16,_19,_15,_1e,_11],{templateString:"<div>                            <div data-dojo-attach-point=\"commandTargetNode\"></div>                            <div data-dojo-attach-point=\"overlayDnd\">                                <div class=\"epi-relationCollectionEditor\" data-dojo-attach-point=\"gridNode\"></div>                            </div>                        </div>",grid:null,storeKey:"epi.commerce.relation",gridOverlayClass:"epi-grid-dnd-overlay",itemType:"EPiServer.Commerce.AddOns.UI.Rest.Models.RelationModel",allowedDndTypes:[_1d.contentTypeIdentifier.variationContent,_1d.contentTypeIdentifier.productContent,_1d.linkTypeIdentifier.relation],includedColumns:["ContentTypeIdentifier","Name","Path","Quantity","GroupName"],editableColumns:["Quantity","GroupName"],cellActionName:"epiGridAction",itemEditorType:_18,noDataMessage:_20.nodatamessage,addLabelText:_20.addlabel,postMixInProperties:function(){this.model=this.model||new this.modelType({itemType:this.itemType});},postCreate:function(){this.inherited(arguments);if(!this.roots){var _21=_f.resolve("epi.cms.contentRepositoryDescriptors"),_22=_21.catalog;this.roots=_22.roots;}var _23=new _12({settings:{showLabel:true}}),_24=this.model.getListCommand();_23.create(_24,this.gridNode);var _25=_2([_e,_c,_b,_14,_1b,DnD,_1f],{});_7(this.model.metadataManager.getMetadataForType(this.itemType),_3.hitch(this,function(_26){var _27=[{field:"contentTypeIdentifier",renderHeaderCell:function(){},get:function(_28){return _28.contentTypeIdentifier;},label:"",formatter:_1c.contentIcon,className:"epi-columnIcon16x16",sortable:false},{field:this.cellActionName,renderHeaderCell:function(){},renderCell:_3.hitch(this,function(_29,_2a,_2b,_2c){var _2d=new _12({settings:{showLabel:false}}),_2e=this.model.getCommands(this.grid,null);_1.forEach(_2e,function(_2f){_2d.create(_2f,_2b);});}),className:"epi-columnNarrow",sortable:false}],_30=_f.resolve("epi.storeregistry").get(this.storeKey),_31=this.grid=new _25({store:_30,minWidth:100,noDataMessage:this.noDataMessage,selectionMode:"single","class":"epi-plain-grid epi-plain-grid-modal epi-plain-grid--margin-bottom epi-plain-grid--cell-borders",columns:_27,metadata:{properties:_26.properties,gridIncluded:this.includedColumns,gridEditable:this.editableColumns},dndSourceTypes:[_1d.linkTypeIdentifier.relation],dndParams:{copyOnly:true,accept:this.allowedDndTypes||[],creator:_3.hitch(this,this._dndNodeCreator)}});_4.place(this.grid.domNode,this.gridNode);this.own(_31,this.model.on("itemAdded",_3.hitch(this,function(e){this.grid.refresh();})),this.model.on("itemRemoved",_3.hitch(this,function(e){this.grid.refresh();})),this.model.on("itemSaved",_3.hitch(this,function(){this.grid.refresh();})),this.model.watch("contentLink",_3.hitch(this,function(_32,_33,_34){this._updateGridQuery(_34);_31.resize();})),this.model.on("removeCommandEvent",_3.hitch(this,function(){_7(this._showConfirmation(this.deleteConfirmationTitle,this.deleteConfirmationDescription),_3.hitch(this,function(){if(this.model){var _35=[];for(var _36 in this.grid.selection){if(this.grid.selection.hasOwnProperty(_36)){_35.push(this.model.store.get(_36));}}return this.model.removeItems(_35);}}));})));this._setupDnD();_7(this.getCurrentContext(),_3.hitch(this,function(_37){this._updateGridQuery(_37.id);this.grid.startup();}));}));},_updateGridQuery:function(_38){var _39=this.getQueryOptions(_38);this.grid.set("query",_39.query,_39.options);},getQueryOptions:function(_3a){return {query:{referenceId:new _1a(_3a).createVersionUnspecificReference().toString(),relationTypes:[this.relationType]},options:{ignore:["referenceId","relationTypes"]}};},_addItem:function(_3b){_7(this._dndGetItemData(_3b),_3.hitch(this,function(_3c){return this.model.addItem(_3c);}));},resize:function(){this.inherited(arguments);if(this.grid){this.grid.resize();}},_getDialogTitleText:function(){return this.addLabelText;},_createItemEditor:function(){return new this.itemEditorType({canSelectOwnerContent:false,showButtons:false,roots:this.roots,allowedTypes:[_1d.contentTypeIdentifier.variationContent,_1d.contentTypeIdentifier.productContent],showAllLanguages:false});},_dndGetItemData:function(_3d){return _7(_3d.data,_3.hitch(this,function(_3e){return this._createItem(_3e.contentLink,_3e.name);}));},_createItem:function(_3f,_40){return {name:_40||_3f,groupName:"Default",quantity:1,sortOrder:0,source:this.model.get("contentLink"),target:_3f,type:this.relationType};},onExecuteDialog:function(){var _41=this._itemEditor.get("value");this._addItem({data:{contentLink:_41}},true);},_setValueAttr:function(_42){this._set("value",_42);if(this.model){this.model.set("contentLink",_42);}},destroy:function(){if(this.grid){this.grid.destroy();this.grid=null;}this.inherited(arguments);},_showConfirmation:function(_43,_44){var _45=new _6();var _46=new _17({destroyOnHide:true,title:_10.toHTML(_43),description:_10.toHTML(_44),onAction:function(_47){if(_47){_45.resolve();}else{_45.cancel();}}});_46.show();return _45.promise;}});});