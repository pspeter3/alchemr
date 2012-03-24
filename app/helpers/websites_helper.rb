# Helper methods defined here can be accessed in any controller or view in the application

Alchemr.helpers do
  # Public: Sets up the class variables
  #
  # model: Either a Website or Survey to associate
  # 
  def setup_requests(model)
    if model.restricted
      @request = Request.new
      if model.class == Website
        @request.website = model
        @models = current_account.surveys(:id, :name)
      else
        @request.survey = model
        @models = current_account.websites(:id, :name)
      end
    end
  end
end
