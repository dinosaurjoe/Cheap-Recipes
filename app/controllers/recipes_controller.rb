class RecipesController < ApplicationController
  before_action :find_recipe, except: [:new, :create, :index]

  def index
    @recipes = current_user.recipes
  end

  def edit
  end

  def update
    if @recipe.update_attributes(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "Unable to update recipe. #{@recipe.errors.full_messages.to_sentence}"
      redirect_to :edit
    end
  end


  def show
    @creator = User.find(@recipe.user_id)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      # flash[:success] = "Your recipe was created. Now add some images."
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
    params.require(:recipe).permit(:name, :photo, :prep_time, :cooking_time, :short_description, :description)
  end

end
