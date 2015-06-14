class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :field_name
      t.string :table_name
      t.string :field_type
      t.string :transl_fn

      t.timestamps null: false
    end
  end
end
