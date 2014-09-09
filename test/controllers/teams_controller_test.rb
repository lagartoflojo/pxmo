require 'test_helper'

class TeamsControllerTest < ActionController::TestCase

  test 'post create is successful with valid attributes' do
    assert_difference 'Team.count' do
      post :create, { team: { name: 'Genoshan' } }
    end
    assert_response :created
  end

  test 'post create is not successful with invalid attributes' do
    assert_no_difference 'Team.count' do
      post :create, { team: { name: '' } }
    end
    assert_response :unprocessable_entity
  end

end
