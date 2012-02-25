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
    $(link).parents(model).hide();  
}

// Add fields to a nested form
function addFields(collection, html) {
  $(collection).append(html.replace(/\$id/gi, new Date().getTime()));
}

// Add an option to the question
function addQuestionOption(id) {
  var template = '<div class="input-append">' +
        '<input class="span4" name="survey[questions_attributes][$id][options][$time]" type="text">' +
        '<span class="add-on">' +
          '<a class="close">×</a>' +
        '</span>' +
      '</div>'
  template = template.replace(/\$id/gi, id);
  template = template.replace(/\$time/gi, new Date().getTime());
  console.log(template);
  $('#' + id + ' .options').append(template);
  // Removes fields
  $('.add-on .close').click(function() {
    $(this).parents('.input-append').remove();
  });
}
