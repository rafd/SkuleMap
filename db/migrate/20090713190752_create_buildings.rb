class CreateBuildings < ActiveRecord::Migration
  def self.up
    create_table :buildings do |t|
      t.string :name, :code, :address, :zip_code, :building_type, :null => false
      t.string :marker
      t.integer :floors
      t.decimal :lat , :lng , :precision => 15, :scale => 10
      

      t.timestamps
    end
  end

  def self.down
    drop_table :buildings
  end
end
