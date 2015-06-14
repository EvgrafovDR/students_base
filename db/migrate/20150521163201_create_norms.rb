class CreateNorms < ActiveRecord::Migration
  def change
    create_table :norms do |t|
      t.string :name
      t.boolean :main
      t.string :type
      t.integer :dat_id
      t.float :v1
      t.float :v2
      t.float :v3
      t.float :v4
      t.float :v5
      t.float :v6
      t.float :v7
      t.float :v8
      t.float :v9
      t.float :v10
      t.timestamps null: false
    end
  end
end
