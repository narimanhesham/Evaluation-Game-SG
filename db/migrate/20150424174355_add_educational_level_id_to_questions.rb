class AddEducationalLevelIdToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :educational_level, index: true
    add_foreign_key :questions, :educational_levels
  end
end
