# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all

User.create! (
  [
    {
      first_name: "Fred",
      last_name: "Handy",
      email: "fred@gmail.com"
    }
  ]
)
puts "Users seeded!"

Questionnaire.delete_all

Questionnaire.create! (
  [
    {
      name: "Uncertified handyman",
      description: "",
      user_id: 1
    },
    {
      name: "Licensed and Certifed Professional",
      description: "",
      user_id: 1
    },
    {
      name: "Texas",
      description: "",
      user_id: 1
    },
    {
      name: "California",
      description: "",
      user_id: 1
    },
    {
      name: "General",
      description: "",
      user_id: 1
    }
  ]
)
puts "Questionnaires seeded!"

Section.delete_all

Section.create! (
  [
    {
      name: "Exterior",
      questionnaire_id: 1
    },
    {
      name: "Interior",
      questionnaire_id: 1
    },
    {
      name: "Kitchen",
      questionnaire_id: 1
    },
    {
      name: "Living",
      questionnaire_id: 1
    },
    {
      name: "Garage",
      questionnaire_id: 1
    }
  ]
)
puts "Sections seeded!"

Question.delete_all

Question.create! (
  [
    {
      name: "Which room adds the most home value when upgraded?",
      description: "Upgrades",
      input_type: "radio",
      section_id: 3
    },
    {
      name: "Does a permitted addition generally add more value to a home than an upgraded bathroom?",
      description: "Upgrades",
      input_type: "radio",
      section_id: 2
    },
    {
      name: "How long does an air conditioner typically last (in years)?",
      description: "Domain Knowledge",
      input_type: "radio",
      section_id: 1
    },
    {
      name: "Which part of a refrigerator is likely to go faulty?",
      description: "Domain Knowledge",
      input_type: "radio",
      section_id: 4
    },
    {
      name: "How much cost in heating do dual pane windows save monthly on average?",
      description: "Domain Knowledge",
      input_type: "radio",
      section_id: 5
    }
  ]
)
puts "Questions seeded!"

QuestionAnswer.delete_all

QuestionAnswer.create! (
  [
    {
      name: "basic",
      value: "Kitchen",
      score: 1,
      question_id: 1
    },
    {
      name: "advanced",
      value: "Yes",
      score: 2,
      question_id: 2
    },
    {
      name: "basic",
      value: "10 Years",
      score: 3,
      question_id: 3
    },
    {
      name: "basic",
      value: "Hose",
      score: 4,
      question_id: 4
    },
    {
      name: "basic",
      value: "$100",
      score: 5,
      question_id: 5
    }
  ]
)
puts "QuestionAnswers seeded!"

UserQuestionnaire.delete_all

UserQuestionnaire.create! (
  [
    {
      user_id: 1,
      questionnaire_id: 1
    },
  ]
)
puts "UserQuestionnaires seeded!"

UserAnswer.delete_all

UserAnswer.create! (
  [
    {
      user_id: 1,
      question_id: 1,
      score: 1
    },
    {
      user_id: 1,
      question_id: 2,
      score: 2
    },
    {
      user_id: 1,
      question_id: 3,
      score: 3
    },
    {
      user_id: 1,
      question_id: 4,
      score: 4
    },
    {
      user_id: 1,
      question_id: 5,
      score: 5
    }
  ]
)
puts "UserAnswers seeded!"
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
