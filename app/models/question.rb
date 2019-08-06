class Question < ApplicationRecord
  belongs_to :section
  has_many :question_answers

  def answers_data
    question_answers.map { |qa| {name: qa.name, value: qa.value, score: qa.score } }
  end
end
