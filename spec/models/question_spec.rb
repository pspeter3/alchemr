require 'spec_helper'

describe Question do
  let(:question) { Question.new }
  it 'can be created' do
    question.should_not be_nil
  end
  
  it { should have_fields(:prompt, :img, :type).of_type(String) }
  it { should have_field(:type).of_type(Symbol).with_default_value_of(:multiple) }
  it { should have_field(:options).of_type(Array).with_default_value_of([]) }
  it { should have_field(:required).of_type(Boolean).with_default_value_of(false) }
  
  it { should validate_presence_of(:prompt) }
  it { should validate_presence_of(:type) }
  
  it { should be_embedded_in(:survey) }
end
