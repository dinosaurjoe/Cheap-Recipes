class RecipesController < ApplicationController
  before_action :find_recipe

  def show
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

end
