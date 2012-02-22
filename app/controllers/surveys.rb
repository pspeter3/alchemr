Krater.controllers :surveys do
  before do
    require_login
  end
  
  get :index do
  end

  get :new do
    @survey = Survey.new
    @survey.questions << Question.new(:prompt => 'Test', :type => :select, :options => [1, 2, 3])
    render 'surveys/new'
  end

  post :create, :map => '/surveys', :provides => :json do
    params.to_json
  end

  get :show do
  end

  get :edit do
  end

  put :update do
  end

end
