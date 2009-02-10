require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Sample, "sound attachment" do

  before do
    @sample = Sample.new
    @sample.sound = File.new(Rails.root.join("spec", "fixtures", "uploads", "snare.mp3"))
  end

  it "exists" do
    Sample.attachment_definitions.should include(:sound)
  end

  it "is placed in public/uploads/samples/123/123/123/original.mp3" do
    @sample.sound.path.should == Rails.root.join("public", "uploads", "samples", "000", "000", "000", "original.mp3").to_s
  end

  it "makes files available at /uploads/samples/123/123/123/original.mp3?1234249408" do
    @sample.sound.url.should =~ %r{^/uploads/samples/000/000/000/original.mp3}
  end

  it "is required" do
    Sample.attachment_definitions[:sound][:validations][:presence].should be_true
  end

  it "must have the 'audio/mpg' content-type"

  it "must be smaller than 1 megabyte"
end
