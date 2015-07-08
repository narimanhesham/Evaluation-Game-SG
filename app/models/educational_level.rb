class EducationalLevel < ActiveRecord::Base
	has_many :checkpoints
	has_many :questions
end
