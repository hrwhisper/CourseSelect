class AddNumIndexToUser < ActiveRecord::Migration
  def change
    add_index :users, :num, :unique => true
  end
end
