//>>built
require({cache:{"url:epi-cms/form/templates/MonthYearPicker.html":"<div class=\"dijit dijitReset dijitInline\" waiRole=\"presentation\" style=\"${styleString}\" dojoAttachPoint=\"container\" id=\"widget_${id}\" >\r\n    <select data-dojo-type=\"dijit/form/FilteringSelect\" dojoAttachPoint=\"yearDropDown\" id=\"yearDropDown_${id}\">\r\n        <option value=\"0000\">${yearLabel}</option>\r\n        ${yearOptions}\r\n    </select>\r\n    <select data-dojo-type=\"dijit/form/FilteringSelect\" dojoAttachPoint=\"monthDropDown\" id=\"monthDropDown_${id}\">\r\n        <option value=\"00\">${monthLabel}</option>    \r\n        <option value=\"01\">${janName}</option>\r\n        <option value=\"02\">${febName}</option>\r\n        <option value=\"03\">${marName}</option>\r\n        <option value=\"04\">${aprName}</option>\r\n        <option value=\"05\">${mayName}</option>\r\n        <option value=\"06\">${junName}</option>\r\n        <option value=\"07\">${julName}</option>\r\n        <option value=\"08\">${augName}</option>\r\n        <option value=\"09\">${sepName}</option>\r\n        <option value=\"10\">${octName}</option>\r\n        <option value=\"11\">${novName}</option>\r\n        <option value=\"12\">${decName}</option>\r\n    </select>    \r\n</div>"}});define("epi-cms/form/MonthYearPicker",["epi","dojo","dijit","dojo/i18n","dojo/date/locale","dijit/_Widget","dijit/_TemplatedMixin","dijit/_WidgetsInTemplateMixin","dojo/text!./templates/MonthYearPicker.html","epi/i18n!epi/cms/nls/episerver.cms.form"],function(_1,_2,_3,_4,_5,_6,_7,_8,_9,_a){return _2.declare([_6,_7,_8],{templateString:_9,yearOptions:"",value:"0000-00",style:{},styleString:"",errorMessage:"",minYear:1861,maxYear:2100,yearLabel:_a.yearLabel,monthLabel:_a.monthLabel,janName:_5.getNames("months","wide","standAlone",this.lang)[0],febName:_5.getNames("months","wide","standAlone",this.lang)[1],marName:_5.getNames("months","wide","standAlone",this.lang)[2],aprName:_5.getNames("months","wide","standAlone",this.lang)[3],mayName:_5.getNames("months","wide","standAlone",this.lang)[4],junName:_5.getNames("months","wide","standAlone",this.lang)[5],julName:_5.getNames("months","wide","standAlone",this.lang)[6],augName:_5.getNames("months","wide","standAlone",this.lang)[7],sepName:_5.getNames("months","wide","standAlone",this.lang)[8],octName:_5.getNames("months","wide","standAlone",this.lang)[9],novName:_5.getNames("months","wide","standAlone",this.lang)[10],decName:_5.getNames("months","wide","standAlone",this.lang)[11],postMixInProperties:function(){for(var i=this.minYear;i<=this.maxYear;i++){this.yearOptions+="<option value="+i+">"+i+"</option>";}if(!this.style["font-family"]&&this.srcNodeRef&&this.srcNodeRef.parentNode&&this.srcNodeRef.parentNode.currentStyle){this.style["font-family"]=this.srcNodeRef.parentNode.currentStyle.fontFamily;}for(var j in this.style){this.styleString+=j+": "+this.style[j]+";";}},postCreate:function(){var _b=_3.byId(this.yearDropDown.id);var _c=_3.byId(this.monthDropDown.id);this._disableDojoValidation(_b);this._disableDojoValidation(_c);},_disableDojoValidation:function(_d){if(_d.displayMessage){_d.displayMessage=function(){};}if(_d._setStateClass){var _e=_d._setStateClass;_d._setStateClass=function(){if((!this.isValid)||(this.isValid&&this.isValid())){_e.apply(this,arguments);}};}},isValid:function(){var _f=_3.byId(this.yearDropDown.id);var _10=_3.byId(this.monthDropDown.id);var _11=_f.get("value");var _12=_10.get("value");if(!_f.isValid()){this.errorMessage=_f.getErrorMessage();return false;}else{if(!_10.isValid()){this.errorMessage=_f.getErrorMessage();return false;}else{if(_11=="0000"&&_12=="00"){this.errorMessage=_4.getLocalization("dijit.form","validate",this.lang).missingMessage;return false;}else{this.errorMessage="";return true;}}}},getErrorMessage:function(){return this.errorMessage;},_setValueAttr:function(_13){if(_13.length==7){this.value=_13;}_3.byId(this.yearDropDown.id).set("value",this.value.substr(0,4));_3.byId(this.monthDropDown.id).set("value",this.value.substr(5,2));},_getValueAttr:function(){var _14=_3.byId(this.yearDropDown.id).get("value");var _15=_3.byId(this.monthDropDown.id).get("value");return _14+"-"+_15;}});});