class DropTablename < ActiveRecord::Migration[5.2]
  def change
    drop_table :service_comments
  end
end
