// Put your application scripts here
$(function() {
  // Add close button to flashes
  $(".alert").prepend('<a class="close" data-dismiss="alert" href="#">&times;</a>');
  // Makes alerts look better
  $('.alert h2').addClass('alert-heading');
  // Adds alert support
  $(".alert-message").alert();
});
