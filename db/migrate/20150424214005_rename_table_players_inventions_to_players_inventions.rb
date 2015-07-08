class RenameTablePlayersInventionsToPlayersInventions < ActiveRecord::Migration
  def change
  	rename_table :table_players_inventions, :players_inventions
  end
end
