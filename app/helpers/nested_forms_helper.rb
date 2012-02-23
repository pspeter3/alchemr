Krater.helpers do
  def remove_fields(model)
    link_to '<i class="icon-remove-sign icon-white"></i> Remove', '#', :class => 'btn btn-danger pull-right', :onclick => "removeFields('#{model}', this); return false;"
  end
  
  def add_fields(collection, association, f)
    new_object = f.object.send(association).build 
    fields = capture_html do
      temp = nil
      f.fields_for(association, new_object) do |builder|  
        temp = partial(association.to_s + "/form", :locals => {:f => builder})
        puts nil
      end
      
      temp
    end
    
    "addFields('#{collection}', '#{js_escape_html(fields)}'); return false;"
  end
end
