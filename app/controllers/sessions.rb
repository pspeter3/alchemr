Krater.controllers :sessions do
  get :new, :map => '/login' do
    render 'sessions/new'
  end
  
  post :create, :map => '/login' do
    if account = Account.authenticate(params[:email], params[:password])
      set_current_account(account)
      flash[:success] = "Welcome #{account.name} #{account.surname}."
      redirect url(:static, :index)
    else
      flash[:warning] = "Wrong or email or password."
      redirect url(:sessions, :new)
    end
  end
  
  get :destroy, :map => '/logout' do
    set_current_account(nil)
    flash[:success] = "Successfully logged out." 
    redirect url(:static, :index)
  end
end
