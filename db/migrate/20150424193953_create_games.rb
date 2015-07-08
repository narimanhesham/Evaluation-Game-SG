class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :player, index: true
      t.references :city, index: true
      t.integer :correct_questions
      t.integer :score
      t.string :mode
      t.references :invention, index: true

      t.timestamps null: false
    end
    add_foreign_key :games, :players
    add_foreign_key :games, :cities
    add_foreign_key :games, :inventions
  end
end
