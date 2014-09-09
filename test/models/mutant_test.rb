require 'test_helper'

class MutantTest < ActiveSupport::TestCase
  test 'Mutant should be valid' do
    mutant = mutants(:cyclops)
    assert mutant.valid?, 'Mutant should be valid'
  end

  test 'Mutant should be invalid' do
    mutant = Mutant.new name: ''
    refute mutant.valid?, 'Mutant should be invalid'
    assert_includes mutant.errors[:name], "can't be blank"
  end

  test 'Mutant name should be unique' do
    mutant1 = mutants(:cyclops)
    mutant2 = Mutant.new name: mutant1.name
    refute mutant2.valid?, 'Mutant should not be valid'
    assert_includes mutant2.errors[:name], 'has already been taken'
  end
end
