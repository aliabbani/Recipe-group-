class Recipe < ApplicationRecord
  has_many :recipeFoods
  has_many :foods, :through => :recipeFoods
end
