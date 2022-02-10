class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @foods = Food.all
  end

  def create
    @foods = Food.all
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = recipe.recipe_foods.new(quantity: recipe_food_params[:quantity], food_id: @food.id,
                                            recipe_id: @recipe.id)

    respond_to do |format|
      format.html do
        if @recipe_foods.save
          flash[:success] = 'You have successfully added an ingredient.'
        else
          flash.now[:error] = 'Error: Ingredient could not be saved'
        end
        redirect_to recipe_path(params[:recipe_id])
      end
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
