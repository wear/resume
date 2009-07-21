// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults 

var $j = jQuery;
 
$j.ajaxSetup({'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")} });

function postition_time_period(ele) {  
    if(ele.value == 'no') {
        $('.end_at').hide();
		ele.value = 'yes';
    } else {
	       $('.end_at').show();
		ele.value = 'no';
	}
}      

function copyToClipboard(txt)
{
 if (window.clipboardData)
 {
 window.clipboardData.clearData();
 window.clipboardData.setData("Text", txt);
 }
 else if (navigator.userAgent.indexOf("Opera") != -1)
 {
 window.location = txt;
 }
 else if (window.netscape)
 {
 try
 {
 netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
 }
 catch (e)
 {
 alert("您的firefox安全限制限制您进行剪贴板操作，请打开'about:config'将signed.applets.codebase_principal_support'设置为true'之后重试");
 return false;
 }
 var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
 if (!clip)
 return false;
 var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
 if (!trans)
 return false;
 trans.addDataFlavor('text/unicode');
 var str = new Object();
 var len = new Object();
 var str = Components.classes['@mozilla.org/supports-string;1'].createInstance(Components.interfaces.nsISupportsString);
 var copytext = txt;
 str.data = copytext;
 trans.setTransferData("text/unicode",str,copytext.length*2);
 var clipid = Components.interfaces.nsIClipboard;
 if (!clip)
 return false;
 clip.setData(trans,null,clipid.kGlobalClipboard);
 }
 return true;
}
