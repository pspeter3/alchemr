require 'spec_helper'

describe "Survey Model" do
  let(:survey) { Survey.new }
  it 'can be created' do
    survey.should_not be_nil
  end
end
