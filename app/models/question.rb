class Question < ActiveRecord::Base
  belongs_to :lesson
  has_and_belongs_to_many :cities
  belongs_to :educational_level
  has_and_belongs_to_many :games
end
