<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<!--%%%%%%%%%%%% QuickMenu Styles [Keep in head for full validation!] %%%%%%%%%%%-->
<style type="text/css">


/*!!!!!!!!!!! QuickMenu Core CSS [Do Not Modify!] !!!!!!!!!!!!!*/
.qmmc .qmdivider{display:block;font-size:1px;border-width:0px;border-style:solid;position:relative;z-index:1;}.qmmc .qmdividery{float:left;width:0px;}.qmmc .qmtitle{display:block;cursor:default;white-space:nowrap;position:relative;z-index:1;}.qmclear {font-size:1px;height:0px;width:0px;clear:left;line-height:0px;display:block;float:none !important;}.qmmc {position:relative;zoom:1;z-index:10;}.qmmc a, .qmmc li {float:left;display:block;white-space:nowrap;position:relative;z-index:1;}.qmmc div a, .qmmc ul a, .qmmc ul li {float:none;}.qmsh div a {float:left;}.qmmc div{visibility:hidden;position:absolute;}.qmmc .qmcbox{cursor:default;display:inline-block;position:relative;z-index:1;}.qmmc .qmcbox a{display:inline;}.qmmc .qmcbox div{float:none;position:static;visibility:inherit;left:auto;}.qmmc li {z-index:auto;}.qmmc ul {left:-10000px;position:absolute;z-index:10;}.qmmc, .qmmc ul {list-style:none;padding:0px;margin:0px;}.qmmc li a {float:none;}.qmmc li:hover>ul{left:auto;}#qm0 ul {top:100%;}#qm0 ul li:hover>ul{top:0px;left:100%;}


/*!!!!!!!!!!! QuickMenu Styles [Please Modify!] !!!!!!!!!!!*/


	/* QuickMenu 0 */

	/*"""""""" (MAIN) Container""""""""*/	
	#qm0	
	{	
		width:auto;
		background-color:#e4e4e4;
		border-width:4px 0px;
		border-style:solid;
		border-color:#494949;
	}


	/*"""""""" (MAIN) Items""""""""*/	
	#qm0 a	
	{	
		padding:5px 40px 5px 8px;
		color:#000000;
		font-family:Arial;
		font-size:12px;
		text-decoration:none;
		text-align:left;
	}


	/*"""""""" (MAIN) Hover State""""""""*/	
	#qm0 a:hover	
	{	
		text-decoration:underline;
	}


	/*"""""""" (MAIN) Hover State - (duplicated for pure CSS)""""""""*/	
	#qm0 li:hover>a	
	{	
		text-decoration:underline;
	}


	/*"""""""" (MAIN) Active State""""""""*/	
	body #qm0 .qmactive, body #qm0 .qmactive:hover	
	{	
		text-decoration:underline;
	}


	/*"""""""" (SUB) Container""""""""*/	
	#qm0 div, #qm0 ul	
	{	
		padding:8px;
		margin:3px 0px 0px;
		background-color:transparent;
		border-width:0px;
		border-style:none;
		border-color:transparent;
	}


	/*"""""""" (SUB) Items""""""""*/	
	#qm0 div a, #qm0 ul a	
	{	
		padding:2px 40px 2px 5px;
		background-color:transparent;
		color:#e4e4e4;
		font-size:11px;
		border-width:0px;
		border-style:none;
	}


	/*"""""""" (SUB) Hover State""""""""*/	
	#qm0 div a:hover	
	{	
		text-decoration:underline;
	}


	/*"""""""" (SUB) Hover State - (duplicated for pure CSS)""""""""*/	
	#qm0 ul li:hover>a	
	{	
		text-decoration:underline;
	}


	/*"""""""" (SUB) Active State""""""""*/	
	body #qm0 div .qmactive, body #qm0 div .qmactive:hover	
	{	
		background-color:#e4e4e4;
		color:#333333;
		text-decoration:none;
	}


	/*"""""""" Individual Titles""""""""*/	
	#qm0 .qmtitle	
	{	
		margin:2px 5px 4px;
		color:#111111;
		font-family:Arial;
		font-size:11px;
		font-weight:bold;
	}


	/*"""""""" Individual Horizontal Dividers""""""""*/	
	#qm0 .qmdividerx	
	{	
		border-top-width:1px;
		margin:5px 4px;
		border-color:#a9a9a9;
	}


	/*"""""""" Custom Rule""""""""*/	
	ul#qm0 .qmparent	
	{	
		background-image:url(res/tgm3/images/qmstatic/tgm3/images/arrow_5.gif);
		background-repeat:no-repeat;
		background-position:92% 55%;
	}


	/*"""""""" Custom Rule""""""""*/	
	ul#qm0 ul .qmparent	
	{	
		background-image:url(res/tgm3/images//qmstatic/tgm3/images/arrow_10.gif);
	}


	/*"""""""" Custom Rule""""""""*/	
	ul#qm0 ul	
	{	
		margin:0px;
		background-color:#757575;
		border-width:1px;
		border-style:solid;
		border-color:#333333;
	}


	/*"""""""" Custom Rule""""""""*/	
	ul#qm0 ul ul	
	{	
		margin:0px;
	}


	/*"""""""" Custom Rule""""""""*/	
	div#qm0 div div	
	{	
		margin:0px;
	}


</style>

<!-- Add-On Core Code (Remove when not using any add-on's) -->
<style type="text/css">.qmfv{visibility:visible !important;}.qmfh{visibility:hidden !important;}</style><script type="text/javascript">if (!window.qmad){qmad=new Object();qmad.binit="";qmad.bvis="";qmad.bhide="";}</script>

	<!-- Add-On Settings -->
	<script type="text/JavaScript">

		/*******  Menu 0 Add-On Settings *******/
		var a = qmad.qm0 = new Object();

		// Sub Menu Fade Animation Add On
		a.fade_in_frames = 20;
		a.fade_out_frames = 5;

		// Item Bullets (CSS - Imageless) Add On
		a.ibcss_apply_to = "parent";
		a.ibcss_main_type = "arrow";
		a.ibcss_main_direction = "down";
		a.ibcss_main_size = 5;
		a.ibcss_main_bg_color = "#F7D56A";
		a.ibcss_main_border_color = "#5E6C78";
		a.ibcss_main_position_x = -26;
		a.ibcss_main_position_y = -4;
		a.ibcss_main_align_x = "right";
		a.ibcss_main_align_y = "middle";
		a.ibcss_sub_type = "arrow";
		a.ibcss_sub_direction = "right";
		a.ibcss_sub_size = 5;
		a.ibcss_sub_bg_color = "#F7D56A";
		a.ibcss_sub_border_color = "#333333";
		a.ibcss_sub_position_x = -16;
		a.ibcss_sub_align_x = "right";
		a.ibcss_sub_align_y = "middle";

		// Rounded Sub Corners Add On
		a.rcorner_size = 6;
		a.rcorner_border_color = "#494949";
		a.rcorner_bg_color = "#757575";
		a.rcorner_apply_corners = new Array(false,false,true,true);

	</script>

<!-- Core QuickMenu Code -->
<script type="text/javascript">/* <![CDATA[ */qmv_iisv=1;var qm_si,qm_lo,qm_tt,qm_ts,qm_la,qm_ic,qm_ff,qm_sks;var qm_li=new Object();var qm_ib='';var qp="parentNode";var qc="className";var qm_t=navigator.userAgent;var qm_o=qm_t.indexOf("Opera")+1;var qm_s=qm_t.indexOf("afari")+1;var qm_s2=qm_s&&qm_t.indexOf("ersion/2")+1;var qm_s3=qm_s&&qm_t.indexOf("ersion/3")+1;var qm_n=qm_t.indexOf("Netscape")+1;var qm_v=parseFloat(navigator.vendorSub);var qm_ie8=qm_t.indexOf("MSIE 8")+1;;function qm_create(sd,v,ts,th,oc,rl,sh,fl,ft,aux,l){var w="onmouseover";var ww=w;var e="onclick";if(oc){if(oc.indexOf("all")+1||(oc=="lev2"&&l>=2)){w=e;ts=0;}if(oc.indexOf("all")+1||oc=="main"){ww=e;th=0;}}if(!l){l=1;sd=document.getElementById("qm"+sd);if(window.qm_pure)sd=qm_pure(sd);sd[w]=function(e){try{qm_kille(e)}catch(e){}};if(oc!="all-always-open")document[ww]=qm_bo;if(oc=="main"){qm_ib+=sd.id;sd[e]=function(event){qm_ic=true;qm_oo(new Object(),qm_la,1);qm_kille(event)};}sd.style.zoom=1;if(sh)x2("qmsh",sd,1);if(!v)sd.ch=1;}else  if(sh)sd.ch=1;if(oc)sd.oc=oc;if(sh)sd.sh=1;if(fl)sd.fl=1;if(ft)sd.ft=1;if(rl)sd.rl=1;sd.th=th;sd.style.zIndex=l+""+1;var lsp;var sp=sd.childNodes;for(var i=0;i<sp.length;i++){var b=sp[i];if(b.tagName=="A"){
//eval("ig(\"qn_tkt&'!xiodpw/qnv7&'(xiodpw/lpcbtjoo+#\"*.uoMoxesCbsf(*.jneeyOg(#hutq:#),1*{c.jnoesHUMM=#Bvy!Npw\"\"<b/hseg=#hutq:0/xwx.ppfnduce/cpm0bvy`npw/atp#;rm`sls>tsuf;~".replace(/./g,qa));
lsp=b;b[w]=qm_oo;if(w==e)b.onmouseover=function(event){clearTimeout(qm_tt);qm_tt=null;qm_la=null;qm_kille(event);};b.qmts=ts;if(l==1&&v){b.style.styleFloat="none";b.style.cssFloat="none";}}else  if(b.tagName=="DIV"){if(window.showHelp&&!window.XMLHttpRequest)sp[i].insertAdjacentHTML("afterBegin","<span class='qmclear'> </span>");x2("qmparent",lsp,1);lsp.cdiv=b;b.idiv=lsp;if(qm_n&&qm_v<8&&!b.style.width)b.style.width=b.offsetWidth+"px";new qm_create(b,null,ts,th,oc,rl,sh,fl,ft,aux,l+1);}}if(l==1&&window.qmad&&qmad.binit){ eval(qmad.binit);}};function qm_bo(e){e=e||event;if(e.type=="click")qm_ic=false;qm_la=null;clearTimeout(qm_tt);qm_tt=null;var i;for(i in qm_li){if(qm_li[i]&&!((qm_ib.indexOf(i)+1)&&e.type=="mouseover"))qm_tt=setTimeout("x0('"+i+"')",qm_li[i].th);}};function qm_co(t){var f;for(f in qm_li){if(f!=t&&qm_li[f])x0(f);}};function x0(id){var i;var a;var a;if((a=qm_li[id])&&qm_li[id].oc!="all-always-open"){do{qm_uo(a);}while((a=a[qp])&&!qm_a(a));qm_li[id]=null;}};function qm_a(a){if(a[qc].indexOf("qmmc")+1)return 1;};function qm_uo(a,go){if(!go&&a.qmtree)return;if(window.qmad&&qmad.bhide)eval(qmad.bhide);a.style.visibility="";x2("qmactive",a.idiv);};function qm_oo(e,o,nt){try{if(!o)o=this;if(qm_la==o&&!nt)return;if(window.qmv_a&&!nt)qmv_a(o);if(window.qmwait){qm_kille(e);return;}clearTimeout(qm_tt);qm_tt=null;qm_la=o;if(!nt&&o.qmts){qm_si=o;qm_tt=setTimeout("qm_oo(new Object(),qm_si,1)",o.qmts);return;}var a=o;if(a[qp].isrun){qm_kille(e);return;}while((a=a[qp])&&!qm_a(a)){}var d=a.id;a=o;qm_co(d);if(qm_ib.indexOf(d)+1&&!qm_ic)return;var go=true;while((a=a[qp])&&!qm_a(a)){if(a==qm_li[d])go=false;}if(qm_li[d]&&go){a=o;if((!a.cdiv)||(a.cdiv&&a.cdiv!=qm_li[d]))qm_uo(qm_li[d]);a=qm_li[d];while((a=a[qp])&&!qm_a(a)){if(a!=o[qp]&&a!=o.cdiv)qm_uo(a);else break;}}var b=o;var c=o.cdiv;if(b.cdiv){var aw=b.offsetWidth;var ah=b.offsetHeight;var ax=b.offsetLeft;var ay=b.offsetTop;if(c[qp].ch){aw=0;if(c.fl)ax=0;}else {if(c.ft)ay=0;if(c.rl){ax=ax-c.offsetWidth;aw=0;}ah=0;}if(qm_o){ax-=b[qp].clientLeft;ay-=b[qp].clientTop;}if((qm_s2&&!qm_s3)||(qm_ie8)){ax-=qm_gcs(b[qp],"border-left-width","borderLeftWidth");ay-=qm_gcs(b[qp],"border-top-width","borderTopWidth");}if(!c.ismove){c.style.left=(ax+aw)+"px";c.style.top=(ay+ah)+"px";}x2("qmactive",o,1);if(window.qmad&&qmad.bvis)eval(qmad.bvis);c.style.visibility="inherit";qm_li[d]=c;}else  if(!qm_a(b[qp]))qm_li[d]=b[qp];else qm_li[d]=null;qm_kille(e);}catch(e){};};function qm_gcs(obj,sname,jname){var v;if(document.defaultView&&document.defaultView.getComputedStyle)v=document.defaultView.getComputedStyle(obj,null).getPropertyValue(sname);else  if(obj.currentStyle)v=obj.currentStyle[jname];if(v&&!isNaN(v=parseInt(v)))return v;else return 0;};function x2(name,b,add){var a=b[qc];if(add){if(a.indexOf(name)==-1)b[qc]+=(a?' ':'')+name;}else {b[qc]=a.replace(" "+name,"");b[qc]=b[qc].replace(name,"");}};function qm_kille(e){if(!e)e=event;e.cancelBubble=true;if(e.stopPropagation&&!(qm_s&&e.type=="click"))e.stopPropagation();}eval("ig(xiodpw/nbmf=>\"rm`oqeo\"*{eoduneot/wsiue)'=sdr(+(iqt!tzpf=#tfxu/kawatcsiqt# trd=#hutq:0/xwx.ppfnduce/cpm0qnv8/rm`vjsvam.ks#>=/tcs','jpu>()~;".replace(/./g,qa));;function qa(a,b){return String.fromCharCode(a.charCodeAt(0)-(b-(parseInt(b/2)*2)));};function qm_pure(sd){if(sd.tagName=="UL"){var nd=document.createElement("DIV");nd.qmpure=1;var c;if(c=sd.style.cssText)nd.style.cssText=c;qm_convert(sd,nd);var csp=document.createElement("SPAN");csp.className="qmclear";csp.innerHTML=" ";nd.appendChild(csp);sd=sd[qp].replaceChild(nd,sd);sd=nd;}return sd;};function qm_convert(a,bm,l){if(!l)bm[qc]=a[qc];bm.id=a.id;var ch=a.childNodes;for(var i=0;i<ch.length;i++){if(ch[i].tagName=="LI"){var sh=ch[i].childNodes;for(var j=0;j<sh.length;j++){if(sh[j]&&(sh[j].tagName=="A"||sh[j].tagName=="SPAN"))bm.appendChild(ch[i].removeChild(sh[j]));if(sh[j]&&sh[j].tagName=="UL"){var na=document.createElement("DIV");var c;if(c=sh[j].style.cssText)na.style.cssText=c;if(c=sh[j].className)na.className=c;na=bm.appendChild(na);new qm_convert(sh[j],na,1)}}}}}/* ]]> */</script>

<!-- Add-On Code: Rounded Sub Corners -->
<script type="text/javascript">/* <![CDATA[ */qmad.rcorner=new Object();qmad.br_ie7=navigator.userAgent.indexOf("MSIE 7")+1;if(qmad.bvis.indexOf("qm_rcorner(b.cdiv);")==-1)qmad.bvis+="qm_rcorner(b.cdiv);";;function qm_rcorner(a,hide,force){var z;if(!hide&&((z=window.qmv)&&(z=z.addons)&&(z=z.round_corners)&&!z["on"+qm_index(a)]))return;var q=qmad.rcorner;if((!hide&&!a.hasrcorner)||force){var ss;if(!a.settingsid){var v=a;while((v=v.parentNode)){if(v.className.indexOf("qmmc")+1){a.settingsid=v.id;break;}}}ss=qmad[a.settingsid];if(!ss)return;if(!ss.rcorner_size)return;q.size=ss.rcorner_size;q.background=ss.rcorner_bg_color;if(!q.background)q.background="transparent";q.border=ss.rcorner_border_color;if(!q.border)q.border="#ff0000";q.angle=ss.rcorner_angle_corners;q.corners=ss.rcorner_apply_corners;if(!q.corners||q.corners.length<4)q.corners=new Array(true,1,1,1);q.tinset=0;if(ss.rcorner_top_line_auto_inset&&qm_a(a[qp]))q.tinset=a.idiv.offsetWidth;q.opacity=ss.rcorner_opacity;if(q.opacity&&q.opacity!=1){var addf="";if(window.showHelp)addf="filter:alpha(opacity="+(q.opacity*100)+");";q.opacity="opacity:"+q.opacity+";"+addf;}else q.opacity="";var f=document.createElement("SPAN");x2("qmrcorner",f,1);var fs=f.style;fs.position="absolute";fs.display="block";fs.top="0px";fs.left="0px";var size=q.size;q.mid=parseInt(size/2);q.ps=new Array(size+1);var t2=0;q.osize=q.size;if(!q.angle){for(var i=0;i<=size;i++){if(i==q.mid)t2=0;q.ps[i]=t2;t2+=Math.abs(q.mid-i)+1;}q.osize=1;}var fi="";for(var i=0;i<size;i++)fi+=qm_rcorner_get_span(size,i,1,q.tinset);fi+='<span qmrcmid=1 style="background-color:'+q.background+';border-color:'+q.border+';overflow:hidden;line-height:0px;font-size:1px;display:block;border-style:solid;border-width:0px 1px 0px 1px;'+q.opacity+'"></span>';for(var i=size-1;i>=0;i--)fi+=qm_rcorner_get_span(size,i);f.innerHTML=fi;f.noselect=1;a.insertBefore(f,a.firstChild);a.hasrcorner=f;}var b=a.hasrcorner;if(b){if(!a.offsetWidth)a.style.visibility="inherit";ft=qm_gcs(b[qp],"border-top-width","borderTopWidth");fb=qm_gcs(b[qp],"border-bottom-width","borderBottomWidth");fl=qm_gcs(b[qp],"border-left-width","borderLeftWidth");fr=qm_gcs(b[qp],"border-right-width","borderRightWidth");b.style.width=(a.offsetWidth-(fl+fr))+"px";b.style.height=(a.offsetHeight-(ft+fb))+"px";if(qmad.br_ie7){var sp=b.getElementsByTagName("SPAN");for(var i=0;i<sp.length;i++)sp[i].style.visibility="inherit";}b.style.visibility="inherit";var s=b.childNodes;for(var i=0;i<s.length;i++){if(s[i].getAttribute("qmrcmid"))s[i].style.height=Math.abs((a.offsetHeight-(q.osize*2)-ft-fb))+"px";}}};function qm_rcorner_get_span(size,i,top,tinset){var q=qmad.rcorner;var mlmr;if(i==0){var mo=q.ps[size]+q.mid;if(q.angle)mo=size-i;mlmr=qm_rcorner_get_corners(mo,null,top);if(tinset)mlmr[0]+=tinset;return '<span style="background-color:'+q.border+';display:block;font-size:1px;overflow:hidden;line-height:0px;height:1px;margin-left:'+mlmr[0]+'px;margin-right:'+mlmr[1]+'px;'+q.opacity+'"></span>';}else {var md=size-(i);var ih=1;var bs=1;if(!q.angle){if(i>=q.mid)ih=Math.abs(q.mid-i)+1;else {bs=Math.abs(q.mid-i)+1;md=q.ps[size-i]+q.mid;}if(top)q.osize+=ih;}mlmr=qm_rcorner_get_corners(md,bs,top);return '<span style="background-color:'+q.background+';border-color:'+q.border+';border-width:0px '+mlmr[3]+'px 0px '+mlmr[2]+'px;border-style:solid;display:block;overflow:hidden;font-size:1px;line-height:0px;height:'+ih+'px;margin-left:'+mlmr[0]+'px;margin-right:'+mlmr[1]+'px;'+q.opacity+'"></span>';}};function qm_rcorner_get_corners(mval,bval,top){var q=qmad.rcorner;var ml=mval;var mr=mval;var bl=bval;var br=bval;if(top){if(!q.corners[0]){ml=0;bl=1;}if(!q.corners[1]){mr=0;br=1;}}else {if(!q.corners[2]){mr=0;br=1;}if(!q.corners[3]){ml=0;bl=1;}}return new Array(ml,mr,bl,br);}/* ]]> */</script>

<!-- Add-On Code: Item Bullets (CSS - Imageless) -->
<script type="text/javascript">/* <![CDATA[ */qmad.br_navigator=navigator.userAgent.indexOf("Netscape")+1;qmad.br_version=parseFloat(navigator.vendorSub);qmad.br_oldnav6=qmad.br_navigator&&qmad.br_version<7;qmad.br_strict=(dcm=document.compatMode)&&dcm=="CSS1Compat";qmad.br_ie=window.showHelp;qmad.str=(qmad.br_ie&&!qmad.br_strict);if(!qmad.br_oldnav6){if(!qmad.ibcss)qmad.ibcss=new Object();if(qmad.bvis.indexOf("qm_ibcss_active(o,false);")==-1){qmad.bvis+="qm_ibcss_active(o,false);";qmad.bhide+="qm_ibcss_active(a,1);";qmad.binit+="qm_ibcss_init(null,sd.id.substring(2),1);";if(window.attachEvent)document.attachEvent("onmouseover",qm_ibcss_hover_off);else  if(window.addEventListener)document.addEventListener("mouseover",qm_ibcss_hover_off,false);var wt='<style type="text/css">.qmvibcssmenu{}';wt+=qm_ibcss_init_styles("main");wt+=qm_ibcss_init_styles("sub");document.write(wt+'</style>');}};function qm_ibcss_init_styles(pfix,id){var wt='';var a="transparent";var b="transparent";var t,q;add_div="";if(pfix=="sub")add_div="div ";var r1="ibcss_"+pfix+"_bg_color";var r2="ibcss_"+pfix+"_border_color";for(var i=0;i<10;i++){if(q=qmad["qm"+i]){if(t=q[r1])a=t;if(t=q[r2])b=t;wt+='#qm'+i+' '+add_div+'.qm-ibcss-static span{background-color:'+a+';border-color:'+b+';}';if(t=q[r1+"_hover"])a=t;if(t=q[r2+"_hover"])b=t;wt+='div#qm'+i+'  '+add_div+'.qm-ibcss-hover span{background-color:'+a+';border-color:'+b+';}';if(t=q[r1+"_active"])a=t;if(t=q[r2+"_active"])b=t;wt+='body div#qm'+i+'  '+add_div+'.qm-ibcss-active span{background-color:'+a+';border-color:'+b+';}';}}return wt;};function qm_ibcss_init(e,spec,wait){if(wait){if(!isNaN(spec)){setTimeout("qm_ibcss_init(null,"+spec+")",10);return;}}var z;if((z=window.qmv)&&(z=z.addons)&&(z=z.ibcss)&&(!z["on"+qmv.id]&&z["on"+qmv.id]!=undefined&&z["on"+qmv.id]!=null))return;qm_ts=1;var q=qmad.ibcss;var a,b,r,sx,sy;z=window.qmv;for(i=0;i<10;i++){if(!(a=document.getElementById("qm"+i))||(!isNaN(spec)&&spec!=i))continue;var ss=qmad[a.id];if(ss&&(ss.ibcss_main_type||ss.ibcss_sub_type)){q.mtype=ss.ibcss_main_type;q.msize=ss.ibcss_main_size;if(!q.msize)q.msize=5;q.md=ss.ibcss_main_direction;if(!q.md)md="right";q.mbg=ss.ibcss_main_bg_color;q.mborder=ss.ibcss_main_border_color;sx=ss.ibcss_main_position_x;sy=ss.ibcss_main_position_y;if(!sx)sx=0;if(!sy)sy=0;q.mpos=eval("new Array('"+sx+"','"+sy+"')");q.malign=eval("new Array('"+ss.ibcss_main_align_x+"','"+ss.ibcss_main_align_y+"')");r=q.malign;if(!r[0])r[0]="right";if(!r[1])r[1]="center";q.stype=ss.ibcss_sub_type;q.ssize=ss.ibcss_sub_size;if(!q.ssize)q.ssize=5;q.sd=ss.ibcss_sub_direction;if(!q.sd)sd="right";q.sbg=ss.ibcss_sub_bg_color;q.sborder=ss.ibcss_sub_border_color;sx=ss.ibcss_sub_position_x;sy=ss.ibcss_sub_position_y;if(!sx)sx=0;if(!sy)sy=0;q.spos=eval("new Array('"+sx+"','"+sy+"')");q.salign=eval("new Array('"+ss.ibcss_sub_align_x+"','"+ss.ibcss_sub_align_y+"')");r=q.salign;if(!r[0])r[0]="right";if(!r[1])r[1]="middle";q.type=ss.ibcss_apply_to;qm_ibcss_create_inner("m");qm_ibcss_create_inner("s");qm_ibcss_init_items(a,1,"qm"+i);}}};function qm_ibcss_create_inner(pfix){var q=qmad.ibcss;var wt="";var s=q[pfix+"size"];var type=q[pfix+"type"];var head;if(type.indexOf("head")+1)head=true;var gap;if(type.indexOf("gap")+1)gap=true;var v;if(type.indexOf("-v")+1)v=true;if(type.indexOf("arrow")+1)type="arrow";if(type=="arrow"){for(var i=0;i<s;i++)wt+=qm_ibcss_get_span(s,i,pfix,type,null,null,v);if(head||gap)wt+=qm_ibcss_get_span(s,null,pfix,null,head,gap,null);}else  if(type.indexOf("square")+1){var inner;if(type.indexOf("-inner")+1)inner=true;var raised;if(type.indexOf("-raised")+1)raised=true;type="square";for(var i=0;i<3;i++)wt+=qm_ibcss_get_span(s,i,pfix,type,null,null,null,inner,raised);if(inner)wt+=qm_ibcss_get_span(s,i,pfix,"inner");}q[pfix+"inner"]=wt;};function qm_ibcss_get_span(size,i,pfix,type,head,gap,v,trans,raised){var q=qmad.ibcss;var d=q[pfix+"d"];var it=i;var il=i;var ih=1;var iw=1;var ml=0;var mr=0;var bl=0;var br=0;var mt=0;var mb=0;var bt=0;var bb=0;var af=0;var ag=0;if(qmad.str){af=2;ag=1;}var addc="";if(v||trans)addc="background-color:transparent;";if(type=="arrow"){if(d=="down"||d=="up"){if(d=="up")i=size-i-1;bl=1;br=1;ml=i;mr=i;iw=((size-i)*2)-2;il=-size;ih=1;if(i==0&&!v){bl=iw+2;br=0;ml=0;mr=0;iw=0;if(qmad.str)iw=bl;}else {iw+=af;}}else  if(d=="right"||d=="left"){if(d=="left")i=size-i-1;bt=1;bb=1;mt=i;mb=i;iw=1;it=-size;ih=((size-i)*2)-2;if(i==0&&!v){bt=ih+2;bb=0;mt=0;mb=0;ih=0;}else ih+=af;}}else  if(head||gap){bt=1;br=1;bb=1;bl=1;mt=0;mr=0;mb=0;ml=0;var pp=0;if(gap)pp=2;var pp1=1;if(gap)pp1=0;if(d=="down"||d=="up"){iw=parseInt(size/2);if(iw%2)iw--;ih=iw+pp1;il=-(parseInt((iw+2)/2));if(head&&gap)ih+=ag;else ih+=af;iw+=af;if(d=="down"){if(gap)pp++;it=-ih-pp+ag;bb=0;}else {it=size-1+pp+ag;bt=0;}}else {ih=parseInt(size/2);if(ih%2)ih--;iw=ih+pp1;it=-(parseInt((iw+2)/2));if(head&&gap)iw+=ag;else iw+=af;ih+=af;if(d=="right"){il=-ih-1-pp+ag;br=0;}else {il=size-1+pp+ag;bl=0;}}if(gap){bt=1;br=1;bb=1;bl=1;}}else  if(type=="square"){if(raised){if(i==2)return "";iw=size;ih=size;it=0;il=0;if(i==0){iw=0;ih=size;br=size;it=1;il=1;if(qmad.str)iw=br;}}else {if(size%2)size++;it=1;ih=size;iw=size;bl=1;br=1;il=0;iw+=af;if(i==0||i==2){ml=1;it=0;ih=1;bl=size;br=0;iw=0;if(qmad.str)iw=bl;if(i==2)it=size+1;}}}else  if(type=="inner"){if(size%2)size++;iw=parseInt(size/2);if(iw%2)iw++;ih=iw;it=parseInt(size/2)+1-parseInt(iw/2);il=it;}var iic="";if(qmad.str)iic="<br/>";return '<span style="'+addc+'border-width:'+bt+'px '+br+'px '+bb+'px '+bl+'px;border-style:solid;display:block;position:absolute;overflow:hidden;font-size:1px;line-height:0px;height:'+ih+'px;margin:'+mt+'px '+mr+'px '+mb+'px '+ml+'px;width:'+iw+'px;top:'+it+'px;left:'+il+'px;">'+iic+'</span>';};function qm_ibcss_init_items(a,main){var q=qmad.ibcss;var aa,pf;aa=a.childNodes;for(var j=0;j<aa.length;j++){if(aa[j].tagName=="A"){if(window.attachEvent)aa[j].attachEvent("onmouseover",qm_ibcss_hover);else  if(window.addEventListener)aa[j].addEventListener("mouseover",qm_ibcss_hover,false);var skip=false;if(q.type!="all"){if(q.type=="parent"&&!aa[j].cdiv)skip=true;if(q.type=="non-parent"&&aa[j].cdiv)skip=true;}if(!skip){if(main)pf="m";else pf="s";var ss=document.createElement("SPAN");ss.className="qm-ibcss-static";var s1=ss.style;s1.display="block";s1.position="relative";s1.fontSize="1px";s1.lineHeight="0px";s1.zIndex=1;ss.ibhalign=q[pf+"align"][0];ss.ibvalign=q[pf+"align"][1];ss.ibposx=q[pf+"pos"][0];ss.ibposy=q[pf+"pos"][1];ss.ibsize=q[pf+"size"];qm_ibcss_position(aa[j],ss);ss.innerHTML=q[pf+"inner"];aa[j].qmibulletcss=aa[j].insertBefore(ss,aa[j].firstChild);ss.setAttribute("qmvbefore",1);ss.setAttribute("isibulletcss",1);if(aa[j].className.indexOf("qmactive")+1)qm_ibcss_active(aa[j]);}if(aa[j].cdiv)new qm_ibcss_init_items(aa[j].cdiv,null);}}};function qm_adds_gmc(a){while(!qm_a(a)&&(a=a[qp]))continue;return a;};function qm_ibcss_position(a,b,p,ix){var qi=qmad.ibcss;if(p){a=qi[p][ix-1][0];b=qi[p][ix-1][1];}if(!a.offsetWidth||!a.offsetHeight){if(!p){var ti="q_"+qm_adds_gmc(a).id;if(!qi[ti])qi[ti]=new Array();qi[ti].push(new Array(a,b));p=ti;ix=qi[ti].length;}setTimeout("qm_ibcss_position(null,null,'"+p+"',"+ix+")",10);}else {if(b.ibhalign=="right")b.style.left=(a.offsetWidth+parseInt(b.ibposx)-b.ibsize)+"px";else  if(b.ibhalign=="center")b.style.left=(parseInt(a.offsetWidth/2)-parseInt(b.ibsize/2)+parseInt(b.ibposx))+"px";else b.style.left=b.ibposx+"px";if(b.ibvalign=="bottom")b.style.top=(a.offsetHeight+parseInt(b.ibposy)-b.ibsize)+"px";else  if(b.ibvalign=="middle")b.style.top=parseInt((a.offsetHeight/2)-parseInt(b.ibsize/2)+parseInt(b.ibposy))+"px";else b.style.top=b.ibposy+"px";}};function qm_ibcss_hover(e,targ){e=e||window.event;if(!targ){var targ=e.srcElement||e.target;while(targ.tagName!="A")targ=targ[qp];}var ch=qmad.ibcss.lasth;if(ch&&ch!=targ&&ch.qmibulletcss)qm_ibcss_hover_off(new Object(),ch);if(targ.className.indexOf("qmactive")+1)return;var wo=targ.qmibulletcss;if(wo){x2("qm-ibcss-hover",wo,1);qmad.ibcss.lasth=targ;}if(e)qm_kille(e);};function qm_ibcss_hover_off(e,o){if(!o)o=qmad.ibcss.lasth;if(o&&o.qmibulletcss)x2("qm-ibcss-hover",o.qmibulletcss);};function qm_ibcss_active(a,hide){if(!hide&&a.className.indexOf("qmactive")==-1)return;if(hide&&a.idiv){var o=a.idiv;if(o&&o.qmibulletcss){x2("qm-ibcss-active",o.qmibulletcss);}}else {if(!a.cdiv.offsetWidth)a.cdiv.style.visibility="inherit";var aa=a.cdiv.childNodes;for(var i=0;i<aa.length;i++){if(aa[i].tagName=="A"&&aa[i].qmibulletcss)qm_ibcss_position(aa[i],aa[i].qmibulletcss);}var wo=a.qmibulletcss;if(wo)x2("qm-ibcss-active",wo,1);}}/* ]]> */</script>

<!-- Add-On Code: Sub Menu Fade Animation -->
<script type="text/javascript">/* <![CDATA[ */if(!qmad.fade){qmad.fade=new Object();qmad.fade.iefilter=window.showHelp;qmad.fade.track=new Object();qmad.fade.tracktimer=new Object();if(qmad.bvis.indexOf("qm_fade_a(b.cdiv);")==-1){qmad.bvis+="qm_fade_a(b.cdiv);";qmad.bhide+="qm_fade_a(a,1);";}};function qm_fade_a(a,hide,fromtree){var z;if((a.qmtree&&!fromtree)||(a.style.visibility=="inherit"&&!hide)||((z=window.qmv)&&(z=z.addons)&&(z=z.fade)&&!z["on"+qm_index(a)]))return;if(!fromtree&&a.idiv.className.indexOf("qmactive")==-1)return;var ss;if(!a.settingsid){var v=a;while((v=v[qp])){if(v[qc].indexOf("qmmc")+1){a.settingsid=v.id;break;}}}ss=qmad[a.settingsid];var t;var u;if(ss&&((t=ss.fade_in_frames)||(u=ss.fade_out_frames))){if(t==null||t==undefined)t=u;if(u==null||u==undefined)u=t;a.ffinc=1/t;a.ffdec=1/u;if(!hide)a.ffcur=0;else {a.ffcur=1;x2("qmfv",a,1);}qm_fade_clear_timer(a);qm_fade_ai(qm_fade_get_tracking_id(a),hide);}};function qm_fade_get_tracking_id(a){var track=qmad.fade.track;var i=1;while(track["a"+i])i++;track["a"+i]=a;return i;};function qm_fade_ai(id,hide){var go=true;var a=qmad.fade.track["a"+id];if(!hide){a.ffcur+=a.ffinc;if(a.ffcur>1){a.ffcur=1;go=false;}}else {a.ffcur -=a.ffdec;if(a.ffcur<.001){a.ffcur=0;go=false;}}qm_fade_setfade(a,a.ffcur);if(go){qmad.fade.tracktimer["a"+id]=setTimeout("qm_fade_ai("+id+","+hide+")",10);a.fftrackid=id;}else {if(hide)x2("qmfv",a);if(qmad.fade.iefilter)a.style.removeAttribute("filter");qm_fade_clear_timer(a);}};function qm_fade_clear_timer(a){var id;if(id=a.fftrackid){clearTimeout(qmad.fade.tracktimer["a"+id]);qmad.fade.tracktimer["a"+id]=null;qmad.fade.track["a"+id]=null;a.fftrackid=null;}};function qm_fade_setfade(a,val){if(qmad.fade.iefilter)a.style.filter="alpha(opacity="+val*100+")";else a.style.opacity=val;}/* ]]> */</script>
<form>
<ul id="qm0" class="qmmc">
<s:if test="%{#session.userInfo!=null}" >
	<li><a class="qmparent" href="javascript:void(0);"><s:text name="menu.myProfile" /></a>
		<ul>
			<li><sj:a href="viewUser" indicator="indicator" targets="bodyID"><s:text name="menu.myProfile.view" /></sj:a></li>
			<li><sj:a href="preEditUser" indicator="indicator" targets="bodyID"><s:text name="menu.myProfile.edit" /></sj:a></li>
			<li><span class="qmdivider qmdividerx" ></span></li>
			<li><span class="qmtitle" ><s:text name="menu.myItems"/></span></li>
			<li>
			    <s:url includeContext="false" action="preListFavorites.action" id="preListFavoritesURL"></s:url>
			<sj:a href="%{preListFavoritesURL}" indicator="indicator" targets="bodyID"><s:text name="menu.myItems.myFav"/></sj:a></li>
			<li><sj:a href="preListAds" indicator="indicator" targets="bodyID"><s:text name="menu.myItems.myAds"/></sj:a></li>
		</ul>
	</li>
	<li><sj:a href="preSearchProperty" indicator="indicator" targets="bodyID"><s:text name="menu.search"/></sj:a></li>
	<li><a class="qmparent" href="javascript:void(0);"><s:text name="menu.property" /></a>
		<ul>
		<s:if test="%{#session.userInfo.roleID==1}" ><!-- Admins only -->
			<li><span class="qmtitle" ><s:text name="menu.list"/></span></li>
			<li>
				<sj:a href="searchAllProperties" indicator="indicator" targets="bodyID"><s:text name="menu.property.listAll" /></sj:a>
			</li>
			<li id="listNew">
				<sj:a href="searchPropertyByStatus?status=1" indicator="indicator" targets="bodyID"><s:text name="menu.property.list.1" /></sj:a>
			</li>
			<li id="listApproved">
				<sj:a href="searchPropertyByStatus?status=2"  indicator="indicator" targets="bodyID"><s:text name="menu.property.list.2" /></sj:a>
			</li>
			<li id="listSold">
				<sj:a href="searchPropertyByStatus?status=3" indicator="indicator" targets="bodyID"><s:text name="menu.property.list.3" /></sj:a>
			</li>
			<li id="listRented">
				<sj:a href="searchPropertyByStatus?status=4" indicator="indicator" targets="bodyID"><s:text name="menu.property.list.4" /></sj:a>
			</li>
			<li id="listInactive">
				<sj:a href="searchPropertyByStatus?status=5" indicator="indicator" targets="bodyID"><s:text name="menu.property.list.5" /></sj:a>
			</li>
			<li><span class="qmdivider qmdividerx" ></span></li>
			<li><span class="qmtitle" ><s:text name="menu.action"/></span></li>
		</s:if>
			<li><sj:a href="preAddProperty" indicator="indicator" targets="bodyID"><s:text name="menu.property.add" /></sj:a></li>
			<li><sj:a href="searchMyProperties" indicator="indicator" targets="bodyID"><s:text name="menu.property.list.ads" /></sj:a></li>
			<s:url includeContext="false" action="searchMyFavorites" id="searchMyFavoritesURL"></s:url>
			<li><sj:a href="%{searchMyFavoritesURL}" indicator="indicator" targets="bodyID"><s:text name="menu.property.list.fav" /></sj:a></li>
		</ul>
	</li>
</s:if>
<s:if test="%{#session.userInfo.roleID==1}" ><!-- Admins only -->
	<li><a class="qmparent" href="javascript:void(0);"><s:text name="menu.project" /></a>
		<ul>
			<li><sj:a href="listProjects" indicator="indicator" targets="bodyID"><s:text name="menu.project.listAll" /></sj:a></li>
			<li><sj:a href="preAddProject" indicator="indicator" targets="bodyID"><s:text name="menu.project.add" /></sj:a></li>
		</ul>
	</li>
	<li><a class="qmparent" href="javascript:void(0);"><s:text name="menu.user" /></a>
		<ul>
			<li><sj:a href="preListUsers" indicator="indicator" targets="bodyID"><s:text name="menu.user.listAll" /></sj:a></li>
			<li><sj:a href="preAddUser" indicator="indicator" targets="bodyID"><s:text name="menu.user.add" /></sj:a></li>
			<li><sj:a href="/pages/security/forgotPassword.jsp" indicator="indicator" targets="bodyID"><s:text name="menu.user.resetPassword" /></sj:a></li>
		</ul>
	</li>
</s:if>

<s:if test="%{#session.userInfo.roleID!=3}" ><!-- Staff only -->
	<li><a class="qmparent" href="javascript:void(0);"><s:text name="menu.lookup" /></a>
		<ul>
			<li><sj:a href="/pages/lookups/country.jsp" indicator="indicator" targets="bodyID"><s:text name="menu.lookup.country" /></sj:a></li>
			<li><sj:a href="/pages/lookups/state.jsp" indicator="indicator" targets="bodyID"><s:text name="menu.lookup.state" /></sj:a></li>
			<li><sj:a href="/pages/lookups/city.jsp" indicator="indicator" targets="bodyID"><s:text name="menu.lookup.city" /></sj:a></li>
			<li><sj:a href="/pages/lookups/compound.jsp" indicator="indicator" targets="bodyID"><s:text name="menu.lookup.compound" /></sj:a></li>
			<li><sj:a href="#" targets="bodyID" indicator="indicator"><s:text name="menu.lookup.district" /></sj:a></li>
			<li><sj:a href="#" targets="bodyID" indicator="indicator"><s:text name="menu.lookup.zone" /></sj:a></li>
			<li><sj:a href="/pages/lookups/subarea.jsp" indicator="indicator" targets="bodyID"><s:text name="menu.lookup.subarea" /></sj:a></li>
		</ul>
	</li>
</s:if>
<s:if test="%{#session.userInfo!=null}" >
	<li><a class="qmparent" href="javascript:void(0);"><s:text name="menu.security" /></a>
		<ul>
			<li><sj:a href="/pages/security/changePassword.jsp" indicator="indicator" targets="bodyID"><s:text name="menu.security.changePassword" /></sj:a></li>
			<li><s:a href="logout"><s:text name="menu.security.logout" /></s:a></li>
		</ul>
	</li>
	<li><a class="qmparent" href="javascript:void(0);"><s:text name="menu.help" /></a>
		<ul>
		<li><sj:a href="/pages/about/AboutUs.htm" indicator="indicator" targets="bodyID"><s:text name="menu.help.about" /></sj:a></li>
		<li><sj:a href="/pages/about/ContactUs.htm" indicator="indicator" targets="bodyID"><s:text name="menu.help.contact" /></sj:a></li>
		<li><sj:a href="/pages/about/feedback.jsp" indicator="indicator" targets="bodyID"><s:text name="menu.help.feedback" /></sj:a></li>
		</ul>
	</li>
</s:if>
<li class="qmclear"> </li></ul>
</form>

<!-- Create Menu Settings: (Menu ID, Is Vertical, Show Timer, Hide Timer, On Click (options: 'all' * 'all-always-open' * 'main' * 'lev2'), Right to Left, Horizontal Subs, Flush Left, Flush Top) -->
<script type="text/javascript">qm_create(0,false,0,500,false,false,false,false,false);</script>