class ChapterController < ApplicationController

def map

@buildings = Building.find(:all)
@features = Feature.find(:all)
end

def list
@feature = Feature.find(params[:feature])
session[:feature] = @feature


render :partial => 'list_of_buildings', :object => @feature
end

def lista
@feature = session[:feature]
render :text => @feature.buildings.to_json(:include => :obbjects)
end




end
