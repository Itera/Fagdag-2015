//>>built
define("epi-cms/contentediting/ViewSettingsManager",["dojo/_base/declare","dojo/_base/array","dojo/_base/lang","dojo/topic","dojo/Stateful","epi/epi","epi/dependency","epi/UriParser"],function(_1,_2,_3,_4,_5,_6,_7,_8){return _1([_5],{_hashWrapper:null,viewSettings:null,_viewSettingsMap:null,viewSettingsHashValue:[],_activeKey:"active",enabled:false,previewParams:null,postscript:function(){this.inherited(arguments);this._hashWrapper=_7.resolve("epi.shell.HashWrapper");this.previewParams={};this._viewSettingsMap={};_2.forEach(this.viewSettings,_3.hitch(this,function(_9){if(!this._viewSettingsMap[_9.key]){this._viewSettingsMap[_9.key]=_9;}else{throw "Duplicated view settings key.";}}));_4.subscribe("/epi/cms/action/viewsettingvaluechanged",_3.hitch(this,this._viewSettingChanged));_4.subscribe("/epi/cms/action/eyetoggle",_3.hitch(this,this._viewSettingEnabledChanged));var _a=this._hashWrapper.getHash();if(_a&&_a.viewsetting){this.viewSettingsHashValue=this._toObjects(_a.viewsetting);}this.enabled=this._loadProperty(this._activeKey)==="true";_2.forEach(this.viewSettingsHashValue,_3.hitch(this,function(_b){var _c=this._viewSettingsMap[_b.type];if(_c){_c.set("enabled",this.get("enabled"));_c.value=_b.id;_c.beforePreviewLoad(this.previewParams,this.get("enabled"));}}));},onPreviewReady:function(_d){this._preview=_d;_2.forEach(this.viewSettings,_3.hitch(this,function(_e){_e.afterPreviewLoad(_d,this.get("enabled"));}));},getSettingProperty:function(_f){var _10=_2.filter(this.viewSettingsHashValue,function(_11){return _11.type==_f;});return _10.length>0?_10[0].id:null;},hasVisitorGroup:function(){return this.getSettingProperty("visitorgroup")!==null&&this.getSettingProperty("visitorgroup").id!==null;},_enabledGetter:function(){return this.enabled;},_enabledSetter:function(_12){this.enabled=_12;var _13={};_2.forEach(this.viewSettings,_3.hitch(this,function(_14){_14.set("enabled",_12);_14.beforePreviewLoad(_13,_12);}));if(!_6.areEqual(this.previewParams,_13)){this.previewParams=_13;}else{_2.forEach(this.viewSettings,_3.hitch(this,function(_15){_15.afterPreviewLoad(this._preview,_12);}));}},_applyViewSettingValue:function(key,_16){var _17,_18=this._viewSettingsMap[key];if(_18){_17=_3.clone(this.previewParams);_18.value=_16;_18.beforePreviewLoad(_17,true);if(!_6.areEqual(this.previewParams,_17)){this.previewParams=_17;}else{_18.afterPreviewLoad(this._preview,true);}}},_viewSettingChanged:function(key,_19){this._saveProperty(key,_19);this._applyViewSettingValue(key,_19);},_viewSettingEnabledChanged:function(_1a){var _1b=this._hasSetting();if(_1a){this._saveProperty(this._activeKey,"true");}else{this._saveProperty(this._activeKey,_1b?false:null);}this.set("enabled",_1a);},_addProperty:function(_1c,_1d){this.viewSettingsHashValue.push({type:_1c,id:_1d});},_updateProperty:function(_1e,_1f){var _20=-1;_2.forEach(this.viewSettingsHashValue,function(_21,_22){if(_21.type==_1e){_20=_22;return;}});if(_20>-1){this.viewSettingsHashValue[_20].id=_1f;}else{this._addProperty(_1e,_1f);}},_toObjects:function(url){var _23=[];_2.forEach(url.split("|"),function(_24,_25){var uri=new _8(_24);_23.push({type:uri.getType(),id:uri.getId()});});return _23;},_deleteProperty:function(_26){var _27=-1;_2.forEach(this.viewSettingsHashValue,function(_28,_29){if(_28.type==_26){_27=_29;return;}});if(_27>-1){this.viewSettingsHashValue.splice(_27,1);}},_updateHash:function(){var obj=this._hashWrapper.getHash();var _2a=[];_2.forEach(this.viewSettingsHashValue,function(_2b,_2c){_2a.push(_2b.type+":///"+_2b.id);});if(_2a.length>0){obj.viewsetting=_2a.join("|");}else{delete obj.viewsetting;}this._hashWrapper.setHash(obj);},_saveProperty:function(_2d,_2e){var obj=this._hashWrapper.getHash();if(obj&&obj.viewsetting){this.viewSettingsHashValue=this._toObjects(obj.viewsetting);if(_2e!=null){this._updateProperty(_2d,_2e);}else{this._deleteProperty(_2d);}this._updateHash();}else{if(_2e!=null){this._updateProperty(_2d,_2e);this._updateHash();}}},_loadProperty:function(_2f){var obj=this._hashWrapper.getHash();var _30=null;if(obj&&obj.viewsetting){var _31=this._toObjects(obj.viewsetting);var _32=_2.filter(_31,function(_33){return _33.type==_2f;})[0];if(_32){_30=_32.id;}}return _30;},_hasSetting:function(){var obj=this._hashWrapper.getHash();if(obj&&obj.viewsetting){if(obj.viewsetting.split("|").length>1){return true;}}return false;},getRenderingViewSettings:function(){return _2.filter(this.viewSettings,_3.hitch(this,function(_34){return _34.usedForRendering;}));}});});