class AddBounce < ActiveRecord::Migration

  def self.up
    add_column :feeds, :bounces, :integer, :default=>0
  end

  def self.down
    remove_column :feeds, :bounces
  end

end
