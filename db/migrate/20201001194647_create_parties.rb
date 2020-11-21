class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :title
      t.text :description
      t.references :comuna, foreign_key: true
      t.string :address
      t.integer :cost
      t.boolean :search, :default => true
      t.boolean :ended, :default => false

      t.timestamps
    end
  end
end
