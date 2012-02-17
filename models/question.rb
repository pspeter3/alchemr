class Question
  include Mongoid::Document
  
  field :prompt, :type => String
  field :help, :type => String
  field :required, :type => Boolean, :default => false
  field :type, :type => Symbol
  field :config, :type => Hash, :default => {}
  
  validates_presence_of :prompt
  validates_presence_of :type
  
  embedded_in :survey
end
