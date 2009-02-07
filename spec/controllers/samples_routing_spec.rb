require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SamplesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "samples", :action => "index").should == "/samples"
    end
  
    it "should map #new" do
      route_for(:controller => "samples", :action => "new").should == "/samples/new"
    end
  
    it "should map #show" do
      route_for(:controller => "samples", :action => "show", :id => 1).should == "/samples/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "samples", :action => "edit", :id => 1).should == "/samples/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "samples", :action => "update", :id => 1).should == "/samples/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "samples", :action => "destroy", :id => 1).should == "/samples/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/samples").should == {:controller => "samples", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/samples/new").should == {:controller => "samples", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/samples").should == {:controller => "samples", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/samples/1").should == {:controller => "samples", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/samples/1/edit").should == {:controller => "samples", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/samples/1").should == {:controller => "samples", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/samples/1").should == {:controller => "samples", :action => "destroy", :id => "1"}
    end
  end
end
