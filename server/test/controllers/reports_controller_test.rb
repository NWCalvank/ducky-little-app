require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test 'should GET #show' do
    get '/reports'
    assert_response :success
  end

  test 'GET #show should return default report as CSV' do
    get '/reports'

    headers = "park,amount,duck_count,time,food\n"
    row_one = "Park One,1.5,1,2018-10-28 04:37:40 UTC,Bugs\n"
    row_two = "Park Two,1.5,12,2018-10-28 04:37:40 UTC,Berries\n"
    csv_report = headers + row_one + row_two

    assert_equal csv_report, @response.body
  end
end
