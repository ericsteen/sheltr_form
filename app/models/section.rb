class Section < ApplicationRecord
  belongs_to :questionnaire
  has_many :questions, dependent: :destroy
end
