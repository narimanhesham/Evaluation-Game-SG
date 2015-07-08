class AddContinentIdToCheckpoints < ActiveRecord::Migration
  def change
  	add_reference :checkpoints, :continent, index: true
    add_foreign_key :checkpoints, :continents
  end
end
