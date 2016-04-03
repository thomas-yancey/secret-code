class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :user, null: false, index: true
      t.references :friend, null: false, index: true
      t.boolean :approved, default: :false
      t.timestamps null: false
    end
  end
end
