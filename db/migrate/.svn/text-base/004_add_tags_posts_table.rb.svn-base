class AddTagsPostsTable < ActiveRecord::Migration

  def self.up
    create_table :tags_posts do |table|
      table.column :tag_id, :integer
      table.column :post_id, :integer
    end
    remove_column :tags_posts, :id
  end

  def self.down
    drop_table :posts_tags
  end

end
