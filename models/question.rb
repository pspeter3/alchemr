class Question
  include Mongoid::Document
  
  field :prompt, :type => String
  field :help, :type => String
  field :required, :type => Boolean
  field :type, :type => Symbol
  field :config, :type => Hash
  
  validates_presence_of :prompt
  validates_presence_of :type
  
  embedded_in :survey
end
