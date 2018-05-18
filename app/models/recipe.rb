class Recipe < ApplicationRecord
  has_many :ingredients

  after_create :set_total_time

  def set_total_time
    @recipe = self

    @recipe.total_time = @recipe.prep_time + @recipe.cooking_time

    @recipe.save!
  end
end
