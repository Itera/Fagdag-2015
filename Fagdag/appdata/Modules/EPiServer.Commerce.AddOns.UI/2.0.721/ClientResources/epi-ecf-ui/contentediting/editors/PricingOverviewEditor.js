//>>built
define("epi-ecf-ui/contentediting/editors/PricingOverviewEditor",["dojo/_base/array","dojo/_base/declare","dojo/_base/lang","dojo/Deferred","dojo/dom-construct","dojo/Stateful","dojo/when","dijit/layout/_LayoutWidget","dijit/_TemplatedMixin","dijit/focus","dojox/html/entities","dgrid/OnDemandGrid","dgrid/Selection","dgrid/extensions/ColumnResizer","dgrid/editor","epi/dependency","epi/string","epi/shell/_ContextMixin","epi/shell/dgrid/_EditorMetadataMixin","epi/shell/widget/_FocusableMixin","epi/shell/widget/_ModelBindingMixin","epi/shell/widget/dialog/Confirmation","epi-cms/dgrid/WithContextMenu","epi-cms/dgrid/formatters","../viewmodel/PricingOverviewEditorModel","./SaleCodeEditor","./MoneyEditor","epi/i18n!epi/cms/nls/commerce.widget.pricingoverview.grid","epi/i18n!epi/cms/nls/commerce.widget.pricecollection.message"],function(_1,_2,_3,_4,_5,_6,_7,_8,_9,_a,_b,_c,_d,_e,_f,_10,_11,_12,_13,_14,_15,_16,_17,_18,_19,_1a,_1b,_1c,_1d){return _2([_8,_9,_15,_14,_12],{templateString:"<div class=\"epi-pricingOverviewEditor\" data-dojo-attach-point=\"gridNode\"></div>",grid:null,modelType:_19,itemType:"EPiServer.Commerce.AddOns.UI.ObjectEditing.InternalMetadata.PriceModel",includedColumns:["Name","Code","MarketId","PriceType","MinQuantity","PriceCode","UnitPrice","ValidDate"],editableColumns:["MarketId","PriceType","MinQuantity","PriceCode","UnitPrice","ValidDate"],postMixInProperties:function(){this.model=this.model||new this.modelType({itemType:this.itemType});},postCreate:function(){this.inherited(arguments);var _1e=_2([_c,_d,_f,_13,_e,_17],{getColumnDefinition:function(_1f){var _20=this.inherited(arguments);if(_20.field!=="unitPrice"&&_1f.selections&&_1f.selections.length>0){_20.renderCell=this._renderSelectorValue(_1f.selections);}return _20;},_renderSelectorValue:function(_21){return _3.hitch(this,function(_22,_23,_24,_25){_21.some(function(_26){if(_26.value===_23){_24.innerHTML=typeof _26.text==="string"?_b.encode(_26.text):_26.text;return true;}});if(!_24.innerHTML){_24.innerHTML=typeof _23==="string"?_b.encode(_23):_23;}});}});_7(this.model.metadataManager.getMetadataForType(this.itemType),_3.hitch(this,function(_27){var _28=[{field:"epiGridAction",renderHeaderCell:function(){},formatter:function(){return _18.menu({title:_1c.commands.title});},className:"epi-columnNarrow",sortable:false}],_29=_10.resolve("epi.storeregistry").get("epi.commerce.price"),_2a=this.grid=new _1e({selectionMode:"single",store:_29,minWidth:100,noDataMessage:_1c.nodatamessage,"class":"epi-plain-grid",columns:_28,metadata:{properties:_27.properties,gridIncluded:this.includedColumns,gridEditable:this.editableColumns}});this.model.generateFormatters(_2a.columns);_5.place(this.grid.domNode,this.gridNode);this._setupEvents(_2a);this._setupContextMenu();_7(this.getCurrentContext(),_3.hitch(this,function(_2b){if(this.model.get("contentLink")!==_2b.id){this.set("value",_2b.id);}else{this._updateGridQuery(_2a);}_2a.startup();}));}));this._setMarkets();},_setupEvents:function(_2c){var _2d=2;this.own(_2c,_2c.on("dgrid-editor-show",_3.hitch(this,function(e){if(e.editor instanceof _1a){e.editor.showDropDown(e.cell.row.data.priceType==_2d);}else{if(e.editor instanceof _1b){this._setCurrencySelections(e);}}})),_2c.on("dgrid-datachange",_3.hitch(this,function(e){if(e.cell.column.field=="priceType"&&(e.value==_2d||e.oldValue==_2d)){e.cell.row.data.priceCode="";}if(e.cell.column.field=="unitPrice"&&(isNaN(e.value.amount)||e.value.amount<0)){e.preventDefault();}})),this.model.watch("contentLink",_3.hitch(this,this._changeGridQuery)),this.model.watch("marketId",_3.hitch(this,this._changeGridQuery)),this.model.watch("priceCode",_3.hitch(this,this._changeGridQuery)),this.model.on("itemAdded",_3.hitch(this,function(e){_7(this.grid.refresh(),_3.hitch(this,function(){var _2e=this.grid.row(e.id);if(_2e){var _2f=_2e.element.parentNode;_2e=this.grid.insertRow(_2e.data,_2f,_2f.firstChild,1,{});this.grid.select(_2e);_a.focus(this.grid.domNode);}}));})),this.model.on("itemsRemoved",_3.hitch(this,function(e){this.grid.refresh();})),this.model.on("removeCommandEvent",_3.hitch(this,function(){_7(this._showConfirmation(_1c.deleteconfirmation.pricetitle,_1c.deleteconfirmation.pricedescription),_3.hitch(this,function(){if(this.model){var _30=[];for(var _31 in this.grid.selection){if(this.grid.selection.hasOwnProperty(_31)){_30.push(this.model.store.get(_31));}}return this.model.removeItems(_30);}}));})),this.model.on("duplicateCommandEvent",_3.hitch(this,function(){var row=this._getSelectedRow(),_32=row.data,_33=row.element;if(_32&&this.model){var _34=_3.clone(_32);delete _34.id;this.model.addItem(_34);}})));},_updateGridQuery:function(_35){var _36=this.model._createQueryOptions();_35.set("query",_36.query,_36.options);},_changeGridQuery:function(_37,_38,_39){if(_38!==_39){this._updateGridQuery(this.grid);}},_setCurrencySelections:function(e){var _3a=e.cell.row.data.unitPrice.currency;var _3b=null;_1.some(e.editor.get("selections"),function(_3c){if(_3c.value==_3a){_3b=_3c;return true;}});var _3d=this._getMarket(e.cell.row.data.marketId);if(_3d){var _3e=_3d["currencies"].slice(0);if(_3b){var _3f=_1.some(_3e,function(_40){return _40.value==_3b.value;});if(!_3f){_3e.push(_3b);}}e.editor.set("selections",_3e);e.editor.set("value",e.cell.row.data.unitPrice);}},_setupContextMenu:function(){this.commands=this.model.getCommands(this.grid,"context");this.grid.contextMenu.addProvider(new _6({commands:this.commands}));},_setMarkets:function(){if(!this.get("markets")){var _41=_10.resolve("epi.storeregistry").get("epi.commerce.market");_41.query().then(_3.hitch(this,function(_42){this.set("markets",_42);}));}},_getMarket:function(_43){var _44=this.get("markets"),_45=null;_1.some(_44,function(m){if(m.id==_43){_45=m;return true;}});return _45;},_getSelectedRow:function(){return this.grid.row(this._getSelectedRowId());},_getSelectedRowId:function(){for(var id in this.grid.selection){return id;}},_noDataMessage:_1c.nodatamessage,_setValueAttr:function(_46){this._set("value",_46);if(this.model){this.model.set("contentLink",_46);}},_setMarketIdAttr:function(_47){this.model.set("marketId",_47);},_setPriceCodeAttr:function(_48){this.model.set("priceCode",_48);},_showConfirmation:function(_49,_4a){var _4b=new _4();var _4c=new _16({destroyOnHide:true,title:_11.toHTML(_49),description:_11.toHTML(_4a),onAction:function(_4d){if(_4d){_4b.resolve();}else{_4b.cancel();}}});_4c.show();return _4b.promise;},addPrice:function(_4e){var _4f=this.get("markets");if(!_4e.marketId&&_4f&&_4f.length>0){var _50=_4f[0];_4e=_3.mixin(_4e,{marketId:_50.id,currency:_50.currencies[0].value});}return this.model.addItem(_4e);}});});