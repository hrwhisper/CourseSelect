class AddTmpAttribute < ActiveRecord::Migration
  def change
    add_column :courses,:tmp,:string
  end
end
