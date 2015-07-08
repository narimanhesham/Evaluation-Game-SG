class RenamePlayersInventionsToInventionsPlayers < ActiveRecord::Migration
  def change
  	rename_table :players_inventions, :inventions_players
  end
end
