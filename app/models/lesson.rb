class Lesson < ActiveRecord::Base
  belongs_to :unit
  has_many :questions
  has_and_belongs_to_many :games
end
