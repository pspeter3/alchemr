Alchemr.controllers :api do
  get :call, :map => '/api' do
    @website = Website.where(:key => params[:key]).only(:id, :name, :msg).first
    @survey = Survey.where(:users => {"$ne" => current_user[:id]}, :active => true).only(:id, :title, :desc, :questions).first
    @survey.to_json
    render 'api/call'
  end
  
  post :response, :map => '/api' do
  end
end
