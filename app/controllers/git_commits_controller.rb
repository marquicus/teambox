class GitCommitsController < ApplicationController
  # GET /git_commits
  # GET /git_commits.xml
  def index
    @git_commits = GitCommit.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @git_commits }
    end
  end

  # GET /git_commits/1
  # GET /git_commits/1.xml
  def show
    @git_commit = GitCommit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @git_commit }
    end
  end

  # GET /git_commits/new
  # GET /git_commits/new.xml
  def new
    @git_commit = GitCommit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @git_commit }
    end
  end

  # GET /git_commits/1/edit
  def edit
    @git_commit = GitCommit.find(params[:id])
  end

  # POST /git_commits
  # POST /git_commits.xml
  def create
    @git_commit = GitCommit.new(params[:git_commit])

    respond_to do |format|
      if @git_commit.save
        format.html { redirect_to(@git_commit, :notice => 'Git commit was successfully created.') }
        format.xml  { render :xml => @git_commit, :status => :created, :location => @git_commit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @git_commit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /git_commits/1
  # PUT /git_commits/1.xml
  def update
    @git_commit = GitCommit.find(params[:id])

    respond_to do |format|
      if @git_commit.update_attributes(params[:git_commit])
        format.html { redirect_to(@git_commit, :notice => 'Git commit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @git_commit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /git_commits/1
  # DELETE /git_commits/1.xml
  def destroy
    @git_commit = GitCommit.find(params[:id])
    @git_commit.destroy

    respond_to do |format|
      format.html { redirect_to(git_commits_url) }
      format.xml  { head :ok }
    end
  end
end
