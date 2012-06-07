require 'spec_helper'

describe GitRepositoriesController do

  def mock_git_repository(stubs={})
    (@mock_git_repository ||= mock_model(GitRepository).as_null_object).tap do |git_repository|
      git_repository.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all git_repositories as @git_repositories" do
      GitRepository.stub(:all) { [mock_git_repository] }
      get :index
      assigns(:git_repositories).should eq([mock_git_repository])
    end
  end

  describe "GET show" do
    it "assigns the requested git_repository as @git_repository" do
      GitRepository.stub(:find).with("37") { mock_git_repository }
      get :show, :id => "37"
      assigns(:git_repository).should be(mock_git_repository)
    end
  end

  describe "GET new" do
    it "assigns a new git_repository as @git_repository" do
      GitRepository.stub(:new) { mock_git_repository }
      get :new
      assigns(:git_repository).should be(mock_git_repository)
    end
  end

  describe "GET edit" do
    it "assigns the requested git_repository as @git_repository" do
      GitRepository.stub(:find).with("37") { mock_git_repository }
      get :edit, :id => "37"
      assigns(:git_repository).should be(mock_git_repository)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created git_repository as @git_repository" do
        GitRepository.stub(:new).with({'these' => 'params'}) { mock_git_repository(:save => true) }
        post :create, :git_repository => {'these' => 'params'}
        assigns(:git_repository).should be(mock_git_repository)
      end

      it "redirects to the created git_repository" do
        GitRepository.stub(:new) { mock_git_repository(:save => true) }
        post :create, :git_repository => {}
        response.should redirect_to(git_repository_url(mock_git_repository))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved git_repository as @git_repository" do
        GitRepository.stub(:new).with({'these' => 'params'}) { mock_git_repository(:save => false) }
        post :create, :git_repository => {'these' => 'params'}
        assigns(:git_repository).should be(mock_git_repository)
      end

      it "re-renders the 'new' template" do
        GitRepository.stub(:new) { mock_git_repository(:save => false) }
        post :create, :git_repository => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested git_repository" do
        GitRepository.should_receive(:find).with("37") { mock_git_repository }
        mock_git_repository.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :git_repository => {'these' => 'params'}
      end

      it "assigns the requested git_repository as @git_repository" do
        GitRepository.stub(:find) { mock_git_repository(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:git_repository).should be(mock_git_repository)
      end

      it "redirects to the git_repository" do
        GitRepository.stub(:find) { mock_git_repository(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(git_repository_url(mock_git_repository))
      end
    end

    describe "with invalid params" do
      it "assigns the git_repository as @git_repository" do
        GitRepository.stub(:find) { mock_git_repository(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:git_repository).should be(mock_git_repository)
      end

      it "re-renders the 'edit' template" do
        GitRepository.stub(:find) { mock_git_repository(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested git_repository" do
      GitRepository.should_receive(:find).with("37") { mock_git_repository }
      mock_git_repository.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the git_repositories list" do
      GitRepository.stub(:find) { mock_git_repository }
      delete :destroy, :id => "1"
      response.should redirect_to(git_repositories_url)
    end
  end

end
