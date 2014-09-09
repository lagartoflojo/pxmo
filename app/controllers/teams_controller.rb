class TeamsController < ApplicationController

  def index
    @teams = Team.all
    render json: @teams
  end

  def create
    @team = Team.new(team_params)
    respond_to do |format|
      if @team.save
        format.html { render @team, status: :created }
      else
        format.html { render nothing: true, status: :unprocessable_entity }
      end
    end
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end
end
