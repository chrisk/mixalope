require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PagesController, "routing" do

  it "connects GET / to the #frontpage action" do
    params = {:controller => 'pages', :action => 'frontpage'}
    params_from(:get, "/").should == params
    route_for(params).should == "/"
  end

end