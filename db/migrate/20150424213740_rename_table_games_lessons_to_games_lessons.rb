class RenameTableGamesLessonsToGamesLessons < ActiveRecord::Migration
  def change
  	rename_table :table_games_lessons, :games_lessons
  end
end
