class CreateUserQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    create_table :user_questionnaires do |t|
      t.references :user, foreign_key: true
      t.references :questionnaire, foreign_key: true

      t.timestamps
    end
  end
end
