//>>built
define("epi-ecf-ui/store/CompositeKey",["dojo/_base/lang","dojo/when"],function(_1,_2){var _3=function(_4,_5,_6){return _1.delegate(_4,{keys:_5,getClones:_6,removeReAdd:function(_7,_8){var _9=_1.clone(_7),_a=this.remove(_7[this.idProperty]);delete _9[this.idProperty];return _2(_a,function(){return _4.add(_9,_8);});},put:function(_b,_c){var _d=this.get(_b[this.idProperty]);if(_d&&this.keys){for(var i=0,j=this.keys.length;i<j;i+=1){if(_d[_5[i]]!==_b[_5[i]]){return this.removeReAdd(_b,_c);}}}return _4.put.apply(_4,arguments);},get:function(id){return _6?_1.clone(_4.get.apply(_4,arguments)):_4.get.apply(_4,arguments);}});};return _3;});