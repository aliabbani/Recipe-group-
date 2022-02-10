class RecipeFoodsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @recipe_food = RecipeFood.new
    @foods = Food.all
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    recipe = Recipe.find(params[:recipe_id])
    recipe_food = recipe.recipeFoods.new(quantity: recipe_food_params[:quantity], food_id: recipe_food_params[:food_id],
    recipe_id: recipe.id)

    if recipe_food.save
      flash.now[:success] = 'You have successfully added an ingredient.'
    else
      flash.now[:error] = 'Error: Ingredient could not be saved'
    end
  end

  def destroy
    ingredient = RecipeFood.find(params[:id])
    if ingredient.destroy
      flash[:notice] = 'Deleted ingredient!'
    else
      flash[:alert] = 'Failed to Delete the ingredient'
    end
    redirect_to recipe_path(params[:recipe_id])
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
