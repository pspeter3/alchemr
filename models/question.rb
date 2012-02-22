class Question
  include Mongoid::Document
  
  field :prompt, :type => String
  field :img, :type => String
  field :required, :type => Boolean, :default => true
  field :type, :type => Symbol
  field :options, :type => Array, :default => []
  
  validates_presence_of :prompt
  validates_presence_of :type
  
  embedded_in :survey
end
