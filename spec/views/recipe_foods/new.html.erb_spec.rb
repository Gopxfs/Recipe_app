require 'rails_helper'

RSpec.describe "recipe_foods/new", type: :view do
  before(:each) do
    assign(:recipe_food, RecipeFood.new(
      quantity: 1,
      recipes: nil,
      foods: nil
    ))
  end

  it "renders new recipe_food form" do
    render

    assert_select "form[action=?][method=?]", recipe_foods_path, "post" do

      assert_select "input[name=?]", "recipe_food[quantity]"

      assert_select "input[name=?]", "recipe_food[recipes_id]"

      assert_select "input[name=?]", "recipe_food[foods_id]"
    end
  end
end
