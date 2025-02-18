class CreateServicereviews < ActiveRecord::Migration[5.2]
  def change
    create_table :servicereviews do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
