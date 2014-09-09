class AddTeamIdToMutants < ActiveRecord::Migration
  def change
    add_reference :mutants, :team, index: true
  end
end
