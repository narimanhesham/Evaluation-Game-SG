class RemoveContinentFromCities < ActiveRecord::Migration
  def change
  	remove_column :cities, :continent
  end
end
