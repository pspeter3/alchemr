Alchemr.controllers :accounts do
  get :new do
    @account = Account.new
    render 'accounts/new'
  end

  post :create, :map => '/accounts' do
    @account = Account.new(params[:account])
    if @account.save
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
    render 'accounts/edit'
  end

  put :update, :map => '/accounts/:id' do
    @account = Account.find(params[:id])
    if @account.update_attributes(params[:account])
      flash[:success] = 'Account was successfully updated.'
      redirect url(:accounts, :show, :id => @account.id)
    else
      render 'accounts/edit'
    end
  end
end
