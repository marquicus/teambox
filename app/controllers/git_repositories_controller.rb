class GitRepositoriesController < ApplicationController
  # GET /git_repositories
  # GET /git_repositories.xml
  def index
    @git_repositories = GitRepository.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @git_repositories }
    end
  end

  # GET /git_repositories/1
  # GET /git_repositories/1.xml
  def show
    @git_repository = GitRepository.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @git_repository }
    end
  end

  # GET /git_repositories/new
  # GET /git_repositories/new.xml
  def new
    @git_repository = GitRepository.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @git_repository }
    end
  end

  # GET /git_repositories/1/edit
  def edit
    @git_repository = GitRepository.find(params[:id])
  end

  # POST /git_repositories
  # POST /git_repositories.xml
  def create
    @git_repository = GitRepository.new(params[:git_repository])

    respond_to do |format|
      if @git_repository.save
        format.html { redirect_to(@git_repository, :notice => 'Git repository was successfully created.') }
        format.xml  { render :xml => @git_repository, :status => :created, :location => @git_repository }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @git_repository.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /git_repositories/1
  # PUT /git_repositories/1.xml
  def update
    @git_repository = GitRepository.find(params[:id])

    respond_to do |format|
      if @git_repository.update_attributes(params[:git_repository])
        format.html { redirect_to(@git_repository, :notice => 'Git repository was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @git_repository.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /git_repositories/1
  # DELETE /git_repositories/1.xml
  def destroy
    @git_repository = GitRepository.find(params[:id])
    @git_repository.destroy

    respond_to do |format|
      format.html { redirect_to(git_repositories_url) }
      format.xml  { head :ok }
    end
  end
end
