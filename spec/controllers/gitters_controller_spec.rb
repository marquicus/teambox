require 'spec_helper'

describe GittersController do

  def mock_gitter(stubs={})
    (@mock_gitter ||= mock_model(Gitter).as_null_object).tap do |gitter|
      gitter.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all gitters as @gitters" do
      Gitter.stub(:all) { [mock_gitter] }
      get :index
      assigns(:gitters).should eq([mock_gitter])
    end
  end

  describe "GET show" do
    it "assigns the requested gitter as @gitter" do
      Gitter.stub(:find).with("37") { mock_gitter }
      get :show, :id => "37"
      assigns(:gitter).should be(mock_gitter)
    end
  end

  describe "GET new" do
    it "assigns a new gitter as @gitter" do
      Gitter.stub(:new) { mock_gitter }
      get :new
      assigns(:gitter).should be(mock_gitter)
    end
  end

  describe "GET edit" do
    it "assigns the requested gitter as @gitter" do
      Gitter.stub(:find).with("37") { mock_gitter }
      get :edit, :id => "37"
      assigns(:gitter).should be(mock_gitter)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created gitter as @gitter" do
        Gitter.stub(:new).with({'these' => 'params'}) { mock_gitter(:save => true) }
        post :create, :gitter => {'these' => 'params'}
        assigns(:gitter).should be(mock_gitter)
      end

      it "redirects to the created gitter" do
        Gitter.stub(:new) { mock_gitter(:save => true) }
        post :create, :gitter => {}
        response.should redirect_to(gitter_url(mock_gitter))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved gitter as @gitter" do
        Gitter.stub(:new).with({'these' => 'params'}) { mock_gitter(:save => false) }
        post :create, :gitter => {'these' => 'params'}
        assigns(:gitter).should be(mock_gitter)
      end

      it "re-renders the 'new' template" do
        Gitter.stub(:new) { mock_gitter(:save => false) }
        post :create, :gitter => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested gitter" do
        Gitter.should_receive(:find).with("37") { mock_gitter }
        mock_gitter.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :gitter => {'these' => 'params'}
      end

      it "assigns the requested gitter as @gitter" do
        Gitter.stub(:find) { mock_gitter(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:gitter).should be(mock_gitter)
      end

      it "redirects to the gitter" do
        Gitter.stub(:find) { mock_gitter(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(gitter_url(mock_gitter))
      end
    end

    describe "with invalid params" do
      it "assigns the gitter as @gitter" do
        Gitter.stub(:find) { mock_gitter(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:gitter).should be(mock_gitter)
      end

      it "re-renders the 'edit' template" do
        Gitter.stub(:find) { mock_gitter(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested gitter" do
      Gitter.should_receive(:find).with("37") { mock_gitter }
      mock_gitter.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the gitters list" do
      Gitter.stub(:find) { mock_gitter }
      delete :destroy, :id => "1"
      response.should redirect_to(gitters_url)
    end
  end

end
