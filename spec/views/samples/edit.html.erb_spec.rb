require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/samples/edit.html.erb" do
  it "renders a form that PUTs to /samples/1" do
    assigns[:sample] = stub_model(Sample, :new_record? => false, :to_param => '1')
    render "/samples/edit.html.erb"

    response.should have_tag("form[action=?][method=post]", "/samples/1") do
      with_tag("input[type=hidden][name=_method][value=?]", "put")
    end
  end
end
