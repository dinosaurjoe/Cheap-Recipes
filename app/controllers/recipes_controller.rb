class RecipesController < ApplicationController
  before_action :find_recipe, except: [:new, :create]

  def show
    @creator = User.find(@recipe.user_id)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      # flash[:success] = "Your project was created. Now add some images."
      redirect_to feed_path(@recipe)
    else
      flash[:alert] = @recipe.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :prep_time, :cooking_time, :short_description, :description)
  end

end
