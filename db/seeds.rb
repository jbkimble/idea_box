# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cat1 = Category.create(name: "Business")
cat2 = Category.create(name: "Fun")
cat3 = Category.create(name: "Random")
cat4 = Category.create(name: "Experiences")
cat5 = Category.create(name: "People")
cat6 = Category.create(name: "Personal Improvement")
cat7 = Category.create(name: "Networking")

user1 = User.create!(name: "Jon", email: "J@gmail.com", password: "123")
  user1.ideas.create(title: "Shitty Drawings", description: "cook", notes:"fantasitc", category_id: cat1.id)
  user1.ideas.create(title: "Moon Base", description: "Workout", notes: "visit here", category_id: cat2.id)
  user1.ideas.create(title: "Enterprise Software App", description: "cook", notes:"okaly doakly", category_id: cat2.id)
  user1.ideas.create(title: "Uber for cats", description: "Workout", notes: "plop", category_id: cat4.id)

user2 = User.create!(name: "Jack", email: "Jack@gmail.com", password: "123")
  user2.ideas.create(title: "Jumping jack shoes", description: "change", notes:"boop", category_id: cat1.id)
  user2.ideas.create(title: "Uber for pandas", description: "hmmm", notes: "beep", category_id: cat2.id)
  user2.ideas.create(title: "Something", description: "ok", notes:"bop", category_id: cat2.id)
  user2.ideas.create(title: "Something else", description: "test", notes: "hop", category_id: cat4.id)

user3 = User.create!(name: "Mary", email: "Mary@gmail.com", password: "123")
  user3.ideas.create(title: "This", description: "yup", notes:"mmmm yum", category_id: cat1.id)
  user3.ideas.create(title: "that", description: "sounds right", notes: "skip", category_id: cat2.id)
  user3.ideas.create(title: "that otherthing", description: "mmmmk", notes:"jump", category_id: cat2.id)
  user3.ideas.create(title: "whatever", description: "wassup", notes: "yay!", category_id: cat4.id)
