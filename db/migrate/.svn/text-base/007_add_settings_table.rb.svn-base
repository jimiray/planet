class AddSettingsTable < ActiveRecord::Migration
  
  def self.up
    create_table :settings do |table|
      table.column :name, :string
      table.column :value, :string
      table.column :position, :int
    end
  end

  def self.down
    drop_table :settings
  end
  
end
