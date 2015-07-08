class CreateQuestionLocations < ActiveRecord::Migration
  def change
    create_table :question_locations do |t|
      t.integer :number
      t.text :hint
      t.string :latitude
      t.string :longitude
      t.references :city, index: true

      t.timestamps null: false
    end
    add_foreign_key :question_locations, :cities
  end
end
