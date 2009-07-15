class MapsController < ApplicationController
require 'xmlrpc/client'
include GeoKit::Geocoders




def simple_map
	# Create a new map object, also defining the div ("map") 
	# where the map will be rendered in the view
	@map = GMap.new("map")
	# Use the larger pan/zoom control but disable the map type
	# selector
	@map.control_init(:large_map => true,:map_type => false)
	# Center the map on specific coordinates and focus in fairly
	# closely
	@map.center_zoom_init([43.662521,-79.395837], 16)
		
	@buildings = Building.find (:all)	
	


	#	@map.overlay_init(buildings1)


end

def display_markers
		@building = Building.find(params[:id])
		@map = Variable.new("map")
		      
          @marker = GMarker.new([@building.lat,@building.lng], :title => @building.name, :info_window => "<b>" << @building.name << "</b> (" << 									@building.code << ") <br/>" << @building.address )
          @building.marker = "true"
          
end

def remove_markers
		@building = Building.find(params[:id])
				
end




end
