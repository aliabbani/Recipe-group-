class RecipeFoodsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @foods = Food.all
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
  end

  def create
    recipe = Recipe.find(params[:recipe_id])
    recipe_food = recipe.recipe_foods.new(quantity: recipe_food_params[:quantity], food_id: params[:food_id], recipe_id: recipe.id)

    if recipe_food.save
      redirect_to recipes_path, notice: 'Recipe created successfully!'
    else
      flash.now[:alert] = 'Failed to create recipe'
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
    params.require(:recipe_food).permit(:quantity)
  end
end
