require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  test 'Task should be valid' do
    task = tasks(:completed_task)
    assert task.valid?, 'Task should be valid'
  end

  test 'Task should be invalid' do
    invalid_task = Task.new
    refute invalid_task.valid?, 'Task should be invalid'
    assert_includes invalid_task.errors['team'], "can't be blank"
    assert_includes invalid_task.errors['description'], "can't be blank"
  end

  test 'Task.completed collects completed tasks' do
    assert_includes Task.completed, tasks(:completed_task),
      'Task.completed should include completed task'
    refute_includes Task.completed, tasks(:pending_task),
      'Task.completed should not include pending task'
  end

  test 'Task.pending collectes pending tasks' do
    assert_includes Task.pending, tasks(:pending_task),
      'Task.pending should include pending task'
    refute_includes Task.pending, tasks(:completed_task),
      'Task.pending should not include completed task'
  end

end
