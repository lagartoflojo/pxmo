require 'test_helper'

class TasksControllerTest < ActionController::TestCase

  test 'post create is successful with valid attributes' do
    assert_difference 'Task.count' do
      post :create, { team_id: teams(:phalanx).id,
        task: { description: 'The task' } }
    end
    assert_response :created
  end

  test 'post create is not successful with invalid attributes' do
    assert_no_difference 'Task.count' do
      post :create, { team_id: teams(:phalanx).id,
        task: { description: '' } }
    end
    assert_response :unprocessable_entity
  end

end
