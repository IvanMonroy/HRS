require 'test_helper'

class Api::RateControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get api_rate_all_url
    assert_response :success
  end

end
