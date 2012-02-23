class Survey
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields
  
  field :title, :type => String
  field :desc, :type => String
  field :sites, :type => Array, :default => []
  field :active, :type => Boolean, :default => true
  field :cap, :type => Integer
  
  validates_presence_of :title
  validates_numericality_of :cap
  
  embeds_many :questions, :autosave => true
  accepts_nested_attributes_for :questions
  belongs_to :account
end
