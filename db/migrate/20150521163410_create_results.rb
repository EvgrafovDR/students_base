class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :student_id
      t.integer :norm_id
      t.integer :dat_id
      t.float :result

      t.timestamps null: false
    end
  end
end
