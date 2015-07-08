class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.string :avatar_100
      t.string :avatar_80
      t.string :avatar_60
      t.string :avatar_40
      t.string :avatar_20

      t.timestamps null: false
    end
  end
end
