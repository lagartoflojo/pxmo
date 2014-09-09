class DashboardController < ApplicationController
  def index
    @teams = Team.includes(:mutants, :tasks)
  end
end
