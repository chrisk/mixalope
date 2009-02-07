require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/samples/new.html.erb" do
  it "renders a form that POSTs to /samples" do
    assigns[:sample] = stub_model(Sample, :new_record? => true)
    render "/samples/new.html.erb"

    response.should have_tag("form[action=?][method=post]", "/samples")
  end
end


