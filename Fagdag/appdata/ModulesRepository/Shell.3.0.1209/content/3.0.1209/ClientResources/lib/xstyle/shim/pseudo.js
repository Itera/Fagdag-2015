//>>built
define("xstyle/shim/pseudo",[],function(){var _1={};function _2(_3,_4,_5){if(!_1[_3]){_1[_3]=true;document.attachEvent(_3,function(_6){var _7,_8=_6.srcElement;while(_7=_8.currentStyle){if(_7.xstyle){if(_4){_8.className+=" "+_5;}else{(function(_9){setTimeout(function(){_9.className=(" "+_9.className+" ").replace(" "+_5+" "," ").slice(1);},0);})(_8);}}_8=_8.parentNode;}});}};return {onPseudo:function(_a,_b){if(_a=="hover"){_2("onmouseover",true,"xstyle-hover");_2("onmouseout",false,"xstyle-hover");_b.add(_b.selector.replace(/:hover/,""),"xstyle: true");_b.add(_b.selector.replace(/:hover/,".xstyle-hover"),_b.cssText);}else{if(_a=="focus"){_2("onactivate",true,"xstyle-focus");_2("ondeactivate",false,"xstyle-focusr");_b.add(_b.selector.replace(/:hover/,""),"xstyle: true");_b.add(_b.selector.replace(/:hover/,".xstyle-focus"),_b.cssText);}}}};});