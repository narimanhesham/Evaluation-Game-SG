class BonusQuestion < ActiveRecord::Base
  belongs_to :city
  belongs_to :location_hint
end
