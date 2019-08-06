json.extract! question, :id, :name, :description, :input_type, :created_at, :updated_at
json.url question_url(question, format: :json)
