class MvcDemosController < ApplicationController
  # GET /mvc_demos
  # GET /mvc_demos.xml
  def index
    @mvc_demos = MvcDemo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mvc_demos }
    end
  end

  # GET /mvc_demos/1
  # GET /mvc_demos/1.xml
  def show
    @mvc_demo = MvcDemo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mvc_demo }
    end
  end

  # GET /mvc_demos/new
  # GET /mvc_demos/new.xml
  def new
    @mvc_demo = MvcDemo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mvc_demo }
    end
  end

  # GET /mvc_demos/1/edit
  def edit
    @mvc_demo = MvcDemo.find(params[:id])
  end

  # POST /mvc_demos
  # POST /mvc_demos.xml
  def create
    @mvc_demo = MvcDemo.new(params[:mvc_demo])

    respond_to do |format|
      if @mvc_demo.save
        format.html { redirect_to(@mvc_demo, :notice => 'Mvc demo was successfully created.') }
        format.xml  { render :xml => @mvc_demo, :status => :created, :location => @mvc_demo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mvc_demo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mvc_demos/1
  # PUT /mvc_demos/1.xml
  def update
    @mvc_demo = MvcDemo.find(params[:id])

    respond_to do |format|
      if @mvc_demo.update_attributes(params[:mvc_demo])
        format.html { redirect_to(@mvc_demo, :notice => 'Mvc demo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mvc_demo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mvc_demos/1
  # DELETE /mvc_demos/1.xml
  def destroy
    @mvc_demo = MvcDemo.find(params[:id])
    @mvc_demo.destroy

    respond_to do |format|
      format.html { redirect_to(mvc_demos_url) }
      format.xml  { head :ok }
    end
  end
end
