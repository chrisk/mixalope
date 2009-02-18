require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/drum_machines/edit.html.erb" do
  it "renders a form that PUTs to /drum_machines/1" do
    assigns[:drum_machine] = stub_model(DrumMachine, :new_record? => false, :to_param => '1')
    render "/drum_machines/edit.html.erb"

    response.should have_tag("form[action=?][method=post]", "/drum_machines/1") do
      with_tag("input[type=hidden][name=_method][value=?]", "put")
    end
  end
end
