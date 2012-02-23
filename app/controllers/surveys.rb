Krater.controllers :surveys do
  before do
    require_login
  end
  
  get :index do
  end

  get :new do
    @survey = Survey.new
    render 'surveys/new'
  end

  post :create, :map => '/surveys' do
    split_options
    @survey = Survey.new(params[:survey])
    @survey.account = current_account
    if @survey.save
      flash[:success] = 'Survey successfully created.'
      redirect url(:surveys, :show, :id => @survey.id)
    else
      render 'surveys/new'
    end
  end

  get :show do
  end

  get :edit do
  end

  put :update do
  end

end
