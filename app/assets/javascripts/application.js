// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require init

// var h = $(window).height();
// var w = $(window).width();
  
//   // sets style for scroll positioning


 $(window).scroll(function() {

 		if($(document).scrollTop() > 0) {
    $('#scroll-hint').css("display", "none");
  } else {
    $('#scroll-hint').css("display", "block");
  };

 });


 $(document).on("page:change", function() {

 	if ($('body').hasClass("application")
 		&& $('body').hasClass("index")) {

 	document.getElementById("wrapper").style.width = "100%";

	document.getElementById("footer").style.display = "relative";
		document.getElementById("footer-wide").style.display = "none";

	$(document).ready(function blinker() {

		if ($(document).scrollTop() == 0) {

	  $('#scroll-hint').fadeOut(1700);
		$('#scroll-hint').fadeIn(1700);
		for (var start = 0; start <= 15; start++) {
					blinker(); } }		

	});

} else {

		document.getElementById("footer").style.display = "none";
		document.getElementById("footer-wide").style.display = "block";

};

});