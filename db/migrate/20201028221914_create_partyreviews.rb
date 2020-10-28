class CreatePartyreviews < ActiveRecord::Migration[5.2]
  def change
    create_table :partyreviews do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :party, foreign_key: true

      t.timestamps
    end
  end
end
