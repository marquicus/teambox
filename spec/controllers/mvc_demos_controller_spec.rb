require 'spec_helper'

describe MvcDemosController do

  def mock_mvc_demo(stubs={})
    (@mock_mvc_demo ||= mock_model(MvcDemo).as_null_object).tap do |mvc_demo|
      mvc_demo.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all mvc_demos as @mvc_demos" do
      MvcDemo.stub(:all) { [mock_mvc_demo] }
      get :index
      assigns(:mvc_demos).should eq([mock_mvc_demo])
    end
  end

  describe "GET show" do
    it "assigns the requested mvc_demo as @mvc_demo" do
      MvcDemo.stub(:find).with("37") { mock_mvc_demo }
      get :show, :id => "37"
      assigns(:mvc_demo).should be(mock_mvc_demo)
    end
  end

  describe "GET new" do
    it "assigns a new mvc_demo as @mvc_demo" do
      MvcDemo.stub(:new) { mock_mvc_demo }
      get :new
      assigns(:mvc_demo).should be(mock_mvc_demo)
    end
  end

  describe "GET edit" do
    it "assigns the requested mvc_demo as @mvc_demo" do
      MvcDemo.stub(:find).with("37") { mock_mvc_demo }
      get :edit, :id => "37"
      assigns(:mvc_demo).should be(mock_mvc_demo)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created mvc_demo as @mvc_demo" do
        MvcDemo.stub(:new).with({'these' => 'params'}) { mock_mvc_demo(:save => true) }
        post :create, :mvc_demo => {'these' => 'params'}
        assigns(:mvc_demo).should be(mock_mvc_demo)
      end

      it "redirects to the created mvc_demo" do
        MvcDemo.stub(:new) { mock_mvc_demo(:save => true) }
        post :create, :mvc_demo => {}
        response.should redirect_to(mvc_demo_url(mock_mvc_demo))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved mvc_demo as @mvc_demo" do
        MvcDemo.stub(:new).with({'these' => 'params'}) { mock_mvc_demo(:save => false) }
        post :create, :mvc_demo => {'these' => 'params'}
        assigns(:mvc_demo).should be(mock_mvc_demo)
      end

      it "re-renders the 'new' template" do
        MvcDemo.stub(:new) { mock_mvc_demo(:save => false) }
        post :create, :mvc_demo => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested mvc_demo" do
        MvcDemo.should_receive(:find).with("37") { mock_mvc_demo }
        mock_mvc_demo.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :mvc_demo => {'these' => 'params'}
      end

      it "assigns the requested mvc_demo as @mvc_demo" do
        MvcDemo.stub(:find) { mock_mvc_demo(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:mvc_demo).should be(mock_mvc_demo)
      end

      it "redirects to the mvc_demo" do
        MvcDemo.stub(:find) { mock_mvc_demo(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(mvc_demo_url(mock_mvc_demo))
      end
    end

    describe "with invalid params" do
      it "assigns the mvc_demo as @mvc_demo" do
        MvcDemo.stub(:find) { mock_mvc_demo(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:mvc_demo).should be(mock_mvc_demo)
      end

      it "re-renders the 'edit' template" do
        MvcDemo.stub(:find) { mock_mvc_demo(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested mvc_demo" do
      MvcDemo.should_receive(:find).with("37") { mock_mvc_demo }
      mock_mvc_demo.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the mvc_demos list" do
      MvcDemo.stub(:find) { mock_mvc_demo }
      delete :destroy, :id => "1"
      response.should redirect_to(mvc_demos_url)
    end
  end

end
