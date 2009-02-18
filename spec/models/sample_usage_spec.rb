require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SampleUsage do
  before(:each) do
    @valid_attributes = {
      :pattern => "value for pattern"
    }
  end

  it "should create a new instance given valid attributes" do
    SampleUsage.create!(@valid_attributes)
  end
end
