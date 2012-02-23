Krater.controllers :surveys do
  before do
    require_login
  end
  
  get :index do
  end

  get :new do
    @survey = Survey.new
    @survey.questions.build
    render 'surveys/new'
  end

  post :create, :map => '/surveys', :provides => :json do
    split_options
    @survey = Survey.new(params[:survey])
    @survey.account = current_account
    @survey.save
    @survey.to_json
  end

  get :show do
  end

  get :edit do
  end

  put :update do
  end

end
