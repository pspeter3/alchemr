# Helper methods defined here can be accessed in any controller or view in the application

Krater.helpers do
  def split_options
    params[:survey][:questions_attributes].each {|k, v| v[:options] = v[:options].split(';') }
  end
end
