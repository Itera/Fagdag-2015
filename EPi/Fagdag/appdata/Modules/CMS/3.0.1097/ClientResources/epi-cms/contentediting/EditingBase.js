//>>built
define("epi-cms/contentediting/EditingBase",["dojo/_base/array","dojo/_base/connect","dojo/_base/declare","dojo/_base/Deferred","dojo/_base/event","dojo/_base/json","dojo/_base/lang","dojo/aspect","dojo/date/stamp","dojo/dom-attr","dojo/on","dojo/query","dojo/topic","dojo/when","dijit/_Widget","epi/dependency","epi/datetime","epi/string","epi/Url","epi/shell/DestroyableByKey","epi-cms/contentediting/_View","epi-cms/contentediting/AutoSaveButton","epi-cms/contentediting/MappingManager","epi-cms/contentediting/RenderManager","epi-cms/contentediting/UpdateController","epi-cms/widget/overlay/overlayFactory","epi/i18n!epi/cms/nls/episerver.cms.contentediting"],function(_1,_2,_3,_4,_5,_6,_7,_8,_9,_a,on,_b,_c,_d,_e,_f,_10,_11,Url,_12,_13,_14,_15,_16,_17,_18,res){return _3([_13,_12],{toolbar:null,editorFactory:null,syncInterval:10000,activePropertyOnStartup:null,createOverlays:true,_renderManager:null,_mappingManager:null,_activeEditorWrapper:null,_autoSaveButton:null,_reloadRequiredProperty:null,_eventHandlers:null,constructor:function(){this.defaultQueryParameters={epieditmode:true};},postMixInProperties:function(){this.inherited(arguments);this.editorFactory=this.editorFactory||_f.resolve("epi.cms.contentediting.EditorFactory");this._mappingManager=new _15();this._eventHandlers=[];},postCreate:function(){this.inherited(arguments);if(this.syncInterval>0){this._syncIntervalId=window.setInterval(_7.hitch(this,"_save"),this.syncInterval);}this.subscribe("/epi/cms/action/save",this._save);this.subscribe("/epi/cms/action/undo",this._undo);this.subscribe("/epi/cms/action/redo",this._redo);this.subscribe("/epi/cms/action/disableundoredoactions",this._toggleUndoRedoActions);},destroy:function(){this._unwatchViewModelHandles();this._stopActiveEditorWrapper();if(this._renderManager){this._renderManager.destroy();}if(this._autoSaveButton){this._autoSaveButton.destroyRecursive();}this._mappingManager.clear();if(this.toolbar){this.toolbar=null;}if(this._syncIntervalId){clearInterval(this._syncIntervalId);}this.inherited(arguments);},_setCommandEnabled:function(_19,_1a){if(this.toolbar){this.toolbar.setItemProperty(_19,"disabled",!_1a);}},onContentLinkSyncChange:function(){this.inherited(arguments);this._setButtonState();},_setViewModelAttr:function(_1b){if(_1b===this.viewModel){return;}this.inherited(arguments);this.destroyByKey("viewModel");this.ownByKey("viewModel",_2.connect(this.viewModel,"onContentChange",this,this._stopActiveEditorWrapper));this.ownByKey("viewModel",_2.connect(this.viewModel,"onSetActiveProperty",this,this.onSetActiveProperty));this.ownByKey("viewModel",_c.subscribe("/dnd/start",_7.hitch(this.viewModel,"beginOperation")));this.ownByKey("viewModel",_c.subscribe("/dnd/stop",_7.hitch(this,function(){if(this._activeEditorWrapper){return;}this.viewModel.endOperation();})));},_stopActiveEditorWrapper:function(){if(this._activeEditorWrapper!=null){_d(this._activeEditorWrapper.tryToStopEditing(),_7.hitch(this,function(){this._activeEditorWrapper=null;}));}},onSetActiveProperty:function(_1c){var _1d=this._mappingManager.findOne("propertyName",_1c);if(_1d){if(_1d.wrapper){_1d.wrapper.startEdit();}else{if(_1d.overlayItem){this._onOverlayItemClick(_1d.overlayItem);}}}},onPreviewReady:function(_1e,doc){if(_1e!=this.viewModel){this.set("viewModel",_1e);this.setupEditMode(doc);}else{if(_1e){this.remapEditMode(doc);}}},_setButtonState:function(){this._setCommandEnabled("reverttopublished",this.viewModel&&!this.viewModel.contentData.isPendingPublish);},setupEditMode:function(doc){this.viewModel.getContentModelAndMetadata().then(_7.hitch(this,function(){this._mappingManager.clear();this._renderManager=new _16();if(this.toolbar&&!this._autoSaveButton){this._autoSaveButton=new _14({button:this.toolbar._getWidget("autosave")});}this.own(_8.after(this._autoSaveButton,"onLayoutChanged",_7.hitch(this,function(){this.mainLayoutContainer.layout();})));this._autoSaveButton.set("model",this.viewModel);var _1f=_7.hitch(this,function(){this._toggleUndoRedoActions(this.viewModel.hasUndoSteps,this.viewModel.hasRedoSteps);});this.viewModel.resetNotifications();this._unwatchViewModelHandles();this._viewModelHandles=[this.viewModel.watch("hasUndoSteps",_1f),this.viewModel.watch("hasRedoSteps",_1f)];_1f();this.onReadySetupEditMode(doc);this._setButtonState();this.onPrepareOverlayComplete();}));},remapEditMode:function(doc){this.viewModel.getMetadataThenUpdateModel().then(_7.hitch(this,function(){this._renderManager.resume();if(doc){setTimeout(_7.hitch(this,function(){this._remapUpdateControllers(doc);this.onPrepareOverlayComplete();this._toggleUndoRedoActions(this.viewModel.hasUndoSteps,this.viewModel.hasRedoSteps);this._autoSaveButton.set("model",this.viewModel);}),1);}}));},_unwatchViewModelHandles:function(){if(this._viewModelHandles){_1.forEach(this._viewModelHandles,function(_20){_20.unwatch();});this._viewModelHandles=null;}},onReadySetupEditMode:function(doc){this._createUpdateControllers(doc);},onSetupEditModeComplete:function(){if(this.activePropertyOnStartup){this.onSetActiveProperty(this.activePropertyOnStartup);this.activePropertyOnStartup=null;}},_getPropertyNodes:function(doc){var _21=_b("[data-epi-property-name]",doc);var _22=_b("[data-epi-property-name] [data-epi-property-name]",doc);return _1.filter(_21,function(_23){return _22.indexOf(_23)===-1;});},_getEditableNodes:function(doc){if(!doc||!this.viewModel.canChangeContent()){return [];}var _24=this._getPropertyNodes(doc);var _25=[];_1.forEach(_24,function(_26){var _27=_11.pascalToCamel(_a.get(_26,"data-epi-property-name"));var _28=this.viewModel.getPropertyMetaData(_27);if(!_28){return;}var _29=_11.pascalToCamel(_28.name);var _2a=_a.get(_26,"data-epi-property-display-name");if(_2a){_28=_7.delegate(_28,{displayName:_2a});}if(_28!=null&&_28.showForEdit){var _2b={cacheResults:true,rerenderOnCancel:false,propertyRenderSettings:_a.get(_26,"data-epi-property-rendersettings")||undefined,useMvc:_a.has(_26,"data-epi-use-mvc")?_a.get(_26,"data-epi-use-mvc").toLowerCase()==="true":false};_2b=_7.mixin(_2b,_28.additionalValues.renderSettings);var _2c=_a.has(_26,"data-epi-property-editorsettings")?_6.fromJson(_a.get(_26,"data-epi-property-editorsettings")):null;var _2d=_a.has(_26,"data-epi-property-overlaysettings")?_6.fromJson(_a.get(_26,"data-epi-property-overlaysettings")):null;_2d=_7.mixin(_2d,_28.overlaySettings);_25.push({node:_26,disabled:(_a.get(_26,"data-epi-disabled")=="true"),useOverlay:(_a.get(_26,"data-epi-useoverlay")=="true"),overlayZIndex:parseInt(_a.get(_26,"data-epi-overlay-z-index"),10)||0,property:{name:_29,contentLink:this.viewModel.contentLink,contentModel:this.viewModel.contentModel,type:_a.get(_26,"data-epi-property-type"),wrapperType:_a.get(_26,"data-epi-property-edittype"),editorParams:_2c,overlayParams:_2d,editorWidgetType:_a.get(_26,"data-epi-property-editor"),renderSettings:_2b,rendererClass:(_a.get(_26,"data-epi-property-render")==="client")?"epi.cms.contentediting.ClientRenderer":_28.customEditorSettings.rendererClass,metadata:_28,propertyNodeName:_27}});}},this);_25.sort(function(a,b){if(a.overlayZIndex<b.overlayZIndex){return -1;}else{if(a.overlayZIndex>b.overlayZIndex){return 1;}else{return 0;}}});return _25;},_createUpdateControllers:function(doc){var _2e=this._createFullPageUpdateController(doc);if(_2e){this._connectUpdateControllerAndOverlayEvents(_2e,null);this._mappingManager.add({updateController:_2e});}var _2f=this._getEditableNodes(doc);_1.forEach(_2f,function(_30){var _31=_30.property;var _32=_30.node.innerHTML;var _33=this._createNodeUpdateController(_30);_d(this._createNodeOverlay(_30),_7.hitch(this,function(_34){this._connectUpdateControllerAndOverlayEvents(_33,_34);this._mappingManager.add({blockPropertyInfo:_31,node:_30.node,updateController:_33,overlayItem:_34});}));this._renderManager.cacheRender(_31.name,_31.renderSettings,this.viewModel.getProperty(_31.name),_32);},this);},_createNodeOverlay:function(_35){var _36=new _4();if(!this.createOverlays){_36.resolve(null);return _36;}_d(_18.create(_35),_7.hitch(this,function(_37){this.overlay.addChild(_37);_36.resolve(_37);}));return _36;},_createNodeUpdateController:function(_38){var _39=_38.property;var _3a=_39.metadata;var _3b=new _17({displayName:_3a.displayName,renderManager:this._renderManager,contentModel:_39.contentModel,contentLink:_39.contentLink,modelPropertyName:_39.name,nodePropertyName:_39.propertyNodeName,renderSettings:_39.renderSettings,rendererClass:_39.rendererClass,displayNode:_38.node});return _3b;},_createFullPageUpdateController:function(doc){var _3c=[];if(doc){var _3d=_b("input[data-epi-full-refresh-property-names][type='hidden']",doc);_1.forEach(_3d,function(tag){_1.forEach(_a.get(tag,"data-epi-full-refresh-property-names").split(","),function(_3e){if(!_1.some(_3c,function(p){return p===_3e;})){_3c.push(_11.pascalToCamel(_3e));}});});}_1.forEach(this.viewModel.metadata.properties,function(_3f){if(_3f.additionalValues["reloadOnChange"]===true){_3c.push(_11.pascalToCamel(_3f.name));}});if(!_3c.length){return null;}var _40=new _17({displayName:"",renderManager:this._renderManager,contentModel:this.viewModel.contentModel,modelPropertyName:_3c,renderSettings:{isFullReload:true}});return _40;},_remapUpdateControllers:function(doc){var _41=this._getEditableNodes(doc);var _42=this._mappingManager.remap(_41);_1.forEach(_42,function(_43){var _44=_43.property;var _45=this._createNodeUpdateController(_43);var _46=this._mappingManager.find(function(m){return (m.updateController===undefined||m.updateController===null)&&(m.propertyName.indexOf(_44.name)===0);});_d(this._createNodeOverlay(_43),_7.hitch(this,function(_47){this._connectUpdateControllerAndOverlayEvents(_45,_47);if(_46&&_46.length){this._mappingManager.update(_46[0],{updateController:_45,overlayItem:_47,node:_43.node});}else{this._mappingManager.add({blockPropertyInfo:_44,node:_43.node,updateController:_45,overlayItem:_47});}}));this._renderManager.cacheRender(_44.name,_44.renderSettings,this.viewModel.getProperty(_44.name),_43.node.innerHTML);},this);var _48=this._createFullPageUpdateController(doc);if(_48){this._connectUpdateControllerAndOverlayEvents(_48,null);this._mappingManager.add({updateController:_48});}},_connectUpdateControllerAndOverlayEvents:function(_49,_4a){if(_49){this.connect(_49,"onReloadRequired",this._onBlockReloadRequired);this.connect(_49,"onRender",this._onBlockRender);}if(_4a){this.connect(_4a,"onClick",this._onOverlayItemClick);this.connect(_4a,"onValueChange",function(_4b){this._onOverlayValueChange(_4a,_4b);});}},_getEditor:function(_4c){var _4d=this._mappingManager.findOne("overlayItem",_4c);return (_4d.wrapper&&_4d.wrapper.editorWidget)?_4d.wrapper.editorWidget:null;},onEditorWrapperCreated:function(_4e){},_onOverlayItemClick:function(_4f,e){if(e){_5.stop(e);}var _50=this._mappingManager.findOne("overlayItem",_4f);var _51=_50.blockPropertyInfo;var val=this.viewModel.getProperty(_50.propertyName);var _52=_7.clone(val,true);var _53;var _54=_7.hitch(this,function(_55){_50.wrapper=_55;this._activeEditorWrapper=_55;_c.publish("/epi/layout/pinnable/propertyEditor/show",null);_1.forEach(this._mappingManager.find(),function(m){if(m.overlayItem){m.overlayItem.set("active",false);}});_50.overlayItem.set("active",true);var _56={value:_52,parent:_55};_55.startEdit(_56);this.overlay.set("readOnly",_55.isOverlayDisabled);this.viewModel.set("disableUndo",_55.isUndoDisabled);});if(_50.wrapper){_53=_50.wrapper;if(_53&&_53.editorWidget&&!_53.editorWidget.overlayItem){_53.editorWidget.overlayItem=_4f;}_53.set("blockDisplayNode",_50.node);_54(_53);}else{_d(this._createEditorWrapper(_51,_4f,_50.node,_52),_7.hitch(this,function(_57){_54(_57);this.onEditorWrapperCreated(_57);}));}},_createEditorWrapper:function(_58,_59,_5a,_5b){var def=new _4(),_5c={overlayItem:_59};_d(this.editorFactory.createEditor(_58,_5a,_5b,_5c),_7.hitch(this,function(_5d){this.connect(_5d,"onValueChange","_onWrapperValueChange");this.connect(_5d,"onCancel","_onWrapperCancel");this.connect(_5d,"onStopEdit","_onWrapperStopEdit");def.resolve(_5d);}),def.reject);return def;},_onBlockReloadRequired:function(_5e){var rm=this._renderManager;setTimeout(function(){rm.suspend();rm.clear();},1);this._reloadRequiredProperty=_5e.modelPropertyName;this._reloadPropertyPreview();},_onBlockRender:function(_5f){var _60=this._mappingManager.findOne("updateController",_5f);if(_60&&_60.overlayItem){_60.overlayItem.refresh();}},_saveEditorChanges:function(_61,_62){var _63=this._getEditor(_61);if(_63&&!_63.overlayItem){_63.overlayItem=_61;}if(_63&&_63.saveChanges){_63.saveChanges(_63,_62);}},_onOverlayValueChange:function(_64,_65){this._saveEditorChanges(_64,_65.value);this.viewModel.setProperty(_65.propertyName,_65.value);},_onWrapperValueChange:function(_66,_67,_68){var _69=this._mappingManager.findOne("wrapper",_66),_6a=_69.propertyName;if(_69.overlayItem){_69.overlayItem.set("updated",true);}this.viewModel.beginOperation();this.viewModel.setProperty(_6a,_67,_68);},_onWrapperStopEdit:function(_6b,_6c,_6d,_6e){var _6f=this._mappingManager.findOne("wrapper",_6b);this.viewModel.endOperation();this._save();if(_6f.overlayItem){_6f.overlayItem.set("active",false);}this._activeEditorWrapper=null;this.overlay.set("readOnly",false);this.viewModel.set("disableUndo",false);},_onWrapperCancel:function(_70,_71){this.viewModel.abortOperation();var _72=this._mappingManager.findOne("wrapper",_70);var _73=_72.updateController;if(_73&&_73.renderSettings&&_73.renderSettings.rerenderOnCancel){_73.render();}if(_70.get("isModified")){this._save();}if(_72.overlayItem){_72.overlayItem.set("active",false);}this._activeEditorWrapper=null;this.overlay.set("readOnly",false);this.viewModel.set("disableUndo",false);},_undo:function(){setTimeout(_7.hitch(this,function(){this.viewModel.undo();}),0);},_redo:function(){setTimeout(_7.hitch(this,function(){this.viewModel.redo();}),0);},_toggleUndoRedoActions:function(_74,_75){this._setCommandEnabled("undo",!!_74);this._setCommandEnabled("redo",!!_75);},_save:function(){if(!this.viewModel||!this.viewModel.hasPendingChanges){return;}_d(this.viewModel.save(),_7.hitch(this,this._reloadPropertyPreview));},_reloadPropertyPreview:function(){if(!this.viewModel.isSaved){this._save();return;}var _76=this._activeEditorWrapper&&(this._activeEditorWrapper.propertyName===this._reloadRequiredProperty);var _77=this._activeEditorWrapper&&this._activeEditorWrapper.hasInlineEditor;if(this._reloadRequiredProperty&&!(_76&&_77)){this._toggleUndoRedoActions(false,false);this.onReloadRequired();this._reloadRequiredProperty=null;}}});});