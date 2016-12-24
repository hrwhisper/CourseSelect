class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.belongs_to :course, index: true
      t.string :user
      t.text :content
      t.timestamps null: false
    end
  end
end
