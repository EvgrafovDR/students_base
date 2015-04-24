class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :family_name
      t.string :name
      t.string :second_name
      t.integer :group_id
      t.integer :faculty_id
      t.integer :teacher_id

      t.timestamps null: false
    end
  end
end
