class Atm < ActiveRecord::Base





belongs_to :building

validates_presence_of :bank_name, :building_id



end
