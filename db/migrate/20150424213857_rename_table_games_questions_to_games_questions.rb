class RenameTableGamesQuestionsToGamesQuestions < ActiveRecord::Migration
  def change
  	rename_table :table_games_questions, :games_questions
  end
end
