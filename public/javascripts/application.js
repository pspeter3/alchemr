// Put your application scripts here
$(function() {
  // Add close button to flashes
  $(".alert").prepend('<a class="close" data-dismiss="alert" href="#">&times;</a>');
  // Makes alerts look better
  $(".alert h2").addClass("alert-heading");
  // Adds alert support
  $(".alert-message").alert();
});

// Remove fields from a nested form
function removeFields(model, link) {  
    $(link).prev("input[type=hidden]").value = "1";  
    $(link).parent(model).hide();  
}

// Add fields to a nested form
function addFields(collection, html) {
  $(collection).append(html);
}
