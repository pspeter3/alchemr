Krater.helpers do
  def remove_fields(model)
    link_to '<i class="icon-remove-sign icon-white"></i> Remove', '#', :class => 'btn btn-danger pull-right', :onclick => "removeFields('#{model}', this); return false;"
  end
  
  def add_fields_function(collection, model, template)
    template = fields_for model do |f|
      partial template, :locals => {:f => f}
    end
    puts template.methods.sort
    
    "addFields(#{collection}, #{template}); return false;"
  end
end
