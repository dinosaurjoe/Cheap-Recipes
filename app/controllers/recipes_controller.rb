class RecipesController < ApplicationController
  before_action :find_recipe

  def show
    @creator = User.find(@recipe.user_id)
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

end
