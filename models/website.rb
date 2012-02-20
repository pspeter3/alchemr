class Website
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields
  
  # Fields
  field :name, :type => String
  field :url, :type => String
  field :img, :type => String
  field :desc, :type => String
  
  # Validations
  validates_presence_of :name
  validates_presence_of :url
  validates_format_of :url, :with => /(?i)\b((?:[a-z][\w-]+:(?:\/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?]))/  
  
  # Associations
  belongs_to :account
end
