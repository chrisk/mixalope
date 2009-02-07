class CreateSamples < ActiveRecord::Migration
  def self.up
    create_table :samples do |t|
      t.string :name
      t.string :sound_file_name
      t.string :sound_content_type
      t.integer :sound_file_size
      t.datetime :sound_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :samples
  end
end
