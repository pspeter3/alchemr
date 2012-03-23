// Put your application scripts here
$(function() {
  // Add close button to flashes
  $(".alert").prepend('<a class="close" data-dismiss="alert" href="#">&times;</a>');
  // Makes alerts look better
  $(".alert h2").addClass("alert-heading");
  // Adds alert support
  $(".alert-message").alert();
  // Add binding for bills
  setMaxBill();
  $(".max input").change(function() {
    setMaxBill();
  });
});

// Remove fields from a nested form
function removeFields(model, link) {  
    $(link).parent().prev("input[type=hidden]").attr("value", "1");  
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
  var template = '<div class="input-append option-input">' +
        '<input class="span4" name="survey[questions_attributes][$id][options_attributes][$time]" type="text">' +
        '<span class="add-on">' +
          '<a class="close" onclick="$(this).parents(\'.input-append\').remove();">×</a>' +
        '</span>' +
      '</div>'
  template = template.replace(/\$id/gi, id);
  template = template.replace(/\$time/gi, new Date().getTime());
  parent.find('.options').append(template);
}

function setMaxBill() {
  var maxResponses = $(".max input").val();
  var bill = '$';
  if (maxResponses !== undefined) {
    bill = "$" + (0.12 * maxResponses) 
  }
  $(".max .help-block").html($(".max .help-block").html().replace(/\$\d+.?\d*/, bill));
}
