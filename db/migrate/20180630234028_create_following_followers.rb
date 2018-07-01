class CreateFollowingFollowers < ActiveRecord::Migration[5.2]
  def change
    create_table :following_followers do |t|
      t.integer :following_id
      t.integer :follower_id
      t.timestamps null: false
    end
  end
end
