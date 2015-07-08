class LocationHint < ActiveRecord::Base
  belongs_to :city
  has_many :bonus_questions
end
