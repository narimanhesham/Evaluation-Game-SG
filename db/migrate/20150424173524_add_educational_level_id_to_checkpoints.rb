class AddEducationalLevelIdToCheckpoints < ActiveRecord::Migration
  def change
    add_reference :checkpoints, :educational_level, index: true
    add_foreign_key :checkpoints, :educational_levels
  end
end
