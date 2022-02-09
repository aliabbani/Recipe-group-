class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    @recipe.user_id = current_user.id

    respond_to do |format|
      format.html do
        if @recipe.save
          flash[:success] = 'You have successfully created a recipe.'
          redirect_to recipes_url
        else
          flash.now[:error] = 'Error: Recipe could not be saved'
          render :new
        end
      end
    end
  end

  # def destroy
  #   @recipe = current_user.recipes.find(params[:id])
  #   @recipe.destroy
  #   flash[:alert] = 'Deleted Recipe'
  #   redirect_to recipes_url
  # end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
