//>>built
define("epi/shell/Downloader",["dojo/_base/lang","dojo/dom-construct"],function(_1,_2){return {_classicalDownload:function(_3,_4){var _5=document.getElementsByTagName("body")[0],_6={href:_3,download:_4,target:"_blank",style:{display:"none;"}},_7=_2.create("a",_6,_5,"last");_7.click();_2.destroy(_7);},download:function(_8,_9){if(_8){return this._classicalDownload(_8,_9);}}};});