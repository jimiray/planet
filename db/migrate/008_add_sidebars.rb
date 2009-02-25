class AddSidebars < ActiveRecord::Migration

  def self.up
    create_table :sidebars do |table|
      table.column :controller, :string
      table.column :active_position, :integer
      table.column :active_config, :text
      table.column :staged_position, :integer
      table.column :staged_config, :text
    end
  end

  def self.down
    drop_table :sidebars
  end
  
end
