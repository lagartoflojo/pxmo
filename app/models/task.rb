class Task < ActiveRecord::Base
  validates :description,
    presence: true

  belongs_to :team, required: true

  scope :completed, -> { where('completed_on is not null') }
  scope :pending, -> { where(completed_on: nil) }

  def complete?
    completed_on?
  end

  def complete!
    update_attribute :completed_on, Time.current
  end

  def pending!
    update_attribute :completed_on, nil
  end

end
