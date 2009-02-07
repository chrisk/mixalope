require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SamplesController, "routing" do

  it "connects GET /samples to the #index action" do
    params = {:controller => "samples", :action => "index"}
    params_from(:get, "/samples").should == params
    route_for(params).should == "/samples"
  end

  it "connects POST /samples to the #create action" do
    params = {:controller => "samples", :action => "create"}
    params_from(:post, "/samples").should == params
  end

  it "connects GET /samples/new to the #new action" do
    params = {:controller => "samples", :action => "new"}
    params_from(:get, "/samples/new").should == params
    route_for(params).should == "/samples/new"
  end

  it "connects GET /samples/1 to the #show action" do
    params = {:controller => "samples", :action => "show", :id => "1"}
    params_from(:get, "/samples/1").should == params
    route_for(params).should == "/samples/1"
  end

  it "connects GET /samples/1/edit to the #edit action" do
    params = {:controller => "samples", :action => "edit", :id => "1"}
    params_from(:get, "/samples/1/edit").should == params
    route_for(params).should == "/samples/1/edit"
  end

  it "connects PUT /samples/1 to the #edit action" do
    params = {:controller => "samples", :action => "update", :id => "1"}
    params_from(:put, "/samples/1").should == params
    route_for(params).should == "/samples/1"
  end

  it "connects DELETE /samples/1 to the #destroy action" do
    params = {:controller => "samples", :action => "destroy", :id => "1"}
    params_from(:delete, "/samples/1").should == params
    route_for(params).should == "/samples/1"
  end

end
