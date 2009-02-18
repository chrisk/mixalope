class CreateSampleUsages < ActiveRecord::Migration
  def self.up
    create_table :sample_usages do |t|
      t.string :pattern
      t.references :drum_machine, :sample
      t.timestamps
    end
  end

  def self.down
    drop_table :sample_usages
  end
end
