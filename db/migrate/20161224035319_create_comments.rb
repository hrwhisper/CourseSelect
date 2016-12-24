class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :course, index: true
      t.belongs_to :user, index: true
      t.integer :comment_1
      t.integer :comment_2
      t.integer :comment_3
      t.integer :comment_4
      t.integer :comment_5
      t.integer :comment_6
      t.integer :comment_7
      t.integer :comment_8
      t.integer :comment_9
      t.integer :comment_10
      t.integer :comment_11
      t.integer :comment_12
      t.integer :comment_13
      t.integer :comment_14
      t.integer :comment_15
      t.integer :comment_16
      t.integer :comment_17

      t.timestamps null: false
    end
  end
end
