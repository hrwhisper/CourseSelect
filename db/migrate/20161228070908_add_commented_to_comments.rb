class AddCommentedToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commented, :boolean,default: false
  end
end
