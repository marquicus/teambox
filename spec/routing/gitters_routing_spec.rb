require "spec_helper"

describe GittersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/gitters" }.should route_to(:controller => "gitters", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/gitters/new" }.should route_to(:controller => "gitters", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/gitters/1" }.should route_to(:controller => "gitters", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/gitters/1/edit" }.should route_to(:controller => "gitters", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/gitters" }.should route_to(:controller => "gitters", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/gitters/1" }.should route_to(:controller => "gitters", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/gitters/1" }.should route_to(:controller => "gitters", :action => "destroy", :id => "1")
    end

  end
end
