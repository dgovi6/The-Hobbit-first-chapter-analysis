$(document).ready(function() {
  
  	$(".scroll").click(function() {
 		$("html, body").animate({
 			scrollTop: $($(this).attr("href")).offset().top + "px"
 		}, {
			duration: 650,
 			easing: "easeInOutExpo"
 		});
 		return false;
 	});
 
});