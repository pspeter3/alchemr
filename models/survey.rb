class Survey
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields
  include Mongoid::Denormalize
  
  field :title, :type => String
  field :active, :type => Boolean, :default => true
  field :max, :type => Integer
  field :restricted, :type => Boolean, :default => false
  field :users, :type => Array, :default => []
  
  validates_presence_of :title
  validates_presence_of :max
  validates_numericality_of :max, :greater_than_or_equal_to => 50, :only_integer => true
  validate :has_questions
  
  embeds_many :questions
  accepts_nested_attributes_for :questions, :reject_if => proc {|attr| attr['prompt'].blank? && attr['options'].empty? }, :allow_destroy => true
  belongs_to :account
  has_many :requests
  
  # Denormalization
  denormalize :name, :from => :account
  
  private
  def has_questions
    errors.add(:questions, "must have at least one question") if self.questions.empty?
  end
end
