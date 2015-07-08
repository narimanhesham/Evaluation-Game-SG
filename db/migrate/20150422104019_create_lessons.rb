class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.references :unit, index: true

      t.timestamps null: false
    end
    add_foreign_key :lessons, :units
  end
end
