class SleepingRecord < ApplicationRecord
  belongs_to :user

  def duration_hours
    return nil unless ended_at.present? and started_at.present?
    (ended_at - started_at) / 1.hour
  end
end
