class CreateLocationHints < ActiveRecord::Migration
  def change
    create_table :location_hints do |t|
      t.references :city, index: true
      t.string :image

      t.timestamps null: false
    end
    add_foreign_key :location_hints, :cities
  end
end
