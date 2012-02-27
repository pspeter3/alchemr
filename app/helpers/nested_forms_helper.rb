Alchemr.helpers do
  def remove_fields(model)
    link_to '<i class="icon-remove-sign icon-white"></i> Remove', '#', :class => 'btn btn-danger', :onclick => "removeFields('#{model}', this); return false;"
  end
  
  def add_fields(association, f)
    new_object = f.object.send(association).build 
    fields = capture_html do
      temp = nil
      f.fields_for(association, new_object) do |builder|  
        temp = partial(association.to_s + "/form", :locals => {:f => builder})
        
        nil # Make sure the block returns nil
      end
      
      temp
    end
    # Make sure to replace the id
    fields.gsub!(/attributes_\d+/, 'attributes_$id')
    fields.gsub!(/attributes\]\[\d+\]/, 'attributes][$id]')
    
    "addFields(\".#{association.to_s}\", \"#{js_escape_html(fields)}\"); return false;"
  end
end
