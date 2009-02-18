require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DrumMachinesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "drum_machines", :action => "index").should == "/drum_machines"
    end
  
    it "should map #new" do
      route_for(:controller => "drum_machines", :action => "new").should == "/drum_machines/new"
    end
  
    it "should map #show" do
      route_for(:controller => "drum_machines", :action => "show", :id => 1).should == "/drum_machines/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "drum_machines", :action => "edit", :id => 1).should == "/drum_machines/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "drum_machines", :action => "update", :id => 1).should == "/drum_machines/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "drum_machines", :action => "destroy", :id => 1).should == "/drum_machines/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/drum_machines").should == {:controller => "drum_machines", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/drum_machines/new").should == {:controller => "drum_machines", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/drum_machines").should == {:controller => "drum_machines", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/drum_machines/1").should == {:controller => "drum_machines", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/drum_machines/1/edit").should == {:controller => "drum_machines", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/drum_machines/1").should == {:controller => "drum_machines", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/drum_machines/1").should == {:controller => "drum_machines", :action => "destroy", :id => "1"}
    end
  end
end
