class Mutant < ActiveRecord::Base
  validates :name,
    uniqueness: true, presence: true

  belongs_to :team
end
