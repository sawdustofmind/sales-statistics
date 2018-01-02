require 'test_helper'

class SalesControllerTest < ActionDispatch::IntegrationTest
  test "should return statistic" do
    get '/sales', params:{'from' => '2017-02-01', 'to' => '2017-02-02'}
    assert_equal @response.status, 200
    assert_equal @response.content_type, 'application/json'
    # puts @response.body
  end

  test "from greater to error" do
    get '/sales', params:{'from' => '2017-02-02', 'to' => '2017-02-01'}
    assert_equal @response.status, 422
  end

  test "incrorect params" do
    get '/sales', params:{'from' => 'some', 'to' => 'any'}
    assert_equal @response.status, 422
  end
end
