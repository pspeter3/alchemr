require 'spec_helper'

describe Survey do
  let(:survey) { Survey.new }
  it 'can be created' do
    survey.should_not be_nil
  end
  
  it { should have_fields(:title, :desc).of_type(String) }
  it { should have_field(:sites).of_type(Array) }
  
  it { should validate_presence_of(:title) }
  
  it { should embed_many(:questions) }
  it { should belong_to(:account) }
  
end
