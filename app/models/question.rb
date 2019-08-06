class Question < ApplicationRecord
  belongs_to :section
  has_many :question_answers
end
