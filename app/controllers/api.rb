Alchemr.controllers :api do
  layout :api
  
  get :call, :map => '/api/:key' do
    # Get the website
    @website = Website.where(:key => params[:key]).only(:key, :msg, :restricted).first
    # Check if it is restricted
    @survey = Survey.where(:users => {"$ne" => current_user[:id]}, :active => true).only(:title, :questions).shuffle[0]
    render 'api/call'
  end
  
  post :respond, :map => '/api/:key', :provides => :json do
    params.to_json
  end
end