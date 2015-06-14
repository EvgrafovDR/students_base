class RemoveType < ActiveRecord::Migration
  def change
    remove_column :norms, :type
    add_column :norms, :typ, :string
  end
end
