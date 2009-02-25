class AddPagesTable < ActiveRecord::Migration

  def self.up
    create_table :pages do |table|
      table.column :location, :string
      table.column :title, :string
      table.column :content, :text
      table.column :created_at, :datetime
      table.column :updated_at, :datetime
    end
  end

  def self.down
    drop_table :pages
  end
  
end
