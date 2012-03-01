require 'spec_helper'

describe "Request Model" do
  let(:request) { Request.new }
  it 'can be created' do
    request.should_not be_nil
  end
end
