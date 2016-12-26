class AddDissAttribute < ActiveRecord::Migration
  def change
    add_column :courses,:diss,:text,:default => "暂无人发言"
  end
end
