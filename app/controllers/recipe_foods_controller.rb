class RecipeFoodsController < ApplicationController
    def new
        @recipe_food = RecipeFood.new
    end

    def create
        food = Food.all
        recipe_food = RecipeFood.new(quantity: recipe_food_params[:quantity],food_id:food.id)
        # comment = post.comments.new(text: recipe_food_params[:text], author:current_user)
    
        if recipe_food.save
            flash.now[:notice] = 'Recipe Food created'
        else
            flash.now[:alert] = 'Error occured creating Recipe Food'
        end
    end

    def recipe_food_params
        params.require(:recipe_food).permit(:quantity)
    end
end
