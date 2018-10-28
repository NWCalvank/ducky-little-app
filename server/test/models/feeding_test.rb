require 'test_helper'

class FeedingTest < ActiveSupport::TestCase
  test 'Valid feeding' do
    new_feeding = Feeding.new(
      food: foods.first,
      amount: 10,
      duck_count: 2,
      time: Time.now,
      park: parks.first,
      daily: false
    )
    assert new_feeding.valid?
  end

  test 'Feeding must have a food' do
    new_feeding = Feeding.new(
      amount: 10,
      duck_count: 2,
      time: Time.now,
      park: parks.first,
      daily: false
    )
    assert_not new_feeding.valid?
  end

  test 'Feeding must have an amount' do
    new_feeding = Feeding.new(
      food: foods.first,
      duck_count: 2,
      time: Time.now,
      park: parks.first,
      daily: false
    )
    assert_not new_feeding.valid?
  end

  test 'Feeding must have a duck_count' do
    new_feeding = Feeding.new(
      food: foods.first,
      amount: 10,
      time: Time.now,
      park: parks.first,
      daily: false
    )
    assert_not new_feeding.valid?
  end

  test 'Feeding must have a time' do
    new_feeding = Feeding.new(
      food: foods.first,
      amount: 10,
      duck_count: 2,
      park: parks.first,
      daily: false
    )
    assert_not new_feeding.valid?
  end

  test 'Feeding must have a park' do
    new_feeding = Feeding.new(
      food: foods.first,
      amount: 10,
      duck_count: 2,
      time: Time.now,
      daily: false
    )
    assert_not new_feeding.valid?
  end
end
