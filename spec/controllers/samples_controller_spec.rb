require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SamplesController do

  def mock_sample(stubs={})
    @mock_sample ||= mock_model(Sample, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all samples as @samples" do
      Sample.should_receive(:find).with(:all).and_return([mock_sample])
      get :index
      assigns[:samples].should == [mock_sample]
    end

    describe "with mime type of xml" do
  
      it "should render all samples as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Sample.should_receive(:find).with(:all).and_return(samples = mock("Array of Samples"))
        samples.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested sample as @sample" do
      Sample.should_receive(:find).with("37").and_return(mock_sample)
      get :show, :id => "37"
      assigns[:sample].should equal(mock_sample)
    end
    
    describe "with mime type of xml" do

      it "should render the requested sample as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Sample.should_receive(:find).with("37").and_return(mock_sample)
        mock_sample.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new sample as @sample" do
      Sample.should_receive(:new).and_return(mock_sample)
      get :new
      assigns[:sample].should equal(mock_sample)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested sample as @sample" do
      Sample.should_receive(:find).with("37").and_return(mock_sample)
      get :edit, :id => "37"
      assigns[:sample].should equal(mock_sample)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created sample as @sample" do
        Sample.should_receive(:new).with({'these' => 'params'}).and_return(mock_sample(:save => true))
        post :create, :sample => {:these => 'params'}
        assigns(:sample).should equal(mock_sample)
      end

      it "should redirect to the created sample" do
        Sample.stub!(:new).and_return(mock_sample(:save => true))
        post :create, :sample => {}
        response.should redirect_to(sample_url(mock_sample))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved sample as @sample" do
        Sample.stub!(:new).with({'these' => 'params'}).and_return(mock_sample(:save => false))
        post :create, :sample => {:these => 'params'}
        assigns(:sample).should equal(mock_sample)
      end

      it "should re-render the 'new' template" do
        Sample.stub!(:new).and_return(mock_sample(:save => false))
        post :create, :sample => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested sample" do
        Sample.should_receive(:find).with("37").and_return(mock_sample)
        mock_sample.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :sample => {:these => 'params'}
      end

      it "should expose the requested sample as @sample" do
        Sample.stub!(:find).and_return(mock_sample(:update_attributes => true))
        put :update, :id => "1"
        assigns(:sample).should equal(mock_sample)
      end

      it "should redirect to the sample" do
        Sample.stub!(:find).and_return(mock_sample(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(sample_url(mock_sample))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested sample" do
        Sample.should_receive(:find).with("37").and_return(mock_sample)
        mock_sample.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :sample => {:these => 'params'}
      end

      it "should expose the sample as @sample" do
        Sample.stub!(:find).and_return(mock_sample(:update_attributes => false))
        put :update, :id => "1"
        assigns(:sample).should equal(mock_sample)
      end

      it "should re-render the 'edit' template" do
        Sample.stub!(:find).and_return(mock_sample(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested sample" do
      Sample.should_receive(:find).with("37").and_return(mock_sample)
      mock_sample.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the samples list" do
      Sample.stub!(:find).and_return(mock_sample(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(samples_url)
    end

  end

end
