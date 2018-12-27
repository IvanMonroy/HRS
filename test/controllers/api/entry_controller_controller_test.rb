require 'test_helper'

class Api::EntryControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get api_entry_controller_all_url
    assert_response :success
  end

end
