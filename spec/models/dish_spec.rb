require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "model methods" do
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

    describe "total_calories" do
      it "adds up the total calories in a dish" do
        expect(@dish_1.total_calories).to eq(360)
        expect(@dish_2.total_calories).to eq(240)
        expect(@dish_3.total_calories).to eq(395)
      end
    end
  end
end