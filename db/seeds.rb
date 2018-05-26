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

FOOD_PRICE = (0.5..2)
TIME = (5..10)

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
      recipes_id: recipe.id,
      name: Faker::Food.ingredient,
      price: rand(FOOD_PRICE)
      )

    i.save
  end
end
