class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.references :recipes, foreign_key: true
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
