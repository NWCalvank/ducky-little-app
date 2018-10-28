require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test 'should GET #show' do
    get '/reports', params: { end_date: '2018-10-28' }
    assert_response :success
  end

  test 'GET #show should require an end_date' do
    get '/reports'
    assert_response :bad_request
  end

  test 'GET #show should return default report as CSV' do
    get '/reports', params: { end_date: '2018-10-27' }

    headers = "Park,Amount,Duck Count,Time,Food\n"
    row_one = "Park One,1.5,1,2018-10-27,Bugs\n"
    row_two = "Park Two,1.5,12,2018-10-26,Berries\n"
    row_three = "Park Two,1.5,12,2018-10-27,Berries\n"
    csv_report = headers + row_one + row_two + row_three

    assert_equal csv_report, @response.body
  end
end
