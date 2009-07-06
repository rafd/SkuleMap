class CreateSkuleMaps < ActiveRecord::Migration
  def self.up
    create_table :skule_maps do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :skule_maps
  end
end
