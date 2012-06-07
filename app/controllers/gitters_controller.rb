class GittersController < ApplicationController
  # GET /gitters
  # GET /gitters.xml
  def index
    @gitters = Gitter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gitters }
    end
  end

  # GET /gitters/1
  # GET /gitters/1.xml
  def show
    @gitter = Gitter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gitter }
    end
  end

  # GET /gitters/new
  # GET /gitters/new.xml
  def new
    @gitter = Gitter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gitter }
    end
  end

  # GET /gitters/1/edit
  def edit
    @gitter = Gitter.find(params[:id])
  end

  # POST /gitters
  # POST /gitters.xml
  def create
    @gitter = Gitter.new(params[:gitter])

    respond_to do |format|
      if @gitter.save
        format.html { redirect_to(@gitter, :notice => 'Gitter was successfully created.') }
        format.xml  { render :xml => @gitter, :status => :created, :location => @gitter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gitter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gitters/1
  # PUT /gitters/1.xml
  def update
    @gitter = Gitter.find(params[:id])

    respond_to do |format|
      if @gitter.update_attributes(params[:gitter])
        format.html { redirect_to(@gitter, :notice => 'Gitter was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gitter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gitters/1
  # DELETE /gitters/1.xml
  def destroy
    @gitter = Gitter.find(params[:id])
    @gitter.destroy

    respond_to do |format|
      format.html { redirect_to(gitters_url) }
      format.xml  { head :ok }
    end
  end
end
