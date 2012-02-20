require 'spec_helper'

describe Website do
  let(:website) { Website.new }
  it 'can be created' do
    website.should_not be_nil
  end
  it { should have_fields(:name, :url, :desc).of_type(String) }
  it { should have_field(:tags).of_type(Array).with_default_value_of([]) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:url) }
  it { should validate_format_of(:url) }
  it { should belong_to(:account) }
end
