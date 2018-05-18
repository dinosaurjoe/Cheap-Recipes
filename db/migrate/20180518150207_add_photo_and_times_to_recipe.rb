class AddPhotoAndTimesToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :photo, :string
    add_column :recipes, :cooking_time, :integer
    add_column :recipes, :prep_time, :integer
    add_column :recipes, :total_time, :integer
  end
end
