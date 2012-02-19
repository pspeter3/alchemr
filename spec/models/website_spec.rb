require 'spec_helper'

describe Website do
  let(:website) { Website.new }
  it 'can be created' do
    website.should_not be_nil
  end
  it { should have_fields(:name, :url, :img, :desc).of_type(String) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:url) }
  it 'should have a url Regex constant' { Website.url_regex.should eql /(?i)\b((?:[a-z][\w-]+:(?:\/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))/ }
  it { should validate_format_of(:url).with(Website.url_regex) }
end
