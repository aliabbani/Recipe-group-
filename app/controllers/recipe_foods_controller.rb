class RecipeFoodsController < ApplicationController
  def index; end

  def show
    @recipe_food = RecipeFood.find(params[:id])
  end

  def new
    @foods = Food.all
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
  end

  def create
    recipe = Recipe.find(params[:recipe_id])
    recipe_food = recipe.recipe_foods.new(quantity: recipe_food_params[:quantity], food_id: params[:food_id],
                                          recipe_id: recipe.id)

    if recipe_food.save
      redirect_to recipe_path(recipe.id), notice: 'Recipe created successfully!'
    else
      flash.now[:alert] = 'Failed to create recipe'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    recipe_foods = RecipeFood.find(params[:id])
    recipe_foods.destroy!
    flash[:notice] = 'Deleted ingredient!'
    redirect_to recipe_path(@recipe.id)
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity)
  end
end
