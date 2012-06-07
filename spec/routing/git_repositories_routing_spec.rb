require "spec_helper"

describe GitRepositoriesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/git_repositories" }.should route_to(:controller => "git_repositories", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/git_repositories/new" }.should route_to(:controller => "git_repositories", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/git_repositories/1" }.should route_to(:controller => "git_repositories", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/git_repositories/1/edit" }.should route_to(:controller => "git_repositories", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/git_repositories" }.should route_to(:controller => "git_repositories", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/git_repositories/1" }.should route_to(:controller => "git_repositories", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/git_repositories/1" }.should route_to(:controller => "git_repositories", :action => "destroy", :id => "1")
    end

  end
end
