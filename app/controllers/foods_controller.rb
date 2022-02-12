class FoodsController < ApplicationController
  def index
    @foods = Food.all.order('created_at Desc')
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    food = current_user.foods.new(food_params)

    return unless can? :create, food

    if food.save
      redirect_to foods_path, notice: 'Food Created Successfully'
    else
      flash.now[:alert] = food.errors
    end
  end

  def destroy
    @food = Food.find(params[:id])

    return unless can? :destroy, @food

    @food.destroy
    redirect_to foods_path, notice: 'Deleted Successfully'
  end

  def food_params
    params.require(:food).permit(:name, :price, :measurement_unit, recipe_ids: [])
  end
end
