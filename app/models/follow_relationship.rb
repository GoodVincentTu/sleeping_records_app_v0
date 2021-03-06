class FollowRelationship < ApplicationRecord
  belongs_to :follower, polymorphic: true
  belongs_to :followed, polymorphic: true
  validates :follower_id, :followed_id,
            :follower_type, :followed_type,
            presence: true
end
