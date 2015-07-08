class AddColumnsToLocationHints < ActiveRecord::Migration
  def change
  	add_column :location_hints, :information, :text
  	add_column :location_hints, :latitude, :string
  	add_column :location_hints, :longitude, :string
  end
end
