Krater.controllers :accounts do
  get :index do
  end

  get :new do
    @account = Account.new
    render 'accounts/new'
  end

  post :create, :map => '/accounts' do
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
