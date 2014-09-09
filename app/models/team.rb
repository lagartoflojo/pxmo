class Team < ActiveRecord::Base
  validates :name,
    presence: true, uniqueness: true

  has_many :tasks
  has_many :mutants
end
