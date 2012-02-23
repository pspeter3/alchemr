class Question
  include Mongoid::Document
  
  field :prompt, :type => String
  field :img, :type => String
  field :required, :type => Boolean, :default => true
  field :type, :type => Symbol, :default => :multiple
  field :options, :type => Array, :default => []
  
  validates_presence_of :prompt
  validates_presence_of :type
  validates_presence_of :options
  
  embedded_in :survey
end
