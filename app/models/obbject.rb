class Obbject < ActiveRecord::Base

belongs_to :building
validates_presence_of :name, :description
end
