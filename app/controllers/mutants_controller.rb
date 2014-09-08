class MutantsController < ApplicationController

  def create
    @mutant = Mutant.new mutant_params
    respond_to do |format|
      if @mutant.save
        format.json { render json: @mutant, status: :created }
      else
        format.json { render json: @mutant.errors, status: :unprocessable_entity}
      end
    end
  end

  private
  def mutant_params
    params.require(:mutant).permit(:nickname, :real_name, :photo_url)
  end

end
