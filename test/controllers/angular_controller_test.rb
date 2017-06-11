require 'test_helper'

class AngularControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get angular_index_url
    assert_response :success
  end

end
