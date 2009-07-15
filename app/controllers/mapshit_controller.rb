class MapshitController < ApplicationController
require 'xmlrpc/client'

def lookup_geocodes
    # your list of places. In a real app, this would come from the database,
    # and have more robust descriptions
    places = [
      {:address=>'555 Irving, San Francisco, CA',:description=>'Irving'},
      {:address=>'1401 Valencia St, San Francisco, CA',:description=>'Valencia'},
      {:address=>'501 Cole St, San Francisco, CA',:description=>'Cole'},
      {:address=>'150 Church st, San Francisco, CA',:description=>'Church'} 
     ]

    # this loop will do the geo lookup for each place
    places.each_with_index do |place,index|
      # get the geocode by calling our own get_geocode(address) method
      geocode = get_geocode place[:address]
      
      # geo_code is now a hash with keys :latitude and :longitude
      # place these values back into our "database" (array of hashes)
      place[:latitude]=geocode[:latitude]
      place[:longitude]=geocode[:longitude]    
    
end
    
    #place the result in the session so we can use it for display
    session[:str] = places
    
    #let the user know the lookup went ok
    render :text=> 'Looked up the geocodes for '+places.length.to_s+
	' address and stored the result in the session . . .'
  
end

def hello
end

  def show_google_map
    # all we're going to do is loop through the @places array on the page
    @places=session[:str]
    render (:action => 'lookup_geocodes')
  end
  
  private
  def get_geocode(address)
    logger.debug 'starting geocoder call for address: '+address
    # this is where we call the geocoding web service
    server = XMLRPC::Client.new2('http://rpc.geocoder.us/service/xmlrpc')
    result = server.call2('geocode', address)
    logger.debug "Geocode call: "+result.inspect
    
    return {:success=> true, :latitude=> result[1][0]['lat'], 
		:longitude=> result[1][0]['long']}
  end  




end
