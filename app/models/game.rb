class Game < ActiveRecord::Base
  belongs_to :player
  belongs_to :city
  belongs_to :invention
  has_and_belongs_to_many :questions
  has_and_belongs_to_many :lessons
end
