class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :lesson, index: true
      t.string :content
      t.string :choice_A
      t.string :choice_B
      t.string :choice_C
      t.string :choice_D
      t.string :correct_choice
      t.string :eliminated_choices
      t.string :explaination

      t.timestamps null: false
    end
    add_foreign_key :questions, :lessons
  end
end
