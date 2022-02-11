class Recipe < ApplicationRecord
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :name, :preparation_time, :cooking_time, :description, presence: true

  def total_food_items
    recipe_foods.sum('quantity')
  end

  def total_price
    recipe_foods.joins(:recipe, :food).sum('quantity * price')
  end
end
