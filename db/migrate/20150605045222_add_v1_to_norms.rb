class AddV1ToNorms < ActiveRecord::Migration
  def change
    add_column :norms, :v1, :float
    add_column :norms, :v2, :float
    add_column :norms, :v3, :float
    add_column :norms, :v4, :float
    add_column :norms, :v5, :float
    add_column :norms, :v6, :float
    add_column :norms, :v7, :float
    add_column :norms, :v8, :float
    add_column :norms, :v9, :float
    add_column :norms, :v10, :float
  end
end
