puts 'Destroying old data...'
User.destroy_all
Ingredient.destroy_all
UserIngredient.destroy_all

puts 'Creating users...'
15.times {User.create(username: Faker::Internet.username, password_digest: Faker::Alphanumeric.alphanumeric(number: 10), favorite_food: Faker::Food.dish, bio: Faker::Books::Dune.quote)}

puts 'Creating ingredients...'
30.times {Ingredient.create(name: Faker::Food.ingredient)}

puts "Filling user's fridges..."
40.times {UserIngredient.create(user: User.all.sample, ingredient: Ingredient.all.sample)}

puts 'Seeding complete.'