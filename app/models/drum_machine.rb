class DrumMachine < ActiveRecord::Base

  has_many :sample_usages
  has_many :samples, :through => :sample_usages

end
