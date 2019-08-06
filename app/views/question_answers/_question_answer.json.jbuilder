json.extract! question_answer, :id, :name, :value, :score, :question_id, :user_id, :created_at, :updated_at
json.url question_answer_url(question_answer, format: :json)
