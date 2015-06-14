class CreateReltables < ActiveRecord::Migration
  def change
    create_table :reltables do |t|
      t.string :table1
      t.string :table2
      t.string :relations

      t.timestamps null: false
    end
  end
end
