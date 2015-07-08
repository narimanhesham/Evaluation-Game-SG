class City < ActiveRecord::Base
  belongs_to :checkpoint
  has_and_belongs_to_many :questions
  belongs_to :continent
  has_many :question_locations
  has_many :location_hints
end
