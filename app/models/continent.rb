class Continent < ActiveRecord::Base
	has_many :checkpoints
	has_many :cities
end
