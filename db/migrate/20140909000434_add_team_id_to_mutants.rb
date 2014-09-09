class AddTeamIdToMutants < ActiveRecord::Migration
  def change
    add_reference :mutants, :team, index: true
    add_foreign_key :mutants, :teams
  end
end
