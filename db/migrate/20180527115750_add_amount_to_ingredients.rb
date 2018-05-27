class AddAmountToIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :measurement, :integer
    add_column :ingredients, :measurement_type, :string
  end
end
