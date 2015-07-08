class CreateEducationalLevels < ActiveRecord::Migration
  def change
    create_table :educational_levels do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
