Krater.controllers :sessions do
  get :new, :map => '/login' do
    render 'sessions/new'
  end
  
  post :create, :map => '/login' do
    if account = Account.authenticate(params[:email], params[:password])
      set_current_account(account)
      redirect url(:static, :index)
    else
      flash[:warning] = "Wrong or email or password."
      redirect url(:sessions, :new)
    end
  end
  
  delete :destroy, :map => '/logout' do
    set_current_account(nil)
    redirect url(:static, :index)
  end
end
