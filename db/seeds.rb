# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Recipe.destroy_all
Ingredient.destroy_all
User.destroy_all

FOOD_PRICE = (1..3)
TIME = (5..10)
MEASUREMENT = (1..4)
MEASUREMENT_TYPE = ["Tablespoon", "Teaspoon", "Cup", "Filet", "Ounce", "Gram"]

joe = User.new(
  email: "joe@joe.com",
  password: "joejoe"
  )

joe.save

10.times do

r = Recipe.new(
  name: Faker::Food.dish,
  cooking_time: rand(TIME),
  prep_time: rand(TIME),
  short_description: Faker::Lorem.sentence,
  description: Faker::Lorem.paragraph(6),
  user_id: joe.id
  )

  r.save
end

recipes = Recipe.all

recipes.each do |recipe|

  5.times do
    i = Ingredient.new(
      recipe_id: recipe.id,
      name: Faker::Food.ingredient,
      price: rand(FOOD_PRICE),
      measurement: rand(MEASUREMENT),
      measurement_type: MEASUREMENT_TYPE.sample
      )

    i.save
  end
end


