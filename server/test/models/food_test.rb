require 'test_helper'

class FoodTest < ActiveSupport::TestCase
  test 'Food must have a name' do
    new_food = Food.new
    assert_not new_food.valid?
  end

  test 'Food name must be unique' do
    new_food1 = Food.create(name: 'New Food')
    new_food2 = Food.new(name: 'New Food')
    assert_not new_food2.valid?
  end
end
