require 'test_helper'

class MutantTest < ActiveSupport::TestCase
  test 'Mutant should be valid' do
    mutant = mutants(:cyclops)
    assert mutant.valid?, 'Mutant should be valid'
  end

  test 'Mutant should be invalid' do
    mutant = mutants(:invalid)
    refute mutant.valid?, 'Mutant should be invalid'
    assert_includes mutant.errors[:nickname], "can't be blank"
    assert_includes mutant.errors[:real_name], "can't be blank"
  end

  test 'Mutant nickname should be unique' do
    mutant1 = mutants(:cyclops)
    mutant2 = Mutant.new nickname: mutant1.nickname, real_name: 'xx'
    refute mutant2.valid?, 'Mutant should not be valid'
    assert_includes mutant2.errors[:nickname], 'has already been taken'
  end
end
