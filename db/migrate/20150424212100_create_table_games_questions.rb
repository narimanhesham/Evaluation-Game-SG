class CreateTableGamesQuestions < ActiveRecord::Migration
  def change
    create_table :table_games_questions do |t|
      t.references :game, index: true
      t.references :question, index: true
    end
    add_foreign_key :table_games_questions, :games
    add_foreign_key :table_games_questions, :questions
  end
end
