class Website
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields
  include Mongoid::Denormalize
  
  # Fields
  field :name, :type => String
  field :url, :type => String
  field :desc, :type => String
  field :msg, :type => String
  field :restricted, :type => Boolean, :default => false
  field :key, :type => String
  
  # Validations
  validates_presence_of :name
  validates_presence_of :url
  validates_format_of :url, :with => /(?i)\b((?:[a-z][\w-]+:(?:\/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?]))/  
  
  # Associations
  belongs_to :account
  has_many :requests
  
  # Denormalization
  denormalize :fullname, :from => :account
  
  # Callbacks
  before_create :generate_key
  
  private
    def generate_key
      self.key = Digest::MD5.hexdigest(self.id.to_s + self.created_at.to_i.to_s)
    end
end
