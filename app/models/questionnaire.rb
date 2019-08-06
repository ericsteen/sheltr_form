class Questionnaire < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :sections, dependent: :destroy
  has_many :questions, through: :sections, source: :questions

  def self.get(id)
    q = includes(:author, sections: {questions: :question_answers}).find(id)
    tree = Hash.new
    tree[q.name] = {}
    q.sections.each do |section|
      data = section.question_data
      tree[q.name][section.name] = data
    end
    tree
  end
end
