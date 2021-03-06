# Helper methods defined here can be accessed in any controller or view in the application

Alchemr.helpers do
  # Check to make sure the user is logged in. If not, add a login in redirect
  # so users can go where they wanted to
  def require_login
    unless logged_in?
      flash[:warning] = 'You must be logged in to see that page.'
      session[:redirect_url] = request.url
      redirect url(:sessions, :new)
    end
  end
  
  def authorized?(condition)
    if condition
      yield
    else
      flash[:warning] = 'You do not have permission for that.'
      redirect url(:static, :index)
    end
  end
  
  def require_logged_out
    if logged_in?
      flash[:warning] = 'You are already logged in'
      redirect url(:static, :index)
    end
  end
end
