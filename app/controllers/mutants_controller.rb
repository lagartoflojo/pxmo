class MutantsController < ApplicationController
  before_action :set_team

  def create
    @mutant = @team.mutants.build mutant_params
    respond_to do |format|
      if @mutant.save
        format.html { render @mutant, status: :created }
      else
        format.html { render nothing: true, status: :unprocessable_entity}
      end
    end
  end

  private
  def mutant_params
    params.require(:mutant).permit(:name, :photo_url)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end

end
