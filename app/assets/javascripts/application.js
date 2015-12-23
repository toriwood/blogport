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
//= require_tree .


// code for switching divs with scroll

var $header = $('.fixed-nav-bar'),
		header_height = $('.fixed-nav-bar').height(),
		intro_height = $('#intro').height(),
		offset_val = intro_height - header_height;

function navSlide() {
	var scroll_top = $(window).scrollTop();

	if (scroll_top >= offset_val) {
		$header.addClass('fixed-nav-bar');
	} else {
		$header.removeClass('fixed-nav-bar');
	}
}

$(window).scroll(navSlide);