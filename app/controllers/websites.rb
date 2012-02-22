Krater.controllers :websites do
  before do
    require_login
  end
  
  get :index do
    @websites = current_account.websites
    render 'websites/index'
  end

  get :new do
    @website = Website.new
    render 'websites/new'
  end

  post :create, :map => '/websites' do
    @website = Website.new(params[:website])
    @website.account = current_account
    if @website.save
      flash[:success] = 'Website was successfully created.'
      redirect url(:websites, :show, :id => @website.id)
    else
      render 'websites/new'
    end
  end

  get :show, :map => '/websites/:id' do
    @website = Website.find(params[:id])
    render 'websites/show'
  end

  get :edit, :map => '/websites/:id/edit' do
    @website = Website.find(params[:id])
    unless @website.account == current_account
      flash[:warning] = 'You may not edit that website.'
      redirect request.referrer
    end
    render 'websites/edit'
  end

  put :update, :map => '/websites/:id' do
    @website = Website.find(params[:id])
    # Check for permission
    if @website.account == current_account
      # Check for update
      if @account.update_attributes(params[:account])
        flash[:success] = 'Account was successfully updated.'
        redirect url(:accounts, :show, :id => @account.id)
      else
        render 'accounts/edit'
      end
    else
      flash[:warning] = 'You may not edit that website.'
      redirect request.referrer
    end
  end

  delete :destroy, :map => '/websites/:id' do
    website = Website.find(params[:id])
    if website.account == current_account
      if website.destroy
        flash[:success] = 'Website succesfully deleted.'
        redirect url(:websites, :index)
      else
        flash[:error] = 'Website cannot be deleted.'
        redirect url(:webiste, :show, :id => website.id)
      end
    else
      flash[:warning] = 'You may not edit that website.'
      redirect request.referrer
    end 
  end
end
