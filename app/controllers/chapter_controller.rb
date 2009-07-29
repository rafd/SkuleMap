class ChapterController < ApplicationController

def map

@buildings = Building.find(:all)

end

def list
render :text=>(Building.find :all).to_json

end

def search
  search_term = params[:keywords]
  @result_buildings = Building.find_by_sql("SELECT * FROM buildings WHERE " +
                                          "name LIKE '%#{search_term}%' OR " +
                                          "code LIKE '%#{search_term}%' OR " +
                                          "address LIKE '%#{search_term}%' OR " +
                                          "zip_code LIKE '%#{search_term}%' OR " +
                                          "building_type LIKE '%#{search_term}%'")
  render :action => "map"
end

end
