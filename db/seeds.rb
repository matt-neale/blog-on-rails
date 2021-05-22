# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.destroy_all()
Comment.destroy_all()
User.destroy_all()

PASSWORD = 'supersecret'

super_user= User.create(
  first_name: "Jon",
  last_name: 'Snow',
  email: 'js@winterfell.gov',
  password: PASSWORD,
  is_admin: true
)

moves = 50.times.map do |x|
  Faker::Games::Pokemon.unique.move
end

30.times do |x|
  u = User.create({
    first_name: Faker::Games::Zelda.character,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    password: PASSWORD
    })
  end
  
  users = User.all

50.times do |x|
  created_at = Faker::Date.backward(days: 365)
  post = Post.create({
    title: Faker::Games::Pokemon.unique.name,
    body: moves.join(', '),
    user: users.sample,
    created_at: created_at,
    updated_at: created_at
  })
  if post.persisted?  # we can also use .valid? to check the data that is entered in db was valid or not
    post.comments= rand(0..10).times.map do
        Comment.new(
          body: Faker::Games::Pokemon.location,
          user: users.sample,
          created_at: created_at,
        )
    end
  end
end

posts = Post.all
comments = Comment.all

puts Cowsay.say("Generated #{users.count}  users!", :bunny)
puts Cowsay.say("Generated #{posts.count} posts!", :dragon)
puts Cowsay.say("Generated #{comments.count} comments!", :ghostbusters)
puts Cowsay.say("Login with #{super_user.email} and password: #{PASSWORD}", :frogs)