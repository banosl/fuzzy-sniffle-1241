require 'rails_helper'

RSpec.describe "Chefs show", type: :feature do
  describe "visit chefs show page" do
    before :each do
      @chef_1 = Chef.create!({name: "Jeff"})
      @chef_2 = Chef.create!({name: "Meghan"})

      @dish_1 = @chef_1.dishes.create!({name: "Spaghetti", description: "Noodles"})
      @dish_2 = @chef_1.dishes.create!({name: "Pho", description: "soup"})
      @dish_3 = @chef_2.dishes.create!({name: "Tacos", description: "mexican"})

      @ingredient_1 = Ingredient.create!({name: "Lettuce", calories: 5})
      @ingredient_2 = Ingredient.create!({name: "Ground beef", calories: 240})
      @ingredient_3 = Ingredient.create!({name: "Spaghetti noodle", calories: 120})
      @ingredient_4 = Ingredient.create!({name: "Tortilla", calories: 100})
      @ingredient_5 = Ingredient.create!({name: "Onion", calories: 55})
      @ingredient_6 = Ingredient.create!({name: "Water", calories: 0})

      @dish_ingredients_1 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_3.id})
      @dish_ingredients_2 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_2.id})
      @dish_ingredients_3 = DishIngredient.create!({dish_id: @dish_2.id, ingredient_id: @ingredient_2.id})
      @dish_ingredients_4 = DishIngredient.create!({dish_id: @dish_2.id, ingredient_id: @ingredient_6.id})
      @dish_ingredients_5 = DishIngredient.create!({dish_id: @dish_3.id, ingredient_id: @ingredient_2.id})
      @dish_ingredients_6 = DishIngredient.create!({dish_id: @dish_3.id, ingredient_id: @ingredient_4.id})
      @dish_ingredients_7 = DishIngredient.create!({dish_id: @dish_3.id, ingredient_id: @ingredient_5.id})
    end

    it 'see name of chef' do
      visit "/chefs/#{@chef_1.id}"

      expect(page).to have_content("#{@chef_1.name}")
      expect(page).to_not have_content("#{@chef_2.name}")
    end

    it 'see list of all dishes that belong to the chef'

    it 'see a form to a dd an exisiting dish to the chef'

    it 'when form is filled with ID of dish that exists in the database, click submit,
    user is redirected to the chefs show page with the dish now listed'

  end
end