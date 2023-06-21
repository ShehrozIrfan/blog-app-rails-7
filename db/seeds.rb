# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.where(email: "shehroz@gmail.com").first_or_initialize
user.update!(
  password: "test1234",
  password_confirmation: "test1234"
)

# 100.times do |i|
#   BlogPost.create(title: "Blog Post #{i}", content: "Hello World", published_at: nil)
# end
