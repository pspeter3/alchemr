require 'spec_helper'

describe Account do
  let(:account) { Account.new }
  it 'can be created' do
    account.should_not be_nil
  end
  it { should have_many(:websites) }
end
