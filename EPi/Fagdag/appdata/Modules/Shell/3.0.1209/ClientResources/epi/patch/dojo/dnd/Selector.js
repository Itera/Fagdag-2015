//>>built
define("epi/patch/dojo/dnd/Selector",["dojo/_base/lang","dojo/dnd/common","dojo/dnd/Selector","dojo/mouse"],function(_1,_2,_3,_4){_1.mixin(_3.prototype,{onMouseDown:function(e){if(this.autoSync){this.sync();}if(!this.current){return;}if(!this.singular&&!_2.getCopyKeyState(e)&&!e.shiftKey&&(this.current.id in this.selection)){this.simpleSelection=true;if(_4.isLeft(e)){e.preventDefault();}return;}if(!this.singular&&e.shiftKey){if(!_2.getCopyKeyState(e)){this._removeSelection();}var c=this.getAllNodes();if(c.length){if(!this.anchor){this.anchor=c[0];this._addItemClass(this.anchor,"Anchor");}this.selection[this.anchor.id]=1;if(this.anchor!=this.current){var i=0,_5;for(;i<c.length;++i){_5=c[i];if(_5==this.anchor||_5==this.current){break;}}for(++i;i<c.length;++i){_5=c[i];if(_5==this.anchor||_5==this.current){break;}this._addItemClass(_5,"Selected");this.selection[_5.id]=1;}this._addItemClass(this.current,"Selected");this.selection[this.current.id]=1;}}}else{if(this.singular){if(this.anchor==this.current){if(_2.getCopyKeyState(e)){this.selectNone();}}else{this.selectNone();this.anchor=this.current;this._addItemClass(this.anchor,"Anchor");this.selection[this.current.id]=1;}}else{if(_2.getCopyKeyState(e)){if(this.anchor==this.current){delete this.selection[this.anchor.id];this._removeAnchor();}else{if(this.current.id in this.selection){this._removeItemClass(this.current,"Selected");delete this.selection[this.current.id];}else{if(this.anchor){this._removeItemClass(this.anchor,"Anchor");this._addItemClass(this.anchor,"Selected");}this.anchor=this.current;this._addItemClass(this.current,"Anchor");this.selection[this.current.id]=1;}}}else{if(!(this.current.id in this.selection)){this.selectNone();this.anchor=this.current;this._addItemClass(this.current,"Anchor");this.selection[this.current.id]=1;}}}}e.preventDefault();}});_3.prototype.onMouseDown.nom="onMouseDown";});