class Task < ActiveRecord::Base
  belongs_to :team, required: true
  validates :description,
    presence: true

  scope :completed, -> { where('completed_on is not null') }
  scope :pending, -> { where(completed_on: nil) }
end
