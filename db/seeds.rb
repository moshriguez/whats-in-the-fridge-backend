puts 'Destroying old data...'
UserIngredient.destroy_all
User.destroy_all
Ingredient.destroy_all

puts 'Creating users...'
15.times do
    username = Faker::Internet.username
    User.create(username: username, password: "password", favorite_food: Faker::Food.dish, bio: Faker::Books::Dune.quote)
end

puts 'Creating ingredients...'
response = HTTParty.get('https://www.themealdb.com/api/json/v1/1/list.php?i=list') # get all ingredients from themealdb api
ingredients = JSON.parse(response.body)

ingredients['meals'].each do |ingredient|
    description = ingredient["strDescription"]
    description ||= "(Faker:) #{Faker::Food.description}" # add fake description if description does not exist in the api

    Ingredient.create(name: ingredient["strIngredient"], description: description)
end

puts "Filling user's fridges..."
40.times do
    UserIngredient.create(user: User.all.sample, ingredient: Ingredient.all.sample)
end

puts 'Seeding complete.'