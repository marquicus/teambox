require "spec_helper"

describe MvcDemosController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/mvc_demos" }.should route_to(:controller => "mvc_demos", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/mvc_demos/new" }.should route_to(:controller => "mvc_demos", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/mvc_demos/1" }.should route_to(:controller => "mvc_demos", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/mvc_demos/1/edit" }.should route_to(:controller => "mvc_demos", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/mvc_demos" }.should route_to(:controller => "mvc_demos", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/mvc_demos/1" }.should route_to(:controller => "mvc_demos", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/mvc_demos/1" }.should route_to(:controller => "mvc_demos", :action => "destroy", :id => "1")
    end

  end
end
