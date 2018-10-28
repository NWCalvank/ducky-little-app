require 'test_helper'

class FeedingsControllerTest < ActionDispatch::IntegrationTest
  test 'POST #create should respond with a bad_request for invalid body' do
    post '/feedings'
    assert_response :bad_request
  end

  test 'should POST #create with a valid request body' do
    post '/feedings', params: {
      food_id: foods.first.id,
      amount: 2,
      duck_count: 19,
      time: '2018-10-28',
      park_id: parks.first.id,
      daily: false
    }
    assert_response :success
  end
end
