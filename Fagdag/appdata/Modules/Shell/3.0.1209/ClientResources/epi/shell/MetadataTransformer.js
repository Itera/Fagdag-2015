//>>built
define("epi/shell/MetadataTransformer",["dojo/_base/array","dojo/_base/declare","dojo/_base/lang","dojo/store/Memory","epi/string","epi/shell/TypeDescriptorManager"],function(_1,_2,_3,_4,_5,_6){return _2(null,{defaultGroupType:"epi.shell.layout.GroupContainer",defaultSingleGroupType:"epi.shell.layout.SimpleContainer",defaultParentType:"epi.shell.layout.ParentContainer",defaultGroupName:"defaultGroup",defaultGroupTitle:"",propertyFilter:null,_item:null,constructor:function(_7){_3.mixin(this,_7);},toComponentDefinitions:function(_8,_9,_a,_b){this._item=_8;var _c=this._filterProperties(_8);var _d=this._getComponentDefinitions(_c,_8.groups,_9,_a,_b);return _d;},_filterProperties:function(_e){var _f=_3.isFunction(this.propertyFilter)?_3.hitch(this,function(_10){return this.propertyFilter(_e,_10);}):function(){return true;},_11=_1.filter(_e.properties,_f);return _11;},_getComponentDefinitions:function(_12,_13,_14,_15,_16){var _17=[],_18=_3.clone(_13)||[],_19=_3.clone(_12)||[],_1a=function(_1b,_1c){return (_1b.displayOrder||0)-(_1c.displayOrder||0);};_18.sort(_1a);_19.sort(_1a);_1.forEach(_18,_3.hitch(this,function(_1d){var _1e=this._createGroupContainer(_1d,_16);_17.push(_1e);}));_1.forEach(_19,_3.hitch(this,function(_1f){if(!_1f.showForEdit){return;}var _20=_1f.properties&&_1f.properties.length?this._createParentContainer(_1f,_14,_15,_16):this._createPropertyWidget(_1f,_14,_15,_16);var _21=_1.some(_17,_3.hitch(this,function(_22){if(_22.settings.name===_5.pascalToCamel(_1f.groupName||this.defaultGroupName)){_22.components.push(_20);return true;}return false;}));if(!_21){var _23=this._createGroupContainer({name:this.defaultGroupName,title:this.defaultGroupTitle,displayUI:true},_16);_23.components.push(_20);_17=[_23].concat(_17);}}));var _24=_1.filter(_17,function(_25){return _25.settings.displayui&&_25.components&&_25.components.length;});var _26=(_24.length>1)?this.defaultGroupType:this.defaultSingleGroupType;_1.forEach(_24,_3.hitch(this,function(_27){_27.widgetType=_27.widgetType||_26;}));return _24;},_createGroupContainer:function(_28,_29){var _2a={_type:"group",name:_5.pascalToCamel(_28.name),title:_28.title,readOnly:_29,displayui:_28.displayUI};return {settings:_3.mixin(_2a,_28.options),widgetType:_28.uiType,components:[]};},_createParentContainer:function(_2b,_2c,_2d,_2e){var _2f={_type:"parent",name:_2c+_5.pascalToCamel(_2b.name),title:_2b.displayName};var _30=this._filterProperties(_2b);return {settings:_3.mixin(_2f,_2b.settings),widgetType:_2b.layoutType||this.defaultParentType,components:this._getComponentDefinitions(_30,_2b.groups,_2f.name+".",_2d,_2e)};},_createPropertyWidget:function(_31,_32,_33,_34){var _35=_3.mixin(_33?{value:_31.initialValue}:{},{_type:_31.hideSurroundingHtml?"hiddenfield":"field",name:_32+_5.pascalToCamel(_31.name),label:_31.displayName,selections:_31.selections,displayui:_31.displayui,readOnly:_34},_31.settings);_3.mixin(_35,this._getTranslatedLabelAndTooltip(_31.name));return {settings:_35,widgetType:_31.uiType,widgetPackage:_31.uiPackage};},_getTranslatedLabelAndTooltip:function(_36){var _37={};if(!this._item.additionalValues||!this._item.additionalValues.modelTypeIdentifier){return _37;}var _38=_6.getResourceValue(this._item.additionalValues.modelTypeIdentifier,"properties."+_36.toLowerCase());if(!_38){return _37;}if(_38.caption){_37.label=_38.caption;}if(_38.help){_37.tooltip=_38.help;}return _37;}});});