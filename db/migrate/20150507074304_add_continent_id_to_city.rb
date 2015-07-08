class AddContinentIdToCity < ActiveRecord::Migration
  def change
  	add_reference :cities, :continent, index: true
    add_foreign_key :cities, :continents
  end
end
