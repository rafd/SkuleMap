class SkuleMapController < ApplicationController
  def showMap
    #render :text => "<h1>Maps</h1>"
    @header = "<h2>Maps Page</h2><br /><br /><p>Campus</p>"
    @location = params[:location]
    address = {'SF' => "15 King's College Rd", 'BA' => "St George St",}
    @header = address[@location] || "nonExistant"
  end
end
