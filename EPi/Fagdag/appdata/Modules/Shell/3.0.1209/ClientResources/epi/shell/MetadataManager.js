//>>built
define("epi/shell/MetadataManager",["dojo/_base/declare","dojo/_base/json","dojo/Deferred","dojo/when","epi/dependency","./PropertyMetadata"],function(_1,_2,_3,_4,_5,_6){return _1(null,{store:null,_setTypeMetadataStore:function(){var _7=_5.resolve("epi.storeregistry");this.store=_7.get("epi.shell.metadata");},getMetadataForType:function(_8,_9){function _a(_b){return _b?new _6(_b):_b;};if(this.store==null){this._setTypeMetadataStore();}if(_9){var _c=new _3();_4(this.store.query({id:_8,modelAccessor:_2.toJson(_9)}),function(_d){if(_d&&_d.length){_c.resolve(_a(_d[0]));}else{_c.reject();}},function(){_c.reject();});return _c.promise;}else{return _4(this.store.get(_8),_a);}},_clear:function(){this.store=null;}});});