class ChapterController < ApplicationController

def map

@buildings = Building.find(:all)

end

def list
render :text=>(Building.find :all).to_json

end


end
