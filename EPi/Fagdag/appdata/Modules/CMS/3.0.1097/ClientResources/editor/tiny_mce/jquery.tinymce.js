(function(c){function f(){function i(l){"remove"===l&&this.each(function(n,o){var m=h(o);m&&m.remove()}),this.find("span.mceEditor,div.mceEditor").each(function(n,o){var m=tinyMCE.get(o.id.replace(/_parent$/,""));m&&m.remove()})}function k(n){var l,m=this;if(n!==b)i.call(m),m.each(function(p,q){var o;(o=tinyMCE.get(q.id))&&o.setContent(n)});else if(m.length>0&&(l=tinyMCE.get(m[0].id)))return l.getContent()}function h(m){var l=null;return m&&m.id&&d.tinymce&&(l=tinyMCE.get(m.id)),l}function g(l){return!!(l&&l.length&&d.tinymce&&l.is(":tinymce"))}var j={};c.each(["text","html","val"],function(n,l){var o=j[l]=c.fn[l],m="text"===l;c.fn[l]=function(s){var p=this;if(!g(p))return o.apply(p,arguments);if(s!==b)return k.call(p.filter(":tinymce"),s),o.apply(p.not(":tinymce"),arguments),p;var r="",q=arguments;return(m?p:p.eq(0)).each(function(u,v){var t=h(v);r+=t?m?t.getContent().replace(/<(?:"[^"]*"|'[^']*'|[^'">])*>/g,""):t.getContent({save:!0}):o.apply(c(v),q)}),r}}),c.each(["append","prepend"],function(n,m){var o=j[m]=c.fn[m],l="prepend"===m;c.fn[m]=function(q){var p=this;return g(p)?q!==b?(p.filter(":tinymce").each(function(s,t){var r=h(t);r&&r.setContent(l?q+r.getContent():r.getContent()+q)}),o.apply(p.not(":tinymce"),arguments),p):void 0:o.apply(p,arguments)}}),c.each(["remove","replaceWith","replaceAll","empty"],function(m,l){var n=j[l]=c.fn[l];c.fn[l]=function(){return i.call(this,l),n.apply(this,arguments)}}),j.attr=c.fn.attr,c.fn.attr=function(o,q){var m=this,n=arguments;if(!o||"value"!==o||!g(m))return q!==b?j.attr.apply(m,n):j.attr.apply(m,n);if(q!==b)return k.call(m.filter(":tinymce"),q),j.attr.apply(m.not(":tinymce"),n),m;var p=m[0],l=h(p);return l?l.getContent({save:!0}):j.attr.apply(c(p),n)}}var b,e,a=[],d=window;c.fn.tinymce=function(j){function o(){var r=[],q=0;f&&(f(),f=null),p.each(function(t,u){var s,w=u.id,v=j.oninit;w||(u.id=w=tinymce.DOM.uniqueId()),s=new tinymce.Editor(w,j),r.push(s),s.onInit.add(function(){var x,y=v;p.css("visibility",""),v&&++q==r.length&&(tinymce.is(y,"string")&&(x=-1===y.indexOf(".")?null:tinymce.resolve(y.replace(/\.\w+$/,"")),y=tinymce.resolve(y)),y.apply(x||tinymce,r))})}),c.each(r,function(t,s){s.render()})}var g,h,m,i,p=this,l="",n="";return p.length?j?(p.css("visibility","hidden"),d.tinymce||e||!(g=j.script_url)?1===e?a.push(o):o():(e=1,h=g.substring(0,g.lastIndexOf("/")),/_(src|dev)\.js/g.test(g)&&(n="_src"),m=g.lastIndexOf("?"),-1!=m&&(l=g.substring(m+1)),d.tinyMCEPreInit=d.tinyMCEPreInit||{base:h,suffix:n,query:l},-1!=g.indexOf("gzip")&&(i=j.language||"en",g=g+(/\?/.test(g)?"&":"?")+"js=true&core=true&suffix="+escape(n)+"&themes="+escape(j.theme)+"&plugins="+escape(j.plugins)+"&languages="+i,d.tinyMCE_GZ||(tinyMCE_GZ={start:function(){function q(r){tinymce.ScriptLoader.markDone(tinyMCE.baseURI.toAbsolute(r))}tinymce.suffix=n,q("langs/"+i+".js"),q("themes/"+j.theme+"/editor_template"+n+".js"),q("themes/"+j.theme+"/langs/"+i+".js"),c.each(j.plugins.split(","),function(s,r){r&&(q("plugins/"+r+"/editor_plugin"+n+".js"),q("plugins/"+r+"/langs/"+i+".js"))})},end:function(){}})),c.ajax({type:"GET",url:g,dataType:"script",cache:!0,success:function(){tinymce.dom.Event.domLoaded=1,e=2,j.script_loaded&&j.script_loaded(),o(),c.each(a,function(q,r){r()})}})),p):tinyMCE.get(p[0].id):p},c.extend(c.expr[":"],{tinymce:function(g){return!!(g.id&&"tinyMCE"in window&&tinyMCE.get(g.id))}})})(jQuery);