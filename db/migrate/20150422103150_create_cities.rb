class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.references :checkpoint, index: true
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :continent

      t.timestamps null: false
    end
    add_foreign_key :cities, :checkpoints
  end
end
