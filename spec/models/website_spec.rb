require 'spec_helper'

describe "Website Model" do
  let(:website) { Website.new }
  it 'can be created' do
    website.should_not be_nil
  end
end
