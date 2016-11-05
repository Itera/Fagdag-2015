(function(){tinymce.create("tinymce.plugins.InsertDateTime",{init:function(ed){var t=this;t.editor=ed,ed.addCommand("mceInsertDate",function(){var str=t._getDateTime(new Date,ed.getParam("plugin_insertdate_dateFormat",ed.getLang("insertdatetime.date_fmt")));ed.execCommand("mceInsertContent",!1,str)}),ed.addCommand("mceInsertTime",function(){var str=t._getDateTime(new Date,ed.getParam("plugin_insertdate_timeFormat",ed.getLang("insertdatetime.time_fmt")));ed.execCommand("mceInsertContent",!1,str)}),ed.addButton("insertdate",{title:"insertdatetime.insertdate_desc",cmd:"mceInsertDate"}),ed.addButton("inserttime",{title:"insertdatetime.inserttime_desc",cmd:"mceInsertTime"})},getInfo:function(){return{longname:"Insert date/time",author:"Moxiecode Systems AB",authorurl:"http://tinymce.moxiecode.com",infourl:"http://wiki.moxiecode.com/index.php/TinyMCE:Plugins/insertdatetime",version:tinymce.majorVersion+"."+tinymce.minorVersion}},_getDateTime:function(d,fmt){function addZeros(value,len){if(value=""+value,len>value.length)for(var i=0;len-value.length>i;i++)value="0"+value;return value}var ed=this.editor;return fmt=fmt.replace("%D","%m/%d/%y"),fmt=fmt.replace("%r","%I:%M:%S %p"),fmt=fmt.replace("%Y",""+d.getFullYear()),fmt=fmt.replace("%y",""+d.getYear()),fmt=fmt.replace("%m",addZeros(d.getMonth()+1,2)),fmt=fmt.replace("%d",addZeros(d.getDate(),2)),fmt=fmt.replace("%H",""+addZeros(d.getHours(),2)),fmt=fmt.replace("%M",""+addZeros(d.getMinutes(),2)),fmt=fmt.replace("%S",""+addZeros(d.getSeconds(),2)),fmt=fmt.replace("%I",""+((d.getHours()+11)%12+1)),fmt=fmt.replace("%p",""+(12>d.getHours()?"AM":"PM")),fmt=fmt.replace("%B",""+ed.getLang("insertdatetime.months_long").split(",")[d.getMonth()]),fmt=fmt.replace("%b",""+ed.getLang("insertdatetime.months_short").split(",")[d.getMonth()]),fmt=fmt.replace("%A",""+ed.getLang("insertdatetime.day_long").split(",")[d.getDay()]),fmt=fmt.replace("%a",""+ed.getLang("insertdatetime.day_short").split(",")[d.getDay()]),fmt=fmt.replace("%%","%")}}),tinymce.PluginManager.add("insertdatetime",tinymce.plugins.InsertDateTime)})();