require 'spec_helper'

describe Survey do
  let(:survey) { Survey.new }
  it 'can be created' do
    survey.should_not be_nil
  end
  
  it { should have_fields(:title, :desc).of_type(String) }
  it { should have_field(:active).of_type(Boolean).with_default_value_of(true) }
  it { should have_field(:cap).of_type(Integer) }
  
  it { should validate_presence_of(:title) }
  it { should validate_numericality_of(:cap) }
  
  it { should embed_many(:questions) }
  it { should belong_to(:account) }
  
end
