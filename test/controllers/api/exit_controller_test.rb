require 'test_helper'

class Api::ExitControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get api_exit_all_url
    assert_response :success
  end

end
