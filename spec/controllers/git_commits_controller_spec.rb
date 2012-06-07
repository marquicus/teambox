require 'spec_helper'

describe GitCommitsController do

  def mock_git_commit(stubs={})
    (@mock_git_commit ||= mock_model(GitCommit).as_null_object).tap do |git_commit|
      git_commit.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all git_commits as @git_commits" do
      GitCommit.stub(:all) { [mock_git_commit] }
      get :index
      assigns(:git_commits).should eq([mock_git_commit])
    end
  end

  describe "GET show" do
    it "assigns the requested git_commit as @git_commit" do
      GitCommit.stub(:find).with("37") { mock_git_commit }
      get :show, :id => "37"
      assigns(:git_commit).should be(mock_git_commit)
    end
  end

  describe "GET new" do
    it "assigns a new git_commit as @git_commit" do
      GitCommit.stub(:new) { mock_git_commit }
      get :new
      assigns(:git_commit).should be(mock_git_commit)
    end
  end

  describe "GET edit" do
    it "assigns the requested git_commit as @git_commit" do
      GitCommit.stub(:find).with("37") { mock_git_commit }
      get :edit, :id => "37"
      assigns(:git_commit).should be(mock_git_commit)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created git_commit as @git_commit" do
        GitCommit.stub(:new).with({'these' => 'params'}) { mock_git_commit(:save => true) }
        post :create, :git_commit => {'these' => 'params'}
        assigns(:git_commit).should be(mock_git_commit)
      end

      it "redirects to the created git_commit" do
        GitCommit.stub(:new) { mock_git_commit(:save => true) }
        post :create, :git_commit => {}
        response.should redirect_to(git_commit_url(mock_git_commit))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved git_commit as @git_commit" do
        GitCommit.stub(:new).with({'these' => 'params'}) { mock_git_commit(:save => false) }
        post :create, :git_commit => {'these' => 'params'}
        assigns(:git_commit).should be(mock_git_commit)
      end

      it "re-renders the 'new' template" do
        GitCommit.stub(:new) { mock_git_commit(:save => false) }
        post :create, :git_commit => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested git_commit" do
        GitCommit.should_receive(:find).with("37") { mock_git_commit }
        mock_git_commit.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :git_commit => {'these' => 'params'}
      end

      it "assigns the requested git_commit as @git_commit" do
        GitCommit.stub(:find) { mock_git_commit(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:git_commit).should be(mock_git_commit)
      end

      it "redirects to the git_commit" do
        GitCommit.stub(:find) { mock_git_commit(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(git_commit_url(mock_git_commit))
      end
    end

    describe "with invalid params" do
      it "assigns the git_commit as @git_commit" do
        GitCommit.stub(:find) { mock_git_commit(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:git_commit).should be(mock_git_commit)
      end

      it "re-renders the 'edit' template" do
        GitCommit.stub(:find) { mock_git_commit(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested git_commit" do
      GitCommit.should_receive(:find).with("37") { mock_git_commit }
      mock_git_commit.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the git_commits list" do
      GitCommit.stub(:find) { mock_git_commit }
      delete :destroy, :id => "1"
      response.should redirect_to(git_commits_url)
    end
  end

end
