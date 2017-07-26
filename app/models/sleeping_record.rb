class SleepingRecord < ApplicationRecord
  belongs_to :user
  scope :sufficient_records, -> { where('ended_at IS NOT NULL AND started_at IS NOT NULL') }
  scope :order_by_duration, -> { order('ended_at - started_at DESC') }

  def duration_hours
    return nil unless ended_at.present? and started_at.present?
    (ended_at - started_at) / 1.hour
  end
end
