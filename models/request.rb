class Request
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :msg, :type => String
  field :status, :type => String, :default => 'pending'
  field :req, :type => String
  field :own, :type => String
  
  belongs_to :website
  belongs_to :survey
end
