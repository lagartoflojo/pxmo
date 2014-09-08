require 'test_helper'

class TeamsControllerTest < ActionController::TestCase

  test 'get index is successful' do
    get :index
    assert_includes assigns(:teams), teams(:phalanx)
    assert_includes assigns(:teams), teams(:mannite)
    assert_response :success
  end

  test 'post create is successful with valid attributes' do
    assert_difference 'Team.count' do
      post :create, { format: :json, team: { name: 'Genoshan' } }
    end
    assert_response :created
  end

  test 'post create is not successful with invalid attributes' do
    assert_no_difference 'Team.count' do
      post :create, { format: :json, team: { name: '' } }
    end
    assert_response :unprocessable_entity
  end

end
