Alchemr.controllers :surveys do
  before do
    require_login
  end
  
  get :index do
    @surveys = current_account.surveys
    render 'surveys/index'
  end

  get :new do
    @survey = Survey.new
    render 'surveys/new'
  end

  post :create, :map => '/surveys' do
    convert_options
    @survey = Survey.new(params[:survey])
    @survey.account = current_account
    if @survey.save
      flash[:success] = 'Survey successfully created.'
      redirect url(:surveys, :show, :id => @survey.id)
    else
      render 'surveys/new'
    end
  end

  get :show, :map => '/surveys/:id' do
    @survey = Survey.find(params[:id])
    render 'surveys/show'
  end

  get :edit, :map => '/surveys/:id/edit' do
    @survey = Survey.find(params[:id])
    render 'surveys/edit'
  end

  put :update, :map => '/surveys/:id' do
    convert_options
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
      flash[:success] = 'Survey was successfully updated.'
      redirect url(:surveys, :show, :id => @survey.id)
    else
      render 'surveys/edit'
    end
  end
end
