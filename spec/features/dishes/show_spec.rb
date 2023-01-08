require 'rails_helper'

RSpec.describe "Dishes show", type: :feature do
  describe "visit dishes show page" do
    before :each do
      @chef_1 = Chef.create!({name: "Jeff"})
      @chef_2 = Chef.create!({name: "Meghan"})

      @dish_1 = @chef_1.dishes.create!({name: "Spaghetti", description: "Noodles"})
      @dish_2 = @chef_1.dishes.create!({name: "Pho", description: "soup"})
      @dish_3 = @chef_2.dishes.create!({name: "Tacos", description: "mexican"})

      @ingredient_1 = Ingredient.create!({name: "Lettuce", calories: 5})
      @ingredient_2 = Ingredient.create!({name: "Ground Beef", calories: 240})
      @ingredient_3 = Ingredient.create!({name: "Spaghetti Noodle", calories: 120})
      @ingredient_4 = Ingredient.create!({name: "Tortilla", calories: 100})
      @ingredient_5 = Ingredient.create!({name: "Onion", calories: 55})
      @ingredient_6 = Ingredient.create!({name: "water", calories: 0})

      @dish_ingredients_1 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_3.id})
      @dish_ingredients_2 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_2.id})
      @dish_ingredients_3 = DishIngredient.create!({dish_id: @dish_2.id, ingredient_id: @ingredient_2.id})
      @dish_ingredients_4 = DishIngredient.create!({dish_id: @dish_2.id, ingredient_id: @ingredient_6.id})
      @dish_ingredients_5 = DishIngredient.create!({dish_id: @dish_3.id, ingredient_id: @ingredient_2.id})
      @dish_ingredients_6 = DishIngredient.create!({dish_id: @dish_3.id, ingredient_id: @ingredient_4.id})
      @dish_ingredients_7 = DishIngredient.create!({dish_id: @dish_3.id, ingredient_id: @ingredient_5.id})
    end

    it 'see dish name and description' do
      visit "/dishes/#{@dish_1.id}"

      expect(page).to have_content("#{@dish_1.name}")
      expect(page).to have_content("Description: #{@dish_1.description}")
    end

    it 'see list of ingredients for that dish'

    it 'see total calorie count for that dish'

    it 'see chefs name'
  end
end