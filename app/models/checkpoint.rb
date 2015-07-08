class Checkpoint < ActiveRecord::Base
  has_many :cities
  belongs_to :educational_level
  belongs_to :continent
end
