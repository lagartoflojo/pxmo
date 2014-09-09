require 'test_helper'

class CompletionsControllerTest < ActionController::TestCase
  test "post create should mark task complete" do
    post :create, { task_id: tasks(:pending_task) }
    assert assigns(:task).complete?, 'Task should be complete'
    assert_response :success
  end

  test "delete destroy should mark task pending" do
    delete :destroy, { task_id: tasks(:completed_task) }
    refute assigns(:task).complete?, 'Task should be pending'
    assert_response :success
  end

end
