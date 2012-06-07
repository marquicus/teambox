require "spec_helper"

describe GitTasksController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/git_tasks" }.should route_to(:controller => "git_tasks", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/git_tasks/new" }.should route_to(:controller => "git_tasks", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/git_tasks/1" }.should route_to(:controller => "git_tasks", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/git_tasks/1/edit" }.should route_to(:controller => "git_tasks", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/git_tasks" }.should route_to(:controller => "git_tasks", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/git_tasks/1" }.should route_to(:controller => "git_tasks", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/git_tasks/1" }.should route_to(:controller => "git_tasks", :action => "destroy", :id => "1")
    end

  end
end
