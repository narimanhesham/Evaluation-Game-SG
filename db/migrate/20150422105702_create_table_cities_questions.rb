class CreateTableCitiesQuestions < ActiveRecord::Migration
  def change
    create_table :cities_questions do |t|
      t.references :city, index: true
      t.references :question, index: true
    end
    add_foreign_key :cities_questions, :cities
    add_foreign_key :cities_questions, :questions
  end
end
