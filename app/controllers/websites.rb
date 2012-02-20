Krater.controllers :websites do
  get :index do
    @websites = Website.all
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
  end

  put :update, :map => '/websites/:id' do
  end

  delete :destroy, :map => '/websites/:id' do
  end
end
