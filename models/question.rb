class Question
  include Mongoid::Document
  
  field :prompt, :type => String
  field :img, :type => String
  field :type, :type => String, :default => 'radio'
  field :options, :type => Array, :default => []
  
  validates_presence_of :prompt
  validates_presence_of :type
  validates_inclusion_of :type, :in => ['radio', 'check', 'select']
  validate :has_options
  
  embedded_in :survey
  
  def has_options
    errors.add(:options, "must have at least two options") if self.options.length < 2
  end
end