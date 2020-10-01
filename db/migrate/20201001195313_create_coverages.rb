class CreateCoverages < ActiveRecord::Migration[5.2]
  def change
    create_table :coverages do |t|
      t.references :service, foreign_key: true
      t.references :comuna, foreign_key: true

      t.timestamps
    end
  end
end
