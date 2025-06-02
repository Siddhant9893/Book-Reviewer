require "test_helper"

class PermissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get permissions_create_url
    assert_response :success
  end

  test "should get approve" do
    get permissions_approve_url
    assert_response :success
  end

  test "should get reject" do
    get permissions_reject_url
    assert_response :success
  end
end
