function cyclos_gwt(){var O='bootstrap',P='begin',Q='gwt.codesvr.cyclos.gwt=',R='gwt.codesvr=',S='cyclos.gwt',T='startup',U='DUMMY',V=0,W=1,X='iframe',Y='position:absolute; width:0; height:0; border:none; left: -1000px;',Z=' top: -1000px;',$='CSS1Compat',_='<!doctype html>',ab='',bb='<html><head><\/head><body><\/body><\/html>',cb='undefined',db='readystatechange',eb=10,fb='Chrome',gb='eval("',hb='");',ib='script',jb='javascript',kb='moduleStartup',lb='moduleRequested',mb='cyclos_gwt',nb='Failed to load ',ob='head',pb='meta',qb='name',rb='cyclos.gwt::',sb='::',tb='gwt:property',ub='content',vb='=',wb='gwt:onPropertyErrorFn',xb='Bad handler "',yb='" for "gwt:onPropertyErrorFn"',zb='gwt:onLoadErrorFn',Ab='" for "gwt:onLoadErrorFn"',Bb='#',Cb='?',Db='/',Eb='img',Fb='clear.cache.gif',Gb='baseUrl',Hb='cyclos.gwt.nocache.js',Ib='base',Jb='//',Kb='user.agent',Lb='webkit',Mb='safari',Nb='msie',Ob=11,Pb='ie10',Qb=9,Rb='ie9',Sb=8,Tb='ie8',Ub='gecko',Vb='gecko1_8',Wb=2,Xb=3,Yb=4,Zb='selectingPermutation',$b='cyclos.gwt.devmode.js',_b='26E92D090715A1DAD73FE134FB4C0260',ac='BDB9AA08F572A7C064EB09CF5F7C1B0F',bc=':',cc='.cache.js',dc='loadExternalRefs',ec='end',fc='http:',gc='file:',hc='_gwt_dummy_',ic='__gwtDevModeHook:cyclos.gwt',jc='Ignoring non-whitelisted Dev Mode URL: ',kc=':moduleBase';var o=window;var p=document;r(O,P);function q(){var a=o.location.search;return a.indexOf(Q)!=-1||a.indexOf(R)!=-1}
function r(a,b){if(o.__gwtStatsEvent){o.__gwtStatsEvent({moduleName:S,sessionId:o.__gwtStatsSessionId,subSystem:T,evtGroup:a,millis:(new Date).getTime(),type:b})}}
cyclos_gwt.__sendStats=r;cyclos_gwt.__moduleName=S;cyclos_gwt.__errFn=null;cyclos_gwt.__moduleBase=U;cyclos_gwt.__softPermutationId=V;cyclos_gwt.__computePropValue=null;cyclos_gwt.__getPropMap=null;cyclos_gwt.__installRunAsyncCode=function(){};cyclos_gwt.__gwtStartLoadingFragment=function(){return null};cyclos_gwt.__gwt_isKnownPropertyValue=function(){return false};cyclos_gwt.__gwt_getMetaProperty=function(){return null};var s=null;var t=o.__gwt_activeModules=o.__gwt_activeModules||{};t[S]={moduleName:S};cyclos_gwt.__moduleStartupDone=function(e){var f=t[S].bindings;t[S].bindings=function(){var a=f?f():{};var b=e[cyclos_gwt.__softPermutationId];for(var c=V;c<b.length;c++){var d=b[c];a[d[V]]=d[W]}return a}};var u;function v(){w();return u}
function w(){if(u){return}var a=p.createElement(X);a.id=S;a.style.cssText=Y+Z;a.tabIndex=-1;p.body.appendChild(a);u=a.contentWindow.document;u.open();var b=document.compatMode==$?_:ab;u.write(b+bb);u.close()}
function A(k){function l(a){function b(){if(typeof p.readyState==cb){return typeof p.body!=cb&&p.body!=null}return /loaded|complete/.test(p.readyState)}
var c=b();if(c){a();return}function d(){if(!c){if(!b()){return}c=true;a();if(p.removeEventListener){p.removeEventListener(db,d,false)}if(e){clearInterval(e)}}}
if(p.addEventListener){p.addEventListener(db,d,false)}var e=setInterval(function(){d()},eb)}
function m(c){function d(a,b){a.removeChild(b)}
var e=v();var f=e.body;var g;if(navigator.userAgent.indexOf(fb)>-1&&window.JSON){var h=e.createDocumentFragment();h.appendChild(e.createTextNode(gb));for(var i=V;i<c.length;i++){var j=window.JSON.stringify(c[i]);h.appendChild(e.createTextNode(j.substring(W,j.length-W)))}h.appendChild(e.createTextNode(hb));g=e.createElement(ib);g.language=jb;g.appendChild(h);f.appendChild(g);d(f,g)}else{for(var i=V;i<c.length;i++){g=e.createElement(ib);g.language=jb;g.text=c[i];f.appendChild(g);d(f,g)}}}
cyclos_gwt.onScriptDownloaded=function(a){l(function(){m(a)})};r(kb,lb);var n=p.createElement(ib);n.src=k;if(cyclos_gwt.__errFn){n.onerror=function(){cyclos_gwt.__errFn(mb,new Error(nb+code))}}p.getElementsByTagName(ob)[V].appendChild(n)}
cyclos_gwt.__startLoadingFragment=function(a){return D(a)};cyclos_gwt.__installRunAsyncCode=function(a){var b=v();var c=b.body;var d=b.createElement(ib);d.language=jb;d.text=a;c.appendChild(d);c.removeChild(d)};function B(){var c={};var d;var e;var f=p.getElementsByTagName(pb);for(var g=V,h=f.length;g<h;++g){var i=f[g],j=i.getAttribute(qb),k;if(j){j=j.replace(rb,ab);if(j.indexOf(sb)>=V){continue}if(j==tb){k=i.getAttribute(ub);if(k){var l,m=k.indexOf(vb);if(m>=V){j=k.substring(V,m);l=k.substring(m+W)}else{j=k;l=ab}c[j]=l}}else if(j==wb){k=i.getAttribute(ub);if(k){try{d=eval(k)}catch(a){alert(xb+k+yb)}}}else if(j==zb){k=i.getAttribute(ub);if(k){try{e=eval(k)}catch(a){alert(xb+k+Ab)}}}}}__gwt_getMetaProperty=function(a){var b=c[a];return b==null?null:b};s=d;cyclos_gwt.__errFn=e}
function C(){function e(a){var b=a.lastIndexOf(Bb);if(b==-1){b=a.length}var c=a.indexOf(Cb);if(c==-1){c=a.length}var d=a.lastIndexOf(Db,Math.min(c,b));return d>=V?a.substring(V,d+W):ab}
function f(a){if(a.match(/^\w+:\/\//)){}else{var b=p.createElement(Eb);b.src=a+Fb;a=e(b.src)}return a}
function g(){var a=__gwt_getMetaProperty(Gb);if(a!=null){return a}return ab}
function h(){var a=p.getElementsByTagName(ib);for(var b=V;b<a.length;++b){if(a[b].src.indexOf(Hb)!=-1){return e(a[b].src)}}return ab}
function i(){var a=p.getElementsByTagName(Ib);if(a.length>V){return a[a.length-W].href}return ab}
function j(){var a=p.location;return a.href==a.protocol+Jb+a.host+a.pathname+a.search+a.hash}
var k=g();if(k==ab){k=h()}if(k==ab){k=i()}if(k==ab&&j()){k=e(p.location.href)}k=f(k);return k}
function D(a){if(a.match(/^\//)){return a}if(a.match(/^[a-zA-Z]+:\/\//)){return a}return cyclos_gwt.__moduleBase+a}
function F(){var f=[];var g=V;function h(a,b){var c=f;for(var d=V,e=a.length-W;d<e;++d){c=c[a[d]]||(c[a[d]]=[])}c[a[e]]=b}
var i=[];var j=[];function k(a){var b=j[a](),c=i[a];if(b in c){return b}var d=[];for(var e in c){d[c[e]]=e}if(s){s(a,d,b)}throw null}
j[Kb]=function(){var a=navigator.userAgent.toLowerCase();var b=p.documentMode;if(function(){return a.indexOf(Lb)!=-1}())return Mb;if(function(){return a.indexOf(Nb)!=-1&&(b>=eb&&b<Ob)}())return Pb;if(function(){return a.indexOf(Nb)!=-1&&(b>=Qb&&b<Ob)}())return Rb;if(function(){return a.indexOf(Nb)!=-1&&(b>=Sb&&b<Ob)}())return Tb;if(function(){return a.indexOf(Ub)!=-1||b>=Ob}())return Vb;return ab};i[Kb]={'gecko1_8':V,'ie10':W,'ie8':Wb,'ie9':Xb,'safari':Yb};__gwt_isKnownPropertyValue=function(a,b){return b in i[a]};cyclos_gwt.__getPropMap=function(){var a={};for(var b in i){if(i.hasOwnProperty(b)){a[b]=k(b)}}return a};cyclos_gwt.__computePropValue=k;o.__gwt_activeModules[S].bindings=cyclos_gwt.__getPropMap;r(O,Zb);if(q()){return D($b)}var l;try{h([Mb],_b);h([Vb],ac);l=f[k(Kb)];var m=l.indexOf(bc);if(m!=-1){g=parseInt(l.substring(m+W),eb);l=l.substring(V,m)}}catch(a){}cyclos_gwt.__softPermutationId=g;return D(l+cc)}
function G(){if(!o.__gwt_stylesLoaded){o.__gwt_stylesLoaded={}}r(dc,P);r(dc,ec)}
B();cyclos_gwt.__moduleBase=C();t[S].moduleBase=cyclos_gwt.__moduleBase;var H=F();if(o){var I=!!(o.location.protocol==fc||o.location.protocol==gc);o.__gwt_activeModules[S].canRedirect=I;function J(){var b=hc;try{o.sessionStorage.setItem(b,b);o.sessionStorage.removeItem(b);return true}catch(a){return false}}
if(I&&J()){var K=ic;var L=o.sessionStorage[K];if(!/^http:\/\/(localhost|127\.0\.0\.1)(:\d+)?\/.*$/.test(L)){if(L&&(window.console&&console.log)){console.log(jc+L)}L=ab}if(L&&!o[K]){o[K]=true;o[K+kc]=C();var M=p.createElement(ib);M.src=L;var N=p.getElementsByTagName(ob)[V];N.insertBefore(M,N.firstElementChild||N.children[V]);return false}}}G();r(O,ec);A(H);return true}
cyclos_gwt.succeeded=cyclos_gwt();