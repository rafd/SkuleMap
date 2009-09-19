class BuildingsFeatures < ActiveRecord::Migration
  def self.up
    create_table(:buildings_features, :id => false) do |t|
      t.column :building_id, :integer
      t.column :feature_id, :integer
      
      t.timestamps
    end
  end

  def self.down
    drop_table :buildings_features
  end
end
