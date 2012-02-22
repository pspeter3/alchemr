# Helper methods defined here can be accessed in any controller or view in the application

Krater.helpers do
  def require_login
    unless logged_in?
      flash[:warning] = 'You must be logged in to see that page.'
      session[:redirect_url] = request.url
      redirect url(:sessions, :new)
    end
  end
end
