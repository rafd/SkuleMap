class ChapterController < ApplicationController

def map

@buildings = Building.find(:all)
@buildings.to_json
end



end
