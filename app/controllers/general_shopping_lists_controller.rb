class GeneralShoppingListsController < ApplicationController
  def index
    recipe = Recipe.all
    @foods = RecipeFood.all
  end
end