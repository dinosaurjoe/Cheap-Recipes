class UploadsController < ApplicationController
  before_action :authenticate_user!
  # before_action :find_user, except: [:destroy]
  before_action :find_recipe

  def new
    @upload = @recipe.uploads.build
  end

  def create
      if params[:upload][:image]
        params[:upload][:image].each do |_, url|
          @recipe.uploads.create(image: url)
        end

        flash[:success] = "Upload successful."

        redirect_to recipe_path(@recipe)
      end
  end

  def destroy
    @upload = Upload.find(params[:id])
    authorize @upload

    if @upload.destroy
      redirect_to recipe_path(@recipe)
      flash[:success] = "Upload was deleted."
    else
      flash[:alert] = "Unable to delete upload."
    end
  end

  private

  def upload_params
    params.require(:upload).permit(:id, :image)
  end

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
