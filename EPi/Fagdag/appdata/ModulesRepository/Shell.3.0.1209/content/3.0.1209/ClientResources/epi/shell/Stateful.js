//>>built
define("epi/shell/Stateful",["dojo","epi","dojo/Stateful"],function(_1,_2,_3){return _1.declare(_3,{_prefix:"epi-",postscript:function(){if(arguments.length>0){throw new Error("Stateful should not be instantiated with initial params. Use set method to set values.");}this.inherited(arguments);},get:function(_4){return _1.getObject(this._prefix+_4,false,this);},set:function(_5,_6){if(typeof _5==="object"){for(var x in _5){this.set(x,_5[x]);}return this;}var _7=_1.getObject(this._prefix+_5,false,this);var _8=_6;_1.setObject(this._prefix+_5,_8,this);if(this._watchCallbacks){this._watchCallbacks(_5,_7,_8);this._callbackParentObjects(_5,_7,_8);this._callbackChildObjects(_5,_7,_8);}return this;},watch:function(_9,_a){var _b=this._watchCallbacks;if(!_b){var _c=this;_b=this._watchCallbacks=function(_d,_e,_f,_10){var _11=function(_12){if(_12){_12=_12.slice();for(var i=0,l=_12.length;i<l;i++){try{_12[i].call(_c,_d,_e,_f);}catch(e){console.error(e);}}}};_11(_b["_"+_d]);if(!_10){_11(_b["*"]);}};}if(!_a&&typeof _9==="function"){_a=_9;_9="*";}else{_9="_"+_9;}var _13=_b[_9];if(typeof _13!=="object"){_13=_b[_9]=[];}_13.push(_a);return {unwatch:function(){_13.splice(_1.indexOf(_13,_a),1);}};},_callbackChildObjects:function(_14,_15,_16){var _17;if(_1.isObject(_16)){for(_17 in _16){if(!_1.isFunction(_16[_17])){this._watchCallbacks(_14+"."+_17,_15?_15[_17]:null,_16[_17]);this._callbackChildObjects(_14+"."+_17,_15?_15[_17]:null,_16[_17]);}}}},_callbackParentObjects:function(_18,_19,_1a){var _1b=_18.split(".");if(_1b.length==1){return;}var key=_1b.pop();_18=_1b.join(".");var _1c=this.get(_18);_19=this._getUpdatedObject(_1c,key,_19);_1a=_1c;this._watchCallbacks(_18,_19,_1a);this._callbackParentObjects(_18,_19,_1a);},_getUpdatedObject:function(_1d,key,_1e){var _1f=_1.clone(_1d);_1f[key]=_1e;return _1f;}});});