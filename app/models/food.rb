class Food < ApplicationRecord
  has_many :recipeFoods
  has_many :recipes, through: :recipeFoods
end
