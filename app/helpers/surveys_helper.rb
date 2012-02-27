# Helper methods defined here can be accessed in any controller or view in the application

Krater.helpers do
  def convert_options
    unless params[:survey][:questions_attributes].nil?
      params[:survey][:questions_attributes].each do |k, v| 
        if v[:options_attributes].nil? 
          v['options'] = []
        else
          v['options'] = v[:options_attributes].map {|k, v| v }
        end
        v['options'].delete_if {|i| i.blank? }
        v.delete 'options_attributes'
      end
    end
  end
end
