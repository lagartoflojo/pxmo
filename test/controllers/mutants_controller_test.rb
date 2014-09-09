require 'test_helper'

class MutantsControllerTest < ActionController::TestCase

  test 'post create is successful with valid attributes' do
    assert_difference 'Mutant.count' do
      post :create, { format: :json,
        mutant: { name: 'Changeling', photo_url: 'changeling.png' }}
    end
    assert_response :created
  end

  test 'post create is unsuccessful with invalid attributes' do
    assert_no_difference 'Mutant.count' do
      post :create, { format: :json,
        mutant: { nickname: ''}}
    end
    assert_response :unprocessable_entity
  end

end
