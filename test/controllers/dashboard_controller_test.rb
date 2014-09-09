require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_includes assigns(:teams), teams(:phalanx)
    assert_includes assigns(:teams), teams(:mannite)
    assert_response :success
  end

end
