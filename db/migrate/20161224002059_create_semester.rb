class CreateSemester < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.integer :year
      t.integer :num
    end
  end
end
