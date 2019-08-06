
json.name questionnaire.name
json.description questionnaire.description
json.sections questionnaire.sections do |section|
  json.name section.name
  json.questions section.questions do |question|
    json.name question.name
    json.input_type question.input_type
    json.question_answers question.question_answers
  end
end

json.url questionnaire_url(questionnaire, format: :json)
