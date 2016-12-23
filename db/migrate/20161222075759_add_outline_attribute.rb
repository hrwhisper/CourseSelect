class AddOutlineAttribute < ActiveRecord::Migration
  def change
    add_column :courses, :outline, :text, :default => "本课程暂无大纲"
  end
end
