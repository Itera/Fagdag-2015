var OxOc85e=["=","; path=/;"," expires=",";","cookie","length","","#ffffff","CECC","onmouseover","event","target","srcElement","className","colordiv","style","onmouseout","onclick","checked","CheckboxColorNames","cname","cvalue","[[_CuteEditorResource_]]Load.ashx?type=dialog\x26file=ColorPicker.Aspx\x26culture=[[_culture_]]","\x26[[DNN_Arg]]","dialogWidth:500px;dialogHeight:420px;help:0;status:0;resizable:1","dialogArguments","object","onchange","color","editor","divpreview","value","#","RecentColors","SPAN","[[ValidColor]]"]; function SetCookie(name,Ox115,Ox116){var Ox117=name+OxOc85e[0x0]+escape(Ox115)+OxOc85e[0x1];if(Ox116){var Ox118= new Date(); Ox118.setSeconds(Ox118.getSeconds()+Ox116) ; Ox117+=OxOc85e[0x2]+Ox118.toUTCString()+OxOc85e[0x3] ;} ; document[OxOc85e[0x4]]=Ox117 ;}  ; function GetCookie(name){var Ox11a=document[OxOc85e[0x4]].split(OxOc85e[0x3]);for(var i=0x0;i<Ox11a[OxOc85e[0x5]];i++){var Ox11b=Ox11a[i].split(OxOc85e[0x0]);if(name==Ox11b[0x0].replace(/\s/g,OxOc85e[0x6])){return unescape(Ox11b[0x1]);} ;} ;}  ; function GetCookieDictionary(){var Ox11d={};var Ox11a=document[OxOc85e[0x4]].split(OxOc85e[0x3]);for(var i=0x0;i<Ox11a[OxOc85e[0x5]];i++){var Ox11b=Ox11a[i].split(OxOc85e[0x0]); Ox11d[Ox11b[0x0].replace(/\s/g,OxOc85e[0x6])]=unescape(Ox11b[0x1]) ;} ;return Ox11d;}  ; function GetCookieArray(){var arr=[];var Ox11a=document[OxOc85e[0x4]].split(OxOc85e[0x3]);for(var i=0x0;i<Ox11a[OxOc85e[0x5]];i++){var Ox11b=Ox11a[i].split(OxOc85e[0x0]);var Ox117={name:Ox11b[0x0].replace(/\s/g,OxOc85e[0x6]),value:unescape(Ox11b[0x1])}; arr[arr[OxOc85e[0x5]]]=Ox117 ;} ;return arr;}  ;var __defaultcustomlist=[OxOc85e[0x7],OxOc85e[0x7],OxOc85e[0x7],OxOc85e[0x7],OxOc85e[0x7],OxOc85e[0x7],OxOc85e[0x7],OxOc85e[0x7]]; function GetCustomColors(){var Ox121=__defaultcustomlist.concat();for(var i=0x0;i<0x12;i++){var Oxc5=GetCustomColor(i);if(Oxc5){ Ox121[i]=Oxc5 ;} ;} ;return Ox121;}  ; function GetCustomColor(Ox123){return GetCookie(OxOc85e[0x8]+Ox123);}  ; function SetCustomColor(Ox123,Oxc5){ SetCookie(OxOc85e[0x8]+Ox123,Oxc5,0x3c*0x3c*0x18*0x16d) ;}  ;var _origincolor=OxOc85e[0x6]; document[OxOc85e[0x9]]=function (Ox214){ Ox214=window[OxOc85e[0xa]]||Ox214 ;var Ox12=Ox214[OxOc85e[0xc]]||Ox214[OxOc85e[0xb]];if(Ox12[OxOc85e[0xd]]==OxOc85e[0xe]){ firecolorchange(Ox12[OxOc85e[0xf]].backgroundColor) ;} ;}  ; document[OxOc85e[0x10]]=function (Ox214){ Ox214=window[OxOc85e[0xa]]||Ox214 ;var Ox12=Ox214[OxOc85e[0xc]]||Ox214[OxOc85e[0xb]];if(Ox12[OxOc85e[0xd]]==OxOc85e[0xe]){ firecolorchange(_origincolor) ;} ;}  ; document[OxOc85e[0x11]]=function (Ox214){ Ox214=window[OxOc85e[0xa]]||Ox214 ;var Ox12=Ox214[OxOc85e[0xc]]||Ox214[OxOc85e[0xb]];if(Ox12[OxOc85e[0xd]]==OxOc85e[0xe]){var Ox215=document.getElementById(OxOc85e[0x13])&&document.getElementById(OxOc85e[0x13])[OxOc85e[0x12]];if(Ox215){ do_select(Ox12.getAttribute(OxOc85e[0x14])||Ox12[OxOc85e[0xf]].backgroundColor) ;} else { do_select(Ox12.getAttribute(OxOc85e[0x15])||Ox12[OxOc85e[0xf]].backgroundColor) ;} ;} ;}  ;var _editor; function firecolorchange(Ox218){}  ; function ShowColorDialog(Ox1a7){var Ox12d=OxOc85e[0x16]+OxOc85e[0x17];var Ox21a=OxOc85e[0x18];var Ox130=showModalDialog(Ox12d,null,Ox21a);if(Ox130!=null&&Ox130!==false){ Ox1a7(Ox130) ;} ;}  ;if(top[OxOc85e[0x19]]){if( typeof (top[OxOc85e[0x19]])==OxOc85e[0x1a]){if(top[OxOc85e[0x19]][OxOc85e[0x1b]]){ firecolorchange=top[OxOc85e[0x19]][OxOc85e[0x1b]] ; _origincolor=top[OxOc85e[0x19]][OxOc85e[0x1c]] ; _editor=top[OxOc85e[0x19]][OxOc85e[0x1d]] ;} ;} ;} ;var _selectedcolor=null; function do_select(Oxc5){ _selectedcolor=Oxc5 ; firecolorchange(Oxc5) ;var Ox21d=document.getElementById(OxOc85e[0x1e]);if(Ox21d){ Ox21d[OxOc85e[0x1f]]=Oxc5 ;} ;}  ; function do_saverecent(Oxc5){if(!Oxc5){return ;} ;if(Oxc5[OxOc85e[0x5]]!=0x7){return ;} ;if(Oxc5.substring(0x0,0x1)!=OxOc85e[0x20]){return ;} ;var hex=Oxc5.substring(0x1,0x7);var Ox21f=GetCookie(OxOc85e[0x21]);if(!Ox21f){ Ox21f=OxOc85e[0x6] ;} ;if((Ox21f[OxOc85e[0x5]]%0x6)!=0x0){ Ox21f=OxOc85e[0x6] ;} ;for(var i=0x0;i<Ox21f[OxOc85e[0x5]];i+=0x6){if(Ox21f.substr(i,0x6)==hex){ Ox21f=Ox21f.substr(0x0,i)+Ox21f.substr(i+0x6) ; i-=0x6 ;} ;} ;if(Ox21f[OxOc85e[0x5]]>0x1f*0x6){ Ox21f=Ox21f.substr(0x0,0x1f*0x6) ;} ; Ox21f=hex+Ox21f ; SetCookie(OxOc85e[0x21],Ox21f,0x3c*0x3c*0x18*0x16d) ;}  ; function do_insert(){var Oxc5;var divpreview=document.getElementById(OxOc85e[0x1e]);if(divpreview){ Oxc5=divpreview[OxOc85e[0x1f]] ;} else { Oxc5=_selectedcolor ;} ;try{ document.createElement(OxOc85e[0x22])[OxOc85e[0xf]][OxOc85e[0x1c]]=Oxc5 ; do_saverecent(Oxc5) ; Window_SetDialogReturnValue(window,Oxc5) ; Window_CloseDialog(window) ;} catch(x){ alert(OxOc85e[0x23]) ; divpreview[OxOc85e[0x1f]]=OxOc85e[0x6] ;return false;} ;}  ;