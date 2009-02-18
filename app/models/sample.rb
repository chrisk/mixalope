class Sample < ActiveRecord::Base

  has_many :sample_usages
  has_many :drum_machines, :through => :sample_usages


  has_attached_file :sound, :url =>  "/uploads/:class/:id_partition/:style.:extension",
                            :path => ":rails_root/public/uploads/:class/:id_partition/:style.:extension"

  validates_attachment_presence :sound
  validates_attachment_content_type :sound, :content_type => "audio/mpg"
  validates_attachment_size :sound, :less_than => 1.megabyte
end
