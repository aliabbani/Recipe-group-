class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def create
    food = current_user.foods.new(food_params)
    if food.save
      redirect_to foods_path, notice: 'Food created successfully'
    else
      flash.now[:alert] = 'Failed to create food'
    end
  end

  def delete
  end

  def food_params
    params.require(:food).permit(:name, :price, :measurement_unit)
  end
end
