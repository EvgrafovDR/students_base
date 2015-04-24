class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :family_name
      t.string :name
      t.string :second_name

      t.timestamps null: false
    end
  end
end
