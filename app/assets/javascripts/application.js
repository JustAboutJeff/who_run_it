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
//= require foundation
//= require_tree .

$(document).foundation();

$('input[name=committed-switch]').click(function() {
  userId = $('#current-user-id').val();
  userAvatar = $('#current-user-avatar').val();
  data = {id: $('#notification-id').val()};
  url = '/commit';

  imgTemplate = "<img id='user-" + userId + "'class='circle icon-face' src='http://www.gravatar.com/avatar/" + userAvatar + "?s=60&d=mm'>"

  $.post(url, data, function(response) {
    if (response === 1) {
      $('#user-' + userId).remove();
      $('#committed-runners').append(imgTemplate);
    }
    else {
      $('#user-' + userId).remove();
      $('#notified-runners').append(imgTemplate);
    }
  });
});
