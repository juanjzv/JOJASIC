// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  $('.search')
  .bind('click', function(event) {
  $(".search-field").toggleClass("expand-search");
$(".search-field").focus();
})
});


$(function() {
    $('.button-like')
        .bind('click', function(event) {
            $(this).toggleClass("liked");
        })
});


