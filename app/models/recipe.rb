class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :name, :preparation_time, :cooking_time, :description, presence: true
  validates :preparation_time, :cooking_time, numericality: { greater_than: 0 }

  def total_food_items
    recipe_foods.sum('quantity')
  end

  def total_price
    recipe_foods.joins(:recipe, :food).sum('quantity * price')
  end
end
