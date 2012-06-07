class GitTasksController < ApplicationController
  # GET /git_tasks
  # GET /git_tasks.xml
  def index
    @git_tasks = GitTask.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @git_tasks }
    end
  end

  # GET /git_tasks/1
  # GET /git_tasks/1.xml
  def show
    @git_task = GitTask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @git_task }
    end
  end

  # GET /git_tasks/new
  # GET /git_tasks/new.xml
  def new
    @git_task = GitTask.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @git_task }
    end
  end

  # GET /git_tasks/1/edit
  def edit
    @git_task = GitTask.find(params[:id])
  end

  # POST /git_tasks
  # POST /git_tasks.xml
  def create
    @git_task = GitTask.new(params[:git_task])

    respond_to do |format|
      if @git_task.save
        format.html { redirect_to(@git_task, :notice => 'Git task was successfully created.') }
        format.xml  { render :xml => @git_task, :status => :created, :location => @git_task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @git_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /git_tasks/1
  # PUT /git_tasks/1.xml
  def update
    @git_task = GitTask.find(params[:id])

    respond_to do |format|
      if @git_task.update_attributes(params[:git_task])
        format.html { redirect_to(@git_task, :notice => 'Git task was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @git_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /git_tasks/1
  # DELETE /git_tasks/1.xml
  def destroy
    @git_task = GitTask.find(params[:id])
    @git_task.destroy

    respond_to do |format|
      format.html { redirect_to(git_tasks_url) }
      format.xml  { head :ok }
    end
  end
end
