class CreateFines < ActiveRecord::Migration
  def change
    create_table :fines do |t|
      t.integer :norm_id
      t.integer :dat_id
      t.float :fine

      t.timestamps null: false
    end
  end
end
