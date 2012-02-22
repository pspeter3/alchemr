class Survey
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields
  
  field :title, :type => String
  field :desc, :type => String
  field :sites, :type => Array, :default => []
  field :active, :type => Boolean, :default => true
  field :rate, :type => Float
  
  validates_presence_of :title
  validates_numericality_of :rate, :greater_than => 0.02
  
  embeds_many :questions
  belongs_to :account
end
