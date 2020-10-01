class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.references :party, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
