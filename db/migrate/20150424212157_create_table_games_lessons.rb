class CreateTableGamesLessons < ActiveRecord::Migration
  def change
    create_table :table_games_lessons do |t|
      t.references :game, index: true
      t.references :lesson, index: true
    end
    add_foreign_key :table_games_lessons, :games
    add_foreign_key :table_games_lessons, :lessons
  end
end
