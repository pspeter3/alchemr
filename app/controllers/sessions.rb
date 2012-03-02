Alchemr.controllers :sessions do
  before :new, :create do
    require_logged_out
  end
  
  before :destroy do
    require_login
  end
  
  get :new, :map => '/login' do
    render 'sessions/new'
  end
  
  post :create, :map => '/login' do
    if account = Account.authenticate(params[:email], params[:password])
      set_current_account(account)
      flash[:success] = "Welcome #{account.name} #{account.surname}."
      redirect_url = session[:redirect_url]
      if redirect_url.nil?
        redirect url(:static, :index)
      else
        session[:redirect_url] = nil
        redirect redirect_url
      end
    else
      flash[:warning] = "Wrong or email or password."
      redirect url(:sessions, :new)
    end
  end
  
  delete :destroy, :map => '/logout' do
    set_current_account(nil)
    flash[:success] = "Successfully logged out." 
    redirect url(:static, :index)
  end
end
