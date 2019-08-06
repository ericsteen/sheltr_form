class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :name
      t.text :description
      t.string :input_type
      t.references :section, foreign_key: true


      t.timestamps
    end
  end
end
