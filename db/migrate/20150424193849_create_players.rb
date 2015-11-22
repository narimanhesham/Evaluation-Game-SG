class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :username
      t.string :password
      t.integer :health_percentage
      t.text :health_description
      t.references :avatar, index: true

      t.timestamps null: false
    end
    add_foreign_key :players, :avatars
  end
end
