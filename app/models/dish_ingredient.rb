class DishIngredient < ApplicationRecord
  belongs_to :dishes
  belongs_to :ingredients
end