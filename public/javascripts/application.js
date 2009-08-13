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

$j(document).ready(function() { 
	setTimeout(function () { $j('#flash-message').fadeOut(); }, 8000); 
});  

$j(document).ready(function() { 
   	$("#btn li a").addClass("ui-corner-all");
});