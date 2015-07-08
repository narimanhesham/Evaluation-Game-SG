class CreateInventions < ActiveRecord::Migration
  def change
    create_table :inventions do |t|
      t.string :name
      t.string :category
      t.text :information
      t.string :full_image
      t.string :part1
      t.string :part2
      t.string :part3
      t.string :part4
      t.string :part5
      t.string :part6

      t.timestamps null: false
    end
  end
end
