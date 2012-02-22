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
    if @website.account != current_account
      flash[:warning] = 'You may not edit that website.'
      redirect request.referrer
    end
    render 'websites/edit'
  end

  put :update, :map => '/websites/:id' do
  end

  delete :destroy, :map => '/websites/:id' do
  end
end
