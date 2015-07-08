class CreateTablePlayersInventions < ActiveRecord::Migration
  def change
    create_table :table_players_inventions do |t|
      t.references :player, index: true
      t.references :invention, index: true
    end
    add_foreign_key :table_players_inventions, :players
    add_foreign_key :table_players_inventions, :inventions
  end
end
