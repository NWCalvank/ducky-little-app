require 'test_helper'

class FoodsControllerTest < ActionDispatch::IntegrationTest
  test 'should GET #index' do
    get '/foods'
    assert_response :success
  end

  test 'GET #index should include records in response body' do
    get '/foods'
    assert_response :success

    body = JSON.parse(@response.body)
    body.fetch('records')
  end

  test 'GET #index should return all foods in response recods' do
    get '/foods'

    body = JSON.parse(@response.body)
    assert_equal foods.count, body.fetch('records').size
  end
end
