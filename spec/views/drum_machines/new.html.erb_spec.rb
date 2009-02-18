require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/drum_machines/new.html.erb" do
  it "renders a form that POSTs to /drum_machines" do
    assigns[:drum_machine] = stub_model(DrumMachine, :new_record? => true)
    render "/drum_machines/new.html.erb"

    response.should have_tag("form[action=?][method=post]", "/drum_machines")
  end
end


