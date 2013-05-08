// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
function jsRoar() {
	alert("I am JavaScript. Hear me Roar!");
}

$(document).ready(function() {
	$('.Rock').click(function() {
		$('#Rock').toggle();
	});
});

$(document).ready(function() {
	$('.Blues').click(function() {
		$('#Blues').toggle();
	});
});

$(document).ready(function() {
	$('.Pop').click(function() {
		$('#Pop').toggle();
	});
});

$(document).ready(function() {
	$('.Gospel').click(function() {
		$('#Gospel').toggle();
	});
});

$(document).ready(function() {
	$('.Rap').click(function() {
		$('#Rap').toggle();
	});
});

$(document).ready(function() {
	$('.Jazz').click(function() {
		$('#Jazz').toggle();
	});
});