require 'spec_helper'

describe Question do
  let(:question) { Question.new }
  it 'can be created' do
    question.should_not be_nil
  end
  
  it { should have_fields(:prompt, :help).of_type(String) }
  it { should have_field(:type).of_type(Symbol) }
  it { should have_field(:config).of_type(Hash) }
  it { should have_field(:required).of_type(Boolean) }
  
  it { should validate_presence_of(:prompt) }
  it { should validate_presence_of(:type) }
  
  it { should belong_to(:survey) }
end
