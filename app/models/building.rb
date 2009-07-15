class Building < ActiveRecord::Base
include GeoKit::Geocoders


has_many :atms

validates_presence_of :name, :code, :address
validates_uniqueness_of :name, :code
acts_as_mappable :auto_geocode=>{:field=>:address, :error_message=>'Could not geocode address'}




end
