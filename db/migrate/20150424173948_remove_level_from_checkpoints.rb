class RemoveLevelFromCheckpoints < ActiveRecord::Migration
  def change
  	remove_column :checkpoints, :level
  end
end
