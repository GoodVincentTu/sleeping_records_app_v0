class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :sleeping_records, dependent: :destroy
  has_many :following, class_name: 'FollowRelationship',
                       as: :follower,
                       source: :followed,
                       dependent: :destroy
  has_many :followers, class_name: 'FollowRelationship',
                       as: :followed,
                       source: :follower,
                       dependent: :destroy
end
