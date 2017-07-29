//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(window).on('popstate', () => {
 window.location.href = window.location.href;
 });
