class ChangeLatitudeColumnTypeInTableCities < ActiveRecord::Migration
  def change
  	change_column :cities, :latitude, :decimal
  	change_column :cities, :longitude, :decimal
  end
end
