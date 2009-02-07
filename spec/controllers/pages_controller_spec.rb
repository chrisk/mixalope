require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PagesController, "handling GET #frontpage" do

  it "responds successfully with the frontpage template" do
    get :frontpage
    response.should be_success
    response.should render_template("frontpage")
  end

end