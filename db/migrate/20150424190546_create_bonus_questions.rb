class CreateBonusQuestions < ActiveRecord::Migration
  def change
    create_table :bonus_questions do |t|
      t.references :city, index: true
      t.references :location_hint, index: true
      t.string :image
      t.string :question
      t.string :choice_A
      t.string :choice_B
      t.string :choice_C
      t.string :choice_D
      t.string :correct_choice

      t.timestamps null: false
    end
    add_foreign_key :bonus_questions, :cities
    add_foreign_key :bonus_questions, :location_hints
  end
end
