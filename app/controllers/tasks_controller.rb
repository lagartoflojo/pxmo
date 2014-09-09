class TasksController < ApplicationController
  before_action :set_team

  def index
    @tasks = @team.tasks
    render json: @tasks
  end

  def create
    @task = @team.tasks.build(task_params)
    respond_to do |format|
      if @task.save
        format.html { render @task, status: :created }
      else
        format.html { render nothing: true, status: :unprocessable_entity }
      end
    end
  end

  private
  def task_params
    params.require(:task).permit(:description)
  end

  def set_team
    @team = Team.find params[:team_id]
  end
end
