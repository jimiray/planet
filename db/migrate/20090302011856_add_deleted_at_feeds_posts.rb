class AddDeletedAtFeedsPosts < ActiveRecord::Migration
  def self.up
    add_column :feeds, :deleted_at, :datetime
    add_column :posts, :deleted_at, :datetime
  end

  def self.down
    remvoe_column :feeds, :deleted_at
    remove_column :feeds, :deleted_at
  end
end
