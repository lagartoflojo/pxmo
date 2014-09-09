class CompletionsController < ApplicationController
  before_action :set_task

  def create
    @task.complete!
    render nothing: true
  end

  def destroy
    @task.pending!
    render nothing: true
  end

  private
  def set_task
    @task = Task.find(params[:task_id])
  end
end
