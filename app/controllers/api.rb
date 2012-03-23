Alchemr.controllers :api do
  get :call, :map => '/api/:key' do
    
#    @website = Website.where(:key => params[:key]).only(:key, :name, :msg).first
#    @survey = Survey.where(:users => {"$ne" => current_user[:id]}, :active => true).only(:title, :desc, :questions).first
#    render 'api/call'
  end
  
  post :respond, :map => '/api/:key', :provides => :json do
    params.to_json
  end
end
