class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.integer :capacity
      t.integer :price
      t.float :rating

      t.timestamps
    end
  end
end
