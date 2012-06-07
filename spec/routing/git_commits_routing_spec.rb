require "spec_helper"

describe GitCommitsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/git_commits" }.should route_to(:controller => "git_commits", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/git_commits/new" }.should route_to(:controller => "git_commits", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/git_commits/1" }.should route_to(:controller => "git_commits", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/git_commits/1/edit" }.should route_to(:controller => "git_commits", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/git_commits" }.should route_to(:controller => "git_commits", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/git_commits/1" }.should route_to(:controller => "git_commits", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/git_commits/1" }.should route_to(:controller => "git_commits", :action => "destroy", :id => "1")
    end

  end
end
