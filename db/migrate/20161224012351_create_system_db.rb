class CreateSystemDb < ActiveRecord::Migration
  def change
    create_table :system_dbs do |t|
      t.string :name
      t.string :value
    end
  end
end
