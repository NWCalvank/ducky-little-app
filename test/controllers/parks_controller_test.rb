require 'test_helper'

class ParksControllerTest < ActionDispatch::IntegrationTest
  test 'should GET #index' do
    get '/parks'
    assert_response :success
  end

  test 'GET #index should include records in response body' do
    get '/parks'
    assert_response :success

    body = JSON.parse(@response.body)
    body.fetch('records')
  end

  test 'GET #index should return all parks in response recods' do
    get '/parks'

    body = JSON.parse(@response.body)
    assert_equal parks.count, body.fetch('records').size
  end
end
