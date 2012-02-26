# Helper methods defined here can be accessed in any controller or view in the application

Krater.helpers do
  def convert_options
    unless params[:survey][:questions_attributes].nil?
      params[:survey][:questions_attributes].each do |k, v| 
        if v[:options].nil? 
          v[:options] = []
        else
          v[:options] = v[:options].map {|k, v| v }
        end
      end
    end
  end
end
