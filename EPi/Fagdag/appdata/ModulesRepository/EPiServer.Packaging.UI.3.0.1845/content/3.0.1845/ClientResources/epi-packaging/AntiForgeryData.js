//>>built
define("epi-packaging/AntiForgeryData",["dojo"],function(_1){return _1.declare(null,{_keyName:null,_keyValue:null,_antiForgeryToken:null,constructor:function(_2){var _3=_1.create("div");this._antiForgeryToken=_2;_3.innerHTML=this._antiForgeryToken;var _4=_1.query("input",_3)[0];this._keyName=_1.attr(_4,"name");this._keyValue=_1.attr(_4,"value");},GetKeyName:function(){return this._keyName;},GetKeyValue:function(){return this._keyValue;},GetTokenNode:function(){return this._antiForgeryToken;},AddAntiforgeryToken:function(_5){var _6={};_6[this._keyName]=this._keyValue;_1.mixin(_5,_6);return _5;}});});