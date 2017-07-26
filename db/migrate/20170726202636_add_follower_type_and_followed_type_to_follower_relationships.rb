class AddFollowerTypeAndFollowedTypeToFollowerRelationships < ActiveRecord::Migration[5.1]
  def change
    add_column :follow_relationships, :follower_type, :string
    add_column :follow_relationships, :followed_type, :string
  end
end
