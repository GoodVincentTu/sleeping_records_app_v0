class SleepingRecordSerializer < ActiveModel::Serializer
  attributes :id, :started_at, :ended_at, :duration_hours
end
