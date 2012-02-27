class Survey
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields
  
  field :title, :type => String
  field :desc, :type => String
  field :active, :type => Boolean, :default => true
  field :cap, :type => Integer
  
  validates_presence_of :title
  validates_numericality_of :cap
  validate :has_questions
  
  embeds_many :questions
  accepts_nested_attributes_for :questions, :reject_if => proc {|attr| attr['prompt'].blank? && attr['options'].empty? }
  belongs_to :account
  has_and_belongs_to_many :websites
  
  private
  def has_questions
    errors.add(:questions, "must have at least one question") if self.questions.empty?
  end
end
