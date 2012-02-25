Krater.controllers :surveys do
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

  post :create, :map => '/surveys', :provides => :json do
    params[:survey].to_json
#    split_options
#    puts params.to_json
#    @survey = Survey.new(params[:survey])
#    @survey.account = current_account
#    if @survey.save
#      flash[:success] = 'Survey successfully created.'
#      redirect url(:surveys, :show, :id => @survey.id)
#    else
#      render 'surveys/new'
#    end
  end

  get :show, :map => '/surveys/:id', :provides => :json do
    @survey = Survey.find(params[:id])
    @survey.to_json
  end

  get :edit do
  end

  put :update do
  end

end
