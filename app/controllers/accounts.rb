Alchemr.controllers :accounts do
  before :new, :create do
    require_logged_out
  end
  
  before :edit, :update do
    require_login
  end
  
  get :new do
    @account = Account.new
    render 'accounts/new'
  end

  post :create, :map => '/accounts' do
    @account = Account.new(params[:account])
    if @account.save
      set_current_account(@account)
      flash[:success] = 'Account was successfully created.'
      redirect url(:accounts, :show, :id => @account.id)
    else
      render 'accounts/new'
    end
  end

  get :show, :map => '/accounts/:id' do
    @account = Account.find(params[:id])
    render 'accounts/show'
  end

  get :edit, :map => '/accounts/:id/edit' do
    @account = Account.find(params[:id])
    authorized? @account == current_account do
      render 'accounts/edit'
    end
  end

  put :update, :map => '/accounts/:id' do
    @account = Account.find(params[:id])
    authorized? @account == current_account do
      if @account.update_attributes(params[:account])
        flash[:success] = 'Account was successfully updated.'
        redirect url(:accounts, :show, :id => @account.id)
      else
        render 'accounts/edit'
      end
    end
  end
end