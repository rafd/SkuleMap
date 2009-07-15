class AtmsController < ApplicationController
  # GET /atms
  # GET /atms.xml
  def index
    @atms = Atm.all
		@buildings = Building.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @atms }
    end
  end

  # GET /atms/1
  # GET /atms/1.xml
  def show
    @atm = Atm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @atm }
    end
  end

  # GET /atms/new
  # GET /atms/new.xml
  def new
    @atm = Atm.new
		@buildings = Building.find(:all)
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @atm }
    end
  end

  # GET /atms/1/edit
  def edit
    @atm = Atm.find(params[:id])
    @buildings = Building.find(:all)
  end

  # POST /atms
  # POST /atms.xml
  def create
    @atm = Atm.new(params[:atm])
    @buildings = Building.find(:all)

    respond_to do |format|
      if @atm.save
        flash[:notice] = 'Atm was successfully created.'
        format.html { redirect_to(@atm) }
        format.xml  { render :xml => @atm, :status => :created, :location => @atm }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @atm.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /atms/1
  # PUT /atms/1.xml
  def update
    @atm = Atm.find(params[:id])

    respond_to do |format|
      if @atm.update_attributes(params[:atm])
        flash[:notice] = 'Atm was successfully updated.'
        format.html { redirect_to(@atm) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @atm.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /atms/1
  # DELETE /atms/1.xml
  def destroy
    @atm = Atm.find(params[:id])
    @atm.destroy

    respond_to do |format|
      format.html { redirect_to(atms_url) }
      format.xml  { head :ok }
    end
  end
end
