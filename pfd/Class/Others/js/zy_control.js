function zy_selectmenu(id){
    var sl = document.getElementById(id);
    if (sl) {
        var sp = sl.parentElement; //<span>
        if (sp) {
            var ch = sp.getElementsByTagName("div")[0];
            var t = sl.options[sl.selectedIndex].text;
            if (ch) {
                ch.innerHTML = t;
            }
        }
    }
}
function zy_selectmenu1(id,cb){
    var sl = document.getElementById(id);
    if (sl) {
        var sp = sl.parentElement; //<span>
        if (sp) {
            var ch = sp.getElementsByTagName("div")[0];
            var t = sl.options[sl.selectedIndex].text;
           cb(t);
        }
    }
}
function letter_selectmenu(id,cb){
    var sl = document.getElementById(id);
    if (sl) {
        var sp = sl.parentElement; //<span>
        if (sp) {
            var ch = sp.getElementsByTagName("div")[0];
            var t = sl.options[sl.selectedIndex].value;
			var t1 = sl.options[sl.selectedIndex].text;
           cb(t,t1);
        }
    }
}
function zy_for(e, cb){
	var ch;
	if(e.currentTarget)
    	ch = e.currentTarget.previousElementSibling;
	else
		ch = e.previousElementSibling;
    if (ch.nodeName == "INPUT") {
        if (ch.type == "checkbox") 
            ch.checked = !ch.checked;
        if (ch.type == "radio" && !ch.checked) 
            ch.checked = "checked";
        
    }
    if (cb) 
        cb(e, ch.checked);
}


function zy_fold(e, col){
    var a = e.currentTarget.nextElementSibling;
    if (a.nodeName == "DIV") {
        if (col) 
            a.className = a.className.replace("col-c", "");
        else 
            a.className += ' col-c';
    }
}
function zy_fold1(e, col){
    var a = e.currentTarget.nextElementSibling;
	var b=e.currentTarget;
    if (a.nodeName == "DIV") {
        if (col){
			  b.className= b.className.replace(/ubb/g, "");
			  a.className = a.className.replace("col-c", "");
		} else {
			 a.className += ' col-c';
			 b.className +=' ubb'
		}
           
    }

}

function zy_touch(c, f){
    var t = event.currentTarget;
	if(!t.zTouch) {
        t.zTouch = new zyClick(t, f, c); 
		t.zTouch._touchStart(event);
    }
}

function zy_parse(){
    var params = {};
    var loc = String(document.location);
    if (loc.indexOf("?") > 0) 
        loc = loc.substr(loc.indexOf('?') + 1);
    else 
        loc = uexWindow.getUrlQuery();
    var pieces = loc.split('&');
    params.keys = [];
    for (var i = 0; i < pieces.length; i += 1) {
        var keyVal = pieces[i].split('=');
        params[keyVal[0]] = decodeURIComponent(keyVal[1]);
        params.keys.push(keyVal[0]);
    }
    return params;
}

function $$(id)
{
	return document.getElementById(id);
}
function int(s)
{
	return parseInt(s);
}

function zy_con(id,url,x,y)
{
	var s=window.getComputedStyle($$(id),null);
	uexWindow.openPopover(id,"0",url,"",parseInt(x),parseInt(y),parseInt(s.width),parseInt(s.height),parseInt(s.fontSize),"0");
}
function zy_resize(id,x,y)
{
	var s=window.getComputedStyle($$(id),null);
	uexWindow.setPopoverFrame(id,parseInt(x),parseInt(y),parseInt(s.width),parseInt(s.height));	
}

function zy_init()
{
	if(window.navigator.platform=="Win32")
		document.body.style.fontSize=window.localStorage["defaultfontsize"];
}
function zy_cc(t){
    if (!t.cancelClick) {
        t.cancelClick = true;
        t.addEventListener("click", function(){
            event.stopPropagation();
        }, true);
    }
}

//封装openPop
function zy_con_p(id,url,x,y,fid){
    var s=window.getComputedStyle($$(id),null);
    var ft=window.getComputedStyle($$(fid),null);
    uexWindow.openPopover(id,"0",url,"",parseInt(x),parseInt(y),parseInt(s.width),'',parseInt(s.fontSize),"0",parseInt(ft.height)+12);
}
function zy_con_h(id,url,x,y)
{
    var s=window.getComputedStyle($$(id),null);
    uexWindow.openPopover(id,"0",url,"",int(x),int(y),int(s.width),int(s.height)+20,int(s.fontSize),"0");
}
function zy_resize(id,x,y)
{
    var s=window.getComputedStyle($$(id),null);
    uexWindow.setPopoverFrame(id,int(x),int(y),int(s.width),int(s.height)); 
}
function zy_resize_m(id,x,y,name)
{
    var s=window.getComputedStyle($$(id),null);
    uexWindow.setPopoverFrame(name,parseInt(x),parseInt(y),parseInt(s.width),parseInt(s.height));   
}
function zy_con_name(id,url,x,y,name)
{
    var s=window.getComputedStyle($$(id),null);
    uexWindow.openPopover(name,"0",url,"",int(x),int(y),int(s.width),int(s.height)-1,int(s.fontSize),"0");
}