class AddViaToReltables < ActiveRecord::Migration
  def change
    add_column :reltables, :via, :string
  end
end
