class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :gender
      t.integer :course
      t.string :health_group

      t.timestamps null: false
    end
  end
end
