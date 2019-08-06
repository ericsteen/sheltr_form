class Section < ApplicationRecord
  belongs_to :questionnaire
  has_many :questions

  def question_data
    questions.map do |q|
      { name: q.name, desc: q.description, input: q.input_type, answers: q.answers_data }
    end
  end
end
