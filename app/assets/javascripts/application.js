// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function bind_buy() {
  $('.buy-button').on('click', function(event) {
    var url = $(event.target).data('comment-buy-path') + '.json';

    $.post(url, function(response) {
      if(response.success)
        window.location.href = window.location.href;
      else
        alert(response.error);
    });
  });

  $('.report-button').on('click', function(event) {
    var url = $(event.target).data('comment-report-path') + '.json';

    $.post(url, function(response) {
      alert("Comment successfully reported.");
    });
  });
}

$(document).ready(bind_buy);
$(document).on('page:load', bind_buy);