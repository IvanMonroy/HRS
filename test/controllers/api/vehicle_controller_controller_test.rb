require 'test_helper'

class Api::VehicleControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get api_vehicle_controller_all_url
    assert_response :success
  end

end
