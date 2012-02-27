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
function addQuestionOption(link) {
  var parent = $(link).parents('.question');
  var id = $(parent).find(':input').first().attr('name').match(/\d+/)[0];
  var template = '<div class="input-append">' +
        '<input class="span4" name="survey[questions_attributes][$id][options_attributes][$time]" type="text">' +
        '<span class="add-on">' +
          '<a class="close" onclick="$(this).parents(\'.input-append\').remove();">×</a>' +
        '</span>' +
      '</div>'
  template = template.replace(/\$id/gi, id);
  template = template.replace(/\$time/gi, new Date().getTime());
  parent.find('.options').append(template);
}
