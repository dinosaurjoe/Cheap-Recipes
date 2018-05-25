class AddShortDescriptionToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :short_description, :text
  end
end
