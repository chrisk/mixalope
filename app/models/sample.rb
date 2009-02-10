class Sample < ActiveRecord::Base

  has_attached_file :sound, :url =>  "/uploads/:class/:id_partition/:style.:extension",
                            :path => ":rails_root/public/uploads/:class/:id_partition/:style.:extension"

end
