# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.destroy_all()

60.times do |x|
  created_at = Faker::Date.backward(days: 365)
  post = Post.create({
    title: "#{Faker::Games::Pokemon.name}-#{rand(1_000_000_000)}",
    body: Faker::Lorem.words,
    created_at: created_at,
    updated_at: created_at
  })
end

posts = Post.all

puts Cowsay.say("Generated #{posts.count} posts!", :dragon)