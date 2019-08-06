json.extract! user_questionnaire, :id, :user_id, :questionnaire_id, :created_at, :updated_at
json.url user_questionnaire_url(user_questionnaire, format: :json)
