class CreateDats < ActiveRecord::Migration
  def change
    create_table :dats do |t|
      t.date :dat

      t.timestamps null: false
    end
  end
end
