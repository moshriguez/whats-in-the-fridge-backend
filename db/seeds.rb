puts 'Destroying old data...'
UserIngredient.destroy_all
User.destroy_all
Ingredient.destroy_all

puts 'Creating users...'
15.times do
    username = Faker::Internet.username
    User.create(username: username, password_digest: BCrypt::Password::create(username), favorite_food: Faker::Food.dish, bio: Faker::Books::Dune.quote)
end

puts 'Creating ingredients...'
30.times do
    Ingredient.create(name: Faker::Food.ingredient)
end

puts "Filling user's fridges..."
40.times do
    UserIngredient.create(user: User.all.sample, ingredient: Ingredient.all.sample)
end

puts 'Seeding complete.'