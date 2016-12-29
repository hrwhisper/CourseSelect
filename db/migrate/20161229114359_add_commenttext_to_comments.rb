class AddCommenttextToComments < ActiveRecord::Migration
  def change
    add_column :comments, :Commenttext, :text
  end
end
