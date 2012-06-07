require 'spec_helper'

describe GitTasksController do

  def mock_git_task(stubs={})
    (@mock_git_task ||= mock_model(GitTask).as_null_object).tap do |git_task|
      git_task.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all git_tasks as @git_tasks" do
      GitTask.stub(:all) { [mock_git_task] }
      get :index
      assigns(:git_tasks).should eq([mock_git_task])
    end
  end

  describe "GET show" do
    it "assigns the requested git_task as @git_task" do
      GitTask.stub(:find).with("37") { mock_git_task }
      get :show, :id => "37"
      assigns(:git_task).should be(mock_git_task)
    end
  end

  describe "GET new" do
    it "assigns a new git_task as @git_task" do
      GitTask.stub(:new) { mock_git_task }
      get :new
      assigns(:git_task).should be(mock_git_task)
    end
  end

  describe "GET edit" do
    it "assigns the requested git_task as @git_task" do
      GitTask.stub(:find).with("37") { mock_git_task }
      get :edit, :id => "37"
      assigns(:git_task).should be(mock_git_task)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created git_task as @git_task" do
        GitTask.stub(:new).with({'these' => 'params'}) { mock_git_task(:save => true) }
        post :create, :git_task => {'these' => 'params'}
        assigns(:git_task).should be(mock_git_task)
      end

      it "redirects to the created git_task" do
        GitTask.stub(:new) { mock_git_task(:save => true) }
        post :create, :git_task => {}
        response.should redirect_to(git_task_url(mock_git_task))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved git_task as @git_task" do
        GitTask.stub(:new).with({'these' => 'params'}) { mock_git_task(:save => false) }
        post :create, :git_task => {'these' => 'params'}
        assigns(:git_task).should be(mock_git_task)
      end

      it "re-renders the 'new' template" do
        GitTask.stub(:new) { mock_git_task(:save => false) }
        post :create, :git_task => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested git_task" do
        GitTask.should_receive(:find).with("37") { mock_git_task }
        mock_git_task.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :git_task => {'these' => 'params'}
      end

      it "assigns the requested git_task as @git_task" do
        GitTask.stub(:find) { mock_git_task(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:git_task).should be(mock_git_task)
      end

      it "redirects to the git_task" do
        GitTask.stub(:find) { mock_git_task(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(git_task_url(mock_git_task))
      end
    end

    describe "with invalid params" do
      it "assigns the git_task as @git_task" do
        GitTask.stub(:find) { mock_git_task(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:git_task).should be(mock_git_task)
      end

      it "re-renders the 'edit' template" do
        GitTask.stub(:find) { mock_git_task(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested git_task" do
      GitTask.should_receive(:find).with("37") { mock_git_task }
      mock_git_task.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the git_tasks list" do
      GitTask.stub(:find) { mock_git_task }
      delete :destroy, :id => "1"
      response.should redirect_to(git_tasks_url)
    end
  end

end
