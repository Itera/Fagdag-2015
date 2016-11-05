//>>built
define("epi/shell/_HierarchicalModelMixin",["dojo/_base/array","dojo/_base/declare","dojo/_base/lang","dojo/Deferred","dojo/promise/all","dojo/when"],function(_1,_2,_3,_4,_5,_6){return _2([],{parentProperty:"parentLink",store:null,constructor:function(_7){_2.safeMixin(this,_7);},getParentIdentity:function(_8){return _3.getObject(this.parentProperty,false,_8);},isAncestor:function(_9,_a){var _b=this.store.getIdentity(_9),_c=this.store.getIdentity(_a),_d=this.getParentIdentity(_a);if(_b==_c||(_a.parentLink&&_9.contentLink==_a.parentLink)){return true;}if(_d){return false;}return _6(this.store.get(_d),_3.hitch(this,function(_e){return this.isAncestor(_9,_e);}));},getAncestors:function(_f,_10){if(!this.store){_10([]);return;}var obj=typeof _f==="object"?_f:this.store.get(_f);_6(obj,_3.hitch(this,function(_11){_6(this._getAncestors([_11]),_10);}));},_getAncestors:function(_12){if(this._hasRoot(_12)){return _12.slice(0,-1);}var _13=this.getParentIdentity(_12[0]);if(!_13){return _12.slice(0,-1);}return _6(this.store.get(_13),_3.hitch(this,function(_14){if(_14){_12.unshift(_14);return this._getAncestors(_12);}return _12.slice(0,-1);}));},_hasRoot:function(_15){var _16=this.roots||[this.root];if(!_15.length||!_16.length||typeof this.getIdentity!=="function"){return false;}var _17=this.getIdentity(_15[0]);return _1.some(_16,function(_18){return _18==_17;},this);},refreshAncestors:function(_19,_1a){var _1b=this.store,_1c=new _4(),_1d=[],_1e=[];this.getAncestors(_19,function(_1f){_1.forEach(_1f,function(_20){if(!_1a||_1a(_20)){_1d.push(_6(_1b.refresh(_1b.getIdentity(_20)),function(_21){_1e.push(_21);}));}});_5(_1d).then(function(){_1c.resolve(_1e);});});return _1c.promise;}});});