//>>built
define("epi/shell/widget/_ActionProviderWidget",["epi","dojo","dijit","epi/shell/widget/_ActionConsumer","epi/shell/widget/_ActionProvider"],function(_1,_2,_3,_4,_5){return _2.declare([_5],{_enclosingConsumer:null,startup:function(){this.inherited(arguments);this._registerSelf();},destroy:function(){this._unregisterSelf();this.inherited(arguments);},_registerSelf:function(){this._enclosingConsumer=this._getEnclosingActionConsumer();if(this._enclosingConsumer!==null){this._enclosingConsumer.addProvider(this);}},_unregisterSelf:function(){if(this._enclosingConsumer!==null){this._enclosingConsumer.removeProvider(this);}},_getEnclosingActionConsumer:function(){var _6=this.domNode.parentNode;while(_6!==null){var _7=_3.getEnclosingWidget(_6);if(!_7){return null;}if(_7.isInstanceOf(_4)){return _7;}_6=_7.domNode.parentNode;}return null;}});});