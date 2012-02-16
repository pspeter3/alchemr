Krater.controllers :accounts do
  get :index do
  end

  get :new do
    @account = Account.new
    render 'accounts/new'
  end

  post :create, :map => '/accounts' do
    @account = Account.new(params[:account])
    if @account.save
      flash[:notice] = 'Account was successfully created.'
      redirect url(:accounts, :edit, :id => @account.id)
    else
      render 'accounts/new'
    end
  end

  get :show, :map => '/accounts/:id' do
  end

  get :edit, :map => '/accounts/:id/edit' do
  end

  put :update, :map => '/accounts/:id' do
  end

  delete :destroy, :map => '/accounts/:id' do
  end

end
