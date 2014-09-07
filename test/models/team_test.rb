require 'test_helper'

class TeamTest < ActiveSupport::TestCase

  test 'Team should be valid' do
    team = teams(:phalanx)
    assert team.valid?, 'Team should be valid'
  end

  test 'Team should be invalid' do
    invalid_team = Team.new
    refute invalid_team.valid?, 'Team should not be valid'
    assert_includes invalid_team.errors['name'], "can't be blank"
  end

  test 'Team name should be unique' do
    team1 = teams(:phalanx)
    team2 = Team.new name: team1.name
    refute team2.valid?, 'Team should not be valid'
  end

end
