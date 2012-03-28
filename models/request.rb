class Request
  # Modules
  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessible :msg, :survey_id, :website_id
  
  # Fields
  field :msg, :type => String
  field :status, :type => String, :default => 'pending'
  field :from, :type => String
  field :to, :type => String
  
  # Relations
  belongs_to :website
  belongs_to :survey
end