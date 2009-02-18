class CreateDrumMachines < ActiveRecord::Migration
  def self.up
    create_table :drum_machines do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :drum_machines
  end
end
