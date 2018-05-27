class FixRecipeIdOnIngredient < ActiveRecord::Migration[5.1]
  def change
    rename_column :ingredients, :recipes_id, :recipe_id
  end
end
