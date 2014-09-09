class Task < ActiveRecord::Base
  validates :description,
    presence: true

  belongs_to :team, required: true

  scope :completed, -> { where('completed_on is not null') }
  scope :pending, -> { where(completed_on: nil) }
end
