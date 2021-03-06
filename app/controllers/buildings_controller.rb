class BuildingsController < ApplicationController
  # GET /buildings
  # GET /buildings.xml
  def index
    @buildings = Building.all
    @features = Feature.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @buildings }
    end
  end

  # GET /buildings/1
  # GET /buildings/1.xml
  def show
    @building = Building.find(params[:id])
    @features = Feature.all

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @building }
    end
  end

  # GET /buildings/new
  # GET /buildings/new.xml
  def new
    @building = Building.new
    @features = Feature.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @building }
    end
  end

  # GET /buildings/1/edit
  def edit
    @features = Feature.find(:all)
    @building = Building.find(params[:id])
    
  end

  # POST /buildings
  # POST /buildings.xml
  def create
  
    @building = Building.new(params[:building])
    @building.address = @building.address << ', Toronto, ON'
    @features = Feature.all
    checked_features = []
    
    
    
    checked_params = params[:feature_list] || []
    for check_box_id in checked_params
    	feature = Feature.find (check_box_id)
    	if not @building.features.include?(feature)	
    		@building.features << feature 
    	end
    	checked_features << feature 
    	
    end
    
    
    

    respond_to do |format|
      if @building.save
        flash[:notice] = 'Building was successfully created.'
        format.html { redirect_to(@building) }
        format.xml  { render :xml => @building, :status => :created, :location => @building }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @building.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /buildings/1
  # PUT /buildings/1.xml
  def update
    @building = Building.find(params[:id])
    @features = Feature.all
    checked_features = []
    
    
    
    checked_params = params[:feature_list] || []
    for check_box_id in checked_params
    	feature = Feature.find (check_box_id)
    	if not @building.features.include?(feature)	
    		@building.features << feature 
    	end
    	checked_features << feature 
    	
    end
		missing_features = @features - checked_features
		for feature in missing_features
			if @building.features.include?(feature)
				@building.features.delete(feature)
			end
	  end
		
    respond_to do |format|
      if @building.update_attributes(params[:building])
        flash[:notice] = 'Building was successfully updated.'
        format.html { redirect_to(@building) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @building.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.xml
  def destroy
    @building = Building.find(params[:id])
    @building.destroy

    respond_to do |format|
      format.html { redirect_to(buildings_url) }
      format.xml  { head :ok }
    end
  end
end
