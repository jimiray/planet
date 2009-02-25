class UpdatePostsTable < ActiveRecord::Migration

  def self.up
    add_column :posts, :author, :string
    add_column :posts, :guid, :string
    add_column :posts, :comment_url, :string
  end

  def self.down
    drop_column :posts, :author
    drop_column :posts, :guid
    drop_column :posts, :comment_url
  end
end
