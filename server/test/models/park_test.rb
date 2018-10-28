require 'test_helper'

class ParkTest < ActiveSupport::TestCase
  test 'fixtures are valid' do
    parks.each do |park|
      assert park.valid?
    end
  end

  test 'Park must have a name' do
    new_park = Park.new
    assert_not new_park.valid?
  end

  test 'Park must have a country' do
    new_park = Park.new(name: 'New Park')
    assert_not new_park.valid?
  end

  test 'Park country must be in list of valid country codes' do
    new_park = Park.new(name: 'New Park', country: 'asdf')
    assert_not new_park.valid?
  end
end