//>>built
define("epi-cms/contentediting/command/StartWorkflow",["dojo/_base/declare","dojo/_base/lang","dojo/dom-class","epi-cms/contentediting/command/_LegacyDialogCommandBase","epi/i18n!epi/cms/nls/episerver.cms.contentediting.command.startworkflow"],function(_1,_2,_3,_4,_5){return _1([_4],{label:_5.label,dialogPath:"Edit/StartWorkflow.aspx",raiseCloseEvent:true,getRouteParams:function(){return _2.mixin(this.inherited(arguments),{"id":this.getContentReference(true)});},_onModelChange:function(){var _6=_2.getObject("model.contentData.capabilities.isPage",false,this);this.set("canExecute",!!_6);},getDialogParams:function(){return {dialogTitle:_5.label,legacyButtonQuery:"div.epi-buttonContainer span.epi-cmsButton, span.epi-cmsButton>input.epi-cmsButton-Cancel",onMapDialogButton:function(_7){return !(_7&&_3.contains(_7,"epi-cmsButton-Cancel"));},showCloseButton:true};}});});