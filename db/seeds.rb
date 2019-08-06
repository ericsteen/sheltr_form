# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Question.delete_all

Question.create! (
  [
    {
      name: "Be yourself; everyone else is already taken.",
      description: "",
      input_type: "",
      author: "Oscar Wilde"
    },
    {
      name: "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe.",
      description: "",
      input_type: "",
      author: "Albert Einstein"
    },
    {
      name: "So many books, so little time.",
      description: "",
      input_type: "",
      author: "Frank Zappa"
    },
    {
      name: "Be the change that you wish to see in the world",
      description: "",
      input_type: "",
      author: "Mahatma Gandhi"
    },
    {
      name: "If you tell the truth, you don't have to remember anything.",
      description: "",
      input_type: "",
      author: "Mark Twain"
    }
  ]
)
puts "Questions seeded!"
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?