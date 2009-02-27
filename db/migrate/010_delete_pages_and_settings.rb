class DeletePagesAndSettings < ActiveRecord::Migration
  def self.up
    drop_table :pages
    drop_table :settings
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration, "Can't recover dropped tables"
  end
end
