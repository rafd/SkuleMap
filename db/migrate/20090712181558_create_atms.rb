class CreateAtms < ActiveRecord::Migration
  def self.up
    create_table :atms do |t|
      t.string :bank_name
      t.integer :floor
      t.integer :building_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :atms
  end
end
