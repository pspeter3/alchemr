# Helper methods defined here can be accessed in any controller or view in the application

Alchemr.helpers do
  def current_user
    if session[:user] == nil
      session[:user] = {}
      session[:user][:id] = Digest::MD5.hexdigest(request.ip + Time.now.to_i.to_s)
    end
    session[:user]
  end
end
