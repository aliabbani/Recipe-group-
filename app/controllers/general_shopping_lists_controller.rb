class GeneralShoppingListsController < ApplicationController
  def index
    @recipes = Recipe.find(params[:recipe_id])
    @recipe_foods = RecipeFood.all
    @food = Food.all
  end
end