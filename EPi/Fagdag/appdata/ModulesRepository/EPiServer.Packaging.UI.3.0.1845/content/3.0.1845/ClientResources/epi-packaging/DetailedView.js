//>>built
require({cache:{"url:epi-packaging/templates/DetailedView.htm":"<div class=\"epi-packaging-detailedViewContainer epi-TabContainerWrapper\" data-dojo-attach-point=\"contentContainer\">\r\n    <div data-dojo-attach-point=\"tabContainer\" data-dojo-type=\"dijit/layout/TabContainer\">\r\n        <div class=\"epi-dialogPadding\" data-dojo-type=\"dijit/layout/ContentPane\" title=\"${res.tab.title.overview}\"  selected=\"true\">\r\n            <h4>${res.tab.content.about}</h4>\r\n            <p data-dojo-attach-point=\"overviewAboutContent\"></p>\r\n            \r\n            <h4>${res.tab.content.releasenotes}</h4>\r\n            <p data-dojo-attach-point=\"overviewReleaseNotesContent\"></p>\r\n        </div>\r\n        <div class=\"epi-dialogPadding\" data-dojo-type=\"dijit/layout/ContentPane\" title=\"${res.tab.title.specs}\">\r\n            <ul data-dojo-attach-point=\"specItemList\"></ul>\r\n        </div>\r\n        <div class=\"epi-dialogPadding epi-dependenciesTabContainer\" data-dojo-type=\"dijit/layout/ContentPane\" title=\"${res.tab.title.dependencies}\">\r\n            <div data-dojo-attach-point=\"dependenciesContent\"></div>\r\n            <div data-dojo-attach-point=\"dependenciesList\" data-dojo-type=\"epi-packaging/DependenciesGrid\"></div>\r\n        </div>\r\n    </div>\r\n</div>"}});define("epi-packaging/DetailedView",["epi","epi/datetime","dojo/_base/array","dojo/_base/declare","dojo/_base/lang","dojo/dom-geometry","dojo/dom-style","dijit","dijit/_TemplatedMixin","dijit/_WidgetsInTemplateMixin","dijit/layout/_LayoutWidget","dijit/layout/TabContainer","dijit/layout/ContentPane","epi/shell/widget/_ActionProviderWidget","dojo/text!./templates/DetailedView.htm","epi-packaging/DependenciesGrid","epi/i18n!epi/packaging/nls/EPiServer.Packaging.UI.DetailedView"],function(_1,_2,_3,_4,_5,_6,_7,_8,_9,_a,_b,_c,_d,_e,_f,_10,res){return _4([_b,_9,_a,_e],{currentPackage:null,installHandler:null,updateHandler:null,unInstallHandler:null,disableHandler:null,enableHandler:null,closeHandler:null,res:res,templateString:_f,_specItemTemplate:"<li>                                <span class='epi-specItemLabel'>{specItemLabel}</span>                                <span class='epi-specItemValue'>{specItemValue}</span>                            </li>",_toolbar:null,postCreate:function(){this.inherited(arguments);if(!this.currentPackage){return;}this._loadOverviewTabContent();this._loadSpecsTabContent();this._loadDependenciesTabContent();},startup:function(){this.inherited(arguments);},layout:function(){this.inherited(arguments);this._contentBox.h=_6.position(this.contentContainer.parentNode).h;this.tabContainer.resize(this._contentBox);if(!this.currentPackage||!this.currentPackage.dependencies||this.currentPackage.dependencies.length<1){this.dependenciesContent.innerHTML=this.res.tab.dependencies.nodependencies;}},_hideTab:function(_11){_3.forEach(this.tabContainer.tablist.getChildren(),_5.hitch(this,function(_12,_13,_14){if(_12.label===_11){_7.set(_12.domNode,{display:"none"});return;}}));},_loadOverviewTabContent:function(){this.overviewAboutContent.innerHTML=this.currentPackage.description||"";this.overviewReleaseNotesContent.innerHTML=this.currentPackage.releaseNotes||"";},_loadDependenciesTabContent:function(){this.dependenciesList.data=this.currentPackage.dependencies;},_loadSpecsTabContent:function(){var _15="";if(this.currentPackage.versionInstalled){if(this.currentPackage.version==this.currentPackage.versionLatestAvailable&&this.currentPackage.isInstalled){_15+=this._addSpecItems(this.res.tab.content.status,"<span class='epi-installationStatusIcon epi-installedStatusIcon'></span>"+this.res.tab.content.installed);}else{if(this.currentPackage.isDisabled){_15+=this._addSpecItems(this.res.tab.content.status,"<span class='epi-installationStatusIcon epi-disabledStatusIcon'></span>"+this.res.tab.content.disabled);}else{_15+=this._addSpecItems(this.res.tab.content.status,"<span class='epi-installationStatusIcon epi-newVersionStatusIcon'></span>"+_5.replace(this.res.tab.content.priorversioninstalled,{priorversion:this.currentPackage.versionInstalled}));}}}else{_15+=this._addSpecItems(this.res.tab.content.status,"<span class='epi-installationStatusIcon epi-notInstalledStatusIcon'></span>"+this.res.tab.content.notinstalled);}var _16=_2.toUserFriendlyHtml(this.currentPackage.installDate);_15+=this._addSpecItems(this.res.tab.content.installationdate,_16||this.res.tab.content.notavailable);_15+=this._addSpecItems(this.res.tab.content.installedby,this.currentPackage.installedBy||this.res.tab.content.notavailable);_15+=this._addSpecItems(this.res.tab.content.version,this.currentPackage.version||"");_15+=this._addSpecItems(this.res.tab.content.releaseby,this.currentPackage.authors||"");var _17=_3.map(this.currentPackage.tags,function(_18){return " \""+_18+"\"";});_15+=this._addSpecItems(this.res.tab.content.tags,_17||"");this.specItemList.innerHTML=_15;},_addSpecItems:function(_19,_1a){return _5.replace(this._specItemTemplate,{specItemLabel:_19,specItemValue:_1a});},getActions:function(){if(!this.currentPackage){return [];}this._actions=[];if(this.currentPackage.actionsAvailable.install){this.addActions({name:"install",label:_1.resources.action.install,action:_5.hitch(this,this.installHandler)});}if(this.currentPackage.actionsAvailable.update||this.currentPackage.actionsAvailable.installAsUpdate){this.addActions({name:"update",label:_1.resources.action.update,action:_5.hitch(this,this.updateHandler)});}if(this.currentPackage.actionsAvailable.enable){this.addActions({name:"enable",label:res.enablebutton,action:_5.hitch(this,this.enableHandler)});}if(this.currentPackage.actionsAvailable.disable){this.addActions({name:"disable",label:res.disablebutton,action:_5.hitch(this,this.disableHandler)});}if(this.currentPackage.actionsAvailable.uninstall){this.addActions({name:"uninstall",label:_1.resources.action.uninstall,action:_5.hitch(this,this.unInstallHandler)});}this.addActions({name:"close",label:_1.resources.action.close,action:_5.hitch(this,this._closeClick)});return this._actions;},_closeClick:function(){if(this.closeHandler){this.closeHandler();}}});});