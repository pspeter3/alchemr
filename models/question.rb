class Question
  include Mongoid::Document
  
  field :prompt, :type => String
  field :img, :type => String
  field :required, :type => Boolean, :default => true
  field :type, :type => Symbol, :default => :multiple
  field :options, :type => Array, :default => []
  
  validates_presence_of :prompt
  validates_presence_of :type
  validate :has_options
  
  embedded_in :survey
  
  def has_options
    puts "hey"
    errors.add(:options, "must have at least two options") if self.options.length < 2
  end
end
