class ChangeSystemInfoName < ActiveRecord::Migration
  def change
    rename_table :system_dbs, :systeminfos
    add_index :systeminfos, :name
  end
end
