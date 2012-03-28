Alchemr.controllers :requests do
  before do
    require_login
  end
  
  get :index do
    @incoming = Request.where(:to => current_account.id, :status => 'pending')
    @outgoing = Request.where(:from => current_account.id, :status => 'pending')
    render 'requests/index'
  end

  post :create, :map => '/requests', :provides => :js do
    @request = Request.new(params[:request])
    @request.from = current_account.id
    if @request.website.account_id == current_account.id
      @request.to = @request.survey.account_id
    else
      @request.to = @request.website.account_id
    end
    @request.save

    '$("#request").modal("hide");'
  end
end
