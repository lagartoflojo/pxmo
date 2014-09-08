class Mutant < ActiveRecord::Base
  validates :nickname, :real_name,
    presence: true
  validates :nickname, uniqueness: true
end
