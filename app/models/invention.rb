class Invention < ActiveRecord::Base
	has_many :games
	has_and_belongs_to_many :players
end
