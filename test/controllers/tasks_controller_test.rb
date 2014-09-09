require 'test_helper'

class TasksControllerTest < ActionController::TestCase

  test 'get index is successful' do
    get :index, team_id: teams(:phalanx).id
    assert_includes assigns(:tasks), tasks(:completed_task)
    assert_includes assigns(:tasks), tasks(:pending_task)
    refute_includes assigns(:tasks), tasks(:mannite_task)
    assert_response :success
  end

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
