class SampleUsage < ActiveRecord::Base

  belongs_to :sample
  belongs_to :drum_machine

  validates_presence_of :pattern

end
