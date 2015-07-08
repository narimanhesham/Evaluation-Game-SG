class ChangeLatitudeAndLongitudeColumnTypeInTableCities < ActiveRecord::Migration
  def change
  	change_column :cities, :latitude, :string
  	change_column :cities, :longitude, :string
  end
end
