class AddOverToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :over, :bool
  end
end
