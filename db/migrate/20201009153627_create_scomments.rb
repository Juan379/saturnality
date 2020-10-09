class CreateScomments < ActiveRecord::Migration[5.2]
  def change
    create_table :scomments do |t|
      t.integer :user_id
      t.integer :service_id
      t.text :content

      t.timestamps
    end
  end
end
