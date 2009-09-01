class CreateObbjects < ActiveRecord::Migration
  def self.up
    create_table :obbjects do |t|
      t.string :name
      t.integer :floor
      t.text :description
      t.integer :building_id

      t.timestamps
    end
  end

  def self.down
    drop_table :obbjects
  end
end
