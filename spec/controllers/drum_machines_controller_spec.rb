require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DrumMachinesController do

  def mock_drum_machine(stubs={})
    @mock_drum_machine ||= mock_model(DrumMachine, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all drum_machines as @drum_machines" do
      DrumMachine.should_receive(:find).with(:all).and_return([mock_drum_machine])
      get :index
      assigns[:drum_machines].should == [mock_drum_machine]
    end

    describe "with mime type of xml" do
  
      it "should render all drum_machines as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        DrumMachine.should_receive(:find).with(:all).and_return(drum_machines = mock("Array of DrumMachines"))
        drum_machines.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested drum_machine as @drum_machine" do
      DrumMachine.should_receive(:find).with("37").and_return(mock_drum_machine)
      get :show, :id => "37"
      assigns[:drum_machine].should equal(mock_drum_machine)
    end
    
    describe "with mime type of xml" do

      it "should render the requested drum_machine as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        DrumMachine.should_receive(:find).with("37").and_return(mock_drum_machine)
        mock_drum_machine.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new drum_machine as @drum_machine" do
      DrumMachine.should_receive(:new).and_return(mock_drum_machine)
      get :new
      assigns[:drum_machine].should equal(mock_drum_machine)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested drum_machine as @drum_machine" do
      DrumMachine.should_receive(:find).with("37").and_return(mock_drum_machine)
      get :edit, :id => "37"
      assigns[:drum_machine].should equal(mock_drum_machine)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created drum_machine as @drum_machine" do
        DrumMachine.should_receive(:new).with({'these' => 'params'}).and_return(mock_drum_machine(:save => true))
        post :create, :drum_machine => {:these => 'params'}
        assigns(:drum_machine).should equal(mock_drum_machine)
      end

      it "should redirect to the created drum_machine" do
        DrumMachine.stub!(:new).and_return(mock_drum_machine(:save => true))
        post :create, :drum_machine => {}
        response.should redirect_to(drum_machine_url(mock_drum_machine))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved drum_machine as @drum_machine" do
        DrumMachine.stub!(:new).with({'these' => 'params'}).and_return(mock_drum_machine(:save => false))
        post :create, :drum_machine => {:these => 'params'}
        assigns(:drum_machine).should equal(mock_drum_machine)
      end

      it "should re-render the 'new' template" do
        DrumMachine.stub!(:new).and_return(mock_drum_machine(:save => false))
        post :create, :drum_machine => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested drum_machine" do
        DrumMachine.should_receive(:find).with("37").and_return(mock_drum_machine)
        mock_drum_machine.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :drum_machine => {:these => 'params'}
      end

      it "should expose the requested drum_machine as @drum_machine" do
        DrumMachine.stub!(:find).and_return(mock_drum_machine(:update_attributes => true))
        put :update, :id => "1"
        assigns(:drum_machine).should equal(mock_drum_machine)
      end

      it "should redirect to the drum_machine" do
        DrumMachine.stub!(:find).and_return(mock_drum_machine(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(drum_machine_url(mock_drum_machine))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested drum_machine" do
        DrumMachine.should_receive(:find).with("37").and_return(mock_drum_machine)
        mock_drum_machine.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :drum_machine => {:these => 'params'}
      end

      it "should expose the drum_machine as @drum_machine" do
        DrumMachine.stub!(:find).and_return(mock_drum_machine(:update_attributes => false))
        put :update, :id => "1"
        assigns(:drum_machine).should equal(mock_drum_machine)
      end

      it "should re-render the 'edit' template" do
        DrumMachine.stub!(:find).and_return(mock_drum_machine(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested drum_machine" do
      DrumMachine.should_receive(:find).with("37").and_return(mock_drum_machine)
      mock_drum_machine.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the drum_machines list" do
      DrumMachine.stub!(:find).and_return(mock_drum_machine(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(drum_machines_url)
    end

  end

end
