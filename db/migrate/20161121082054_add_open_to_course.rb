class AddOpenToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :outline, :text, :default => false
  end
end